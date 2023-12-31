﻿namespace DataModel
{
    public class HoaDonModel
    {
        public int MaHoaDon { get; set; }
        public bool trangthai { get; set; }

        public string TenKH { get; set; }

        public string Diachi { get; set; }
        public DateTime NgayTao { get; set; }
        public DateTime NgayDuyet { get; set; }
        public decimal TongGia { get; set; }
        public string Email { get; set; }
        public string SDT { get; set; }
        public string DiaChiGiaoHang { get; set; }

        public List<ChiTietHoaDonModel> list_json_chitiethoadon { get; set; }

    }
}