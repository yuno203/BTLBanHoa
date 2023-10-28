
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
        public bool Create(SanPhamModel model)
        {
            return _res.Create(model);
        }
        public SanPhamModel GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }
        public List<SanPhamModel> GetDataAll()
        {
            return _res.GetDataAll();
        }
        public bool Update1(SanPhamModel model)
        {
            return _res.Update1(model);
        }
        public List<SanPhamModel> Search(int pageIndex, int pageSize, out long total, string tenSanPham, int gia, int soluong)
        {
            return _res.Search(pageIndex, pageSize, out total, tenSanPham, gia, soluong);
        }
       
    }
}