using ContactManagement.Domain.Model;
using ContactManagement.Repository.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace ContactManagement.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        UserRepository repository = new UserRepository();

        string email = string.Empty;
        // GET: User
        public ActionResult Index()
        {
            email = Session["email"].ToString();
            return View();
        }

        public ActionResult GetAllUsers()
        {
            email = Session["email"].ToString();
            var result = repository.GetAllUsers(email);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetUserById(int? Id)
        {
            var obj = repository.GetById(Id);
            return Json(obj, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddUser(User model)
        {
            string msg = string.Empty;
            if (model != null)
            {
                if (model.UserId > 0)
                {
                    User obj = repository.GetUser(model.UserId);
                    obj.Name = model.Name;
                    obj.Mobile = model.Mobile;
                    obj.Address = model.Address;
                    repository.Update(obj);
                    msg = "Record Updated Successfully";
                }
               
            }
            else
            {
                msg = "Invalid Record";
            }

            return Json(msg, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Register(FormCollection collection)
        {
            string msg = string.Empty;
            string email = Request.Form["email"];
            string name = Request.Form["name"];
            string password = Request.Form["password"];

            if (repository.IsDuplicateUser(email))
            {
                msg = "User is already exists!";
            }
            else
            {
                Domain.Model.User obj = new Domain.Model.User();
                obj.Email = email;
                obj.Mobile = name;
                obj.Pssword = password;
                repository.Insert(obj);
                msg = "Registration Successfully complete!";
            }

            return View();
        }


        [NonAction]

        public List<User> GetUserList()
        {
            return new List<User>{
            new User{
               UserId = 1,
               Name = "Rana",
               Email = "allan@gmail.com",
               Mobile = "01718999888",
               Pssword = "Mirpur"
            },

            new User{
               UserId = 2,
               Name = "Carson",
               Email = "carson@gmail.com",
               Mobile = "01718999887",
               Pssword = "Gulshan"
            },

            new User{
                UserId = 3,
               Name = "George",
               Email = "george@gmail.com",
               Mobile = "01718999886",
               Address = "Bashundhara"
            },

            new User{
               UserId = 4,
               Name = "Joy",
               Email = "joy@gmail.com",
               Mobile = "01718999848",
               Address = "Dhanmondi"
            },
         };
        }

        public ActionResult Users()
        {
            var users = GetUserList().OrderByDescending(x => x.UserId).ToList(); ;
            return View(users);
        }
    }
}