
using BusinessLogicLayer.Interfaces;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using DataModel;

namespace BusinessLogicLayer
{
    public class ChuyenMucBusiness : IChuyenMucBusiness
    {
        private IChuyenMucRepository _res;
        public ChuyenMucBusiness(IChuyenMucRepository res)
        {
            _res = res;
        }
        //public bool Create(ChuyenMucModel model)
        //{
        //    return _res.Create(model);
        //}
        public ChuyenMucModel GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }
        public List<ChuyenMucModel> GetDataAll()
        {
            return _res.GetDataAll();
        }
        //public bool Update(ChuyenMucModel model)
        //{
        //    return _res.Update(model);
        //}
        public List<ChuyenMucModel> Search(int pageIndex, int pageSize, out long total, string ten_ChuyenMuc)
        {
            return _res.Search(pageIndex, pageSize, out total,ten_ChuyenMuc);
        }
        //public bool Delete(string id)
        //{
        //    return _res.Delete(id);
        //}
    }
}