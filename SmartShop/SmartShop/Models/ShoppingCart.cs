using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartShop.Models
{
    public class ShoppingCartItem
    {
        public string MaSP { get; set; }
        public string TenSP { get; set; }
        public string Hinh { get; set; }
        public int SoLuong { get; set; }
        public int Gia { get; set; }
        public decimal TongCong { get; set; }
    }
    public class ShoppingCart
    {
        public ShoppingCart()
        {
            ListItem = new List<ShoppingCartItem>();
        }

        public List<ShoppingCartItem> ListItem { get; set; }

        public bool AddToCart(ShoppingCartItem item)
        {
            bool alreadyExists = ListItem.Any(x => x.MaSP == item.MaSP);
            if (alreadyExists)
            {
                ShoppingCartItem existsItem = ListItem.Where(x => x.MaSP == item.MaSP).SingleOrDefault();
                if (existsItem != null)
                {
                    existsItem.SoLuong = existsItem.SoLuong + 1;
                    existsItem.TongCong = existsItem.SoLuong * existsItem.Gia;
                }
            }
            else
            {
                ListItem.Add(item);
            }
            return true;
        }

        public bool RemoveFromCart(string lngProductSellID)
        {
            ShoppingCartItem existsItem = ListItem.Where(x => x.MaSP == lngProductSellID).SingleOrDefault();
            if (existsItem != null)
            {
                ListItem.Remove(existsItem);
            }
            return true;
        }

        public bool UpdateQuantity(string lngProductSellID, int intQuantity)
        {
            ShoppingCartItem existsItem = ListItem.Where(x => x.MaSP == lngProductSellID).SingleOrDefault();
            if (existsItem != null)
            {
                existsItem.SoLuong = intQuantity;
                existsItem.TongCong = existsItem.SoLuong * existsItem.Gia;
            }
            return true;
        }

        public decimal GetTotal()
        {
            return ListItem.Sum(x => x.TongCong);
        }

        public bool EmptyCart()
        {
            ListItem.Clear();
            return true;
        }
    }
}