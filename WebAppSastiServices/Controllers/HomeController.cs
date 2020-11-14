using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebAppSastiServices.Models.DB;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Net;
using System.Net.Mail;
using WebAppSastiServices.Models;
using WebAppSastiServices.Models.ViewModel;

namespace WebAppSastiServices.Controllers
{

    public class HomeController : Controller
    {
        SastaServicesDBEntities db = new SastaServicesDBEntities();
        // GET: Home


        public ActionResult Index()
        {

            if (TempData["Message"] != null) { 
            ViewBag.Message = TempData["Message"];
            }
            return View();
        }


        [HttpGet]
        public ActionResult AboutUs()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        [HttpGet]
        public PartialViewResult pvGetInTouch()
        {
            return PartialView();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult pvGetInTouch(GetInTouch g)
        {

            if (ModelState.IsValid)
            {
                string RequestNumber = DateTime.Now.Day.ToString() +
                                   DateTime.Now.Month.ToString() +
                                   DateTime.Now.Year.ToString() +
                                   DateTime.Now.Hour.ToString() +
                                   DateTime.Now.Minute.ToString() +
                                   DateTime.Now.Second.ToString();
                try { 

                SendEmail("sastiService123@gmail.com",
                          "muhammadmoosahaider@gmail.com", //Email of customer support employee
                          g.Email,
                          "Email Received by " + g.Name,
                          g.Message,
                          "smtp.gmail.com",
                          587,
                          "sastiService123456",
                          RequestNumber,
                          true);

                //Entry into the Database

                STPCustomerSupport cp = new STPCustomerSupport()
                {
                    Name = g.Name,
                    ContactNo = g.ContactNo,
                    Subject = g.Subject,
                    Email = g.Email,
                    Message = g.Message,
                    RequestNumber = RequestNumber

                };

                db.STPCustomerSupports.Add(cp);
                db.SaveChanges();
                TempData["Message"] = "Emailsuccess";
                    
                    return RedirectToAction("Index");
                }
                catch(Exception ex)
                {
                    throw ex;
                    return RedirectToAction("Index");
                }

            }
            else
            {
                return RedirectToAction("Index");
            }
        }

        [HttpGet]
        public PartialViewResult pvQuickCall()
        {
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult pvQuickCall(QuickCall q)
        {

            if (ModelState.IsValid)
            {
                try
                {

                    STPQuickCall Qcall = new STPQuickCall()
                    {
                        Name = q.Name,
                        Contact = q.Contact
                    };

                    db.STPQuickCalls.Add(Qcall);
                    db.SaveChanges();
                    Session["Message"] = "QCallSucceed";
                    return RedirectToAction("Index");
                }
                catch
                {
                    Session["Message"] = "QCallFailed";
                }


            }
            else {

                Session["Message"] = "QCallFailed";
            }
            return View();
        }

        
        public ActionResult CustomerOrder(int? serviceTypeId)
        {
            ViewBag.ServiceType = new SelectList(db.STPServiceTypes.Where(s => s.ID == serviceTypeId), "ID", "ServiceTypeName");
            ViewBag.FuelType = new SelectList(db.STPServicesFuelTypes.Where(f => f.STPServiceTypeID == serviceTypeId), "ID", "Options");
            ViewBag.UnitType = new SelectList(db.STPServicesUnitTypes.Where(u => u.STPServiceTypeID == serviceTypeId), "ID", "Options");
            ViewBag.preferredTime = new SelectList(db.STPPrefferedTimes, "ID", "TimeRange");


            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CustomerOrder(TRNCustomerOrderMetadata model)
        {

            try { 
            if (ModelState.IsValid)
            {
                TRNCustomerOrder o = new TRNCustomerOrder()
                {
                    CustomerName = model.CustomerName,
                    Contact = model.Contact,
                    Email=model.Email,
                    Address = model.Address,
                    OrderDescription = model.OrderDescription,
                    preferredDate = model.preferredDate,
                    preferredTimeID = model.preferredTimeID,
                    FuelTypeId = model.FuelTypeId,
                    UnitTypeId = model.UnitTypeId,
                    ServiceTypeId = model.ServiceTypeId,
                    CreateOn = System.DateTime.Now,
                    OrderStatusId = 6


                };
                db.TRNCustomerOrders.Add(o);
                db.SaveChanges();
                TempData["Message"] = "success";

                return Redirect(Url.Action("Index", "Home"));

                }
                else { 
                TempData["Message"] = "error";
                return Redirect(Url.Action("Index", "Home"));
                }
            }
            catch {

                TempData["Message"] = "error";
                return Redirect(Url.Action("Index", "Home"));
            }

        }



        public void SendEmail(string emailFromAddress,
                                     string emailToAddress,
                                     string emailUser,
                                     string subject,
                                     string body,
                                     string smtpAddress,
                                     int portNumber,
                                     string password,
                                     string RequestNumber,
                                     bool enableSSL)
        {
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFromAddress);
                mail.To.Add(emailToAddress);
                mail.CC.Add(emailUser);
                mail.Subject = subject;
                string strBody = "<html><head><Title> Kaam Waley </Title></head><body bgcolor='#ccc'>  <h1>Email Notification from Customer</h1><br /> <p>The message has been received by $$$emailUser$$$</p><br /> <h3>Request Number: $$$RequestNumber$$$</h3><br />  <h3>Message: $$$body$$$</h3><br /></body></html>";
                strBody = strBody.Replace("$$$emailUser$$$", emailUser);
                strBody = strBody.Replace("$$$RequestNumber$$$", RequestNumber);
                strBody = strBody.Replace("$$$body$$$", body);
                mail.Body = strBody;
                mail.IsBodyHtml = true;
                //mail.Attachments.Add(new Attachment("D:\\TestFile.txt"));//--Uncomment this to send any attachment  
                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential(emailFromAddress, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);



                }
            }
        }




        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        //[HttpPost]
        //public ActionResult Login()
        //{
        //    return View();
        //}

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        //[HttpPost]
        //public ActionResult Register()
        //{
        //    return View();
        //}

        [HttpGet]
        public ActionResult ForgotPassword()
        {
            return View();
        }





        //[HttpPost]
        //public ActionResult ForgotPassword()
        //{
        //    return View();
        //}
        // [HttpGet]
        public PartialViewResult PVservices()
        {
            var Services = (from d in db.STPServiceTypes
                            orderby d.ID ascending
                            select d).Take(5).ToList();

            return PartialView(Services);

        }

    }

}