using BusinessLogicLayer;
using DataAccessLayer;
using DataModel;
using System.Collections.Generic;

namespace BusinessLogicLayer
{
    public class HoaDonNhapBusiness:IHoaDonNhapBusiness
    {
        private IHoaDonNhapRepository _res;
        public HoaDonNhapBusiness(IHoaDonNhapRepository res)
        {
            _res = res;
        }
        public HoaDonNhapModel GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }

        public bool Create(HoaDonNhapModel model)
        {
            return _res.Create(model);
        }
        //public bool Update(HoaDonModle model)
        //{
        //    return _res.Update(model);
        //}
        public bool Update1(HoaDonNhapModel model)
        {
            return _res.Update1(model);
        }
        public List<HoaDonNhapModel> Search(int pageIndex, int pageSize, out long total, string hoten, string diachi, bool trangthai)
        {
            return _res.Search(pageIndex, pageSize,out total, hoten, diachi, trangthai);
        }


    }
}