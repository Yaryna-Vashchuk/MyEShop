using MyEShop.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEShop.Models
{
    public class CartCatalogViewModel
    {
        public List<CartItem> Items { get; set; }
        public decimal Sum { get => this.Items.Sum(x => x.Product.Price); }
    }
}
