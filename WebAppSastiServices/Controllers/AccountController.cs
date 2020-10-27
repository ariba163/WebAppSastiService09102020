using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebAppSastiServices.Models.ViewModel;
using WebAppSastiServices.Models.EntityManager;
using WebAppSastiServices.Models.DB;
using System.Web.Helpers;

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
                    stpUser.STPUserTypeID = 1 ;
                    db.StpUsers.Add(stpUser);
                    db.SaveChanges();

                    TempData["Message"] = "RegisterSuccess";
                    return Redirect(Url.Action("Login", "Account"));
                }
            }
            else
            {
                return View(user);
            }
            return View(user);
        }

        [HttpGet]
        public ActionResult Login()
        {
            ViewBag.Message=TempData["Message"] ;
            return View();
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
                            string UserType = db.StpUsers.Find(id).StpUserType.UserType;
                            Session["UserRole"] = UserType;


                            if (UserType == "User")
                            {
                                TempData["Message"] = "LogInSuccess";
                                return Redirect(Url.Action("Index", "Home"));
                            }
                            else if (UserType == "Admin")
                            {
                                TempData["Message"] = "LogInSuccess";
                                return Redirect(Url.Action("Index", "AdminDashboard"));
                            }
                        }

                        else
         
                        
                        
                        
                        
                        
                        {
                            ViewBag.Message = "Invalid";
                        }
                    }


                }
            }
            catch (Exception e)
            {
                ViewBag.Message = "Error";
            }
                


                return View();
            }




        }
    }
