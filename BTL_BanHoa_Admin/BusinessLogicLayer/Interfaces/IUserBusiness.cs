using System;
using DataModel;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
    public partial interface IUserBusiness
    {
        UserModel Login(string taikhoan, string matkhau);
    }
}
