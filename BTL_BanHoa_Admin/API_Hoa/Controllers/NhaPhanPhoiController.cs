using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Hoa.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class NhaPhanPhoiController : ControllerBase
    {
        private INhaBusiness _NhaPhanPhoiBusiness;
        //private string _path;
        //private IWebHostEnvironment _env;
        public NhaPhanPhoiController(INhaBusiness NhaPhanPhoiBusiness, IConfiguration configuration, IWebHostEnvironment env)
        {
            _NhaPhanPhoiBusiness = NhaPhanPhoiBusiness;
            //_path = configuration["AppSettings:PATH"];
            //_env = env;
        }
       
        [Route("get-by-id/{id}")]
        [HttpGet]
        public NhaPhanPhoiModel GetDatabyID(string id)
        {
            return _NhaPhanPhoiBusiness.GetDatabyID(id);
        }
        [Route("get-all")]
        [HttpGet]
        public IEnumerable<NhaPhanPhoiModel> GetDatabAll()
        {
            return _NhaPhanPhoiBusiness.GetDataAll();
        }
        [Route("create-item")]
        [HttpPost]
        public NhaPhanPhoiModel Create([FromBody] NhaPhanPhoiModel model)
        {
            _NhaPhanPhoiBusiness.Create(model);
            return model;
        }
        [Route("update-item")]
        [HttpPost]
        public NhaPhanPhoiModel Update([FromBody] NhaPhanPhoiModel model)
        {
            _NhaPhanPhoiBusiness.Update(model);
            return model;
        }

        [Route("delete")]
        [HttpPost]
        public IActionResult DeleteNhaPhanPhoihang([FromBody] Dictionary<string, object> formData)
        {
            string ID = "";
            if (formData.Keys.Contains("MaNhaPhanPhoi") && !string.IsNullOrEmpty(Convert.ToString(formData["MaNhaPhanPhoi"]))) { ID = Convert.ToString(formData["MaNhaPhanPhoi"]); }
            _NhaPhanPhoiBusiness.Delete(ID);
            return Ok();
        }


        [Route("search")]
        [HttpPost]
        public IActionResult Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new NhaPhanPhoiModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string ten_NhaPhanPhoi = "";
                if (formData.Keys.Contains("ten_NhaPhanPhoi") && !string.IsNullOrEmpty(Convert.ToString(formData["ten_NhaPhanPhoi"]))) { ten_NhaPhanPhoi = Convert.ToString(formData["ten_NhaPhanPhoi"]); }
                string diachi = "";
                if (formData.Keys.Contains("diachi") && !string.IsNullOrEmpty(Convert.ToString(formData["diachi"]))) { diachi = Convert.ToString(formData["diachi"]); }
                long total = 0;
                var data = _NhaPhanPhoiBusiness.Search(page, pageSize, out total, ten_NhaPhanPhoi, diachi);
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
