using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartShopBUS.Bus
{
    public class ChungLoaiBus
    {
        public static IEnumerable<ChungLoai> DanhSach()
        {
            var db = new SmartShopConnectionDB();
            return db.Query<ChungLoai>("SELECT * FROM chungloai");
        }
        
        public static void Them(ChungLoai cl)
        {
            var db = new SmartShopConnectionDB();
            db.Insert(cl);
        }
        public static void Xoa(int id, ChungLoai cl)
        {
            var db = new SmartShopConnectionDB();
            db.Execute("DELETE FROM ChungLoai WHERE MaCL=@0", id);
        }
        public static void Sua(int id, ChungLoai cl)
        {
            var db = new SmartShopConnectionDB();
            db.Update("ChungLoai", "MaCL", cl);
        }
        public static ChungLoai ChiTiet(int id)
        {
            var db = new SmartShopConnectionDB();
            return db.SingleOrDefault<ChungLoai>("SELECT * FROM chungloai WHERE MaCL=@0", id);
        }
    }
}
