using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Excel = Microsoft.Office.Interop.Excel;
using System.Runtime.InteropServices;
using ContactManagement.Domain.Model;
using ContactManagement.Repository.Repository;
using ContactManagement.Models;
using System.IO;
using System.Web.UI;
using System.ComponentModel;
using System.Web.UI.WebControls;
using ContactManagement.Repository.ViewModel;

namespace ContactManagement.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        ContactInformationRepository repository = new ContactInformationRepository();
        string email = string.Empty;
        // GET: ContactInformation
        public ActionResult Index()
        {                        
            return View();
        }
        public ActionResult GetAllContacts()
        {
            email = Session["email"].ToString();
            var result = repository.GetAllContacts(email);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteContact(int? Id)
        {
            ContactInformation obj = repository.GetContact(Id);
            repository.Delete(obj);
            return Json("Delete Successfully", JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddContact(ContactInformation model)
        {
            string msg = string.Empty;
            if (model != null)
            {
                if (model.ContactId > 0)
                {
                    ContactInformation obj = repository.GetContact(model.ContactId);
                    obj.CategoryId = model.CategoryId;
                    obj.Name = model.Name;
                    obj.Mobile = model.Mobile;
                    obj.Address = model.Address;
                    obj.Email = model.Email;
                    repository.Update(obj);
                    msg = "Record Updated Successfully";
                }
                else
                {
                    model.EntryDate = DateTime.Now;
                    repository.Insert(model);
                    msg = "Record Saved Successfully";
                }
            }
            else
            {
                msg = "Invalid Record";
            }

            return Json(msg, JsonRequestBehavior.AllowGet);
        }


        public ActionResult ImportExcel()
        {
            return View();
        }


        [ActionName("Importexcel")]
        [HttpPost]
        public ActionResult ExtractPreScheduleData(HttpPostedFileBase upload)
        {
            if (upload == null || upload.ContentLength == 0)
            {
                ViewBag.Error = "Please select a execl file<br>";
                return View("Index");
            }
            else
            {
                if (upload.FileName.EndsWith("xlsx") || upload.FileName.EndsWith("xls"))
                {
                    string path = Server.MapPath("~/Content/Uploads/" + upload.FileName);
                    if (System.IO.File.Exists(path))
                    {
                        System.IO.File.Delete(path);
                    }
                    upload.SaveAs(path);
                    Excel.Application application = new Excel.Application();
                    Excel.Workbook workBook = application.Workbooks.Open(path);
                    Excel.Worksheet workSheet = workBook.ActiveSheet;
                    Excel.Range range = workSheet.UsedRange;

                    for (int row = 1; row < range.Rows.Count; row++)
                    {
                        string Name = string.IsNullOrEmpty(((Excel.Range)range.Cells[row, 1]).Text) ? string.Empty : ((Excel.Range)range.Cells[row, 1]).Text;
                        string Email = string.IsNullOrEmpty(((Excel.Range)range.Cells[row, 2]).Text) ? string.Empty : ((Excel.Range)range.Cells[row, 2]).Text;
                        string Mobile = string.IsNullOrEmpty(((Excel.Range)range.Cells[row, 3]).Text) ? string.Empty : ((Excel.Range)range.Cells[row, 3]).Text;
                        string Address = string.IsNullOrEmpty(((Excel.Range)range.Cells[row, 4]).Text) ? string.Empty : ((Excel.Range)range.Cells[row, 4]).Text;
                        string Category = string.IsNullOrEmpty(((Excel.Range)range.Cells[row, 5]).Text) ? string.Empty : ((Excel.Range)range.Cells[row, 5]).Text;

                        ContactInformation obj = new ContactInformation();
                        obj.CategoryId = repository.GetCategorytIdByTitle(Category);
                        obj.Name = Name;
                        obj.Mobile = Mobile;
                        obj.Address = Address;
                        obj.Email = Email;
                        repository.Insert(obj);
                    }
                    ViewBag.Message = "Data Upload Successfully";

                    try
                    {
                        if (System.IO.File.Exists(path))
                        {
                            System.IO.File.Delete(path);
                        }
                    }
                    catch
                    {

                    }
                    finally
                    {
                        workBook.Close(true);
                        application.Quit();
                        if (System.IO.File.Exists(path))
                        {
                            System.IO.File.Delete(path);
                        }
                    }
                    return View("ImportExcel");
                }
                else if (upload.FileName.EndsWith("csv"))
                {
                    string path = Server.MapPath("~/Content/Uploads/" + upload.FileName);
                    if (System.IO.File.Exists(path))
                    {
                        System.IO.File.Delete(path);
                    }
                    upload.SaveAs(path);
                    using (var reader = new StreamReader(Server.MapPath("~/Content/Uploads/" + upload.FileName)))
                    {
                        while (!reader.EndOfStream)
                        {
                            var line = reader.ReadLine();
                            var values = line.Split(',');                        

                            string Name = string.IsNullOrEmpty(values[1].ToString()) ? string.Empty : values[1].ToString();
                            string Email = string.IsNullOrEmpty(values[2].ToString()) ? string.Empty : values[2].ToString();
                            string Mobile = string.IsNullOrEmpty(values[3].ToString()) ? string.Empty : values[3].ToString();
                            string Address = string.IsNullOrEmpty(values[4].ToString()) ? string.Empty : values[4].ToString();
                            string Category = string.IsNullOrEmpty(values[5].ToString()) ? string.Empty : values[5].ToString();

                            ContactInformation obj = new ContactInformation();
                            obj.CategoryId = repository.GetCategorytIdByTitle(Category);
                            obj.Name = Name;
                            obj.Mobile = Mobile;
                            obj.Address = Address;
                            obj.Email = Email;
                            repository.Insert(obj);
                        }
                    }
                }
                else
                {
                    ViewBag.Message = "File type is incorrect";
                }
            }
            return View("ImportExcel");
        }

        [HttpPost]
        public void ExportListFromTable()
        {
            email = Session["email"].ToString();
            List<ContactViewModel>  data = repository.GetList(email);
           
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=Contact.xls");
            Response.AddHeader("Content-Type", "application/vnd.ms-excel");
            WriteHtmlTable(data, Response.Output);
            Response.End();
        }

        public void WriteHtmlTable<T>(IEnumerable<T> data, TextWriter output)
        {
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {

                    Table table = new Table();
                    TableRow row = new TableRow();
                    PropertyDescriptorCollection props = TypeDescriptor.GetProperties(typeof(T));
                    foreach (PropertyDescriptor prop in props)
                    {
                        TableHeaderCell hcell = new TableHeaderCell();
                        hcell.Text = prop.Name;
                        hcell.BackColor = System.Drawing.Color.Yellow;
                        row.Cells.Add(hcell);
                    }

                    table.Rows.Add(row);

                    foreach (T item in data)
                    {
                        row = new TableRow();
                        foreach (PropertyDescriptor prop in props)
                        {
                            TableCell cell = new TableCell();
                            cell.Text = prop.Converter.ConvertToString(prop.GetValue(item));
                            row.Cells.Add(cell);
                        }
                        table.Rows.Add(row);
                    }

                    table.RenderControl(htw);
                    output.Write(sw.ToString());
                }
            }

        }

        public void WriteCsv<T>(IEnumerable<T> data, TextWriter output)
        {
            PropertyDescriptorCollection props = TypeDescriptor.GetProperties(typeof(T));
            foreach (PropertyDescriptor prop in props)
            {
                output.Write(prop.DisplayName); 
                output.Write(",");
            }
            output.WriteLine();
            foreach (T item in data)
            {
                foreach (PropertyDescriptor prop in props)
                {
                    output.Write(prop.Converter.ConvertToString(
                         prop.GetValue(item)));
                    output.Write(",");
                }
                output.WriteLine();
            }
        }

        public void ExportListFromCsv()
        {
            email = Session["email"].ToString();
            List<ContactViewModel> data = repository.GetList(email);

            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=Contact.csv");
            Response.AddHeader("Content-Type", "application/vnd.ms-excel");
            WriteCsv(data, Response.Output);
            Response.End();
        }
        [NonAction]

        public List<Contact> GetContactList()
        {
            return new List<Contact>{
            new Contact{
               ContactId = 1,
               Name = "Allan",
               Email = "allan@gmail.com",
               Mobile = "01718999888",
               Address = "Mirpur"
            },

            new Contact{
               ContactId = 2,
               Name = "Carson",
               Email = "carson@gmail.com",
               Mobile = "01718999887",
               Address = "Gulshan"
            },

            new Contact{
                ContactId = 3,
               Name = "George",
               Email = "george@gmail.com",
               Mobile = "01718999886",
               Address = "Bashundhara"
            },

            new Contact{
               ContactId = 4,
               Name = "Joy",
               Email = "joy@gmail.com",
               Mobile = "01718999848",
               Address = "Dhanmondi"
            },
         };
        }

        public ActionResult Contracts()
        {
            var contacts = from e in GetContactList()
                           orderby e.ContactId
                           select e;
            return View(contacts);
        }
    }
}