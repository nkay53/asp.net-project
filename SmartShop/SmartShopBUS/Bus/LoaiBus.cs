using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartShopBUS.Bus
{
    public class LoaiBus
    {
        public static IEnumerable<Loai> DanhSach()
        {
            var db = new SmartShopConnectionDB();
            return db.Query<Loai>("SELECT * FROM loai");
        }
        public static IEnumerable<viewLoai> DanhSachView()
        {
            var db = new SmartShopConnectionDB();
            return db.Query<viewLoai>("SELECT * FROM viewLoai");
        }
        public static void Them(Loai l)
        {
            var db = new SmartShopConnectionDB();
            db.Insert(l);
        }
        public static void Xoa(string id, Loai l)
        {
            var db = new SmartShopConnectionDB();
            db.Execute("DELETE FROM Loai WHERE MaLoai=@0", id);
        }
        public static void Sua(Loai l)
        {
            var db = new SmartShopConnectionDB();
            db.Update("Loai", "MaLoai", l);
        }
        public static Loai ChiTiet(string id)
        {
            var db = new SmartShopConnectionDB();
            var l = db.SingleOrDefault<Loai>("SELECT * FROM loai WHERE MaLoai=@0", id);
            l.dsCL = ChungLoaiBus.DanhSach();
            return l;
        }
    }
}
