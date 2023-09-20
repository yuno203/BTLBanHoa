using System;
using DataModel;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
    public partial interface IKhachBusiness
    {
        KhachModel GetDatabyID(string id);
        bool Create(KhachModel model);
        bool Update(KhachModel model);
        bool Delete(string id);
    }
}
