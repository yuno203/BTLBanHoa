
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
        public bool Update1(SanPhamModel model)
        {
            return _res.Update1(model);
        }
        public bool Update(SanPhamModel model)
        {
            return _res.Update(model);
        }
        public List<SanPhamModel> GetDataAll()
        {
            return _res.GetDataAll();
        }
        public bool Delete(string id)
        {
            return _res.Delete(id);
        }
        //public bool Deletes(string id)
        //{
        //    return _res.Deletes(id);
        //}
        public List<SanPhamModel> Search(int pageIndex, int pageSize, out long total, string tenSanPham, int gia, int soluong)
        {
            return _res.Search(pageIndex, pageSize, out total, tenSanPham, gia, soluong);
        }
       
    }
}