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
        //------Generators start--------------
        public ActionResult GeneratorsIndex()
        {
            return View();
        }


        public ActionResult GeneratorsEmail()
        {
            return View();
        }
        public ActionResult GeneratorsProfile()
        {
            return View();
        }
        public ActionResult GeneratorsInvoice()
        {
            return View();
        }
        public ActionResult GeneratorsLogin()
        {
            return View();
        }
        public ActionResult GeneratorsRegister()
        {
            return View();
        }
        public ActionResult GeneratorsLockScreen()
        {
            return View();
        }
        public ActionResult GeneratorsViewServices()
        {
            return View();
        }
        public ActionResult GeneratorsCreateServices()
        {
            return View();
        }
        public ActionResult GeneratorsEditServices()
        {
            return View();
        }
        public ActionResult GeneratorsDeleteServices()
        {
            return View();
        }
        
        public ActionResult GeneratorsViewItems()
        {
            return View();
        }
        public ActionResult GeneratorsCreateItems()
        {
            return View();
        }
        public ActionResult GeneratorsEditItems()
        {
            return View();
        }
        public ActionResult GeneratorsDeleteItems()
        {
            return View();
        }
        //------Generators end


        //------AC start--------------
        // GET: VendorDashboard
        public ActionResult ACIndex()
        {
            return View();
        }
        public ActionResult ACLatestActOrders()
        {

            db.Configuration.ProxyCreationEnabled = false;

            var result = (from o in db.TRNCustomerOrders
                          join t in db.STPPrefferedTimes on o.preferredTimeID equals t.ID
                          join s in db.STPServiceTypes on o.ServiceTypeId equals s.ID
                          join st in db.STPStatus on o.OrderStatusId equals st.ID
                          where (s.ServiceTypeName == "Air Condition" && o.STPStatu.Description == "Not Availed")
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


            return Json(result, JsonRequestBehavior.AllowGet);
        }


        public ActionResult ACAvailedOrder()
        {
            return View();
        }

        public ActionResult ACAvailedOrdersData()
        {

            db.Configuration.ProxyCreationEnabled = false;

            var result = (from o in db.TRNCustomerOrders
                          join t in db.STPPrefferedTimes on o.preferredTimeID equals t.ID
                          join s in db.STPServiceTypes on o.ServiceTypeId equals s.ID
                          join st in db.STPStatus on o.OrderStatusId equals st.ID
                          where (s.ServiceTypeName == "Air Condition" && o.STPStatu.Description == "Availed")
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

            return Redirect(Url.Action("ACIndex", "VendorDashboard"));
        }
        public ActionResult ACEmail()
        {
            return View();
        }
        public ActionResult ACProfile()
        {
            return View();
        }
        //public ActionResult ACInvoice(int OrderID)
        //{
        //    var order = (from d in db.TRNCustomerOrders
        //                where(d.OrderId == OrderID)
        //                select d). 
        //                FirstOrDefault();

        //    return View(order);
        //}

        // public ActionResult ACInvService(int fuelTypeID,int unitTypeID )
        // {

        //    ViewBag.Services = new SelectList(db.STPServices.Where(f =>  f.UnitTypeId == unitTypeID && f.FuelTypeId == fuelTypeID), "ID", "ServiceName");
            
        //    return View();
        //}

        //[HttpPost]
        //public ActionResult getSerValue(int ID)
        // {

        //    var results = (from d in db.STPServices
        //                           where (d.ID == ID)
        //                           select d).First();

        //    return Json(results.ServiceRate, JsonRequestBehavior.AllowGet);
        //}
        



        // public ActionResult ACInvItems(int fuelTypeID, int unitTypeID)
        //{
        //    ViewBag.Products = new SelectList(db.STPServiceProductItems.Where(f => f.UnitTypeId == unitTypeID && f.FuelTypeId == fuelTypeID), "ID", "ServiceProductName");

        //    List<SelectListItem> ModelNo = new List<SelectListItem>() {
        //        new SelectListItem() { Value="0", Text="-- Select Model No --" },
        //   };

        //    ViewBag.ModelNo = ModelNo;

        //    return View();
        //}


        //[HttpPost]
        //public ActionResult getItemNo(int ID, int fuelTypeID, int unitTypeID)
        //{

        //    db.Configuration.ProxyCreationEnabled = false;

        //    var ProductName = (from d in db.STPServiceProductItems
        //                       where (d.ID == ID)
        //                   select d.ServiceProductName).FirstOrDefault();

        //    var product = (from d in db.STPServiceProductItems
        //                   where (d.ServiceProductName == ProductName && d.UnitTypeId == unitTypeID && d.FuelTypeId == fuelTypeID)
        //                select d).ToList();


        //    return Json(product, JsonRequestBehavior.AllowGet);
        //}


        //[HttpPost]
        //public ActionResult getPrice(int ID)
        //{
        //    var results = (from d in db.STPServiceProductItems
        //                   where (d.ID == ID)
        //                   select d.SellingPrice).First();

        //    return Json(results, JsonRequestBehavior.AllowGet);
        //}


        public ActionResult ACLogin()
        {
            return View();
        }
        public ActionResult ACRegister()
        {
            return View();
        }
        public ActionResult ACLockScreen()
        {
            return View();
        }

        public ActionResult ACServiceData()
        {

            var services = (from o in db.STPServices
                            join s in db.STPServiceTypes on o.STPServiceTypeID equals s.ID
                            join f in db.STPServicesFuelTypes on o.FuelTypeId equals f.ID
                            join u in db.STPServicesUnitTypes on o.UnitTypeId equals u.ID
                            where (o.STPServiceType.ServiceTypeName == "Air Condition")
                            select new
                            {
                                ServiceName = o.ServiceName,
                                ServiceType = s.ServiceTypeName,
                                FuelType = f.Options,
                                UnitType = u.Options,
                                ServiceRate=o.ServiceRate
                            }).ToList();

            return Json(services, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ACViewServices()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ACCreateServices()
        {
            ViewBag.UnitType = new SelectList(db.STPServicesUnitTypes.Where(s=>s.STPServiceType.ServiceTypeName== "Air Condition"),"ID", "Options"); 
            ViewBag.FuelType = new SelectList(db.STPServicesFuelTypes.Where(s => s.STPServiceType.ServiceTypeName == "Air Condition"), "ID", "Options");


            return View();
        }
        [HttpPost]
        public ActionResult ACCreateServices(service obj)
        {
            STPService service = new STPService()
            {
                ServiceName = obj.ServiceName,
                ServiceDescrption = obj.ServiceDescription,
                STPServiceTypeID = 5,
                IsAvailible = true,
                FuelTypeId = obj.FuelTypeId,
                UnitTypeId = obj.UnitTypeId,
                ServiceRate = obj.ServiceRate,
                CreatedDateTime = System.DateTime.Now
            };
            db.STPServices.Add(service);
            db.SaveChanges();


            return Redirect(Url.Action("ACViewServices", "VendorDashboard")); 
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

        public ActionResult ACEditServices()
        {
            return View();
        }
        public ActionResult ACDeleteServices()
        {
            return View();
        }

        public ActionResult ACItemsData()
        {
            var products = (from p in db.STPServiceProductItems
                            join b in db.STPProductBrands on p.STPProductBrandID equals b.ID
                            join f in db.STPServicesFuelTypes on p.FuelTypeId equals f.ID
                            join u in db.STPServicesUnitTypes on p.UnitTypeId equals u.ID
                            where (p.STPProductBrand.STPProductType.ProductTypeName == "Air Condition")
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
        public ActionResult ACViewItems()
        {
            return View();
        }
        public ActionResult ACCreateItems()
        {
            ViewBag.UnitType = new SelectList(db.STPServicesUnitTypes.Where(s => s.STPServiceType.ServiceTypeName == "Air Condition"), "ID", "Options");
            ViewBag.FuelType = new SelectList(db.STPServicesFuelTypes.Where(s => s.STPServiceType.ServiceTypeName == "Air Condition"), "ID", "Options");
            ViewBag.ProductBrand = new SelectList(db.STPProductBrands.Where(s => s.STPProductType.ProductTypeName == "Air Condition"), "ID", "Name ");

            return View();
        }
        [HttpPost]
        public ActionResult ACCreateItems(product obj)
        {
            //if (ImageFilePath != null && ImageFilePath.ContentLength > 0) { 
                
            //        string path = Path.Combine(Server.MapPath("~/img"),
            //                                   Path.GetFileName(ImageFilePath.FileName));
            //        ImageFilePath.SaveAs(path);
            //        ViewBag.Message = "File uploaded successfully";


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

            //}

            //catch (Exception ex)
            //{
            //    ViewBag.Message = "ERROR:" + ex.Message.ToString();
            //}
            //else
            //{
            //    ViewBag.Message = "You have not specified a file.";
            //}

            return Redirect(Url.Action("ACViewItems", "VendorDashboard"));
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



        public ActionResult ACEditItems()
        {
            return View();
        }
        public ActionResult ACDeleteItems()
        {
            return View();
        }
        //------AC end

        
        //------CCTV start--------------
        // GET: VendorDashboard
        public ActionResult CCTVIndex()
        {
            return View();
        }


        public ActionResult CCTVEmail()
        {
            return View();
        }
        public ActionResult CCTVProfile()
        {
            return View();
        }
        public ActionResult CCTVInvoice()
        {
            return View();
        }
        public ActionResult CCTVLogin()
        {
            return View();
        }
        public ActionResult CCTVRegister()
        {
            return View();
        }
        public ActionResult CCTVLockScreen()
        {
            return View();
        }
        public ActionResult CCTVViewServices()
        {
            return View();
        }
        public ActionResult CCTVCreateServices()
        {
            return View();
        }
        public ActionResult CCTVEditServices()
        {
            return View();
        }
        public ActionResult CCTVDeleteServices()
        {
            return View();
        }

        public ActionResult CCTVViewItems()
        {
            return View();
        }
        public ActionResult CCTVCreateItems()
        {
            return View();
        }
        public ActionResult CCTVEditItems()
        {
            return View();
        }
        public ActionResult CCTVDeleteItems()
        {
            return View();
        }
        //-----CCTV end

        //------SolarSys start--------------
        // GET: VendorDashboard
        public ActionResult SolarSysIndex()
        {
            return View();
        }


        public ActionResult SolarSysEmail()
        {
            return View();
        }
        public ActionResult SolarSysProfile()
        {
            return View();
        }
        public ActionResult SolarSysInvoice()
        {
            return View();
        }
        public ActionResult SolarSysLogin()
        {
            return View();
        }
        public ActionResult SolarSysRegister()
        {
            return View();
        }
        public ActionResult SolarSysLockScreen()
        {
            return View();
        }
        public ActionResult SolarSysViewServices()
        {
            return View();
        }
        public ActionResult SolarSysCreateServices()
        {
            return View();
        }
        public ActionResult SolarSysEditServices()
        {
            return View();
        }
        public ActionResult SolarSysDeleteServices()
        {
            return View();
        }

        public ActionResult SolarSysViewItems()
        {
            return View();
        }
        public ActionResult SolarSysCreateItems()
        {
            return View();
        }
        public ActionResult SolarSysEditItems()
        {
            return View();
        }
        public ActionResult SolarSysDeleteItems()
        {
            return View();
        }
        //-----SolarSys end
        //------UPS start--------------
        // GET: VendorDashboard
        public ActionResult UPSIndex()
        {
            return View();
        }


        public ActionResult UPSEmail()
        {
            return View();
        }
        public ActionResult UPSProfile()
        {
            return View();
        }
        public ActionResult UPSInvoice()
        {
            return View();
        }
        public ActionResult UPSLogin()
        {
            return View();
        }
        public ActionResult UPSRegister()
        {
            return View();
        }
        public ActionResult UPSLockScreen()
        {
            return View();
        }
        public ActionResult UPSViewServices()
        {
            return View();
        }
        public ActionResult UPSCreateServices()
        {
            return View();
        }
        public ActionResult UPSEditServices()
        {
            return View();
        }
        public ActionResult UPSDeleteServices()
        {
            return View();
        }

        public ActionResult UPSViewItems()
        {
            return View();
        }
        public ActionResult UPSCreateItems()
        {
            return View();
        }
        public ActionResult UPSEditItems()
        {
            return View();
        }
        public ActionResult UPSDeleteItems()
        {
            return View();
        }
        //-----UPS end




        public ActionResult Print()
        {
            return View();
        }


    }
}