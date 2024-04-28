using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public partial interface INhaRepository
    {
        NhaPhanPhoiModel GetDatabyID(string id);
        bool Create(NhaPhanPhoiModel model);
        bool Update(NhaPhanPhoiModel model);
        bool Delete(string id);
        List<NhaPhanPhoiModel> GetDataAll();
        List<NhaPhanPhoiModel> Search(int pageIndex, int pageSize, out long total, string ten_NhaPhanPhoi, string dia_chi);
    }
}
