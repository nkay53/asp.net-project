using SmartShopBUS.Bus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartShop.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(int? page)
        {
            if (page == null)
                page = 1;
            return View(ProductBus.DanhSachHOT(page));
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}