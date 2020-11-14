﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            if(Session["serviceType"] != null) { 
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
            else
            {
                TempData["Message"] = "AdminSelctOpt";
                return Redirect(Url.Action("Index", "AdminDashboard"));
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
            try { 
            string serviceType = Session["serviceType"].ToString();

            if (serviceType != null)
            {
                db.Configuration.ProxyCreationEnabled = false;
                var orders = (from o in db.TRNCustomerOrders
                              join t in db.STPPrefferedTimes on o.preferredTimeID equals t.ID
                              join s in db.STPServiceTypes on o.ServiceTypeId equals s.ID
                              join st in db.STPStatus on o.OrderStatusId equals st.ID
                              where (s.ServiceTypeName == serviceType && o.STPStatu.Description == "Not Availed")
                              orderby o.CreateOn descending
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
             catch
            {
                TempData["Message"] = "NotVendor";
                return Redirect(Url.Action("Login", "Account"));
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
                                    ServiceRate = o.ServiceRate,
                                    btns = " <div class='btn-group' role='group'>" +
                                    "<a type='button' class='btn btn-danger text-light' onclick=OpenDeleteForm(" + o.ID + ") id='Delete'><i class='fas fa-trash'></i> </a>" +
                                    "<a type='button' class='btn btn-primary text-light' onclick=OpenEditForm(" + o.ID + ") id='Edit'><i class='far fa-edit'></i> </a></div>"
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
        public ActionResult CreateServices()
        {
            try { 
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
            catch 
            {
                return RedirectToAction("Login","Account");
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateServices(STPServiceMetadata obj)
        {
            string serviceType = Session["serviceType"].ToString();
            if (serviceType != null)
            {
                try
                {
                    if (ModelState.IsValid)
                    {
                        STPService service = new STPService()
                        {
                            ServiceName = obj.ServiceName,
                            ServiceDescrption = obj.ServiceDescrption,
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
                    else
                    {
                        TempData["Message"] = "NotAddservice";
                    }
                }
                catch
                {
                    TempData["Message"] = "NotAddservice";
                }
            }
            else
            {
                TempData["Message"] = "NotAddservice";
            }

            return Redirect(Url.Action("ViewServices", "VendorDashboard"));
        }

        public ActionResult ItemsData()
        {
            try { 
            string serviceType = Session["serviceType"].ToString();

            if (serviceType != null)
            {

                var products = (from p in db.STPServiceProductItems
                                join b in db.STPProductBrands on p.STPProductBrandID equals b.ID
                                join f in db.STPServicesFuelTypes on p.FuelTypeId equals f.ID
                                join u in db.STPServicesUnitTypes on p.UnitTypeId equals u.ID
                                where (p.STPProductType.ProductTypeName == serviceType)
                                select new
                                {
                                    ProductName = p.ServiceProductName,
                                    ItemNo = p.ServiceModelNo,
                                    BrandName = b.Name,
                                    FuelType = f.Options,
                                    UnitType = u.Options,
                                    CostPrice = p.CostPrice,
                                    SellingPrice = p.SellingPrice,
                                    ProductType=p.STPProductType.ProductTypeName,
                                    btns= " <div class='btn-group' role='group'>"+
                                    "<a type='button' class='btn btn-danger text-light' onclick=OpenDeleteForm(" + p.ID + ") id='Delete'><i class='fas fa-trash'></i> </a>" +
                                    "<a type='button' class='btn btn-primary text-light' onclick=OpenEditForm(" + p.ID + ") id='Edit'><i class='far fa-edit'></i> </a></div>"
                                }).ToList();

                return Json(products, JsonRequestBehavior.AllowGet);
            }
            else { return Json(new { products = false }, JsonRequestBehavior.AllowGet); }
            }
            catch
            {
                return RedirectToAction("Login","Account");
            }
        }
        public ActionResult ViewItems()
        { 
            ViewBag.Message = TempData["Message"];
            return View();
        }
        public ActionResult CreateItems()
        {
            string serviceType = Session["serviceType"].ToString();
            ViewBag.Message = TempData["Message"];
            if (serviceType != null)
            {
                ViewBag.UnitType = new SelectList(db.STPServicesUnitTypes.Where(s => s.STPServiceType.ServiceTypeName == serviceType), "ID", "Options");
                ViewBag.FuelType = new SelectList(db.STPServicesFuelTypes.Where(s => s.STPServiceType.ServiceTypeName == serviceType), "ID", "Options");
                ViewBag.ProductBrand = new SelectList(db.STPProductBrands.Where(s => s.STPProductType.ProductTypeName == serviceType), "ID", "Name ");
            }
            return View();
        }
        [HttpPost]
        public ActionResult CreateItems(STPServiceProductItemMetadata obj)
        {

            string serviceType = Session["serviceType"].ToString();
            var productTypeID = (from d in db.STPProductTypes
                                where (d.ProductTypeName == serviceType)
                                select d.ID).FirstOrDefault();


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
                    CreatedDateTime = System.DateTime.Now,
                    STPProductTypeID= productTypeID
                };
                db.STPServiceProductItems.Add(product);
                db.SaveChanges();
                    TempData["Message"] = "AddItem";
                }
                catch (Exception ex)
                {
                    TempData["Message"] = "NotAddItem";
                }
            }


            //else
            //{
            //    ViewBag.Message = "You have not specified a file.";
            //}

            return Redirect(Url.Action("ViewItems", "VendorDashboard"));
        }
        public ActionResult ACEmail()
        {
            return View();
        }
        public ActionResult ACProfile()
        {
            return View();
        }
        public ActionResult AddProductBrand()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddProductBrand(STPProductBrandMetadata product)
        {
            string serviceType = Session["serviceType"].ToString();

            bool isAlready = (from d in db.STPProductBrands
                              where d.Name == product.Name
                              select d)
                              .Any();


            if (serviceType != null)
            {
                if (!isAlready) { 
                STPProductBrand p = new STPProductBrand()
                {
                    Name = product.Name,
                    STPProductTypeID = db.STPProductTypes.Where(a => a.ProductTypeName == serviceType).Select(a => a.ID).FirstOrDefault()
                };
                db.STPProductBrands.Add(p);
                db.SaveChanges();
                 TempData["Message"] = "brandAdd";
                }
                else
                {
                    TempData["Message"] ="brandAlready";
                }
                return RedirectToAction("CreateItems");
            }
            else
            {
                TempData["Message"] = "NotVendor";
                return Redirect(Url.Action("Login", "Account"));
            }
        }
        public ActionResult ItemDelete(int? ID)
        {
            var details = (from d in db.STPServiceProductItems
                           where (d.ID == ID)
                           select d).SingleOrDefault();

            return View(details);
        }
        [HttpPost]
        public ActionResult ItemDelete(int ID)
        {
            try { 
            var details = (from d in db.STPServiceProductItems
                         where (d.ID == ID)
                         select d).SingleOrDefault();
            db.STPServiceProductItems.Remove(details);
            db.SaveChanges();
                TempData["Message"] = "Deleted";
            }
            catch
            {
                TempData["Message"] = "InUse";
            }
            return Redirect(Url.Action("ViewItems", "VendorDashboard"));
        }
        [HttpGet]
        public ActionResult ItemEdit(int? ID)
        {
            var ProductTypeName = (from d in db.STPServiceProductItems where (d.ID == ID) select d.STPProductType.ProductTypeName).FirstOrDefault();
            var ProductTypeID = (from d in db.STPServiceProductItems where (d.ID == ID) select d.STPProductTypeID).FirstOrDefault();
            var serviceTypeID = (from d in db.STPServiceTypes where (d.ServiceTypeName == ProductTypeName) select d.ID).FirstOrDefault();

            ViewBag.FuelType = new SelectList(db.STPServicesFuelTypes.Where(s => s.STPServiceTypeID == serviceTypeID), "ID", "Options");
            ViewBag.UnitType = new SelectList(db.STPServicesUnitTypes.Where(s => s.STPServiceTypeID == serviceTypeID), "ID", "Options");
            ViewBag.BrandName = new SelectList(db.STPProductBrands.Where(s => s.STPProductTypeID == ProductTypeID), "ID", "Name");
            ViewBag.ProductTypeID = ProductTypeID;
            var details = (from d in db.STPServiceProductItems
                           where (d.ID == ID)
                           select d).SingleOrDefault();

            return View(details);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ItemEdit(STPServiceProductItem item)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    db.Entry(item).State = EntityState.Modified;
                    db.SaveChanges();

                    TempData["Message"] = "Edited";
                }
            }
            catch(Exception ex)
            {
                TempData["Message"] = "NotEdited";
            }
            return Redirect(Url.Action("ViewItems", "VendorDashboard"));
        }
        public ActionResult ServicesDelete(int? ID)
        {
            var details = (from d in db.STPServices
                           where (d.ID == ID)
                           select d).SingleOrDefault();

            return View(details);
        }
        [HttpPost]
        public ActionResult ServicesDelete(int ID)
        {
            try { 
            var details = (from d in db.STPServices
                           where (d.ID == ID)
                         select d).SingleOrDefault();

            db.STPServices.Remove(details);
            db.SaveChanges();
                TempData["Message"] = "Deleted";
            }
            catch
            {
                TempData["Message"] = "InUse";
            }
            return Redirect(Url.Action("ViewServices", "VendorDashboard"));
        }
        [HttpGet]
        public ActionResult ServicesEdit(int? ID)
        {
            try
            {
                string serviceType = Session["serviceType"].ToString();
                int serviceTypeId = (from d in db.STPServiceTypes
                                    where d.ServiceTypeName == serviceType
                                    select d.ID).FirstOrDefault();

                ViewBag.FuelType = new SelectList(db.STPServicesFuelTypes.Where(s =>s.STPServiceTypeID == serviceTypeId), "ID", "Options");
                ViewBag.UnitType = new SelectList(db.STPServicesUnitTypes.Where(s => s.STPServiceTypeID == serviceTypeId), "ID", "Options");
                var details = (from d in db.STPServices
                               where (d.ID == ID)
                               select d).SingleOrDefault();

                return View(details);
            }
            catch
            {
                return RedirectToAction("ViewServices","VendorDashboard");
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ServicesEdit(STPService item)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    db.Entry(item).State = EntityState.Modified;
                    db.SaveChanges();

                    TempData["Message"] = "Edited";
                }
                else { }
            }
            catch(Exception ex)
            {
                TempData["Message"] = "NotEdited";
            }
            return Redirect(Url.Action("ViewServices", "VendorDashboard"));
        }
    }
}