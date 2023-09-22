namespace DataModel
{
    public class HoaDonModel
    {
        public int MaHoaDon { get; set; }
        public bool trangthai { get; set; }

        public string TenKH { get; set; }

        public string Diachi { get; set; }

        public List<ChiTietHoaDonModel> list_json_chitiethoadon { get; set; }

    }
}