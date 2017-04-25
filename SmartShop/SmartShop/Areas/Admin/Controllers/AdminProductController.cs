using SmartShop.Areas.Admin.ViewModels;
using SmartShopBUS.Bus;
using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartShop.Areas.Admin.Controllers
{
    //[Authorize(Roles="Admin")]
    public class AdminProductController : Controller
    {
        //
        // GET: /Admin/AminProduct/
        //[ValidateInput(true)]
        public ActionResult Index(int? page)
        {
            if (page == null)
                page = 1;
            return View(ProductBus.AdDanhSach(page));
        }

        //
        // GET: /Admin/AminProduct/Details/5
        [HttpGet]
        public ActionResult Details(string id)
        {
            return View(ProductBus.ChiTiet(id));
        }

        //
        // GET: /Admin/AminProduct/Create
        public ActionResult Create()
        {
            ProductViewModels sp = new ProductViewModels();
            sp.dsLoai1 = LoaiBus.DanhSach();
            return View(sp);
        }

        //
        // POST: /Admin/AminProduct/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create(ProductViewModels sp)
        {
            try
            {
                var validImageTypes = new string[]
                {
                    "image/gif",
                    "image/jpeg",
                    "image/pjpeg",
                    "image/png"
                };

                if (sp.ImageUpload == null || sp.ImageUpload.ContentLength == 0)
                {
                    ModelState.AddModelError("ImageUpload", "Chưa chọn hình");
                }
                else if (!validImageTypes.Contains(sp.ImageUpload.ContentType))
                {
                    ModelState.AddModelError("ImageUpload", "Làm ơn chọn file có định dạng hình GIF, JPG, PNG.");
                }

                if (ModelState.IsValid)
                {
                    if (sp.ImageUpload != null && sp.ImageUpload.ContentLength > 0)
                    {
                        var uploadDir = "~/image/san pham";
                        var imagePath = Path.Combine(Server.MapPath(uploadDir), sp.ImageUpload.FileName);
                        var imageUrl = Path.Combine(uploadDir, sp.ImageUpload.FileName);
                        sp.ImageUpload.SaveAs(imagePath);
                        sp.Hinh = sp.ImageUpload.FileName;
                    }
                }
                sp.NgayDangSP = DateTime.Now;
                sp.LuotXem = 0;
                ProductBus.Them(sp);
                return RedirectToAction("Index");
            }
            catch
            {
                ProductViewModels spham = new ProductViewModels();
                spham.dsLoai1 = LoaiBus.DanhSach();
                return View(spham);
            }
        }

        //
        // GET: /Admin/AminProduct/Edit/5
        public ActionResult Edit(string id)
        {
            return View(ProductBus.ChiTiet(id));
        }

        //
        // POST: /Admin/AminProduct/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit(ProductViewModels sp)
        {
            try
            {
                var validImageTypes = new string[]
                {
                    "image/gif",
                    "image/jpeg",
                    "image/pjpeg",
                    "image/png"
                };

                if (sp.ImageUpload2 == null || sp.ImageUpload2.ContentLength == 0)
                {
                    ModelState.AddModelError("ImageUpload", "Chưa chọn hình");
                }
                else if (!validImageTypes.Contains(sp.ImageUpload2.ContentType))
                {
                    ModelState.AddModelError("ImageUpload", "Làm ơn chọn file có định dạng hình GIF, JPG, PNG.");
                }

                if (ModelState.IsValid)
                {
                    if (sp.ImageUpload2 != null && sp.ImageUpload2.ContentLength > 0)
                    {
                        var uploadDir = "~/Image/product";
                        var imagePath = Path.Combine(Server.MapPath(uploadDir), sp.ImageUpload2.FileName);
                        var imageUrl = Path.Combine(uploadDir, sp.ImageUpload2.FileName);
                        sp.ImageUpload2.SaveAs(imagePath);
                        if (sp.ImageUpload2.FileName!=null)
                        {
                            sp.Hinh = sp.ImageUpload2.FileName;
                        }
                       
                    }
                }
                sp.NgayDangSP = DateTime.Now;
                ProductBus.Sua(sp);
                return RedirectToAction("Index");
            }
            catch
            {
                return View(ProductBus.ChiTiet(sp.MaSP));
            }
        }

        //
        // GET: /Admin/AminProduct/Delete/5
        public ActionResult Delete(string id)
        {
            return View(ProductBus.ChiTiet(id));
        }

        //
        // POST: /Admin/AminProduct/Delete/5
        [HttpPost]
        public ActionResult Delete(string id, Product sp)
        {
            try
            {
                // TODO: Add delete logic here
                ProductBus.Xoa(id,sp);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
