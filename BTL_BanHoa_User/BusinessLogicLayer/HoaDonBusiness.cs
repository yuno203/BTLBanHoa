using BusinessLogicLayer;
using DataAccessLayer;
using DataModel;
using System.Collections.Generic;

namespace BusinessLogicLayer
{
    public class HoaDonBusiness:IHoaDonBusiness
    {
        private IHoaDonRepository _res;
        public HoaDonBusiness(IHoaDonRepository res)
        {
            _res = res;
        }
        public HoaDonModel GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }

        public bool Create(HoaDonModel model)
        {
            return _res.Create(model);
        }
        //public bool Update(HoaDonModle model)
        //{
        //    return _res.Update(model);
        //}
        public bool Update1(HoaDonModel model)
        {
            return _res.Update1(model);
        }
        public List<HoaDonModel> Search(int pageIndex, int pageSize, out long total, string hoten, string diachi, bool trangthai, DateTime?ngayTao, DateTime? ngayDuyet)
        {
            return _res.Search(pageIndex, pageSize,out total, hoten, diachi, trangthai,ngayTao,ngayDuyet );
        }


    }
}