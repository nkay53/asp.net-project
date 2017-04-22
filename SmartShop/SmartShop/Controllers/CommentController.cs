using SmartShopBUS.Bus;
using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartShop.Controllers
{
    public class CommentController : Controller
    {
        //
        // GET: /Comment/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Cmt(int? page)
        {
            if (page == null)
            {
                page = 1;
                return PartialView("_Cmt", CommentBus.CmtSp((string)Session["MaSP"], page));
            }
            else
            {
                Session["page"]=page;
                return RedirectToAction("Details", "Product", new { id = (string)Session["MaSP"] });
            }
        }
      
        public ActionResult Create()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult Created(string UserCmt, string NoiDung, string MaSP)
        {
            try
            {
                Comment cmt = new Comment();
                cmt.MaSP = MaSP;
                cmt.UserCmt = UserCmt;
                cmt.NoiDung = NoiDung;
                CommentBus.Them(cmt);
                return RedirectToAction("Details", "Product", new { id = (string)Session["MaSP"]});
            }
            catch
            {
                return RedirectToAction("Details", "Product", new { id = (string)Session["MaSP"] });
            }
        }
        public ActionResult Delete(int id)
        {
            CommentBus.Xoa(id);
            return RedirectToAction("Details", "Product", new { id = Session["MaSP"] });
        }
        public ActionResult Edit(Comment cmt)
        {
            try
            {
                CommentBus.Sua(cmt);
                return RedirectToAction("Details", "Product", new { id = Session["MaSP"] });
            }
            catch
            {
                return RedirectToAction("Details", "Product", new { id = Session["MaSP"] });
            }
        }
    }
}
