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
}