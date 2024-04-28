using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Mvc;
using System;

namespace Api.BanHang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HoaDonController : ControllerBase
    {
        private IHoaDonBusiness _hoadonBusiness;
        public HoaDonController(IHoaDonBusiness khachBusiness)
        {
            _hoadonBusiness = khachBusiness;
        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public HoaDonModel GetDatabyID(string id)
        {
            return _hoadonBusiness.GetDatabyID(id);
        }
        [Route("getcthd-by-id/{id}")]
        [HttpGet]
        public IActionResult GetDatabyI1D(string id)
        {
            try
            {
                var result = _hoadonBusiness.GetDatabyI1D(id);

                if (result != null)
                {
                    // Trả về danh sách sản phẩm
                    return Ok(result);
                }
                else
                {
                    // Trả về NotFound nếu không tìm thấy dữ liệu
                    return NotFound();
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi và trả về lỗi 500
                return StatusCode(500, ex.Message);
            }
        }
       
       
      
        [Route("create-item")]
        [HttpPost]
        public HoaDonModel Create([FromBody] HoaDonModel model)
        {
            _hoadonBusiness.Create(model);
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
            var response = new HoaDonModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string ten_khach = "";
                if (formData.Keys.Contains("ten_khach") && !string.IsNullOrEmpty(Convert.ToString(formData["ten_khach"]))) { ten_khach = Convert.ToString(formData["ten_khach"]); }
                string diachi = "";
                if (formData.Keys.Contains("diachi") && !string.IsNullOrEmpty(Convert.ToString(formData["diachi"]))) { diachi = Convert.ToString(formData["diachi"]); }

                bool trang_thai = formData.ContainsKey("trangthai") && bool.TryParse(formData["trangthai"].ToString(), out bool parsedTrangThai) ? parsedTrangThai : false;
                DateTime? ngayTao = null; // Khởi tạo biến ngay_tao kiểu DateTime?

                if (formData.Keys.Contains("ngay_tao") && !string.IsNullOrEmpty(Convert.ToString(formData["ngay_tao"])))
                {
                    if (DateTime.TryParse(Convert.ToString(formData["ngay_tao"]), out DateTime parsedNgayTao))
                    {
                        ngayTao = parsedNgayTao;
                    }
                    else
                    {
                        // Xử lý trường hợp không thể chuyển đổi ngày tạo thành kiểu DateTime
                    }
                }



                long total = 0;
                var data = _hoadonBusiness.Search(page, pageSize, out total, ten_khach, diachi, trang_thai, ngayTao);
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
        public HoaDonModel Update1([FromBody] HoaDonModel model)
        {
            _hoadonBusiness.Update1(model);
            return model;
        }
        [Route("update-item")]
        [HttpPost]
        public HoaDonModel Update([FromBody] HoaDonModel model)
        {
            _hoadonBusiness.Update(model);
            return model;
        }
        [Route("delete")]
        [HttpPost]
        public IActionResult DeleteKhachhang([FromBody] Dictionary<string, object> formData)
        {
            string ID = "";
            if (formData.Keys.Contains("MaHoaDon") && !string.IsNullOrEmpty(Convert.ToString(formData["MaHoaDon"]))) { ID = Convert.ToString(formData["MaHoaDon"]); }
            _hoadonBusiness.Delete(ID);
            return Ok();
        }
    }
}
