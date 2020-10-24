using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebAppSastiServices.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        
        [HttpGet]
        public ActionResult ContactUs()
        {
            return View();
        }
    }
}