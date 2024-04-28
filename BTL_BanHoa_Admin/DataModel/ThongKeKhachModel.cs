namespace DataModel
{
    public class ThongKeKhachModel
    {
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public DateTime NgayTao { get; set; }
        //public DateTime NgayTao { get; set; }
        public string TenKH { get; set; }
        public string DiaChi { get; set; }
        public string AnhDaiDien { get; set; }
        public int TotalQuantitySold { get; set; }
    }
}