using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartShop.Areas.Admin.ViewModels
{
    public class ChungLoaiViewModel : Loai
    {
        public IEnumerable<ChungLoai> dsCLoai { get; set; }
    }
}