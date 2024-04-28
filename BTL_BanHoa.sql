create database BTLThayDong125211
USE BTLThayDong125211

go
CREATE TABLE dbo.ChuyenMucs(
    MaChuyenMuc int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MaChuyenMucCha int,
    TenChuyenMuc nvarchar(50),
    DacBiet bit NOT NULL,
    NoiDung nvarchar(max)
);

go
CREATE TABLE dbo.HoaDons(
    MaHoaDon int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TrangThai bit,
    NgayTao datetime,
    NgayDuyet datetime,
    TongGia decimal(18, 0),
    TenKH nvarchar(50),
    GioiTinh bit NOT NULL,
    Diachi nvarchar(250),
    Email nvarchar(50),
    SDT nvarchar(50),
    DiaChiGiaoHang nvarchar(350),
    ThoiGianGiaoHang datetime
);
alter table dbo.HoaDons
ALTER COLUMN NgayTao datetime;
go
CREATE TABLE dbo.KhachHangs(
    Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TenKH nvarchar(50),
    GioiTinh bit NOT NULL,
    DiaChi nvarchar(250),
    SDT nvarchar(50),
    Email nvarchar(250)
);
go
CREATE TABLE dbo.NhaPhanPhois(
    MaNhaPhanPhoi int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TenNhaPhanPhoi nvarchar(250),
    DiaChi nvarchar(max),
    SoDienThoai nvarchar(50),
    Fax nvarchar(50),
    MoTa nvarchar(max)
);
go
CREATE TABLE dbo.SanPhams(
    MaSanPham int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MaChuyenMuc int,
    TenSanPham nvarchar(150),
    AnhDaiDien nvarchar(350),
    Gia decimal(18, 0),
    GiaGiam decimal(18, 0),
    SoLuong int,
    TrangThai bit,
    LuotXem int,
    DacBiet bit NOT NULL,
    FOREIGN KEY (MaChuyenMuc) REFERENCES dbo.ChuyenMucs(MaChuyenMuc)
);
go

create TABLE dbo.ChiTietSanPhams(
    MaChiTietSanPham int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MaSanPham int,
    MaNhaSanXuat int,
    MoTa nvarchar(350) NOT NULL,
    ChiTiet nvarchar(max),
    FOREIGN KEY (MaSanPham) REFERENCES dbo.SanPhams(MaSanPham) ON DELETE CASCADE ON UPDATE CASCADE   
);
go
CREATE TABLE dbo.SanPhams_NhaPhanPhois(
    MaSanPham int NOT NULL,
    MaNhaPhanPhoi int NOT NULL,
    PRIMARY KEY (MaNhaPhanPhoi, MaSanPham),
    FOREIGN KEY (MaSanPham) REFERENCES dbo.SanPhams(MaSanPham) ON DELETE CASCADE ON UPDATE CASCADE   ,
    FOREIGN KEY (MaNhaPhanPhoi) REFERENCES dbo.NhaPhanPhois(MaNhaPhanPhoi) ON DELETE CASCADE ON UPDATE CASCADE   
);


go
	CREATE TABLE dbo.ChiTietHoaDons(
		MaChiTietHoaDon int IDENTITY(1,1) NOT NULL PRIMARY KEY,
		MaHoaDon int,
		MaSanPham int,
		SoLuong int,
		DonGia decimal(18, 0),
		FOREIGN KEY (MaHoaDon) REFERENCES dbo.HoaDons(MaHoaDon) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (MaSanPham) REFERENCES dbo.SanPhams(MaSanPham) ON DELETE CASCADE ON UPDATE CASCADE
	);

go
CREATE TABLE dbo.TaiKhoans(
    MaTaiKhoan int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    LoaiTaiKhoan int,
    TenTaiKhoan nvarchar(50),
    MatKhau nvarchar(50),
    Email nvarchar(150)
);
go
CREATE TABLE dbo.LoaiTaiKhoans(
    MaLoai int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TenLoai nvarchar(50),
    MoTa nvarchar(250)
);
go
CREATE TABLE dbo.ChiTietTaiKhoans(
    MaChitietTaiKhoan int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MaTaiKhoan int,
    HoTen nvarchar(50),
    DiaChi nvarchar(250),
    SoDienThoai nvarchar(11),
    AnhDaiDien nvarchar(500),
    FOREIGN KEY (MaTaiKhoan) REFERENCES dbo.TaiKhoans(MaTaiKhoan) ON DELETE CASCADE ON UPDATE CASCADE
);
go
CREATE TABLE dbo.HoaDonNhaps(
    MaHoaDon int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MaNhaPhanPhoi int,
    NgayTao datetime,
    KieuThanhToan nvarchar(max),
    MaTaiKhoan int,
    FOREIGN KEY (MaNhaPhanPhoi) REFERENCES dbo.NhaPhanPhois(MaNhaPhanPhoi),
    FOREIGN KEY (MaTaiKhoan) REFERENCES dbo.TaiKhoans(MaTaiKhoan)
);
go
CREATE TABLE dbo.ChiTietHoaDonNhaps(
    Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MaHoaDon int,
    MaSanPham int,
    SoLuong int,
    DonViTinh nvarchar(50),
    GiaNhap decimal(18, 0),
    TongTien decimal(18, 0),
    FOREIGN KEY (MaHoaDon) REFERENCES dbo.HoaDonNhaps(MaHoaDon) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MaSanPham) REFERENCES dbo.SanPhams(MaSanPham) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE dbo.TaiKhoans
ADD CONSTRAINT FK_TaiKhoans_LoaiTaiKhoans
FOREIGN KEY (LoaiTaiKhoan)
REFERENCES dbo.LoaiTaiKhoans(MaLoai)
ON DELETE CASCADE
ON UPDATE CASCADE;


--ALTER TABLE dbo.SanPhams
--ADD CONSTRAINT FK_SanPhams_ChuyenMucs
--FOREIGN KEY (MaChuyenMuc)
--REFERENCES dbo.ChuyenMucs(MaChuyenMuc)
--ON DELETE CASCADE
--ON UPDATE CASCADE;

go
ALTER TABLE dbo.HoaDons
ALTER COLUMN GioiTinh bit NULL


go
INSERT INTO dbo.SanPhams (MaChuyenMuc, TenSanPham, AnhDaiDien, Gia, GiaGiam, SoLuong, TrangThai, LuotXem, DacBiet)
VALUES
    (1, 'Hoa hồng đỏ', 'link_anh_hoa1.jpg', 100000, 0, 50, 1, 0, 0),
    (1, 'Hoa cúc trắng', 'link_anh_hoa2.jpg', 80000, 0, 30, 1, 0, 0),
    (1, 'Hoa tulip vàng', 'link_anh_hoa3.jpg', 120000, 0, 20, 1, 0, 0),
    (1, 'Hoa ly trắng', 'link_anh_hoa4.jpg', 90000, 0, 40, 1, 0, 0),
    (1, 'Hoa hướng dương', 'link_anh_hoa5.jpg', 75000, 0, 60, 1, 0, 0);
go
-- Liên kết các sản phẩm với các nhà cung cấp
INSERT INTO dbo.SanPhams_NhaPhanPhois (MaSanPham, MaNhaPhanPhoi)
VALUES
    (2, 1), -- Hoa hồng đỏ từ Nhà cung cấp 1
    (3, 2), -- Hoa cúc trắng từ Nhà cung cấp 1
    (4, 3), -- Hoa tulip vàng từ Nhà cung cấp 2
    (5, 4), -- Hoa ly trắng từ Nhà cung cấp 2
    (6, 5); -- Hoa hướng dương từ Nhà cung cấp 1
go
	-- Tạo hóa đơn nhập cho các sản phẩm
INSERT INTO dbo.HoaDonNhaps (MaNhaPhanPhoi, NgayTao, KieuThanhToan, MaTaiKhoan)
VALUES
    (1, '2023-09-01', 'Thanh toán khi nhận hàng', 1),
    (2, '2023-09-02', 'Thanh toán trực tuyến', 2),
    (1, '2023-09-03', 'Thanh toán khi nhận hàng', 3),
    (2, '2023-09-04', 'Thanh toán trực tuyến', 4),
    (1, '2023-09-05', 'Thanh toán khi nhận hàng', 5);
go
-- Thêm chi tiết hóa đơn nhập
INSERT INTO dbo.ChiTietHoaDonNhaps (MaHoaDon, MaSanPham, SoLuong, DonViTinh, GiaNhap, TongTien)
VALUES
    (2, 2, 10, 'Bó', 100000, 1000000),
    (4, 2, 5, 'Bó', 80000, 400000),
    (2, 3, 8, 'Bó', 120000, 960000),
    (2, 4, 7, 'Bó', 90000, 630000),
    (3, 5, 12, 'Bó', 75000, 900000);
go
-- Tạo hóa đơn bán hàng cho khách hàng
INSERT INTO dbo.HoaDons (TrangThai, NgayTao, NgayDuyet, TongGia, TenKH, GioiTinh, Diachi, Email, SDT, DiaChiGiaoHang, ThoiGianGiaoHang)
VALUES
    (1, '2023-09-10', '2023-09-12', 1500000, 'Khách hàng 1', 1, 'Địa chỉ 1', 'khachhang1@gmail.com', '0123456789', 'Địa chỉ giao hàng 1', '2023-09-15'),
    (1, '2023-09-11', '2023-09-13', 1200000, 'Khách hàng 2', 0, 'Địa chỉ 2', 'khachhang2@gmail.com', '0123456788', 'Địa chỉ giao hàng 2', '2023-09-16'),
    (1, '2023-09-12', '2023-09-14', 800000, 'Khách hàng 3', 1, 'Địa chỉ 3', 'khachhang3@gmail.com', '0123456787', 'Địa chỉ giao hàng 3', '2023-09-17'),
    (1, '2023-09-13', '2023-09-15', 350000, 'Khách hàng 4', 0, 'Địa chỉ 4', 'khachhang4@gmail.com', '0123456786', 'Địa chỉ giao hàng 4', '2023-09-18'),
    (1, '2023-09-14', '2023-09-16', 2000000, 'Khách hàng 5', 1, 'Địa chỉ 5', 'khachhang5@gmail.com', '0123456785', 'Địa chỉ giao hàng 5', '2023-09-19');
go
	-- Thêm chi tiết hóa đơn
INSERT INTO dbo.ChiTietHoaDons (MaHoaDon, MaSanPham, SoLuong, DonGia)
VALUES
    (2, 2, 2, 150000),
    (2, 2, 1, 200000),
    (2, 3, 3, 180000),
    (3, 4, 2, 220000),
    (3, 5, 4, 250000);
go
	-- Thêm thông tin khách hàng
INSERT INTO dbo.KhachHangs (TenKH, GioiTinh, DiaChi, SDT, Email)
VALUES
    ('Khách hàng 1', 1, 'Địa chỉ 1', '0123456789', 'khachhang1@gmail.com'),
    ('Khách hàng 2', 0, 'Địa chỉ 2', '0123456788', 'khachhang2@gmail.com'),
    ('Khách hàng 3', 1, 'Địa chỉ 3', '0123456787', 'khachhang3@gmail.com'),
    ('Khách hàng 4', 0, 'Địa chỉ 4', '0123456786', 'khachhang4@gmail.com'),
    ('Khách hàng 5', 1, 'Địa chỉ 5', '0123456785', 'khachhang5@gmail.com');
go
	-- Thêm tài khoản cho các khách hàng
INSERT INTO dbo.TaiKhoans (LoaiTaiKhoan, TenTaiKhoan, MatKhau, Email)
VALUES
    (1, 'khachhang1', 'hashed_password1', 'khachhang1@gmail.com'),
    (1, 'khachhang2', 'hashed_password2', 'khachhang2@gmail.com'),
    (1, 'khachhang3', 'hashed_password3', 'khachhang3@gmail.com'),
    (1, 'khachhang4', 'hashed_password4', 'khachhang4@gmail.com'),
    (1, 'khachhang5', 'hashed_password5', 'khachhang5@gmail.com');
go
	-- Thêm thông tin chi tiết tài khoản của khách hàng
INSERT INTO dbo.ChiTietTaiKhoans (MaTaiKhoan, HoTen, DiaChi, SoDienThoai, AnhDaiDien)
VALUES
    (2, 'Khách hàng 1', 'Địa chỉ 1', '0123456789', 'link_anh_khachhang1.jpg'),
    (2, 'Khách hàng 2', 'Địa chỉ 2', '0123456788', 'link_anh_khachhang2.jpg'),
    (3, 'Khách hàng 3', 'Địa chỉ 3', '0123456787', 'link_anh_khachhang3.jpg'),
    (4, 'Khách hàng 4', 'Địa chỉ 4', '0123456786', 'link_anh_khachhang4.jpg'),
    (5, 'Khách hàng 5', 'Địa chỉ 5', '0123456785', 'link_anh_khachhang5.jpg');
go
	-- Thêm thông tin các nhà phân phối
INSERT INTO dbo.NhaPhanPhois (TenNhaPhanPhoi, DiaChi, SoDienThoai, Fax, MoTa)
VALUES
    ('Nhà phân phối 1', 'Địa chỉ NP1', '0123456780', '0123456780', 'Mô tả NP1'),
    ('Nhà phân phối 2', 'Địa chỉ NP2', '0123456781', '0123456781', 'Mô tả NP2'),
    ('Nhà phân phối 3', 'Địa chỉ NP3', '0123456782', '0123456782', 'Mô tả NP3'),
    ('Nhà phân phối 4', 'Địa chỉ NP4', '0123456783', '0123456783', 'Mô tả NP4'),
    ('Nhà phân phối 5', 'Địa chỉ NP5', '0123456784', '0123456784', 'Mô tả NP5');
go
	-- Thêm thông tin chuyên mục sản phẩm
INSERT INTO dbo.ChuyenMucs (MaChuyenMucCha, TenChuyenMuc, DacBiet, NoiDung)
VALUES
    (NULL, 'Chuyên mục 1', 0, 'Mô tả CM1'),
    (NULL, 'Chuyên mục 2', 0, 'Mô tả CM2'),
    (NULL, 'Chuyên mục 3', 0, 'Mô tả CM3'),
    (1, 'Chuyên mục 1.1', 0, 'Mô tả CM1.1'),
    (1, 'Chuyên mục 1.2', 0, 'Mô tả CM1.2');
go
	-- Thêm chi tiết sản phẩm
INSERT INTO dbo.ChiTietSanPhams (MaSanPham, MaNhaSanXuat, MoTa, ChiTiet)
VALUES
    (2, 2, N'Mô tả sản phẩm 2', N'Chi tiết sản phẩm 2'),
    (3, 11, N'Mô tả sản phẩm 1', N'Chi tiết sản phẩm 1'),
    (2, , N'Mô tả sản phẩm 3', N'Chi tiết sản phẩm 3'),
    (4, 3, N'Mô tả sản phẩm 4', N'Chi tiết sản phẩm 4'),
    (5, 2, N'Mô tả sản phẩm 5', N'Chi tiết sản phẩm 5');
go
	-- Thêm loại tài khoản với mã
INSERT INTO dbo.LoaiTaiKhoans ( TenLoai, MoTa)
VALUES
    ( N'Quản trị viên', N'Loại tài khoản quản trị viên'),
    ( N'Người dùng', N'Loại tài khoản người dùng'),
    ( N'Khách hàng', N'Loại tài khoản khách hàng'),
    ( N'Nhà cung cấp', N'Loại tài khoản nhà cung cấp');
go