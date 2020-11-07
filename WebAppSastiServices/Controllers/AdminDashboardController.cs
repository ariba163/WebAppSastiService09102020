﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using WebAppSastiServices.Models;
using WebAppSastiServices.Models.DB;
using WebAppSastiServices.Models.EntityManager;
using WebAppSastiServices.Models.ViewModel;
    

namespace WebAppSastiServices.Controllers
{

    public class AdminDashboardController : Controller
    {
        

        SastaServicesDBEntities db = new SastaServicesDBEntities();


        // GET: AdminDashboard
        public ActionResult Index()
        {

            ViewBag.Message = TempData["Message"];
            int? ID = Convert.ToInt32(Session["UserID"]);
            if (Session["UserID"] == null)
            {
                ID = null;
            }
            bool isAdmin = (from d in db.StpUsers
                            where (d.ID == ID && d.StpRole.Description == "Admin")
                            select d).Any();



            if (isAdmin)
            {
                Session["IsAdmin"] = "true";
                return View();
            }
            else
            {
                TempData["Message"] = "NotAdmin";
                return Redirect(Url.Action("Login", "Account"));
            }
        }

        public ActionResult QuickCallRequest() {

            return View();
        }

        public ActionResult QuickCallData()
        {
            var Requests = (from d in db.STPQuickCalls
                            orderby d.createdDateTime descending
                            select new 
                            {
                                ID=d.ID,
                                UserName= d.Name,
                                UserContact=d.Contact,
                                CreatedDateTime=d.createdDateTime
                            }
                            ).ToList();

            return Json(Requests, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Invoices()
        {

            return View();
        }

        public ActionResult InvoicesData()
        {
            var Requests = (from d in db.TRNInvoices
                            select new
                            {
                                ID = d.ID,
                                OrderID=d.TRNCustomerOrder.OrderId,
                                CustomerName = d.TRNCustomerOrder.CustomerName,
                                CustomerContact = d.TRNCustomerOrder.Contact,
                                Services= db.TRNCustomerOrders_STPServices.Where(s=>s.TRNCustomerOrderID== d.TRNCustomerOrder.OrderId).Select(s=>s.STPService.ServiceName).ToList(),
                                Products = db.TRNCustomerOrders_STPProductItems.Where(s=>s.TRNCustomerOrderID== d.TRNCustomerOrder.OrderId).Select(s => s.STPServiceProductItem.ServiceProductName).ToList(),
                            }
                            ).ToList();

            return Json(Requests, JsonRequestBehavior.AllowGet);
        }
        public ActionResult LatestActOrders()
        {
            db.Configuration.ProxyCreationEnabled = false;

            //---------Single Table Data---------
            //IList<TRNCustomerOrder> orders = db.TRNCustomerOrders.
            //    Where(s => s.STPStatu.Description == "Not Availed").
            //    ToList<TRNCustomerOrder>();


            var result = (from o in db.TRNCustomerOrders
                          join t in db.STPPrefferedTimes on o.preferredTimeID equals t.ID
                          join s in db.STPServiceTypes on o.ServiceTypeId equals s.ID
                          join st in db.STPStatus on o.OrderStatusId equals st.ID
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
                              CreateOn = o.CreateOn.ToString(),
                              btns = " <div class='btn-group' role='group'><a type='button' class='btn btn-secondary text-light' onclick=OpenDetailForm(" + o.OrderId + ") id='Detail'><i class='fas fa-info-circle'></i> </a>" +
                                                    "<a type='button' class='btn btn-danger text-light' onclick=OpenDeleteForm(" + o.OrderId + ") id='Delete'><i class='fas fa-trash'></i> </a>" +
                                                    "<a type='button' class='btn btn-primary text-light' onclick=OpenEditForm(" + o.OrderId + ") id='Edit'><i class='far fa-edit'></i> </a></div>"

                          }).ToList();


            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SessionEnd()
        {
            string SessionStatus;

            if(Session["UserID"] != null)
            {
                SessionStatus = "Continue";
            }
            else
            {
                SessionStatus = "Stop";
            }

            return Json(SessionStatus, JsonRequestBehavior.AllowGet);

        }


        public ActionResult OrderDetails(int? ID)
        {
            var details = (from d in db.TRNCustomerOrders
                           where (d.OrderId == ID)
                           select d).SingleOrDefault();

            return View(details);
        }
        public ActionResult OrderDelete(int? ID)
        {

            var details = (from d in db.TRNCustomerOrders
                           where (d.OrderId == ID)
                           select d).SingleOrDefault();

            return View(details);
        }
        [HttpPost]
        public ActionResult OrderDelete(string OrderId)
        {
            int ID = Convert.ToInt32(OrderId);
            var Order = (from d in db.TRNCustomerOrders
                         where (d.OrderId == ID)
                         select d).SingleOrDefault();
            db.TRNCustomerOrders.Remove(Order);
            db.SaveChanges();

            return Redirect(Url.Action("Index", "AdminDashboard"));
        }
        [HttpGet]
        public ActionResult OrderEdit(int? ID)
        {
            var serviceID = (from d in db.TRNCustomerOrders where (d.OrderId == ID) select d.ServiceTypeId).FirstOrDefault();
            ViewBag.FuelType = new SelectList(db.STPServicesFuelTypes.Where(s => s.STPServiceTypeID == serviceID), "ID", "Options");
            ViewBag.UnitType = new SelectList(db.STPServicesUnitTypes.Where(s => s.STPServiceTypeID == serviceID), "ID", "Options");
            ViewBag.preferredTime = new SelectList(db.STPPrefferedTimes, "ID", "TimeRange");
            ViewBag.status = new SelectList(db.STPStatus.Where(s => s.STPStatusType.Description == "Orders"), "ID", "Description");

            var details = (from d in db.TRNCustomerOrders
                           where (d.OrderId == ID)
                           select d).SingleOrDefault();

            return View(details);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult OrderEdit(TRNCustomerOrder order)
        {
            try
            {
                if (ModelState.IsValid) 
                {
               
            db.Entry(order).State = EntityState.Modified;
            db.SaveChanges();

            return Redirect(Url.Action("Index", "AdminDashboard"));
                }
                else
                {
                    return View(order);
                }
            }
            catch
            {
                return View(order);
            }
        }

        public ActionResult AvailedOrders()
        {
            return View();
        }

        public ActionResult AvailedOrdersData()
        {

            var result = (from o in db.TRNCustomerOrders
                          join t in db.STPPrefferedTimes on o.preferredTimeID equals t.ID
                          join s in db.STPServiceTypes on o.ServiceTypeId equals s.ID
                          join st in db.STPStatus on o.OrderStatusId equals st.ID
                          where (o.STPStatu.Description == "Availed")
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
                              CreateOn = o.CreateOn.ToString(),
                              btns = " <div class='btn-group' role='group'><a type='button' class='btn btn-secondary text-light' href='/AdminDashboard/Invoice?OrderID=" + o.OrderId + "' id='Invoice'> Invoice </a></div>"

                          }).ToList();


            return Json(result, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterVendorSupplierView user)
        {

            if (ModelState.IsValid)
            {

                var isEmailExist = UserManager.IsEmailExist(user.EmailID);
                var isNameExist = UserManager.IsUsernameExist(user.UserName);
                if (isEmailExist)
                {
                    ModelState.AddModelError("EmailExist", "Email Already Exist");
                    return View(user);
                }
                else if (isNameExist)
                {
                    ModelState.AddModelError("UserNameExist", "UserName Already Exist");
                    return View(user);
                }
                else
                {
                    StpUser stpUser = new StpUser();
                    stpUser.UserName = user.UserName;
                    stpUser.EmailID = user.EmailID;
                    stpUser.Password = Crypto.Hash(user.Password);
                    stpUser.Contact = user.Contact;
                    stpUser.Address = user.Address;
                    stpUser.CreatedDate = System.DateTime.Now;
                    stpUser.IsEmailVerified = false;
                    stpUser.IsEmailActive = false;
                    stpUser.ActivationCode = Guid.NewGuid();
                    stpUser.STPRolesID = user.STPRolesID;
                    stpUser.STPRolesCategoriesID = user.STPRolesCategoriesID;
                    db.StpUsers.Add(stpUser);
                    db.SaveChanges();

                    TempData["Message"] = "RegisterSuccess";
                    return View("Index");
                }
            }
            else
            {
                return View(user);
            }

        }

        public ActionResult getRoleCategories(int RoleID)
        {
            db.Configuration.ProxyCreationEnabled = false;

            var roleCategories = (from d in db.STPRolesCategories
                                  where d.STPRolesID == RoleID
                                  select d).ToList();

            return Json(roleCategories, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Register()
        {
            ViewBag.Roles = new SelectList(db.StpRoles.Where(d=>d.Description!="Admin"),"ID","Description");
            List<SelectListItem> Categories = new List<SelectListItem>() {
                new SelectListItem() {Value="0", Text="- Select Role Category -" },
           };

            ViewBag.STPRolesCategoriesID = Categories;
            return View();
        }

        public ActionResult Email()
        {
            return View();
        }
        public ActionResult Vendor()
        {
            return View();
        }
        //public ActionResult Supplier()
        //{
        //    return View();
        //}
        public ActionResult AdminProfile()
        {
            return View();
        }

        public ActionResult InvService(int fuelTypeID, int unitTypeID,int serviceTypeID)
        {
            ViewBag.Services = new SelectList(db.STPServices.Where(f => (f.UnitTypeId == unitTypeID && f.FuelTypeId == fuelTypeID)||(f.STPServiceTypeID == serviceTypeID && (f.STPServicesFuelType.Options=="Default"|| f.STPServicesUnitType.Options == "Default"))), "ID", "ServiceName");
            return View();
        }
        [HttpPost]
        public ActionResult getSerValue(int ID)
        {

            var results = (from d in db.STPServices
                           where (d.ID == ID)
                           select d.ServiceRate).First();

            return Json(results, JsonRequestBehavior.AllowGet);
        }
        public ActionResult InvItems(int fuelTypeID, int unitTypeID,int serviceTypeID)
        {
            ViewBag.Products = new SelectList(db.STPServiceProductItems.Where(f => (f.UnitTypeId == unitTypeID && f.FuelTypeId == fuelTypeID) ||  (f.STPServicesFuelType.Options == "Default" || f.STPServicesUnitType.Options == "Default")), "ID", "ServiceProductName");

            List<SelectListItem> ModelNo = new List<SelectListItem>() {
                new SelectListItem() { Value="0", Text="-- Select Model No --" },
           };

            ViewBag.ModelNo = ModelNo;

            return View();
        }
        [HttpPost]
        public ActionResult getItemNo(int ID, int fuelTypeID, int unitTypeID)
        {

            db.Configuration.ProxyCreationEnabled = false;

            var ProductName = (from d in db.STPServiceProductItems
                               where (d.ID == ID)
                               select d.ServiceProductName).FirstOrDefault();

            var product = (from d in db.STPServiceProductItems
                           where (d.ServiceProductName == ProductName && d.UnitTypeId == unitTypeID && d.FuelTypeId == fuelTypeID)
                           select d).ToList();


            return Json(product, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult getPrice(int ID)
        {
            var results = (from d in db.STPServiceProductItems
                           where (d.ID == ID)
                           select d.SellingPrice).First();

            return Json(results, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult PostServices(int ServiceID, int OrderID)
        {
            var serviceRate = (from d in db.STPServices
                              where d.ID == ServiceID
                              select d.ServiceRate).FirstOrDefault();
            var PlatformCharges = (serviceRate * 2 / 100);
            var Total = serviceRate + PlatformCharges;

            TRNCustomerOrders_STPServices s = new TRNCustomerOrders_STPServices()
            {
                STPServicesID = ServiceID,
                TRNCustomerOrderID = OrderID,
                Rate = Total
            };
            db.TRNCustomerOrders_STPServices.Add(s);
            db.SaveChanges();


            return Json(s, JsonRequestBehavior.AllowGet);

        }
        
        [HttpPost]
        public JsonResult PostItem(int ModelNoId, int OrderID,int QTY)
        {
            TRNCustomerOrders_STPProductItems p = new TRNCustomerOrders_STPProductItems()
            {
                STPProductItemsID = ModelNoId,
                TRNCustomerOrderID = OrderID,
                QTY= QTY
            };
            db.TRNCustomerOrders_STPProductItems.Add(p);
            db.SaveChanges();


            return Json(p, JsonRequestBehavior.AllowGet);

        }


        public ActionResult InvSerTbl(int OrderID)
        {
            var service = (from d in db.TRNCustomerOrders_STPServices
                                    where d.TRNCustomerOrderID == OrderID
                                    select d).ToList();
            return View(service);
        }

        public JsonResult DeleteInvItem(int rowID)
        {
            var row = (from d in db.TRNCustomerOrders_STPProductItems
                       where (d.ID == rowID)
                       select d).SingleOrDefault();
            db.TRNCustomerOrders_STPProductItems.Remove(row);
            db.SaveChanges();

            return Json(true, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteInvSer(int rowID)
        {
            var row = (from d in db.TRNCustomerOrders_STPServices
                         where (d.ID == rowID)
                         select d).SingleOrDefault();

            if(row != null)
            {

                db.TRNCustomerOrders_STPServices.Remove(row);
                db.SaveChanges();
                return Json(true, JsonRequestBehavior.AllowGet);

            }
            else
            {
            return Json(false, JsonRequestBehavior.AllowGet);

            }

        }
        public ActionResult InvItemTbl(int OrderID)
        {
            var item = (from d in db.TRNCustomerOrders_STPProductItems
                                  where d.TRNCustomerOrderID == OrderID
                                  select d).ToList();
            return View(item);
        }




        [HttpPost]
        public ActionResult PostInvoice(int OrderID, decimal ServiceRatetotal, decimal ItemsRatetotal, decimal PlatformCharges, decimal total)
        {

            bool isAlready = (from d in db.TRNInvoices
                            where (d.STPOrdersID == OrderID)
                            select d).Any();


            if (isAlready)
            {
                TempData["Message"] = "Invoiced";
                return Json(new { p = false }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                try { 
                if (ServiceRatetotal != 0 || ItemsRatetotal != 0)
                {
                        TRNInvoice p = new TRNInvoice()
                        {
                        STPOrdersID = OrderID,
                        ServiceCharges = ServiceRatetotal,
                        ProductItemCharges = ItemsRatetotal,
                        PlatformCharges = PlatformCharges,
                        TotalAmount = total
                    };
                    db.TRNInvoices.Add(p);

                    db.TRNCustomerOrders.Find(OrderID).OrderStatusId= (from a in db.STPStatus
                                                                       where (a.Description == "Finished" && a.STPStatusType.Description == "Orders")
                                                                       select a.ID).FirstOrDefault();

                    db.SaveChanges();

                        TempData["InvoiceID"] = (from i in db.TRNInvoices
                                            where (i.STPOrdersID == OrderID)
                                            select i.ID).FirstOrDefault(); 

                    TempData["Message"] = "InvoiceSuccess";
                    return Json( p.ID , JsonRequestBehavior.AllowGet);
                }

                    TempData["Message"] = "InvoiceError";
                    return Json(new { p = false }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex) {
                    //throw ex;
                    TempData["Message"] = "InvoiceErr";
                    return Json(new { p = false}, JsonRequestBehavior.AllowGet);
                }
            }
        }



        public ActionResult Invoice(int OrderID)
        {
            ViewBag.Message = TempData["Message"];
            ViewBag.InvoiceID = TempData["InvoiceID"];
            var order = (from d in db.TRNCustomerOrders
                         where (d.OrderId == OrderID)
                         select d).
                        FirstOrDefault();

            return View(order);
        }
        public ActionResult PrintInvoice(int invId)
        {
            try
            {


                var results =(from d in db.TRNInvoices
                              where (d.ID == invId)
                              select d).SingleOrDefault();

                if(results != null)
                {
                    int OrderID = results.STPOrdersID;


                    var row1 = (from d in db.TRNCustomerOrders_STPServices
                              where d.TRNCustomerOrderID == OrderID
                              select d).ToList();

                    ViewBag.ServiceData = row1;

                    var row2 = (from d in db.TRNCustomerOrders_STPProductItems
                              where d.TRNCustomerOrderID == OrderID
                              select d).ToList();

                    ViewBag.ProductData = row2;
                    


                }

                return View(results);
            }
            catch(Exception ex)
            {
                //throw ex;
                return View();
            }

        }
        public ActionResult GeneratePDF(int invId)
        {
            return new Rotativa.ActionAsPdf("PrintInvoice",
                                         new { invId = invId });

        }


    }
}
