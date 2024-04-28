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
        private string _path;
        private IWebHostEnvironment _env;
        public SanPhamController(ISanPhamBusiness sanphamBusiness, IConfiguration configuration, IWebHostEnvironment env)
        {
            _sanphamBusiness = sanphamBusiness;
            _path = configuration["AppSettings:PATH"];
            _env = env;
        }
        [NonAction]
        public string CreatePathFile(string RelativePathFileName)
        {
            try
            {
                string serverRootPathFolder = _path;
                string fullPathFile = $@"{serverRootPathFolder}\{RelativePathFileName}";
                string fullPathFolder = System.IO.Path.GetDirectoryName(fullPathFile);
                if (!Directory.Exists(fullPathFolder))
                    Directory.CreateDirectory(fullPathFolder);
                return fullPathFile;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        [Route("upload")]
        [HttpPost, DisableRequestSizeLimit]
        public async Task<IActionResult> Upload(IFormFile file)
        {
            try
            {
                if (file.Length > 0)
                {
                    string filePath = $"/{file.FileName}";
                    var fullPath = CreatePathFile(filePath);
                    using (var fileStream = new FileStream(fullPath, FileMode.Create))
                    {
                        await file.CopyToAsync(fileStream);
                    }
                    return Ok(new { filePath });
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Không tìm thây");
            }
        }

        [Route("download")]
        [HttpPost]
        public IActionResult DownloadData([FromBody] Dictionary<string, object> formData)
        {
            try
            {
                var webRoot = _env.ContentRootPath;
                string exportPath = Path.Combine(webRoot + @"\Export\DM.xlsx");
                var stream = new FileStream(exportPath, FileMode.Open, FileAccess.Read);
                return File(stream, "application/octet-stream");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public SanPhamModel GetDatabyID(string id)
        {
            return _sanphamBusiness.GetDatabyID(id);
        }
        [Route("get-all")]
        [HttpGet]
        public IEnumerable<SanPhamModel> GetDatabAll()
        {
            return _sanphamBusiness.GetDataAll();
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
        //[Authorize]
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
                int gia = 0; // You can change the default value as needed.
                int soluong = 0; // You can change the default value as needed.

                if (formData.Keys.Contains("gia") && !string.IsNullOrEmpty(Convert.ToString(formData["gia"])))
                {
                    gia = int.Parse(Convert.ToString(formData["gia"]));
                }

                if (formData.Keys.Contains("soluong") && !string.IsNullOrEmpty(Convert.ToString(formData["soluong"])))
                {
                    soluong = int.Parse(Convert.ToString(formData["soluong"]));
                }

                long total = 0;
                var data = _sanphamBusiness.Search(page, pageSize, out total, tenSanPham, gia, soluong);
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
        [Route("update-item")]
        [HttpPost]
        public SanPhamModel Update([FromBody] SanPhamModel model)
        {
            _sanphamBusiness.Update(model);
            return model;
        }
        [Route("delete")]
        [HttpPost]
        public IActionResult DeleteKhachhang([FromBody] Dictionary<string, object> formData)
        {
            string ID = "";
            if (formData.Keys.Contains("MaSanPham") && !string.IsNullOrEmpty(Convert.ToString(formData["MaSanPham"]))) { ID = Convert.ToString(formData["MaSanPham"]); }
            _sanphamBusiness.Delete(ID);
            return Ok();
        //}
        //[Route("deletes")]
        //[HttpPost]
        //public IActionResult DeleteKhachhangs([FromBody] Dictionary<string, object> formData)
        //{
        //    string ID = "";
        //    if (formData.Keys.Contains("MaSanPhams") && !string.IsNullOrEmpty(Convert.ToString(formData["MaSanPhams"]))) { ID = Convert.ToString(formData["MaSanPhams"]); }
        //    _sanphamBusiness.Deletes(ID);
        //    return Ok();
        }
    }
}
