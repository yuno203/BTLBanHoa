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
        List<SanPhamCMModel> GetDatabyI1D(string id);
        SanPhamModel GetDatabyID(string id);
        //bool Create(SanPhamModel model);
        //bool Update1(SanPhamModel model);
        List<SanPhamModel> GetDataBanChay();
        List<SanPhamModel> GetDataAll();
       
        List<SanPhamModel> Search(int pageindex, int pagesize, out long total, string tenSanPham, int maChuyenMuc, int giaFrom,int giaTo, int soluong, bool dacbiet);
    }
}
