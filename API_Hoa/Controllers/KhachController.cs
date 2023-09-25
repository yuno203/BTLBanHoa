using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Hoa.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KhachController : ControllerBase
    {
        private IKhachBusiness _khachBusiness;
        public KhachController(IKhachBusiness khachBusiness)
        {
            _khachBusiness = khachBusiness;
        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public KhachModel GetDatabyID(string id)
        {
            return _khachBusiness.GetDatabyID(id);
        }

        [Route("create-item")]
        [HttpPost]
        public KhachModel Create([FromBody] KhachModel model)
        {
            _khachBusiness.Create(model);
            return model;
        }
        [Route("update-item")]
        [HttpPost]
        public KhachModel Update([FromBody] KhachModel model)
        {
            _khachBusiness.Update(model);
            return model;
        }

        [Route("delete")]
        [HttpPost]
        public IActionResult DeleteKhachhang([FromBody] Dictionary<string, object> formData)
        {
            string ID = "";
            if (formData.Keys.Contains("ID") && !string.IsNullOrEmpty(Convert.ToString(formData["ID"]))) { ID = Convert.ToString(formData["ID"]); }
            _khachBusiness.Delete(ID);
            return Ok();
        }


        [Route("search")]
        [HttpPost]
        public IActionResult Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new KhachModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string ten_khach = "";
                if (formData.Keys.Contains("ten_khach") && !string.IsNullOrEmpty(Convert.ToString(formData["ten_khach"]))) { ten_khach = Convert.ToString(formData["ten_khach"]); }
                string diachi = "";
                if (formData.Keys.Contains("diachi") && !string.IsNullOrEmpty(Convert.ToString(formData["diachi"]))) { diachi = Convert.ToString(formData["diachi"]); }
                long total = 0;
                var data = _khachBusiness.Search(page, pageSize, out total, ten_khach, diachi);
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
