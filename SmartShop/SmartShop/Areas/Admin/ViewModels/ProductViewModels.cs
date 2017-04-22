using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SmartShop.Areas.Admin.ViewModels
{
    public class ProductViewModels : Product
    {
        [Display(Name="Hình sản phẩm")]
        [DataType(DataType.Upload)]
        public HttpPostedFileBase ImageUpload { get; set; }
        public IEnumerable<Loai> dsLoai1 { get; set; }
    }
}