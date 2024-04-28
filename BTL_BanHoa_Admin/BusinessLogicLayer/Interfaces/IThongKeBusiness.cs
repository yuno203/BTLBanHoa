using System;
using DataModel;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
    public partial interface IThongKeBusiness
    {
        List<ThongKeKhachModel> Search(int pageIndex, int pageSize, out long total, string ten_khach, DateTime? fr_NgayTao, DateTime? to_NgayTao);
        List<ThongKeKhachModel> Searchdoanhso(int pageIndex, int pageSize, out long total, string ten_khach, DateTime? fr_NgayTao, DateTime? to_NgayTao);
        List<ThongKeKhachModel> Searchbanchay(int pageIndex, int pageSize, out long total, int topn);
    }
}
