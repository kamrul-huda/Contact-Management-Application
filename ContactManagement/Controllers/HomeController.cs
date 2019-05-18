using ContactManagement.Repository.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ContactManagement.Controllers
{
    public class HomeController : Controller
    {
        UserRepository repository = new UserRepository();
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(FormCollection collection)
        {
            string email = Request.Form["Email"];
            string password = Request.Form["Pssword"];

            if (repository.IsValid(email, password))
            {
                Session["email"] = email;
                return RedirectToAction("Index", "User");
            }
            else
            {
                ViewBag.Message = "Wrong user name and password!";
            }
            return View();
        }

        public ActionResult LogOff()
        {
            Session["email"] = "";
            return View("Index");
        }


        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Register(FormCollection collection)
        {
            string email = Request.Form["email"];
            string name = Request.Form["name"];
            string password = Request.Form["password"];
            return View();
        }
    }
}