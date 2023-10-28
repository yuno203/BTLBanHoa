using DataAccessLayer.Interfaces;
using DataModel;
using Newtonsoft.Json;
using System.Reflection;

namespace DataAccessLayer
{
    public class SanPhamRepository : ISanPhamRepository
    {
        private IDatabaseHelper _dbHelper;
        public SanPhamRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public SanPhamModel GetDatabyID(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_SanPham_get_by_id",
                     "@MaSanPham", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPhamModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPhamModel> GetDataAll()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "BanChay");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPhamModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create(SanPhamModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_SanPham_create",

                "@MaChuyenMuc", model.MaChuyenMuc,
                "@TenSanPham", model.TenSanPham,
                "@AnhDaiDien", model.AnhDaiDien,
                "@Gia", model.Gia,
                "@GiaGiam", model.GiaGiam, 
                "@SoLuong", model.SoLuong,
                "@TrangThai", model.TrangThai,
                "@LuotXem", model.LuotXem,
                "@DacBiet", model.DacBiet,
                "@list_json_chitietsanpham", model.list_json_chitietsanpham != null ? MessageConvert.SerializeObject(model.list_json_chitietsanpham) : null);
                //"@list_json_sanphamnhaphanphoi", model.list_json_sanphamnhaphanphoi != null ? MessageConvert.SerializeObject(model.list_json_sanphamnhaphanphoi) : null);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //public bool Update(SanPhamModel model)
        //{
        //    string msgError = "";
        //    try
        //    {
        //        var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "update_SanPham",
        //        //"@Id",model.Id,
        //        "@TenKH", model.TenKH,               
        //        "@DiaChi", model.Diachi,
        //        "@trangthai", model.trangthai,
        //        "@listjson_chitiet", model.list_json_chitietSanPham != null ? MessageConvert.SerializeObject(model.list_json_chitietSanPham) : null);

        //        if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
        //        {
        //            throw new Exception(Convert.ToString(result) + msgError);
        //        }
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        public List<SanPhamModel> Search(int pageIndex, int pageSize, out long total, string tenSanPham,int gia,int soluong)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_SanPham_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@tensanpham", tenSanPham,
                    "@gia",gia,
                    "@soluong",soluong
                  
                    //"@Email",Email,
                    //"@SDT",SDT,
                    //"@DiaChiGiaoHang", DiaChiGiaoHang
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<SanPhamModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Update1(SanPhamModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "update1_SanPham",
                 "@MaSanPham", model.MaSanPham,
                "@MaChuyenMuc", model.MaChuyenMuc,
                "@TenSanPham", model.TenSanPham,
                "@AnhDaiDien", model.AnhDaiDien,
                "@Gia", model.Gia,
                "@GiaGiam", model.GiaGiam,
                "@SoLuong", model.SoLuong,
                "@TrangThai", model.TrangThai,
                "@LuotXem", model.LuotXem,
                "@DacBiet", model.DacBiet,
                "@list_json_chitietsanpham", model.list_json_chitietsanpham != null ? MessageConvert.SerializeObject(model.list_json_chitietsanpham) : null);
                //"@list_json_sanphamnhaphanphoi", model.list_json_sanphamnhaphanphoi != null ? MessageConvert.SerializeObject(model.list_json_sanphamnhaphanphoi) : null);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
