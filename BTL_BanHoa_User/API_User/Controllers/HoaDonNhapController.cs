using BusinessLogicLayer;
using DataModel;
using Microsoft.AspNetCore.Mvc;
using System;

namespace Api.BanHang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HoaDonNhapController : ControllerBase
    {
        private IHoaDonNhapBusiness _hoadonnhapBusiness;
        public HoaDonNhapController(IHoaDonNhapBusiness khachBusiness) 
        {
            _hoadonnhapBusiness = khachBusiness;
        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public HoaDonNhapModel GetDatabyID(string id)
        {
            return _hoadonnhapBusiness.GetDatabyID(id);
        }


        [Route("create-item")]
        [HttpPost]
        public HoaDonNhapModel Create([FromBody] HoaDonNhapModel model)
        {
            _hoadonnhapBusiness.Create(model);
            return model;
        }
        //[Route("update-item")]
        //[HttpPost]
        //public HoaDonModle Update([FromBody] HoaDonModle model)
        //{
        //    _khachBusiness.Update(model);
        //    return model;
        //}

        [Route("search")]
        [HttpPost]
        public IActionResult Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new HoaDonNhapModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string ten_khach = "";
                if (formData.Keys.Contains("ten_khach") && !string.IsNullOrEmpty(Convert.ToString(formData["ten_khach"]))) { ten_khach = Convert.ToString(formData["ten_khach"]); }
                string diachi = "";
                if (formData.Keys.Contains("diachi") && !string.IsNullOrEmpty(Convert.ToString(formData["diachi"]))) { diachi = Convert.ToString(formData["diachi"]); }

                bool trang_thai = formData.ContainsKey("trangthai") && bool.TryParse(formData["trangthai"].ToString(), out bool parsedTrangThai) ? parsedTrangThai : false;

                long total = 0;
                var data = _hoadonnhapBusiness.Search(page, pageSize,out total , ten_khach, diachi, trang_thai);
                return Ok(
                   new
                   {
                       TotalItems = total,
                       Data = data,
                       Page = page,
                       PageSize = pageSize
                   }
                   );
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [Route("updatene-item")]
        [HttpPost]
        public HoaDonNhapModel Update1([FromBody] HoaDonNhapModel model)
        {
            _hoadonnhapBusiness.Update1(model);
            return model;
        }
    }
}
