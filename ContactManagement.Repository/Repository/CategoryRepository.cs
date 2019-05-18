using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ContactManagement.Domain.Model;

namespace ContactManagement.Repository.Repository
{
    public class CategoryRepository : Repository<Category>
    {
        public dynamic GetAllCategories(string email)
        {
            var result = Entities.Where(x=> x.User.Email == email)
                .Select(x=> new
                {
                    x.CategoryId,
                    x.UserId,
                    x.Title,
                    x.Description
                })
                .OrderByDescending(x => x.CategoryId).ToList();
            return result;
        }

        public dynamic PopulateCategories(string email)
        {
            var result = Entities.Where(x => x.User.Email == email).Select(x=> new { Id = x.CategoryId, Name = x.Title }).OrderByDescending(x => x.Id).ToList();
            return result;
        }

        public Category GetCategory(int? Id)
        {
            Category obj = Entities.FirstOrDefault(x => x.CategoryId == Id);
            return obj;
        }

        public bool IsDuplicate(string title, string email)
        {
            var result = Entities.Where(x => x.Title == title && x.User.Email == email).Any();
            return result;
        }
    }
}
