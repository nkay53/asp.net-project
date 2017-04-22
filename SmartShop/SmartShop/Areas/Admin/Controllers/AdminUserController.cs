using SmartShopBUS.Bus;
using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
namespace SmartShop.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminUserController : Controller
    {
        //
        // GET: /Admin/AdminUser/
        public ActionResult Index()
        {
            return View(UserBus.DanhSach());
        }

        //
        // GET: /Admin/AdminUser/Details/5
        public ActionResult Details(string id)
        {
            return View(UserBus.ChiTiet(id));
        }

        //
        // GET: /Admin/AdminUser/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Admin/AdminUser/Create
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
        // GET: /Admin/AdminUser/Edit/5
        public ActionResult Edit(string id)
        {
            return View(UserBus.ChiTiet(id));
        }

        //
        // POST: /Admin/AdminUser/Edit/5
        [HttpPost]
        public ActionResult Edit(Account acc)
        {
            try
            {
                // TODO: Add update logic here
                UserBus.Sua(acc);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/AdminUser/Delete/5
        
        public ActionResult Delete(string id)
        {
            return View(UserBus.ChiTiet(id));
        }
        [HttpPost]
        public ActionResult Deletee(string id)
        {
            try
            {
                UserBus.Xoa(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        //
        // POST: /Admin/AdminUser/Delete/5
        
    }
}
