using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ContactManagement.Domain.Model;
using ContactManagement.Repository.ViewModel;

namespace ContactManagement.Repository.Repository
{    
    public class ContactInformationRepository : Repository<ContactInformation>
    {
        public dynamic GetAllContacts(string email)
        {
            var result = Entities.Where(x=> x.Category.User.Email == email).Select(x=> new {
                x.ContactId,
                x.CategoryId,
                x.Category.Title,
                x.Name,
                x.Mobile,
                x.Email,
                x.Address
            }).OrderByDescending(x => x.ContactId).ToList();
            return result;
        }
        
        public List<ContactViewModel> GetList(string email)
        {
            var result = Entities.Where(x => x.Category.User.Email == email).Select(x => new {               
                x.Category.Title,
                x.Name,
                x.Mobile,
                x.Email,
                x.Address
            }).ToList();

            List<ContactViewModel> list = new List<ContactViewModel>();
            foreach(var obj in result)
            {
                ContactViewModel con = new ContactViewModel();
                con.Name = obj.Name;
                con.Email = obj.Email;
                con.Mobile = obj.Mobile;
                con.Address = obj.Address;
                con.CategoryTitle = obj.Title;
                list.Add(con);
            }
            return list;
        }
        public ContactInformation GetContact(int? Id)
        {
            ContactInformation obj = Entities.FirstOrDefault(x => x.ContactId == Id);
            return obj;
        }

        public int? GetCategorytIdByTitle(string title)
        {
            int? CategorytId = Entity<Category>().Where(x => x.Title.ToLower() == title.ToLower()).Select(x=> x.CategoryId).FirstOrDefault();
            return CategorytId;
        }

        public bool IsDuplicate(string name)
        {
            var result = Entities.Where(x => x.Name == name).Any();
            return result;
        }
    }
}
