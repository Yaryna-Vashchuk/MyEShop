using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEShop.Entities
{
    public class User
    {
        public System.Guid Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string PasswordHash { get; set; }
        public Role Role { get; set; }
        public string ImagePath { get; set; }

    }
    public enum Role
    {
        Customer,
        Admin
    }

}
