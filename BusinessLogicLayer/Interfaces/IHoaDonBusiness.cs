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
        HoaDonModel GetDatabyID(string id);
        bool Create(HoaDonModel model);
        //bool Update(HoaDonModle model);
        bool Update1(HoaDonModel model);
        List<HoaDonModel> Search(int pageindex, int pagesize, out long total, string ten_khach, string dia_chi, bool trangthai,DateTime? ngayTao);
        
    }
}
