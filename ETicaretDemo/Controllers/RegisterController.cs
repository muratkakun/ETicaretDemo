using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ETicaretDemo.Controllers
{
    public class RegisterController : Controller
    {
        //
        // GET: /Register/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult RegisterPage()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegisterUser(string Ad, string Soyad, string Telefon, string Email, string KullaniciAdi, string Sifre)
        {
            try
            {
                ETicaretDemo.Models.ETicaretDemoEntities entity = new Models.ETicaretDemoEntities();

                ETicaretDemo.Models.Musteri musteri = new Models.Musteri
                {
                    Ad = Ad,
                    Soyad = Soyad,
                    Email = Email,
                    KullaniciAdi = KullaniciAdi,
                    MusteriAdres = null,
                    Sifre = Sifre,
                    Telefon = Telefon
                };

                entity.Musteri.Add(musteri);
                entity.SaveChanges();

                return Redirect("/Login/LoginPage");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }


    }
}
