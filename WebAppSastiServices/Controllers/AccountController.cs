﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebAppSastiServices.Models.ViewModel;
using WebAppSastiServices.Models.EntityManager;
using WebAppSastiServices.Models.DB;
using System.Web.Helpers;
using System.Collections;
using System.Web.Caching;

namespace WebAppSastiServices.Controllers
{
    public class AccountController : Controller
    {
        private SastaServicesDBEntities db = new SastaServicesDBEntities();
        // GET: Account
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(UserRegisterView user)
        {
            if (ModelState.IsValid)
            {

                var isExist = UserManager.IsEmailExist(user.EmailID);
                if (isExist)
                {
                    ModelState.AddModelError("EmailExist", "Email Already Exist");
                    return View(user);
                }
                else
                {
                    try
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
                        stpUser.STPRolesID = 1;
                        stpUser.STPRolesCategoriesID = 17;
                        db.StpUsers.Add(stpUser);
                        db.SaveChanges();

                        TempData["Message"] = "RegisterSuccess";
                        return Redirect(Url.Action("Login", "Account"));
                    }
                    catch (Exception ex)
                    {
                        TempData["Message"] = "RegisterFail";
                        return View(user);
                    }
                }
            }
            else
            {
                return View(user);
            }
        }

        [HttpGet]
        public ActionResult Login()
        {
            ViewBag.Message=TempData["Message"] ;
            return View();
        }


        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }

        public JsonResult SessionEnd()
{
            if (Session["UserName"] != null || Session["LoggedInTime"] != null)
            {
                DateTime loggedInTime = Convert.ToDateTime(Session["LoggedInTime"]);
                TimeSpan elapsedtimespan = DateTime.Now.Subtract(loggedInTime);
                int elapsedtime = Convert.ToInt32(elapsedtimespan.TotalMinutes);

                if (elapsedtime >= 20)
                {
                    Session.Abandon();
                    Dispose();
                    TempData["Message"] = "SessionExpired";
                    return Json("true", JsonRequestBehavior.AllowGet);
                }

            }
            return Json("false" , JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public ActionResult Login(UserLoginView u)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var isExist = UserManager.IsUsernameExist(u.UserName);
                    if (isExist)
                    {
                        string hashedPass = UserManager.GetHashedPassByUsername(u.UserName);
                        string UserPass = Crypto.Hash(u.Password);

                        if (Equals(hashedPass, UserPass))
                        {
                            int id = UserManager.GetUserIDByUsername(u.UserName);
                            Session["UserID"] = id;
                            Session["UserName"] = u.UserName;

                            string Role = db.StpUsers.Find(id).StpRole.Description;
                            int RoleID = db.StpUsers.Find(id).StpRole.ID;
                            int RoleCategoryID = db.StpUsers.Find(id).STPRolesCategory.ID;
                            string RoleCategory = db.StpUsers.Find(id).STPRolesCategory.Description;
                            Session["RoleID"] = RoleID;
                            Session["LoggedInTime"] = DateTime.Now;

                            string Message = "";

                            if (Role == "User")
                            {
                                Message = "LogInSuccess";


                                return Redirect(Url.Action("Index", "Home"));
                            }
                            else if (Role == "Admin")
                            {
                                Message = "LogInSuccess";
                                return Redirect(Url.Action("Index", "AdminDashboard"));
                            }

                            else if (Role == "Vendor")
                            {
                                var serviceType = "";

                                if (RoleCategory == "Air Condition") { serviceType = "Air Condition"; }
                                else if (RoleCategory == "UPS") { serviceType = "UPS"; }
                                else if (RoleCategory == "Generator") { serviceType = "Generator"; }
                                else if (RoleCategory == "Solar System") { serviceType = "Solar System"; }
                                else if (RoleCategory == "CCTV") { serviceType = "CCTV Camera"; }

                                Session["serviceType"] = serviceType;
                                return Redirect(Url.Action("Index", "VendorDashboard"));

                            }
                            else if (Role == "Supplier")
                            {

                            }

                            TempData["Message"] = Message;
                            Session["RoleCategoryID"] = RoleCategoryID;
                        }

                        else
                        {
                            ViewBag.Message = "Invalid";
                        }
                    }
                    else
                    {
                        ViewBag.Message = "notFound";
                    }

                }
            }
            catch (Exception)
            {
                ViewBag.Message = "Error";
            }
                
                return View();
            }




        }
    }
