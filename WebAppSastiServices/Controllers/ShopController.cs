using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebAppSastiServices.Controllers
{
    public class ShopController : Controller
    {
        // GET: Shop

        [HttpGet]
        public ActionResult Products()
        {
            return View();
        }

        [HttpGet]
        public ActionResult ProductGrid()
        {
            return View();
        }

         [HttpGet]
        public ActionResult ProductDetail()
        {
            return View();
        }

        [HttpGet]
        public ActionResult ShopCart()
        {
            return View();
        }

        [HttpGet]
        public ActionResult ShopCheckout()
        {
            return View();
        }
    }
}