using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaretDemo.Models;

namespace ETicaretDemo.Controllers
{
    public class CartDetailController : Controller
    {
        
        ETicaretDemoEntities entity = new ETicaretDemoEntities();
 
        public ActionResult ShowChartDetails()
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);

            // Set up our ViewModel
            var viewModel = new ShoppingCartViewModel
            {
                CartItems = cart.GetCartItems(),
                CartTotal = cart.GetTotal()
            };
            // Return the view
            return View(viewModel);
        }

        //
        // GET: /Store/AddToCart/5
        public ActionResult AddToCart(int id)
        {
            // Retrieve the album from the database
            var addedAlbum = entity.Urunler
                .Single(album => album.id == id);

            // Add it to the shopping cart
            var cart = ShoppingCart.GetCart(this.HttpContext);

            cart.AddToCart(addedAlbum);

            // Go back to the main store page for more shopping
            return Redirect("/Home/");
        }
        //
        // AJAX: /ShoppingCart/RemoveFromCart/5
        [HttpPost]
        public ActionResult RemoveFromCart(int id)
        {
            // Remove the item from the cart
            var cart = ShoppingCart.GetCart(this.HttpContext);

            // Get the name of the album to display confirmation
            string albumName = entity.Sepet
                .Single(item => item.id == id).Urunler.Baslik;

            // Remove from cart
            int itemCount = cart.RemoveFromCart(id);

            // Display the confirmation message
            var results = new ShoppingCartRemoveViewModel
            {
                Message = Server.HtmlEncode(albumName) +
                    " alışveriş sepetinden çıkarıldı.",
                CartTotal = cart.GetTotal(),
                CartCount = cart.GetCount(),
                ItemCount = itemCount,
                DeleteId = id
            };
            return Json(results);
        }
        //
        // GET: /ShoppingCart/CartSummary
        [ChildActionOnly]
        public ActionResult CartSummary()
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);

            ViewData["CartCount"] = cart.GetCount();
            return PartialView("CartSummary");
        }
    
    }
    public partial class ShoppingCart
    {
        ETicaretDemoEntities entitiy = new ETicaretDemoEntities();
        string ShoppingCartId { get; set; }
        public const string CartSessionKey = "CartId";
        public static ShoppingCart GetCart(HttpContextBase context)
        {
            var cart = new ShoppingCart();
            cart.ShoppingCartId = cart.GetCartId(context);
            return cart;
        }
        // Helper method to simplify shopping cart calls
        public static ShoppingCart GetCart(Controller controller)
        {
            return GetCart(controller.HttpContext);
        }
        public void AddToCart(Urunler urun)
        {
            // Get the matching cart and album instances
            var cartItem = entitiy.Sepet.SingleOrDefault(
                c => c.SepetId == ShoppingCartId
                && c.RefUrun == urun.id);

            if (cartItem == null)
            {
                // Create a new cart item if no cart item exists
                cartItem = new Sepet
                {
                    RefUrun = urun.id,
                    SepetId = ShoppingCartId,
                    Adet = 1,
                    KayitTarihi = DateTime.Now,
                    RefMusteri = 1,
                };
                entitiy.Sepet.Add(cartItem);
            }
            else
            {
                // If the item does exist in the cart, 
                // then add one to the quantity
                cartItem.Adet++;
            }
            // Save changes
            entitiy.SaveChanges();
        }
        public int RemoveFromCart(int id)
        {
            // Get the cart
            var cartItem = entitiy.Sepet.Single(
                cart => cart.SepetId == ShoppingCartId
                && cart.RefUrun == id);

            int itemCount = 0;

            if (cartItem != null)
            {
                if (cartItem.Adet > 1)
                {
                    cartItem.Adet--;
                    itemCount = cartItem.Adet;
                }
                else
                {
                    entitiy.Sepet.Remove(cartItem);
                }
                // Save changes
                entitiy.SaveChanges();
            }
            return itemCount;
        }
        public void EmptyCart()
        {
            var cartItems = entitiy.Sepet.Where(
                cart => cart.SepetId == ShoppingCartId);

            foreach (var cartItem in cartItems)
            {
                entitiy.Sepet.Remove(cartItem);
            }
            // Save changes
            entitiy.SaveChanges();
        }
        public List<Sepet> GetCartItems()
        {
            return entitiy.Sepet.Where(
                cart => cart.SepetId == ShoppingCartId).ToList();
        }
        public int GetCount()
        {          
            int? count = (from cartItems in entitiy.Sepet
                          where cartItems.SepetId == ShoppingCartId
                          select (int?)cartItems.Adet).Sum();
            // Return 0 if all entries are null
            return count ?? 0;
        }
        public decimal GetTotal()
        {           
            decimal? total = (from cartItems in entitiy.Sepet
                              where cartItems.SepetId == ShoppingCartId
                              select (int?)cartItems.Adet *
                              cartItems.Urunler.Fiyat).Sum();

            return total ?? decimal.Zero;
        }
        public int CreateOrder(Siparis order)
        {
            decimal orderTotal = 0;

            var cartItems = GetCartItems();
            // Iterate over the items in the cart, 
            // adding the order details for each
            foreach (var item in cartItems)
            {
                var orderDetail = new SiparisDetay
                {
                    RefUrun = item.RefUrun,
                    RefSiparis = order.id,
                    BirimFiyat = item.Urunler.Fiyat,
                    Adet = item.Adet
                };
                // Set the order total of the shopping cart
                orderTotal += (item.Adet * item.Urunler.Fiyat);

                entitiy.SiparisDetay.Add(orderDetail);

            }
            // Set the order's total to the orderTotal count
            order.ToplamFiyat = orderTotal;

            // Save the order
            entitiy.SaveChanges();
            // Empty the shopping cart
            EmptyCart();
            // Return the OrderId as the confirmation number
            return order.id;
        }
        // We're using HttpContextBase to allow access to cookies.
        public string GetCartId(HttpContextBase context)
        {
            if (context.Session[CartSessionKey] == null)
            {
                if (!string.IsNullOrWhiteSpace(context.User.Identity.Name))
                {
                    context.Session[CartSessionKey] =
                        context.User.Identity.Name;
                }
                else
                {
                    // Generate a new random GUID using System.Guid class
                    Guid tempCartId = Guid.NewGuid();
                    // Send tempCartId back to client as a cookie
                    context.Session[CartSessionKey] = tempCartId.ToString();
                }
            }
            return context.Session[CartSessionKey].ToString();
        }
        // When a user has logged in, migrate their shopping cart to
        // be associated with their username
        public void MigrateCart(string userName)
        {
            var shoppingCart = entitiy.Sepet.Where(
                c => c.SepetId == ShoppingCartId);

            foreach (Sepet item in shoppingCart)
            {
                item.SepetId = userName;
            }
            entitiy.SaveChanges();
        }
    }
    public class ShoppingCartRemoveViewModel
    {
        public string Message { get; set; }
        public decimal CartTotal { get; set; }
        public int CartCount { get; set; }
        public int ItemCount { get; set; }
        public int DeleteId { get; set; }
    }
    public class ShoppingCartViewModel
    {
        public List<Sepet> CartItems { get; set; }
        public decimal CartTotal { get; set; }
    }
}
