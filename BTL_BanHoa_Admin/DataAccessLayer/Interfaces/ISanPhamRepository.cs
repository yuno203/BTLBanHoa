using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public partial interface ISanPhamRepository
    {
        SanPhamModel GetDatabyID(string id);
        bool Create(SanPhamModel model);
        //bool Update(HoaDonModle model);

        bool Update1(SanPhamModel model);
        List<SanPhamModel> Search(int pageIndex, int pageSize, out long total, string tenSanPham, int gia, int soluong);
    }
}
