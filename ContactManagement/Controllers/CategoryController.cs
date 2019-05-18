using ContactManagement.Domain.Model;
using ContactManagement.Repository.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ContactManagement.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        CategoryRepository repository = new CategoryRepository();
        UserRepository userRepository = new UserRepository();

        string email = string.Empty;
        public ActionResult Index()
        {
            email = Session["email"].ToString();
            return View();
        }

        public ActionResult GetAllCategories()
        {
            email = Session["email"].ToString();
            var result = repository.GetAllCategories(email);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult PopulateCategories()
        {
            email = Session["email"].ToString();
            var result = repository.PopulateCategories(email);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddCategory(Category model)
        {
            email = Session["email"].ToString();
            string msg = string.Empty;
            if (model != null)
            {
                if (model.CategoryId > 0)
                {
                    Category obj = repository.GetCategory(model.CategoryId);
                    obj.Title = model.Title;
                    obj.Description = model.Description;
                    repository.Update(obj);
                    msg = "Record Updated Successfully";
                }
                else
                {
                    bool isDuplicate = repository.IsDuplicate(model.Title, email);
                    if(isDuplicate)
                    {
                        msg = "Category is already exists";
                    }
                    else
                    {
                        model.UserId = userRepository.GetUserId(email);
                        model.EntryDate = DateTime.Now;
                        repository.Insert(model);
                        msg = "Record Saved Successfully";
                    }
                   
                }
            }
            else
            {
                msg = "Invalid Record";
            }

            return Json(msg, JsonRequestBehavior.AllowGet);
        }

        [NonAction]

        public List<Category> GetCategoryList()
        {
            return new List<Category>{
            new Category{
               CategoryId = 1,
               Title = "Family",
               Description = "We are family",
               UserId = 1
            },

            new Category{
               CategoryId = 2,
               Title = "Friend",
               Description = "N/A",
               UserId = 1
            },
         };
        }

        public ActionResult Categories()
        {
            var categories = GetCategoryList().OrderByDescending(x => x.CategoryId).ToList();
            return View(categories);
        }
    }
}