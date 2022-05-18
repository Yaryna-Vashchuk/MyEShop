using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MyEShop.Data;
using MyEShop.Entities;
using MyEShop.Models;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;

namespace MyEShop.Controllers
{
    public class AuthController : Controller
    {

        private readonly ApplicationContext _context;
        public AuthController(ApplicationContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult LogIn()
        {
            return View();
        }        

        [HttpGet]
        [Authorize]
        public IActionResult Profile()
        {
            ProfileViewModel result;
            try
            {
                var email = HttpContext.User.Identity.Name;
                var user = _context.Users.Where(u => u.Email == email).FirstOrDefault();
                result = new()
                { 
                    Email = user.Email,
                    Name = user.Name,
                    ImagePath = user.ImagePath
                };
            }
            catch
            {
                return BadRequest("Profile not found");
            }

            return View(result);
        }

        [HttpPost]
        public IActionResult LogIn(LogInViewModel model)
        {
            var user = _context.Users.Where(u => u.Email == model.Email).FirstOrDefault();
            if (user == null)
            {
                return BadRequest("Wrong email");
            }
            if(!VerifyPassword(model.Password, user.PasswordHash))
            {
                return BadRequest("Wrong password");
            }

            Authenticate(user);
            return RedirectToAction("Index", "Home");
        }
        [HttpPost]
        [Authorize]
        public IActionResult LogOut()
        {
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme).Wait();

            return RedirectToAction("Index", "Home");
        }
        public bool VerifyPassword(string password, string PasswordHash)
        {
            return BCrypt.Net.BCrypt.Verify(password, PasswordHash);
        }
        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(RegisterViewModel model)
        {
            var validEmail = _context.Users.Where(u => u.Email == model.Email).FirstOrDefault();
            if (validEmail != null)
            {
                return BadRequest("Email already exists");
            }
            else if (model.Password != model.PasswordConfirm)
            {
                return BadRequest("Passwords do not match");
            }
                
            var passwordHash = BCrypt.Net.BCrypt.HashPassword(model.Password);

            _context.Users.Add(new User { Name = model.Name, Email = model.Email, PasswordHash = passwordHash, Role = Role.Customer }) ;
            _context.SaveChanges();

            return RedirectToAction("LogIn", "Auth");
        }
        public void Authenticate(User user)
        {
            var claims = new List<Claim>
            {
                new (ClaimsIdentity.DefaultNameClaimType, user.Email),
                new (ClaimsIdentity.DefaultRoleClaimType, user.Role.ToString())
            };

            var id = new ClaimsIdentity(
                claims,
                "ApplicationCookie",
                ClaimsIdentity.DefaultNameClaimType,
                ClaimsIdentity.DefaultRoleClaimType
            );

            HttpContext.SignInAsync(
                CookieAuthenticationDefaults.AuthenticationScheme,
                new ClaimsPrincipal(id)
            ).Wait();
        }

        public bool Logout()
        {
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme).Wait();
            return true;
        }
        public bool IsSignedIn(ClaimsPrincipal principal)
        {
            return principal?.Identity != null && principal.Identity.IsAuthenticated;
        }
    }
}
