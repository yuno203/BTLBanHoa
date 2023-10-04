using DataAccessLayer.Interfaces;
using DataModel;

namespace DataAccessLayer
{
    public class ChuyenMucRepository : IChuyenMucRepository
    {
        private IDatabaseHelper _dbHelper;
        public ChuyenMucRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public ChuyenMucModel GetDatabyID(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_chuyenmuc_get_by_id",
                     "@MaChuyenMuc", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ChuyenMucModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create(ChuyenMucModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "create_ChuyenMuc",
                "@MaChuyenMucCha", model.MaChuyenMucCha,
                "@TenChuyenMuc", model.TenChuyenMuc,
                "@DacBiet", model.DacBiet,
                "@NoiDung", model.NoiDung
                
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
        public bool Update(ChuyenMucModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "update_ChuyenMuc",
                "@MaChuyenMuc", model.MaChuyenMuc,
                "@MaChuyenMucCha", model.MaChuyenMucCha,
                "@TenChuyenMuc", model.TenChuyenMuc,
                "@DacBiet", model.DacBiet,
                "@NoiDung", model.NoiDung
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
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "delete_ChuyenMuc",
                "@MaChuyenMuc", id);
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

        public List<ChuyenMucModel> Search(int pageIndex, int pageSize, out long total, string ten_ChuyenMuc)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_ChuyenMuc_search1",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@ten_ChuyenMuc", ten_ChuyenMuc
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<ChuyenMucModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }



       
    }
}
