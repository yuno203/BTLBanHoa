
using BusinessLogicLayer.Interfaces;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using DataModel;

namespace BusinessLogicLayer
{
    public class SanPhamBusiness : ISanPhamBusiness
    {
        private ISanPhamRepository _res;
        public SanPhamBusiness(ISanPhamRepository res)
        {
            _res = res;
        }
        //public bool Create(SanPhamModel model)
        //{
        //    return _res.Create(model);
        //}
        public List<SanPhamCMModel> GetDatabyI1D(string id)
        {
            return _res.GetDatabyI1D(id);
        }
        public SanPhamModel GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }
        public List<SanPhamModel> GetDataBanChay()
        {
            return _res.GetDataBanChay();
        }
        public List<SanPhamModel> GetDataAll()
        {
            return _res.GetDataAll();
        }
        //public List<SanPhamCMModel> GetDataCM()
        //{
        //    return _res.GetDataCM();
        //}
        //public bool Update1(SanPhamModel model)
        //{
        //    return _res.Update1(model);
        //}
        public List<SanPhamModel> Search(int pageIndex, int pageSize, out long total, string tenSanPham, int maChuyenMuc, int giaTo,int giaFrom, int soluong, bool dacbiet)
        {
            return _res.Search(pageIndex, pageSize, out total, tenSanPham, maChuyenMuc, giaFrom, giaTo, soluong, dacbiet);
        }
       
    }
}