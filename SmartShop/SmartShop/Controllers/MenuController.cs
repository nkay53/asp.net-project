using SmartShopBUS.Bus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartShop.Controllers
{
    public class MenuController : Controller
    {
        //
        // GET: /Menu/
        public ActionResult MainMenu()
        {
            return View(MenuBus.Menu());
        }
	}
}