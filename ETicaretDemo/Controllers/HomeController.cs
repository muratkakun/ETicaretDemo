using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ETicaretDemo.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        ETicaretDemo.Models.ETicaretDemoEntities entity = new Models.ETicaretDemoEntities();
        public ActionResult Index()
        {
            var urunler = entity.Urunler;
            return View(urunler);
        }
        public ActionResult Kampanyalar()
        {
            var kampanyalar = entity.Kampanya;
            return View(kampanyalar);
        }
        public ActionResult YeniUrunGetir()
        {
            var urunler = entity.Urunler;
            return View(urunler);
        }

        public ActionResult PopulerUrunGetir()
        {
            var urunler = entity.Urunler.Where(x => x.Puanlama >= 4);
            return View(urunler);
        }

    }
}
