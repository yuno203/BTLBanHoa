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
        //public List<SanPhamCMModel> GetDataCM()
        //{
        //    string msgError = "";
        //    try
        //    {
        //        var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "GetSanPhamChuyenMucData");
        //        if (!string.IsNullOrEmpty(msgError))
        //            throw new Exception(msgError);
        //        return dt.ConvertTo<SanPhamCMModel>().ToList();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        public List<SanPhamCMModel> GetDatabyI1D(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_getbyidcm",
                    "@MaChuyenMuc", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);

                // Chuyển đổi DataTable thành danh sách HoaDonAll
                if (id != "") ;
                return dt.ConvertTo<SanPhamCMModel>().ToList();


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
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_all");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPhamModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<SanPhamModel> GetDataBanChay()
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
      

        public List<SanPhamModel> Search(int pageIndex, int pageSize, out long total, string tenSanPham,int maChuyenMuc, int giaFrom, int giaTo, int soluong, bool dacbiet)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_SanPham_search_user",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@tensanpham", tenSanPham,
                     "@maChuyenMuc", maChuyenMuc,
                    "@giaFrom",giaFrom,
                     "@giaTo", giaTo,
                    "@soluong",soluong,
                    "@dacBiet",dacbiet

                    
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
       
        

    }
}
