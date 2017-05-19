using ETicaretDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ETicaretDemo.Controllers
{
    public class CategoryMenuController : Controller
    {
        //
        // GET: /CategoryMenu/

        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult GetMenu()
        {
            ETicaretDemo.Models.ETicaretDemoEntities entity = new Models.ETicaretDemoEntities();

            var kategoriler = entity.Kategori;


            return PartialView("GetMenu", kategoriler);
        }

    }  
}
