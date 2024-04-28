using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public partial interface IHoaDonRepository
    {
        List<HoaDonAll> GetDatabyI1D(string id);
        HoaDonModel GetDatabyID(string id);
        bool Create(HoaDonModel model);
        bool CreateCT(ChiTietHoaDonModel model);
        //bool Update(HoaDonModle model);
        bool Update(HoaDonModel model);
        bool Update1(HoaDonModel model);
        bool Delete(string id);
        List<HoaDonModel> Search(int pageIndex, int pageSize, out long total, string hoten, string diachi, bool trangthai, DateTime? ngayTao);
    }
}
