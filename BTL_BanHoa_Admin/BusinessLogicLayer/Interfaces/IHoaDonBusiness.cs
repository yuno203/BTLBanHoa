using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public partial interface IHoaDonBusiness
    {
        List<HoaDonAll> GetDatabyI1D(string id);
        HoaDonModel GetDatabyID(string id);
        bool Create(HoaDonModel model);
        bool CreateCT(ChiTietHoaDonModel model);
        //bool Update(HoaDonModle model);
        bool Update1(HoaDonModel model);
        bool Update(HoaDonModel model);
        bool Delete(string id);
        List<HoaDonModel> Search(int pageindex, int pagesize, out long total, string ten_khach, string dia_chi, bool trangthai,DateTime? ngayTao );
        
    }
}
