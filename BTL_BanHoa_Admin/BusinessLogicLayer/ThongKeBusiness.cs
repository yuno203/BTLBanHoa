
using BusinessLogicLayer.Interfaces;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using DataModel;

namespace BusinessLogicLayer
{
    public class ThongKeBusiness : IThongKeBusiness
    {
        private IThongKeRepository _res;
        public ThongKeBusiness(IThongKeRepository res)
        {
            _res = res;
        }
        public List<ThongKeKhachModel> Search(int pageIndex, int pageSize, out long total, string hoten, DateTime? fr_NgayTao, DateTime? to_NgayTao)
        {
            return _res.Search(pageIndex, pageSize, out total, hoten, fr_NgayTao, to_NgayTao);
        }
        public List<ThongKeKhachModel> Searchdoanhso(int pageIndex, int pageSize, out long total, string hoten, DateTime? fr_NgayTao, DateTime? to_NgayTao)
        {
            return _res.Search(pageIndex, pageSize, out total, hoten, fr_NgayTao, to_NgayTao);
        }
        public List<ThongKeKhachModel> Searchbanchay(int pageIndex, int pageSize, out long total, int topn)
        {
            return _res.Searchbanchay(pageIndex, pageSize, out total, topn);
        }
    }
}