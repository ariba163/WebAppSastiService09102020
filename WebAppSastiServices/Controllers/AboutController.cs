using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebAppSastiServices.Controllers
{
    public class AboutController : Controller
    {
        // GET: About

        [HttpGet]
        public ActionResult AboutUs()
        {
            return View();
        }
    }
}