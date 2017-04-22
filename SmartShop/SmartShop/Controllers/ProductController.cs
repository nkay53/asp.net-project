using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SmartShopBUS.Bus;
using SmartShopConnection;

namespace SmartShop.Controllers
{
    public class ProductController : Controller
    {
        //
        // GET: /Product/
        public ActionResult Index(int? page)
        {
            if (page == null)
                page = 1;
            return View(ProductBus.DanhSach(page));
        }

        //
        // GET: /Product/Details/5
        [HttpGet]
        public ActionResult Details(string id)
        {
            Session["MaSP"] = id;
            return View(ProductBus.ChiTiet(id));
        }
        public ActionResult CLoai(int? page, int? macl)
        {
            if (page == null)
                page = 1;
            Session["key2"] = macl;
            return View(ProductBus.SpTheoCL(page,macl));
        }
        public ActionResult Loai(int? page, string maloai)
        {
            if (page == null)
                page = 1;
            Session["key2"]=maloai;
            return View(ProductBus.SpTheoLoai(page, maloai));
        }
        [HttpGet]
        public ActionResult Search(int? page, string key)
        {
            if (page == null)
                page = 1;
            return View(ProductBus.TimKiem(page,key));
        }
    }
}
