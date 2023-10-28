using System;
using DataModel;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
    public partial interface ISanPhamBusiness
    {
        SanPhamModel GetDatabyID(string id);
        bool Create(SanPhamModel model);
        bool Update1(SanPhamModel model);
        bool Update(SanPhamModel model);
        bool Delete(string id);
        //bool Deletes(string id);
        List<SanPhamModel> Search(int pageindex, int pagesize, out long total, string tenSanPham,int gia, int soluong);
    }
}
