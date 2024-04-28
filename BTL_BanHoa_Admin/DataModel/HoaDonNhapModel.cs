namespace DataModel
{
    public class HoaDonNhapModel
    {
        public int MaHoaDon { get; set; }
        public int MaNhaPhanPhoi { get; set; }
        public DateTime NgayTao { get; set; }
        public string KieuThanhToan { get; set; }

        public List<ChiTietHoaDonNhapModel> list_json_chitiethoadonnhap { get; set; }
    }
    public class HoaDonNhapAll
    {
        public int MaHoaDon { get; set; }   
        public int MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public decimal GiaNhap { get; set; }
        public string TenSanPham { get; set; }
        public string AnhDaiDien { get; set; }

    }


}