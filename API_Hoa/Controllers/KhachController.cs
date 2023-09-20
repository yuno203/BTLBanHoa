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
            string KhachHangID = "";
            if (formData.Keys.Contains("KhachHangID") && !string.IsNullOrEmpty(Convert.ToString(formData["KhachHangID"]))) { KhachHangID = Convert.ToString(formData["KhachHangID"]); }
            _khachBusiness.Delete(KhachHangID);
            return Ok();
        }
    }
}
