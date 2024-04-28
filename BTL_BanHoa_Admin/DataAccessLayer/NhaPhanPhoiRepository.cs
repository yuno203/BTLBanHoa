using DataAccessLayer.Interfaces;
using DataModel;

namespace DataAccessLayer
{
    public class NhaPhanPhoiRepository : INhaRepository
    {
        private IDatabaseHelper _dbHelper;
        public NhaPhanPhoiRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public NhaPhanPhoiModel GetDatabyID(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_get_NhaCungCapByID",
                     "@MaNhaPhanPhoi", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NhaPhanPhoiModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<NhaPhanPhoiModel> GetDataAll()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_item_allnpp");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NhaPhanPhoiModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create(NhaPhanPhoiModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_create_nhacungcap",
                "@TenNhaPhanPhoi", model.TenNhaPhanPhoi,
                "@SoDienThoai", model.SoDienThoai,
                "@DiaChi", model.DiaChi,
                "@Fax", model.Fax,
                "@MoTa", model.MoTa
                );
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
        public bool Update(NhaPhanPhoiModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_update_nhacungcap",
                "@MaNhaPhanPhoi", model.MaNhaPhanPhoi,
                "@TenNhaPhanPhoi", model.TenNhaPhanPhoi,
                "@SoDienThoai", model.SoDienThoai,
                "@DiaChi", model.DiaChi,
                "@Fax", model.Fax,
                "@MoTa", model.MoTa
                );
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

        public bool Delete(string id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_delete_nhacungcap",
                "@MaNhaPhanPhoi", id);
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

        public List<NhaPhanPhoiModel> Search(int pageIndex, int pageSize, out long total, string ten_NhaPhanPhoi, string dia_chi)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_NhaPhanPhoi_search1",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@ten_NhaPhanPhoi", ten_NhaPhanPhoi,
                    "@dia_chi", dia_chi);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<NhaPhanPhoiModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }



       
    }
}
