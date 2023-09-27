using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Mvc;
using System;

namespace Api.BanHang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private ISanPhamBusiness _sanphamBusiness;
        public SanPhamController(ISanPhamBusiness khachBusiness)
        {
            _sanphamBusiness = khachBusiness;
        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public SanPhamModel GetDatabyID(string id)
        {
            return _sanphamBusiness.GetDatabyID(id);
        }


        [Route("create-item")]
        [HttpPost]
        public SanPhamModel Create([FromBody] SanPhamModel model)
        {
            _sanphamBusiness.Create(model);
            return model;
        }
        //[Route("update-item")]
        //[HttpPost]
        //public SanPhamModle Update([FromBody] SanPhamModle model)
        //{
        //    _khachBusiness.Update(model);
        //    return model;
        //}

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
               

                long total = 0;
                var data = _sanphamBusiness.Search(page, pageSize, out total, tenSanPham);
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
        public SanPhamModel Update1([FromBody] SanPhamModel model)
        {
            _sanphamBusiness.Update1(model);
            return model;
        }
    }
}
