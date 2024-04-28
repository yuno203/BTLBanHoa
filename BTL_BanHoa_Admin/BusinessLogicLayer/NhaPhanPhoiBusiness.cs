
using BusinessLogicLayer.Interfaces;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using DataModel;

namespace BusinessLogicLayer
{
    public class NhaPhanPhoiBusiness : INhaBusiness
    {
        private INhaRepository _res;
        public NhaPhanPhoiBusiness(INhaRepository res)
        {
            _res = res;
        }
        public bool Create(NhaPhanPhoiModel model)
        {
            return _res.Create(model);
        }
        public NhaPhanPhoiModel GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }
        public List<NhaPhanPhoiModel> GetDataAll()
        {
            return _res.GetDataAll();
        }
        public bool Update(NhaPhanPhoiModel model)
        {
            return _res.Update(model);
        }
        public List<NhaPhanPhoiModel> Search(int pageIndex, int pageSize, out long total, string ten_NhaPhanPhoi, string dia_chi)
        {
            return _res.Search(pageIndex, pageSize, out total, ten_NhaPhanPhoi, dia_chi);
        }
        public bool Delete(string id)
        {
            return _res.Delete(id);
        }
    }
}