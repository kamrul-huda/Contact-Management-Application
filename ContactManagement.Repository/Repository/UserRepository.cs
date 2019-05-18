using ContactManagement.Domain.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ContactManagement.Repository.Repository
{ 
    public class UserRepository : Repository<User>
    {
        public dynamic GetAllUsers(string email)
        {
            var result = Entities.Select(x=> new {
                x.UserId,
                x.Name,
                x.Mobile,
                x.Email,
                x.Address,
                x.Pssword
            }).Where(x=> x.Email == email).ToList();
            return result;
        }

        public dynamic GetById(int? Id)
        {
            var result = Entities.Find(Id);
            return result;
        }

        public User GetUser(int? Id)
        {
            User obj = Entities.FirstOrDefault(x => x.UserId == Id);
            return obj;
        }

        public int GetUserId(string mail)
        {
            int userId = Entities.Where(x => x.Email == mail).Select(x => x.UserId).FirstOrDefault();
            return userId;
        }

        public bool IsValid(string mail, string pass)
        {
            bool isValid = Entities.Where(x => x.Email == mail && x.Pssword == pass).Any();
            return isValid;
        }

        public bool IsDuplicateUser(string mail)
        {
            var result = Entities.Where(x => x.Email == mail).Any();
            return result;
        }
    }
}
