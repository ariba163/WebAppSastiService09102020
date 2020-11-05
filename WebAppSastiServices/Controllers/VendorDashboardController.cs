using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebAppSastiServices.Models;
using WebAppSastiServices.Models.DB;

namespace WebAppSastiServices.Controllers
{
    public class VendorDashboardController : Controller
    {
        SastaServicesDBEntities db = new SastaServicesDBEntities();
      
        // GET: VendorDashboard
        public ActionResult Index()
        {
            
            ViewBag.Message = TempData["Message"];
            int? ID = Convert.ToInt32(Session["UserID"]);
            if (Session["UserID"] == null)
            {
                ID = null;
            }

            bool isValid = (from d in db.StpUsers
                            where (d.ID == ID && (d.StpRole.Description == "Vendor"|| d.StpRole.Description=="Admin"))
                            select d).Any();

            if (isValid)
            {
                return View();
            }
            else
            {
                TempData["Message"] = "NotVendor";
                return Redirect(Url.Action("Login", "Account"));
            }

        }


        public ActionResult ChooseService(string ServiceName)
        {
            string value = "";

            switch (ServiceName)
            {
                case "AC":
                    value = "Air Condition";
                    break;

                case "CCTV":
                    value = "CCTV Camera";
                    break;

                case "UPS":
                    value = "UPS";
                    break;

                case "SolarSys":
                    value = "Solar System";
                    break;

                case "Generator":
                    value = "Generator";
                    break;

                default:
                    break;
            }

            Session["serviceType"] = value;
            return RedirectToAction("Index");
        }

        public ActionResult LatestActOrders()
        {
            string serviceType = Session["serviceType"].ToString();

            if (serviceType != null)
            {
                db.Configuration.ProxyCreationEnabled = false;
                var orders = (from o in db.TRNCustomerOrders
                              join t in db.STPPrefferedTimes on o.preferredTimeID equals t.ID
                              join s in db.STPServiceTypes on o.ServiceTypeId equals s.ID
                              join st in db.STPStatus on o.OrderStatusId equals st.ID
                              where (s.ServiceTypeName == serviceType && o.STPStatu.Description == "Not Availed")
                              select new
                              {
                                  OrderId = o.OrderId,
                                  CustomerName = o.CustomerName,
                                  Contact = o.Contact,
                                  Address = o.Address,
                                  Description = s.ServiceTypeName,
                                  TimeRange = t.TimeRange,
                                  preferredDate = o.preferredDate.ToString(),
                                  status = st.Description,
                                  btns = " <div class='btn-group' role='group'><a type='button' class='btn btn-success text-light' onclick=AvailOrder(" + o.OrderId + ") id='Avail'>Avail Order</a>" +
                                         "<a type='button' class='btn btn-secondary text-light' onclick=OpenDetailForm(" + o.OrderId + ") id='Details'>Details</a></div>"

                              }).
                              ToList();


                return Json(orders, JsonRequestBehavior.AllowGet);
            }

            else
            {
                return Json(new { orders = false }, JsonRequestBehavior.AllowGet);
            }
        
    }
        public ActionResult AvailedOrder()
        {
            return View();
        }

        public ActionResult AvailedOrdersData()
        {

            string serviceType = Session["serviceType"].ToString();

            if (serviceType != null)
            {
                db.Configuration.ProxyCreationEnabled = false;

                var result = (from o in db.TRNCustomerOrders
                              join t in db.STPPrefferedTimes on o.preferredTimeID equals t.ID
                              join s in db.STPServiceTypes on o.ServiceTypeId equals s.ID
                              join st in db.STPStatus on o.OrderStatusId equals st.ID
                              where (s.ServiceTypeName == serviceType && o.STPStatu.Description == "Availed")
                              select new
                              {
                                  OrderId = o.OrderId,
                                  CustomerName = o.CustomerName,
                                  Contact = o.Contact,
                                  Address = o.Address,
                                  Description = s.ServiceTypeName,
                                  TimeRange = t.TimeRange,
                                  preferredDate = o.preferredDate.ToString(),
                                  status = st.Description,
                                  btns = " <div class='btn-group' role='group'><a type='button' class='btn btn-secondary text-light' onclick=OpenDetailForm(" + o.OrderId + ") id='Detail'><i class='fas fa-info-circle'></i> </a></div>"

                              }).
                              ToList();


                return Json(result, JsonRequestBehavior.AllowGet);
            }

            else
            {
                return Json(new { result = false }, JsonRequestBehavior.AllowGet);
            }





        }



        public ActionResult AvailOrder(int? ID)
        {
            var Order = (from d in db.TRNCustomerOrders
                         where (d.OrderId == ID)
                         select d).First();

            return View(Order);
        }
        [HttpPost]
        public ActionResult AvailOrder(string OrderId)
        {
            int ID = Convert.ToInt32(OrderId);

            var Order = db.TRNCustomerOrders.Where(x => x.OrderId == ID).First();
            Order.OrderStatusId = (from d in db.STPStatus
                                   where (d.Description == "Availed")
                                   select d.ID).First();
            db.SaveChanges();

            return Redirect(Url.Action("Index", "VendorDashboard"));
        }

        public ActionResult ServiceData()
        {


            string serviceType = Session["serviceType"].ToString();

            if (serviceType != null)
            {

                db.Configuration.ProxyCreationEnabled = false;

                var services = (from o in db.STPServices
                                join s in db.STPServiceTypes on o.STPServiceTypeID equals s.ID
                                join f in db.STPServicesFuelTypes on o.FuelTypeId equals f.ID
                                join u in db.STPServicesUnitTypes on o.UnitTypeId equals u.ID
                                where (o.STPServiceType.ServiceTypeName == serviceType)
                                select new
                                {
                                    ServiceName = o.ServiceName,
                                    ServiceType = s.ServiceTypeName,
                                    FuelType = f.Options,
                                    UnitType = u.Options,
                                    ServiceRate = o.ServiceRate
                                }).ToList();



                return Json(services, JsonRequestBehavior.AllowGet);
            }

            else
            {
                return Json(new { services = false }, JsonRequestBehavior.AllowGet);
            }



        }

        public ActionResult ViewServices()
        {
            ViewBag.Message = TempData["Message"];
            return View();
        }
        [HttpGet]
        public ActionResult ACCreateServices()
        {
            string serviceType = Session["serviceType"].ToString();
            if (serviceType != null)
            {
                ViewBag.UnitType = new SelectList(db.STPServicesUnitTypes.Where(s => s.STPServiceType.ServiceTypeName == serviceType), "ID", "Options");
                ViewBag.FuelType = new SelectList(db.STPServicesFuelTypes.Where(s => s.STPServiceType.ServiceTypeName == serviceType), "ID", "Options");
            }
            else
            {
                ViewBag.UnitType = "";
                ViewBag.FuelType = "";
            }

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateServices(service obj)
        {
            string serviceType = Session["serviceType"].ToString();
            if (serviceType != null)
            {
                if (ModelState.IsValid)
                {
                    try
                    {
                        STPService service = new STPService()
                        {
                            ServiceName = obj.ServiceName,
                            ServiceDescrption = obj.ServiceDescription,
                            STPServiceTypeID = db.STPServiceTypes.Where(d => d.ServiceTypeName == serviceType).Select(d => d.ID).FirstOrDefault(),
                            IsAvailible = true,
                            FuelTypeId = obj.FuelTypeId,
                            UnitTypeId = obj.UnitTypeId,
                            ServiceRate = obj.ServiceRate,
                            CreatedDateTime = System.DateTime.Now
                        };
                        db.STPServices.Add(service);
                        db.SaveChanges();
                        TempData["Message"] = "AddService";
                    }
                    catch
                    {
                        TempData["Message"] = "NotAddservice";
                    }
                }
            }
            return Redirect(Url.Action("ViewServices", "VendorDashboard"));

        }


        // store data of ACCreateServices
        public class service
        {
            public string ServiceName { get; set; }
            public string ServiceDescription { get; set; }
            public int FuelTypeId { get; set; }
            public int UnitTypeId { get; set; }
            public decimal ServiceRate { get; set; }
        }


        public ActionResult ItemsData()
        {


            string serviceType = Session["serviceType"].ToString();

            if (serviceType != null)
            {

                var products = (from p in db.STPServiceProductItems
                                join b in db.STPProductBrands on p.STPProductBrandID equals b.ID
                                join f in db.STPServicesFuelTypes on p.FuelTypeId equals f.ID
                                join u in db.STPServicesUnitTypes on p.UnitTypeId equals u.ID
                                where (p.STPProductBrand.STPProductType.ProductTypeName == serviceType)
                                select new
                                {
                                    ProductName = p.ServiceProductName,
                                    ItemNo = p.ServiceModelNo,
                                    BrandName = b.Name,
                                    FuelType = f.Options,
                                    UnitType = u.Options,
                                    CostPrice = p.CostPrice,
                                    SellingPrice = p.SellingPrice
                                }).ToList();

                return Json(products, JsonRequestBehavior.AllowGet);
            }
            else { return Json(new { products = false }, JsonRequestBehavior.AllowGet); }
        }
        public ActionResult ViewItems()
        {
            return View();
        }
        public ActionResult ACCreateItems()
        {

            string serviceType = Session["serviceType"].ToString();

            if (serviceType != null)
            {
                ViewBag.UnitType = new SelectList(db.STPServicesUnitTypes.Where(s => s.STPServiceType.ServiceTypeName == serviceType), "ID", "Options");
                ViewBag.FuelType = new SelectList(db.STPServicesFuelTypes.Where(s => s.STPServiceType.ServiceTypeName == serviceType), "ID", "Options");
                ViewBag.ProductBrand = new SelectList(db.STPProductBrands.Where(s => s.STPProductType.ProductTypeName == serviceType), "ID", "Name ");
            }
            return View();
        }
        [HttpPost]
        public ActionResult ACCreateItems(product obj)
        {

            string serviceType = Session["serviceType"].ToString();

            if (serviceType != null)
            {
                try { 
                STPServiceProductItem product = new STPServiceProductItem()
                {
                    ServiceModelNo = obj.ServiceModelNo,
                    ServiceProductName = obj.ServiceProductName,
                    ServiceProductDescription = obj.ServiceProductDescription,
                    STPProductBrandID = obj.STPProductBrandID,
                    IsAvailible = true,
                    FuelTypeId = obj.FuelTypeId,
                    UnitTypeId = obj.UnitTypeId,
                    CostPrice = obj.CostPrice,
                    SellingPrice = obj.SellingPrice,
                    CreatedDateTime = System.DateTime.Now
                };
                db.STPServiceProductItems.Add(product);
                db.SaveChanges();

                }
                catch (Exception ex)
                {
                    ViewBag.Message = "ERROR:" + ex.Message.ToString();
                }
            }


            //else
            //{
            //    ViewBag.Message = "You have not specified a file.";
            //}

            return Redirect(Url.Action("ViewItems", "VendorDashboard"));
        }


        // store data of ACCreateItems
        public class product
        {
            public string ServiceProductName { get; set; }
            public string ServiceProductDescription { get; set; }
            public int FuelTypeId { get; set; }
            public int UnitTypeId { get; set; }
            public string ServiceModelNo { get; set; }
            public int STPProductBrandID { get; set; }
            public decimal CostPrice { get; set; }
            public decimal SellingPrice { get; set; }
        }


        public ActionResult ACEmail()
        {
            return View();
        }
        public ActionResult ACProfile()
        {
            return View();
        }



    }
}