namespace DataModel
{
    public class ChiTietHoaDonModel
    {
        public int MaChiTietHoaDon { get; set; }
        public int MaHoaDon { get; set; }
        public int MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public double DonGia { get; set; }
        public int status { get; set; }

        //public List<ChiTietSanPhamModel> list_json_chitietsanpham { get; set; }
    }
    public class ChiTietHoaDonAll {
        public int MaChiTietHoaDon { get; set; }
        public int MaHoaDon { get; set; }
        public int MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public string TenSanPham { get; set; }
        public string AnhDaiDien { get; set; }
      
    }
}