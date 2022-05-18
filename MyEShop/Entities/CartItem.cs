using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEShop.Entities
{
    public class CartItem
    {
        public Guid Id { get; set; }
        public Product Product { get; set; }
        public string UserId { get; set; }

    }
}
