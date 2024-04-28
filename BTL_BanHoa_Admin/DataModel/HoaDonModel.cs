namespace DataModel
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

    public class HoaDonAll
    {
        public int MaHoaDon { get; set; }
        public int MaChiTietHoaDon { get; set; }
        public int MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public string TenSanPham { get; set; }
        public string AnhDaiDien { get; set; }
    }
}