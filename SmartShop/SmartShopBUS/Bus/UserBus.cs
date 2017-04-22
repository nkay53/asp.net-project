using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartShopBUS.Bus
{
    public class UserBus
    {
        public static IEnumerable<viewUser> DanhSach()
        {
            var db = new SmartShopConnectionDB();
            return db.Query<viewUser>("SELECT * FROM viewUser");
        }

        public static void Them(Account acc)
        {
            var db = new SmartShopConnectionDB();
            db.Insert(acc);
        }
        public static void PhanQuyen(string us)
        {
            var db = new SmartShopConnectionDB();
            var user = db.SingleOrDefault<viewUser>("SELECT * FROM viewUser where UserName=@0", us);
            AspNetUserRole pq = new AspNetUserRole();
            pq.RoleId = "12629e90-6c15-424b-abaa-164250682d15";
            pq.UserId = user.UserId;
            db.Insert("AspNetUserRoles",pq);
        }
        public static void Xoa(string us)
        {
            var db = new SmartShopConnectionDB();
            var user = db.SingleOrDefault<viewUser>("SELECT * FROM viewUser where UserName=@0", us);
            string id = user.UserId;
            db.Execute("DELETE FROM AspNetUserRoles WHERE UserId=@0", id);
            db.Execute("DELETE FROM AspNetUsers WHERE UserName=@0", us);
            db.Execute("DELETE FROM Accounts WHERE UserName=@0", us);
        }
        public static void Sua(Account acc)
        {
            var db = new SmartShopConnectionDB();
            db.Update("Accounts", "UserName", acc);
        }
        public static Account ChiTiet(string us)
        {
            var db = new SmartShopConnectionDB();
            return db.SingleOrDefault<Account>("SELECT * FROM Accounts WHERE UserName=@0", us);
        }
        public static Account Admin(string us)
        {
            var db = new SmartShopConnectionDB();
            return db.SingleOrDefault<Account>("SELECT R.Name FROM Accounts A,AspNetUsers Us,AspNetUserRoles UR,AspNetRoles R WHERE A.UserName=@0 AND A.UserName=Us.UserName AND Us.Id=UR.UserId AND UR.RoleId=R.Id", us);
        }
    }
}
