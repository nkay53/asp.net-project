using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartShop.Models
{
    public class Cart
    {
        string MaSP { get; set; }
        int SoLuong { get; set; }
        public IEnumerable<Product> dsSP { get; set; }
        public IEnumerable<Account> dsUser { get; set; }
    }
}