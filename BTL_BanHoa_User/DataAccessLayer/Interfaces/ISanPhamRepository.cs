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
        List<SanPhamCMModel> GetDatabyI1D(string id);
        SanPhamModel GetDatabyID(string id);    
     
        List<SanPhamModel> GetDataBanChay();
        List<SanPhamModel> GetDataAll();
       
        
        List<SanPhamModel> Search(int pageIndex, int pageSize, out long total, string tenSanPham, int maChuyenMuc, int giaFrom, int giaTo, int soluong, bool dacbiet);
    }
}
