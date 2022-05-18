using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MyEShop.Data;
using MyEShop.Entities;
using MyEShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
namespace MyEShop.Controllers
{
    public class ProductController : Controller
    {
        private readonly ApplicationContext _context;
        public ProductController(ApplicationContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Details(string id)
        {
            var product = _context.Products.Where(u => u.Id.ToString() == id).FirstOrDefault();
            ProductViewModel result = new()
            {
                Description = product.Description,
                ImagePath = product.ImagePath,
                Price = product.Price,
                Title = product.Title,
                Id = product.Id
            };
            return View(result);
        }

        [HttpGet]
        [Authorize(Roles ="Admin")]
        public IActionResult AddNew()
        {
            return View();
        }
        
        [HttpPost]
        [Authorize(Roles ="Admin")]
        public IActionResult AddNew(ProductViewModel model)
        {
            if (model.Price <= 0)
            {
                return BadRequest("Price has to be positive ");
            }
            _context.Products.Add(new Product{ Description = model.Description, ImagePath = model.ImagePath, Price = model.Price, Title = model.Title });
            _context.SaveChanges();

            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        [Authorize(Roles ="Admin")]
        public IActionResult Edit(string id)
        {
            var product = _context.Products.Where(u => u.Id.ToString() == id).FirstOrDefault();
            ProductViewModel result = new()
            {
                Description = product.Description,
                ImagePath = product.ImagePath,
                Price = product.Price,
                Title = product.Title,
                Id = product.Id
            };
            return View(result);
        }


        [HttpPost]
        [Authorize(Roles ="Admin")]
        public IActionResult Edit(ProductViewModel model)
        {
            var product = _context.Products.Where(u => u.Id == model.Id).FirstOrDefault();
            product.Title = model.Title;
            product.Price = model.Price;
            product.ImagePath = model.ImagePath;
            product.Description = model.Description;
            _context.SaveChanges();

            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public IActionResult Delete(string id)
        {
            var product = _context.Products.Where(u => u.Id.ToString() == id).FirstOrDefault();
            _context.Products.Remove(product);
            _context.SaveChanges();

            return RedirectToAction("Index", "Home");
        }
    }
}
