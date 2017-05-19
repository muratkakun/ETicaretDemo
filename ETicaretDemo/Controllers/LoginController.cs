using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ETicaretDemo.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LoginPage()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginControl(string KullaniciAdi, string Sifre)
        {
            try
            {
                Session["KullaniciId"] = "";
                TempData["ErrorMessage"] = "";
                ETicaretDemo.Models.ETicaretDemoEntities entity = new Models.ETicaretDemoEntities();
                var girisMusteri = entity.Musteri.Where(musteri => musteri.KullaniciAdi == KullaniciAdi && musteri.Sifre == Sifre);
                if (girisMusteri.Count() > 0)
                {
                    Session["KullaniciId"] = girisMusteri.ElementAt(0).id;

                    return Redirect("/User/UserPage");
                }
                TempData["ErrorMessage"] = "Kullanıcı Adı ya da şifre hatalı. Tekrar deneyiniz.";
                return RedirectToAction("/LoginPage");
            }
            catch (Exception ex)
            { 
                throw ex;
            }
           
        }
    }
}
