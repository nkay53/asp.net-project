using SmartShop.Models;
using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartShop.Controllers
{
    public class CartController : Controller
    {
        //
        // GET: /Cart/

        public ActionResult Index()
        {
            var db = new SmartShopConnectionDB();
            List<Cart> ds_SP = new List<Cart>();
            List<string> sp = new List<string>();
            sp = (List<string>)Session["sp_gh"];
            if (sp != null)
            {
                foreach (var item in sp)
                {
                    Cart sp_gh = new Cart();
                    sp_gh.dsSP = db.Query<Product>("select * from Product where MaSP=@0", item.ToString());
                    ds_SP.Add(sp_gh);
                }
            }
            return View(ds_SP);
        }
        [HttpGet]
        public ActionResult AddCart(string masp)
        {            
            List<string> sp = new List<string>();
            if(Session["sp_gh"]!=null)
            {
                sp = (List<string>)Session["sp_gh"];
            }
            sp.Add(masp);
            Session["sp_gh"] = sp;
            return View("Index");
        }
    }
}
