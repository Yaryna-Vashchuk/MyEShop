using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEShop.Models
{
    public class RegisterViewModel
    {
        public string ImagePath { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string PasswordConfirm { get; set; }
    }
}
