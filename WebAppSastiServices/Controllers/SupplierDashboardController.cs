using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebAppSastiServices.Models.DB;

namespace WebAppSastiServices.Controllers
{
    public class SupplierDashboardController : Controller
    {
        SastaServicesDBEntities db = new SastaServicesDBEntities();
        // GET: SupplierDashboard
        public ActionResult Index()
        {
            ViewBag.Message = TempData["Message"];
            int? ID = Convert.ToInt32(Session["UserID"]);
            if (Session["UserID"] == null)
            {
                ID = null;
            }
            if (Session["ProductType"] != null)
            {
                bool isValid = (from d in db.StpUsers
                                where (d.ID == ID && (d.StpRole.Description == "Supplier" || d.StpRole.Description == "Admin"))
                                select d).Any();
                if (isValid)
                {
                    return View();
                }
                else
                {
                    TempData["Message"] = "NotSupplier";
                    return Redirect(Url.Action("Login", "Account"));
                }
            }
            else
            {
                TempData["Message"] = "AdminSelctOpt";
                return Redirect(Url.Action("Index", "AdminDashboard"));
            }
        }

        public ActionResult ProductList()
        {
            return View();
        }
        public ActionResult ProductListData()
        {
            try
            {
                string ProductType = Session["ProductType"].ToString();

                if (ProductType != null)
                {
                  var ProductList=(from d in db.STPProductLists
                                    where d.STPProductType.ProductTypeName== ProductType
                                    select new
                                    {
                                        productID=d.ID,
                                        productName=d.ProductName,
                                        productSKU=d.ProductSKU,
                                        productDescription=d.ProductShortDescription,
                                        productPrice=d.ProductPrice,
                                        productDiscountedPrice=d.DiscountedAmount,
                                        productImage=d.ImageOne,
                                        btns = " <div class='btn-group' role='group'><a type='button' class='btn btn-secondary text-light' onclick=OpenDetailForm(" + d.ID + ") id='Detail'><i class='fas fa-info-circle'></i> </a></div>"
                                    }
                                    ).ToList();

                    return Json(ProductList, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(false, JsonRequestBehavior.AllowGet);
                }
            }
            catch
            {
                TempData["Message"] = "NotVendor";
                return Redirect(Url.Action("Login", "Account"));
            }

        }


        public ActionResult Email()
        {
            return View();
        }
        public ActionResult SupplierProfile()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult LockScreen()
        {
            return View();
        }
        public ActionResult Invoice()
        {
            return View();
        }
    }
}