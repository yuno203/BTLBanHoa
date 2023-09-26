namespace DataModel
{
    public class ChiTietHoaDonNhapModel
    {
        public int Id { get; set; }
        public int MaHoaDon { get; set; }
        public int MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public string DonViTinh { get; set; }
        public decimal GiaNhap { get; set; }
        public decimal TongTien { get; set; }

    }
}