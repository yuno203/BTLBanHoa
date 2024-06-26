﻿using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public partial interface IHoaDonNhapBusiness
    {
        HoaDonNhapModel GetDatabyID(string id);
        List<HoaDonNhapAll> GetDatabyI1D(string id);
        bool Create(HoaDonNhapModel model);
        //bool Update(HoaDonModle model);
        bool Update1(HoaDonNhapModel model);
        bool Delete(string id);
        List<HoaDonNhapModel> Search(int pageindex, int pagesize, out long total, string ten_khach, string dia_chi, bool trangthai);
        
    }
}
