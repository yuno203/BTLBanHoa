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
        HoaDonModel GetDatabyID(string id);
        bool Create(HoaDonModel model);
        //bool Update(HoaDonModle model);

        bool Update1(HoaDonModel model);
        List<HoaDonModel> Search(int pageIndex, int pageSize, out long total, string hoten, string diachi, bool trangthai);
    }
}
