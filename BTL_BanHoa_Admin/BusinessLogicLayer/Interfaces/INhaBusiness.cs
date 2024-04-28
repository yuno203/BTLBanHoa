using System;
using DataModel;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
    public partial interface INhaBusiness
    {
        NhaPhanPhoiModel GetDatabyID(string id);
        bool Create(NhaPhanPhoiModel model);
        bool Update(NhaPhanPhoiModel model);
        bool Delete(string id);
        List<NhaPhanPhoiModel> GetDataAll();
        List<NhaPhanPhoiModel> Search(int pageIndex, int pageSize, out long total, string ten_NhaPhanPhoi, string dia_chi);
    }
}
