using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public partial interface IHoaDonNhapRepository
    {
        HoaDonNhapModel GetDatabyID(string id);
        bool Create(HoaDonNhapModel model);
        //bool Update(HoaDonModle model);

        bool Update1(HoaDonNhapModel model);
        List<HoaDonNhapModel> Search(int pageIndex, int pageSize, out long total, string hoten, string diachi, bool trangthai);
    }
}
