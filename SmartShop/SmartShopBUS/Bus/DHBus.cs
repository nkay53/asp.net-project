using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartShopBUS.Bus
{
    public class DHBus
    {
        public static IEnumerable<DonDatHang> DanhSach()
        {
            var db = new SmartShopConnectionDB();
            var dsDH = db.Query<DonDatHang>("select * from DonDatHang");
            List<DonDatHang> model = new List<DonDatHang>();
            foreach (var item in dsDH)
            {
                DonDatHang dh = new DonDatHang();
                dh.MaDH = item.MaDH;
                dh.Username = item.Username;
                dh.NgayDatHang = item.NgayDatHang;
                dh.HoTen = item.HoTen;
                dh.GhiChu = item.GhiChu;
                dh.DiaChi = item.DiaChi;
                dh.Email = item.Email;
                dh.SDT = item.SDT;
                dh.TinhTrang = item.TinhTrang;
                dh.Tongtien = item.Tongtien;
                dh.DsctDH = db.Query<ChiTietDH>("select * from ChiTietDH where MaDH=@0", item.MaDH);
                model.Add(dh);
            }
            return (model);
        }
        public static IEnumerable<DonDatHang> DsDHUs(string id)
        {
            var db = new SmartShopConnectionDB();
            var dsDH = db.Query<DonDatHang>("select * from DonDatHang where Username=@0",id);
            List<DonDatHang> model = new List<DonDatHang>();
            foreach (var item in dsDH)
            {
                DonDatHang dh = new DonDatHang();
                dh.MaDH = item.MaDH;
                dh.Username = item.Username;
                dh.NgayDatHang = item.NgayDatHang;
                dh.HoTen = item.HoTen;
                dh.GhiChu = item.GhiChu;
                dh.DiaChi = item.DiaChi;
                dh.Email = item.Email;
                dh.SDT = item.SDT;
                dh.TinhTrang = item.TinhTrang;
                dh.Tongtien = item.Tongtien;
                dh.DsctDH = db.Query<ChiTietDH>("select * from ChiTietDH where MaDH=@0", item.MaDH);
                model.Add(dh);
            }
            return (model);
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
