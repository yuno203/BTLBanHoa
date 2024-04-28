using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;

namespace Api.BanHang.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private ISanPhamBusiness _sanphamBusiness;
      
        public SanPhamController(ISanPhamBusiness sanphamBusiness, IConfiguration configuration, IWebHostEnvironment env)
        {
            _sanphamBusiness = sanphamBusiness;
            
        }
       
       
        [Route("get-by-id/{id}")]
        [HttpGet]
        public SanPhamModel GetDatabyID(string id)
        {
            return _sanphamBusiness.GetDatabyID(id);
        }

        [Route("get-banchay")]
        [HttpGet]
        public IEnumerable<SanPhamModel> GetDataBanChay()
        {
            return _sanphamBusiness.GetDataBanChay();
        }
        [Route("get-all")]
        [HttpGet]
        public IEnumerable<SanPhamModel> GetDataAll()
        {
            return _sanphamBusiness.GetDataAll();
        }
      
        //[Route("create-item")]
        //[HttpPost]
        //public SanPhamModel Create([FromBody] SanPhamModel model)
        //{
        //    _sanphamBusiness.Create(model);
        //    return model;
        //}
        [Route("getcmsp-by-id/{id}")]
        [HttpGet]
        //public HoaDonAll GetDatabyI1D(string id)
        //{
        //    return _hoadonBusiness.GetDatabyI1D(id);
        //}
        public IActionResult GetDatabyI1D(string id)
        {
            try
            {
                var result = _sanphamBusiness.GetDatabyI1D(id);

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

        [Route("search")]
        [HttpPost]
        public IActionResult Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new SanPhamModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string tenSanPham = "";
                if (formData.Keys.Contains("tenSanPham") && !string.IsNullOrEmpty(Convert.ToString(formData["tenSanPham"]))) { tenSanPham = Convert.ToString(formData["tenSanPham"]); }
                int giaFrom = 0;
                int giaTo = 0;// You can change the default value as needed.
                int soluong = 0; // You can change the default value as needed.
                int maChuyenMuc = 0;
                bool dacbiet = true; // Thêm biến dacbiet với giá trị mặc định là false.
                if (formData.TryGetValue("maChuyenMuc", out var maChuyenMucValue) && int.TryParse(maChuyenMucValue.ToString(), out maChuyenMuc))
                {
                    // maChuyenMuc đã được chuyển thành số nguyên thành công.
                }
                if (formData.TryGetValue("giaFrom", out var giaFromValue) && int.TryParse(giaFromValue.ToString(), out var parsedGiaFrom))
                {
                    giaFrom = parsedGiaFrom;
                }

                if (formData.TryGetValue("giaTo", out var giaToValue) && int.TryParse(giaToValue.ToString(), out var parsedGiaTo))
                {
                    giaTo = parsedGiaTo;
                }
                if (formData.Keys.Contains("soluong") && !string.IsNullOrEmpty(Convert.ToString(formData["soluong"])))
                {
                    soluong = int.Parse(Convert.ToString(formData["soluong"]));
                }
                if (formData.TryGetValue("dacBiet", out var dacbietValue) && bool.TryParse(dacbietValue.ToString(), out dacbiet))
                {
                    // dacbiet đã được chuyển thành bool thành công.
                }


                long total = 0;
                var data = _sanphamBusiness.Search(page, pageSize, out total, tenSanPham, maChuyenMuc, giaFrom, giaTo, soluong, dacbiet);
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

        
    }
}
