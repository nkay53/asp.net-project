using SmartShopBUS.Bus;
using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartShop.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminCLController : Controller
    {
        //
        // GET: /Admin/AdminCL/
        public ActionResult Index()
        {
            return View(ChungLoaiBus.DanhSach());
        }
        //
        [HttpGet]
        public ActionResult Details(int id)
        {
            return View(ChungLoaiBus.ChiTiet(id));
        }

        //

        public ActionResult Create()
        {
            return View();
        }

        //

        [HttpPost]
        public ActionResult Create(ChungLoai cl)
        {
            try
            {
                // TODO: Add insert logic here
                ChungLoaiBus.Them(cl);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //

        public ActionResult Edit(int id)
        {
            return View(ChungLoaiBus.ChiTiet(id));
        }

        //

        [HttpPost]
        public ActionResult Edit(int id, ChungLoai cl)
        {
            try
            {
                // TODO: Add update logic here
                ChungLoaiBus.Sua(id, cl);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //

        public ActionResult Delete(int id)
        {
            return View(ChungLoaiBus.ChiTiet(id));
        }

        //

        [HttpPost]
        public ActionResult Delete(int id, ChungLoai cl)
        {
            try
            {
                // TODO: Add delete logic here
                ChungLoaiBus.Xoa(id, cl);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
