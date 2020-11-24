using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebAppSastiServices.Models.DB;

namespace WebAppSastiServices.Controllers
{
    public class ShopController : Controller
    {

        SastaServicesDBEntities db = new SastaServicesDBEntities();

        // GET: Shop
        [HttpGet]
        public ActionResult Products()
        {
            return View();
        }

        public ActionResult ProductGrid()
        {
            ViewBag.categories = (from d in db.STPProductTypes
                              select d).ToList();
            ViewBag.products = db.STPProductLists.ToList();
            return View();
        }

        public JsonResult ProductGridList(string Category, int? page)
        {
            using (var db = new SastaServicesDBEntities())
            {
                db.Configuration.LazyLoadingEnabled = false;

                int CategoryID = db.STPProductTypes.Where(x => x.ProductTypeName == Category).Select(x => x.ID).FirstOrDefault();

                if (CategoryID > 0)
                {
                    var ProductRow = db.STPProductLists.Where(x => x.STPProductTypeID == CategoryID).ToList();

                    if (page > 0)
                    {
                        page = page;
                    }
                    else
                    {
                        page = 1;
                    }

                    int start = (int)(page - 1) * 9;
                    ViewBag.pageCurrent = page;
                    int totalPage = ProductRow.Count();
                    float totalNumsize = (totalPage / (float)9);
                    int numSize = (int)Math.Ceiling(totalNumsize);
                    ViewBag.numSize = numSize;
                    var dataPost = ProductRow.OrderBy(x => x.ID).Skip(start).Take(9);
                    List<STPProductList> ListProduct = new List<STPProductList>();
                    ListProduct = dataPost.ToList();
                    int TotalRecords = ProductRow.Count();
                    int CurrentItem = ListProduct.Count();


                    return Json(new { data = ListProduct, pageCurrent = page, numSize = numSize, currentRecords = CurrentItem, totalItem = TotalRecords }, JsonRequestBehavior.AllowGet);

                }
                else
                {

                    return Json("", JsonRequestBehavior.AllowGet);

                }
            }
        }

        public ActionResult ProductDetail(int productID)
        {
            var details = (from d in db.STPProductLists
                           where d.ID == productID
                           select d).FirstOrDefault();

            return View(details);
        }

        public PartialViewResult RelatedProducts(int productTypeID)
        {
            var RelatedProducts=(from d in db.STPProductLists
                                where d.STPProductTypeID== productTypeID
                                select d).Distinct().ToList();

            return PartialView(RelatedProducts);
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