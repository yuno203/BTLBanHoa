namespace DataModel
{
    public class SanPhamModel
    {
        public int MaSanPham { get; set; }
        public int MaChuyenMuc { get; set; }
        public string TenSanPham { get; set; }
        public string AnhDaiDien { get; set; }
        public decimal Gia { get; set; }
        public decimal GiaGiam { get; set; }
        public int SoLuong { get; set; }
        public bool TrangThai { get; set; }
        public int LuotXem { get; set; }
        public bool DacBiet { get; set; }
        public List<ChiTietSanPhamModel> list_json_chitietsanpham { get; set; }
        public List<SanPhamNhaPhanPhoiModel> list_json_sanphamnhaphanphoi { get; set; }

    }
}