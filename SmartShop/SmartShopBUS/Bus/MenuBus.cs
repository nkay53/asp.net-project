using SmartShopConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartShopBUS.Bus
{
    public class MenuBus
    {
        public static IEnumerable<viewMenu> Menu()
        {
            var db = new SmartShopConnectionDB();
            //return db.Query<viewMenu>("SELECT * FROM viewMenu");

            var dsCL = db.Query<viewMenu>("select chungloai.MaCL,chungloai.TenCL from chungloai");
            List<viewMenu> model = new List<viewMenu>();
            foreach (var item in dsCL)
            {
                viewMenu clvm = new viewMenu();
                clvm.MaCL = item.MaCL;
                clvm.TenCL = item.TenCL;
                clvm.dsLoai = db.Query<Loai>("select * from Loai where MaCL=@0", item.MaCL);
                model.Add(clvm);
            }
            return (model);
        }
    }
}
