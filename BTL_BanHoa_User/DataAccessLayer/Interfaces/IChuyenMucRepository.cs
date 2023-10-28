using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public partial interface IChuyenMucRepository
    {
        ChuyenMucModel GetDatabyID(string id);
        bool Create(ChuyenMucModel model);
        bool Update(ChuyenMucModel model);
        bool Delete(string id);
        List<ChuyenMucModel> GetDataAll();
        List<ChuyenMucModel> Search(int pageindex, int pagesize, out long total, string ten_ChuyenMuc);
    }
}
