using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Hoa.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class ChuyenMucController : ControllerBase
    {
        private IChuyenMucBusiness _ChuyenMucBusiness;
        public ChuyenMucController(IChuyenMucBusiness khachBusiness)
        {
            _ChuyenMucBusiness = khachBusiness;

        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public ChuyenMucModel GetDatabyID(string id)
        {
            return _ChuyenMucBusiness.GetDatabyID(id);
        }
        [Route("get-all")]
        [HttpGet]
        public IEnumerable<ChuyenMucModel> GetDatabAll()
        {
            return _ChuyenMucBusiness.GetDataAll();
        }

        [Route("create-item")]
        [HttpPost]
        public ChuyenMucModel Create([FromBody] ChuyenMucModel model)
        {
            _ChuyenMucBusiness.Create(model);
            return model;
        }
        [Route("update-item")]
        [HttpPost]
        public ChuyenMucModel Update([FromBody] ChuyenMucModel model)
        {
            _ChuyenMucBusiness.Update(model);
            return model;
        }

        [Route("delete")]
        [HttpDelete]
        public IActionResult DeleteChuyenMuchang([FromBody] Dictionary<string, object> formData)
        {
            string ID = "";
            if (formData.Keys.Contains("MaChuyenMuc") && !string.IsNullOrEmpty(Convert.ToString(formData["MaChuyenMuc"]))) { ID = Convert.ToString(formData["MaChuyenMuc"]); }
            _ChuyenMucBusiness.Delete(ID);
            return Ok();
        }


        [Route("search")]
        [HttpPost]
        public IActionResult Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new ChuyenMucModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string ten_ChuyenMuc = "";
                if (formData.Keys.Contains("ten_ChuyenMuc") && !string.IsNullOrEmpty(Convert.ToString(formData["ten_ChuyenMuc"]))) { ten_ChuyenMuc = Convert.ToString(formData["ten_ChuyenMuc"]); }
               
                long total = 0;
                var data = _ChuyenMucBusiness.Search(page, pageSize, out total, ten_ChuyenMuc);
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
