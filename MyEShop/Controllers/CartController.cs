using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyEShop.Data;
using MyEShop.Entities;
using MyEShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEShop.Controllers
{
    public class CartController : Controller
    {
        private readonly ApplicationContext _context;
        public CartController(ApplicationContext context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult Cart()
        {
            var products = _context.Carts.Include(x => x.Product).ToList();
            CartCatalogViewModel cart = new CartCatalogViewModel { Items = products };
            return View(cart);
        }
        [HttpPost]
        public IActionResult AddItem(string id)
        {
            var product = _context.Products.Where(u => u.Id.ToString() == id).FirstOrDefault();
            _context.Carts.Add(new ()
            {
                Product = product,
                UserId = HttpContext.User.Identity.Name.ToString()
            });
            _context.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
        [HttpGet]
        public IActionResult Delete(string id)
        {
            var product = _context.Carts.Where(u => u.Product.Id.ToString() == id).FirstOrDefault();
            _context.Carts.Remove(product);
            _context.SaveChanges();

            return RedirectToAction("Index", "Home");
        }
    }
}
