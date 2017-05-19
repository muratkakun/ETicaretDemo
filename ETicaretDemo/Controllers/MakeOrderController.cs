using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ETicaretDemo.Controllers
{
    public class MakeOrderController : Controller
    {
        //
        // GET: /MakeOrder/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult MakeOrderPage(string sepetId)
        {

            return View();
        }
        
    }
}
