using SmartShop.Areas.Admin.ViewModels;
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
    public class AdminLoaiController : Controller
    {
        //
        // GET: /Admin/AdminLoai/
        public ActionResult Index()
        {
            return View(LoaiBus.DanhSachView());
        }

        //
        // GET: /Loai/Details/5
        public ActionResult Details(string id)
        {
            return View(LoaiBus.ChiTiet(id));
        }

        //
        // GET: /Loai/Create
        public ActionResult Create()
        {
            ChungLoaiViewModel cl = new ChungLoaiViewModel();
            cl.dsCLoai = ChungLoaiBus.DanhSach();
            return View(cl);
        }

        //
        // POST: /Loai/Create
        [HttpPost]
        public ActionResult Create(Loai l)
        {
            try
            {
                // TODO: Add insert logic here
                LoaiBus.Them(l);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Loai/Edit/5
        public ActionResult Edit(string id)
        {
            return View(LoaiBus.ChiTiet(id));
        }

        //
        // POST: /Loai/Edit/5
        [HttpPost]
        public ActionResult Edit(Loai l)
        {
            try
            {
                // TODO: Add update logic here
                LoaiBus.Sua(l);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Loai/Delete/5
        public ActionResult Delete(string id)
        {
            return View(LoaiBus.ChiTiet(id));
        }

        //
        // POST: /Loai/Delete/5
        [HttpPost]
        public ActionResult Delete(string id, Loai l)
        {
            try
            {
                // TODO: Add delete logic here
                LoaiBus.Xoa(id, l);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
