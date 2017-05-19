using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ETicaretDemo.Controllers
{
   
    public class ProductController : Controller
    {
        //
        // GET: /Pruduct/

          ETicaretDemo.Models.ETicaretDemoEntities entity = new Models.ETicaretDemoEntities();

        public ActionResult AllProducts()
        {
            try
            {
                var Product = entity.Urunler;
                return View(Product);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult Details(int id)
        {
            try
            {
                var u = entity.Urunler.Where(urun => urun.id == id).FirstOrDefault();
                return View(u);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
