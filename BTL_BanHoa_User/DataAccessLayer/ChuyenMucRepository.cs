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
        public List<ChuyenMucModel> GetDataAll()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_item_all");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ChuyenMucModel>().ToList();
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
