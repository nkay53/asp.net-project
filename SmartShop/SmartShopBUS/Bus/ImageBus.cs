using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartShopBUS.Bus
{
    public class ImageBus
    {
        public static IEnumerable<Image> DsTheoSP(string masp)
        {
            var db = new SmartShopConnectionDB();
            return db.Query<Image>("SELECT * FROM Image where MaSP=@0",masp);
        }
    }
}
