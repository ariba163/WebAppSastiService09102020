using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebAppSastiServices.Models.DB;

namespace WebAppSastiServices.Controllers
{
    public class ServicesController : Controller
    {
        SastaServicesDBEntities db = new SastaServicesDBEntities();

        // GET: Services
        public ActionResult Service()
        {
            var Services = (from d in db.STPServiceTypes
                            orderby d.ID descending
                            select d).Take(5).ToList();
            return View(Services);
        }

        public ActionResult ServiceDetail(int serviceTypeID)
        {
            var data = (from d in db.STPServiceTypes 
                       where d.ID== serviceTypeID
                       select d).FirstOrDefault();

            return View(data);
        }
    }
}