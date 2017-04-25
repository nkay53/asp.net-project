using PetaPoco;
using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartShopBUS.Bus
{
    public class ProductBus
    {
        public static Page<Product> DanhSach(int? page)
        {
            var db = new SmartShopConnectionDB();
            return db.Page<Product>(page.Value, 9, "SELECT * FROM Product ORDER BY NgayDangSP DESC");
        }
        public static Page<viewAdProduct> AdDanhSach(int? page)
        {
            var db = new SmartShopConnectionDB();
            return db.Page<viewAdProduct>(page.Value, 9, "SELECT * FROM Product ORDER BY NgayDangSP DESC");
        }
        public static Page<Product> DanhSachHOT(int? page)
        {
            var db = new SmartShopConnectionDB();
            return db.Page<Product>(page.Value, 9, "SELECT * FROM Product ORDER BY LuotXem DESC");
        }
        public static Page<Product> SpTheoCL(int? page, int? macl)
        {
            var db = new SmartShopConnectionDB();
            return db.Page<Product>(page.Value, 9, "SELECT Product.*,ChungLoai.MaCL FROM Product,Loai,ChungLoai WHERE Product.LoaiSP=Loai.MaLoai AND Loai.MaCL=ChungLoai.MaCL AND ChungLoai.MaCL=@0 ORDER BY NgayDangSP DESC",macl);
        }
        public static Page<Product> SpTheoLoai(int? page, string maloai)
        {
            var db = new SmartShopConnectionDB();
            return db.Page<Product>(page.Value, 9, "SELECT * FROM Product WHERE LoaiSP=@0 ORDER BY NgayDangSP DESC", maloai);
        }
        public static Page<Product> TimKiem(int? page, string key)
        {
            var db = new SmartShopConnectionDB();
            return db.Page<Product>(page.Value, 9, "select * from Product where TenSP like '%"+key+"%' order by NgayDangSP DESC");
        }
        public static void Them(Product sp)
        {
            var db = new SmartShopConnectionDB();
            db.Insert("Product","MaSP",sp);
        }
        public static void Xoa(string id, Product sp)
        {
            var db = new SmartShopConnectionDB();
            db.Execute("DELETE FROM Product WHERE MaSP=@0", id);
        }
        public static void Sua(Product sp)
        {
            var db = new SmartShopConnectionDB();
            db.Update("Product", "MaSP", sp);
        }
        public static Product ChiTiet(string id)
        {
            var db = new SmartShopConnectionDB();
            var sp = db.SingleOrDefault<Product>("SELECT * FROM Product WHERE MaSP=@0", id);
            sp.dsLoai = LoaiBus.DanhSach();
            sp.LuotXem = sp.LuotXem + 1;
            db.Update("Product", "MaSP", sp);
            return sp;
        }
    }
}
