﻿using DataModel;
using Newtonsoft.Json;
using System.Reflection;
using DataAccessLayer.Interfaces;

namespace DataAccessLayer
{
    public class HoaDonRepository : IHoaDonRepository
    {
        private IDatabaseHelper _dbHelper;
        public HoaDonRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public HoaDonModel GetDatabyID(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_hoadon_get_by_id",
                     "@MaHoaDon", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<HoaDonModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create(HoaDonModel model)
        {
            string msgError = "";
            try
            {
                if (model.NgayTao < DateTime.MinValue || model.NgayTao > DateTime.MaxValue ||
                    model.NgayDuyet < DateTime.MinValue || model.NgayDuyet > DateTime.MaxValue)
                {
                    throw new Exception("Giá trị ngày không hợp lệ.");
                }

                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_hoadon_create",
                    "@TenKH", model.TenKH,
                    "@DiaChi", model.Diachi,
                    "@trangthai", model.trangthai,
                    "@NgayTao", model.NgayTao,
                    "@NgayDuyet", model.NgayDuyet,
                    "@TongGia", model.TongGia,
                    "@Email", model.Email,
                    "@SDT", model.SDT,
                    "@DiaChiGiaoHang", model.DiaChiGiaoHang,
                    "@list_json_chitiethoadon", model.list_json_chitiethoadon != null ? MessageConvert.SerializeObject(model.list_json_chitiethoadon) : null);
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //public bool Update(HoaDonModel model)
        //{
        //    string msgError = "";
        //    try
        //    {
        //        var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "update_hoadon",
        //        //"@Id",model.Id,
        //        "@TenKH", model.TenKH,               
        //        "@DiaChi", model.Diachi,
        //        "@trangthai", model.trangthai,
        //        "@listjson_chitiet", model.list_json_chitiethoadon != null ? MessageConvert.SerializeObject(model.list_json_chitiethoadon) : null);

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

        public List<HoaDonModel> Search(int pageIndex, int pageSize, out long total, string ten_khach, string dia_chi, bool trang_thai,
            DateTime? ngayTao , DateTime? ngayDuyet)
        {
            string msgError = ""; 
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_hoadon_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@ten_khach", ten_khach,
                    "@dia_chi", dia_chi,
                    "@trang_thai", trang_thai,
                    "@NgayTao", ngayTao
                                 
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<HoaDonModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Update1(HoaDonModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "update1_hoadon",
                "@MaHoaDon", model.MaHoaDon,
                "@TenKH", model.TenKH,
                "@DiaChi", model.Diachi,
                "@trangthai", model.trangthai,
                "@NgayTao", model.NgayTao,
                "@NgayDuyet", model.NgayDuyet,
                "@TongGia", model.TongGia,
                "@Email", model.Email,
                "@SDT", model.SDT,
                "@DiaChiGiaoHang", model.DiaChiGiaoHang,
                "@list_json_chitiethoadon", model.list_json_chitiethoadon != null ? MessageConvert.SerializeObject(model.list_json_chitiethoadon) : null);
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
