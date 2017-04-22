using SmartShopBUS.Bus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartShop.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminDHController : Controller
    {
        //
        // GET: /Admin/AdminDH/
        public ActionResult Index()
        {
            return View(DHBus.DanhSach());
        }

        //
        // GET: /Admin/AdminDH/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Admin/AdminDH/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Admin/AdminDH/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/AdminDH/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Admin/AdminDH/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/AdminDH/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Admin/AdminDH/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
