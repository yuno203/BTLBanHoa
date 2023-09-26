create database BTLThayDong12521111
USE [BTLThayDong12521111]
CREATE TABLE [dbo].[ChiTietHoaDonNhaps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[GiaNhap] [decimal](18, 0) NULL,
	[TongTien] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDons](
	[MaChiTietHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DetailBill] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSanPhams]    Script Date: 8/28/2023 4:03:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPhams](
	[MaChiTietSanPham] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [int] NULL,
	[MaNhaSanXuat] [int] NULL,
	[MoTa] [nvarchar](350) NOT NULL,
	[ChiTiet] [nvarchar](max) NULL,
 CONSTRAINT [PK_DetailProducts] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[ChuyenMucs](
	[MaChuyenMuc] [int] IDENTITY(1,1) NOT NULL,
	[MaChuyenMucCha] [int] NULL,
	[TenChuyenMuc] [nvarchar](50) NULL,
	[DacBiet] [bit] NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[MaChuyenMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[HoaDonNhaps](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNhaPhanPhoi] [int] NULL,
	[NgayTao] [datetime] NULL,
	[KieuThanhToan] [nvarchar](max) NULL,
	[MaTaiKhoan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[HoaDons](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
	[NgayDuyet] [datetime] NULL,
	[TongGia] [decimal](18, 0) NULL,
	[TenKH] [nvarchar](50) NULL,
	[GioiTinh] [bit] NOT NULL,
	[Diachi] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[DiaChiGiaoHang] [nvarchar](350) NULL,
	[ThoiGianGiaoHang] [datetime] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[KhachHangs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[GioiTinh] [bit] NOT NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[NhaPhanPhois](
	[MaNhaPhanPhoi] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaPhanPhoi] [nvarchar](250) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaPhanPhoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[SanPhams](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[MaChuyenMuc] [int] NULL,
	[TenSanPham] [nvarchar](150) NULL,
	[AnhDaiDien] [nvarchar](350) NULL,
	[Gia] [decimal](18, 0) NULL,
	[GiaGiam] [decimal](18, 0) NULL,
	[SoLuong] [int] NULL,
	[TrangThai] [bit] NULL,
	[LuotXem] [int] NULL,
	[DacBiet] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[SanPhams_NhaPhanPhois](
	[MaSanPham] [int] NOT NULL,
	[MaNhaPhanPhoi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaPhanPhoi] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[TaiKhoans](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[LoaiTaiKhoan] [int] NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

go
CREATE TABLE [dbo].[LoaiTaiKhoans](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[MoTa] [nvarchar](250) NULL,
 CONSTRAINT [PK_TypeAccounts] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ChiTietTaiKhoans](
	[MaChitietTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [int] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SoDienThoai] [nvarchar](11) NULL,
	[AnhDaiDien] [nvarchar](500) NULL,
 CONSTRAINT [PK_InformationAccounts] PRIMARY KEY CLUSTERED 
(
	[MaChitietTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GO
SET IDENTITY_INSERT [dbo].[TaiKhoans] ON 

INSERT [dbo].[TaiKhoans] ([MaTaiKhoan], [LoaiTaiKhoan], [TenTaiKhoan], [MatKhau], [Email]) VALUES (1, 1, N'admin', N'123456', N'shopthethaonova@gmail.com')
INSERT [dbo].[TaiKhoans] ([MaTaiKhoan], [LoaiTaiKhoan], [TenTaiKhoan], [MatKhau], [Email]) VALUES (2, 1, N'dongnh', N'123456', N'dongnh@gmail.com')
SET IDENTITY_INSERT [dbo].[TaiKhoans] OFF
GO



SET IDENTITY_INSERT [dbo].[ChiTietHoaDonNhaps] ON 

INSERT [dbo].[ChiTietHoaDonNhaps] ([Id], [MaHoaDon], [MaSanPham], [SoLuong], [DonViTinh], [GiaNhap], [TongTien]) VALUES (4, 3, 1167, 100, N'Bó', CAST(10 AS Decimal(18, 0)), CAST(49500000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDonNhaps] ([Id], [MaHoaDon], [MaSanPham], [SoLuong], [DonViTinh], [GiaNhap], [TongTien]) VALUES (5, 3, 1166, 100, N'Bó', CAST(5 AS Decimal(18, 0)), CAST(39900000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDonNhaps] ([Id], [MaHoaDon], [MaSanPham], [SoLuong], [DonViTinh], [GiaNhap], [TongTien]) VALUES (6, 3, 1166, 100, N'Cành', CAST(10 AS Decimal(18, 0)), CAST(41800000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDonNhaps] ([Id], [MaHoaDon], [MaSanPham], [SoLuong], [DonViTinh], [GiaNhap], [TongTien]) VALUES (9, 3, 1166, 1, N'Bình', CAST(10 AS Decimal(18, 0)), CAST(418000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDonNhaps] ([Id], [MaHoaDon], [MaSanPham], [SoLuong], [DonViTinh], [GiaNhap], [TongTien]) VALUES (11, 3, 1166, 3, N'Lọ', CAST(10 AS Decimal(18, 0)), CAST(1254000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDonNhaps] ([Id], [MaHoaDon], [MaSanPham], [SoLuong], [DonViTinh], [GiaNhap], [TongTien]) VALUES (13, 3, 1166, 1, N'Bó', CAST(1 AS Decimal(18, 0)), CAST(383800 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonNhaps] OFF
GO

SET IDENTITY_INSERT [dbo].[ChiTietHoaDons] ON 

INSERT [dbo].[ChiTietHoaDons] ([MaChiTietHoaDon], [MaHoaDon], [MaSanPham], [SoLuong], [DonGia]) VALUES (1, 1, 1113, 4, CAST(52000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ChiTietHoaDons] OFF
GO

SET IDENTITY_INSERT [dbo].[ChiTietSanPhams] ON 

INSERT [dbo].[ChiTietSanPhams] ([MaChiTietSanPham], [MaSanPham], [MaNhaSanXuat], [MoTa], [ChiTiet]) VALUES (2033, 1167, 1, N'Không có gì', NULL)
INSERT [dbo].[ChiTietSanPhams] ([MaChiTietSanPham], [MaSanPham], [MaNhaSanXuat], [MoTa], [ChiTiet]) VALUES (2034, 1166, 2, N'zxczxc', NULL)
INSERT [dbo].[ChiTietSanPhams] ([MaChiTietSanPham], [MaSanPham], [MaNhaSanXuat], [MoTa], [ChiTiet]) VALUES (2035, 1165, 1, N'ádasd', NULL)
INSERT [dbo].[ChiTietSanPhams] ([MaChiTietSanPham], [MaSanPham], [MaNhaSanXuat], [MoTa], [ChiTiet]) VALUES (2036, 1164, 4, N'ádas', NULL)
INSERT [dbo].[ChiTietSanPhams] ([MaChiTietSanPham], [MaSanPham], [MaNhaSanXuat], [MoTa], [ChiTiet]) VALUES (2037, 1163, 1, N'ádasd', NULL)
SET IDENTITY_INSERT [dbo].[ChiTietSanPhams] OFF
GO

SET IDENTITY_INSERT [dbo].[ChuyenMucs] ON 

INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (31, NULL, N'Hoa tươi', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (32, NULL, N'Hoa Bó', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (33, NULL, N'Bình Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (34, NULL, N'Cành Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (35, NULL, N'Giỏ Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (36, NULL, N'Hoa Bó', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (37, 35, N'Lọ Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (38, 35, N'Lọ Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (39, 31, N'Lọ Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (40, 31, N'Lọ Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (41, 31, N'Lọ Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (42, 31, N'Giỏ Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (43, 31, N'Giỏ Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (44, 33, N'Giỏ Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (45, 33, N'Giỏ Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (46, 33, N'Cành Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (47, 33, N'Cành Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (48, 33, N'Cành Hoa', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (49, 32, N'Hoa tươi', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (50, 32, N'Hoa tươi', 0, NULL)
INSERT [dbo].[ChuyenMucs] ([MaChuyenMuc], [MaChuyenMucCha], [TenChuyenMuc], [DacBiet], [NoiDung]) VALUES (51, 32, N'Hoa tươi', 0, NULL)
SET IDENTITY_INSERT [dbo].[ChuyenMucs] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonNhaps] ON 

INSERT [dbo].[HoaDonNhaps] ([MaHoaDon], [MaNhaPhanPhoi], [NgayTao], [KieuThanhToan], [MaTaiKhoan]) VALUES (3, 1, CAST(N'2016-12-04T00:00:00.000' AS DateTime), N'Trả tiền trước', NULL)
SET IDENTITY_INSERT [dbo].[HoaDonNhaps] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDons] ON 

INSERT [dbo].[HoaDons] ([MaHoaDon], [TrangThai], [NgayTao], [NgayDuyet], [TongGia], [TenKH], [GioiTinh], [Diachi], [Email], [SDT], [DiaChiGiaoHang], [ThoiGianGiaoHang]) VALUES (1, 0, CAST(N'2016-05-21T09:54:25.963' AS DateTime), NULL, CAST(52000000 AS Decimal(18, 0)), N'trịnh quang trung', 0, N'luong bag', N'trinhquangtrung375@gmail.com', N'09666226444', N'kimdong', CAST(N'2016-05-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[HoaDons] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHangs] ON 

INSERT [dbo].[KhachHangs] ([Id], [TenKH], [GioiTinh], [DiaChi], [SDT], [Email]) VALUES (0, N'Nguyễn Mai Gia Bảo', 0, N'HÀ NỘI', N'012345678', N'shopthethaonova@gmail.com')
INSERT [dbo].[KhachHangs] ([Id], [TenKH], [GioiTinh], [DiaChi], [SDT], [Email]) VALUES (1, N'Dương Văn Tiến', 0, N'Hưng yên', N'2434567', N'agfywgef@gmail.com')
INSERT [dbo].[KhachHangs] ([Id], [TenKH], [GioiTinh], [DiaChi], [SDT], [Email]) VALUES (2, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[KhachHangs] ([Id], [TenKH], [GioiTinh], [DiaChi], [SDT], [Email]) VALUES (3, N'Lưu Dức Quang', 0, N'Hà Nội', N'324234234', N'sdfsdfsdf@gmail.com')
INSERT [dbo].[KhachHangs] ([Id], [TenKH], [GioiTinh], [DiaChi], [SDT], [Email]) VALUES (4, N'trịnh quang trung', 0, N'luong bag', N'09666226444', N'trinhquangtrung375@gmail.com')
SET IDENTITY_INSERT [dbo].[KhachHangs] OFF
GO

SET IDENTITY_INSERT [dbo].[NhaPhanPhois] ON 

INSERT [dbo].[NhaPhanPhois] ([MaNhaPhanPhoi], [TenNhaPhanPhoi], [DiaChi], [SoDienThoai], [Fax], [MoTa]) VALUES (1, N'Tuấn Vũ Sport', N'Trịnh Hoài Đức, Hà Nội', N'0123456789', N'000912124', N'Phân phối đồ dùng võ thuật')
INSERT [dbo].[NhaPhanPhois] ([MaNhaPhanPhoi], [TenNhaPhanPhoi], [DiaChi], [SoDienThoai], [Fax], [MoTa]) VALUES (2, N'Tài Phát Sport', N'Ba Đình, Hà Nội', N'12341241241', N'086812468', N'Phân phối máy tập')
INSERT [dbo].[NhaPhanPhois] ([MaNhaPhanPhoi], [TenNhaPhanPhoi], [DiaChi], [SoDienThoai], [Fax], [MoTa]) VALUES (3, N'Sendo', N'TPHCM', N'01237812384', N'098912777', N'Phân phối quần áo thể thao')
SET IDENTITY_INSERT [dbo].[NhaPhanPhois] OFF
GO

SET IDENTITY_INSERT [dbo].[SanPhams] ON 

INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (31, 31, N'Hoa Hồng','khong co', CAST(1990000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 0)

INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (32, 32, N'
Hoa Cúc','khong co', CAST(5200000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 2, 1)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (33, 33, N'
Hoa cảm tú','khong co', CAST(3760000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (34, 34, N'
Hoa nhài','khong co', CAST(2380000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 198, 1, 0, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (35, 35, N'
Hoa ly','khong co', CAST(5480000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 1)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (36, 36, N'
Hoa tuy lip','khong co', CAST(3760000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 4, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (37, 37, N'Hoa đỏ','khong co', CAST(2990000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (38, 38, N'
Hoa thiên ân','khong co', CAST(1990000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 4, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (39, 39, N'Hoa vạn thọ ','khong co', CAST(8990000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 1)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (40, 40, N'Hoa Quỳnh','khong co', CAST(15990000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 1, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (41, 41, N'Hoa Mai','khong co', CAST(15800000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (42, 42, N'Hoa Đào','khong co', CAST(15900000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 1)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (43, 43, N'Hoa tulip xanh','khong co', CAST(2890000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (44, 44, N'Hoa hồng trắng','khong co', CAST(8990000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (45, 45, N'Hoa hồng vàng','khong co', CAST(8990000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (46, 46, N'Hoa loa kèn','khong co', CAST(5200000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 1)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (47, 47, N'sahushev','khong co', CAST(220000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (48, 48, N'ẻtyu','khong co', CAST(270000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (49, 49, N'hhthth','khong co', CAST(100000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (50, 50, N'grgrgr','khong co', CAST(100000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 0, 0)
INSERT [dbo].[SanPhams] ([MaSanPham], [MaChuyenMuc], [TenSanPham], [AnhDaiDien], [Gia], [GiaGiam], [SoLuong], [TrangThai], [LuotXem], [DacBiet]) VALUES (51, 51, N'Q','khong co', CAST(120000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 200, 1, 4, 0)
SET IDENTITY_INSERT [dbo].[SanPhams] OFF
GO

INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (47, 1)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (48, 1)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (49, 1)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (50, 1)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (51, 1)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (44, 1)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (40, 1)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (50, 1)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (39, 2)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (35, 2)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (47, 2)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (48, 2)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (49, 3)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (50, 3)
INSERT [dbo].[SanPhams_NhaPhanPhois] ([MaSanPham], [MaNhaPhanPhoi]) VALUES (51, 3)
GO


--ALTER TABLE [dbo].[ChiTietHoaDonNhaps]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhaps_HoaDonNhaps] FOREIGN KEY([MaHoaDon])
--REFERENCES [dbo].[HoaDonNhaps] ([MaHoaDon])
--GO
--ALTER TABLE [dbo].[ChiTietHoaDonNhaps] CHECK CONSTRAINT [FK_ChiTietHoaDonNhaps_HoaDonNhaps]
--GO
--ALTER TABLE [dbo].[ChiTietHoaDonNhaps]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhaps_SanPhams] FOREIGN KEY([MaSanPham])
--REFERENCES [dbo].[SanPhams] ([MaSanPham])
--GO
--ALTER TABLE [dbo].[ChiTietHoaDonNhaps] CHECK CONSTRAINT [FK_ChiTietHoaDonNhaps_SanPhams]
--GO
--ALTER TABLE [dbo].[ChiTietHoaDons]  WITH CHECK ADD  CONSTRAINT [FK_DetailBill_Bills] FOREIGN KEY([MaHoaDon])
--REFERENCES [dbo].[HoaDons] ([MaHoaDon])
--GO
--ALTER TABLE [dbo].[ChiTietHoaDons] CHECK CONSTRAINT [FK_DetailBill_Bills]
--GO
--ALTER TABLE [dbo].[ChiTietHoaDons]  WITH CHECK ADD  CONSTRAINT [FK_DetailBill_Products] FOREIGN KEY([MaSanPham])
--REFERENCES [dbo].[SanPhams] ([MaSanPham])
--GO
--ALTER TABLE [dbo].[ChiTietHoaDons] CHECK CONSTRAINT [FK_DetailBill_Products]
--GO
--ALTER TABLE [dbo].[ChiTietSanPhams]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPhams_NhaSanXuats] FOREIGN KEY([MaNhaSanXuat])
--REFERENCES [dbo].[HangSanXuats] ([MaHang])
--GO
--ALTER TABLE [dbo].[ChiTietSanPhams] CHECK CONSTRAINT [FK_ChiTietSanPhams_NhaSanXuats]
--GO
--ALTER TABLE [dbo].[ChiTietSanPhams]  WITH CHECK ADD  CONSTRAINT [FK_DetailProducts_Products] FOREIGN KEY([MaSanPham])
--REFERENCES [dbo].[SanPhams] ([MaSanPham])
--GO
--ALTER TABLE [dbo].[ChiTietSanPhams] CHECK CONSTRAINT [FK_DetailProducts_Products]
--GO
--ALTER TABLE [dbo].[HoaDonNhaps]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhaps_NhaPhanPhois] FOREIGN KEY([MaNhaPhanPhoi])
--REFERENCES [dbo].[NhaPhanPhois] ([MaNhaPhanPhoi])
--GO
--ALTER TABLE [dbo].[HoaDonNhaps] CHECK CONSTRAINT [FK_HoaDonNhaps_NhaPhanPhois]
--GO
--ALTER TABLE [dbo].[HoaDonNhaps]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhaps_TaiKhoans] FOREIGN KEY([MaTaiKhoan])
--REFERENCES [dbo].[TaiKhoans] ([MaTaiKhoan])
--GO
--ALTER TABLE [dbo].[HoaDonNhaps] CHECK CONSTRAINT [FK_HoaDonNhaps_TaiKhoans]
--GO
--ALTER TABLE [dbo].[SanPhams]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([MaChuyenMuc])
--REFERENCES [dbo].[ChuyenMucs] ([MaChuyenMuc])
--GO
--ALTER TABLE [dbo].[SanPhams] CHECK CONSTRAINT [FK_Products_Categories]
--GO
--ALTER TABLE [dbo].[SanPhams_NhaPhanPhois]  WITH CHECK ADD  CONSTRAINT [FK_SanPhams_NhaPhanPhois_NhaPhanPhois] FOREIGN KEY([MaNhaPhanPhoi])
--REFERENCES [dbo].[NhaPhanPhois] ([MaNhaPhanPhoi])
--GO
--ALTER TABLE [dbo].[SanPhams_NhaPhanPhois] CHECK CONSTRAINT [FK_SanPhams_NhaPhanPhois_NhaPhanPhois]
--GO
--ALTER TABLE [dbo].[SanPhams_NhaPhanPhois]  WITH CHECK ADD  CONSTRAINT [FK_SanPhams_NhaPhanPhois_SanPhams] FOREIGN KEY([MaSanPham])
--REFERENCES [dbo].[SanPhams] ([MaSanPham])
--GO
--ALTER TABLE [dbo].[SanPhams_NhaPhanPhois] CHECK CONSTRAINT [FK_SanPhams_NhaPhanPhois_SanPhams]
--GO




--Các storted Proc


--- ********************KHÁCH HÀNG************************
go
-- Hiển thị khách hàng theo id
alter PROCEDURE sp_khach_get_by_id(
	@ID int 
)
as
Begin
	SELECT * FROM KhachHangs WHERE Id = @ID;
end

go
--cập nhật thông tin khách hàng
create PROCEDURE update_khachhang(
	@KhachHangID int ,
	@TenKhachHang Varchar(255),
	@Email nvarchar(255),
	@DiaChi nvarchar(255)
)
as
Begin
	update KhachHangs 
	set  TenKH = @TenKhachHang , Email = @Email, DiaChi = @DiaChi
	where ID =@KhachHangID 
end

--Xoa thong tin khach hang theo id
go
alter PROCEDURE delete_khachhang(
	@ID int
)
as
Begin
	delete from KhachHangs where Id = @ID
end
select*from KhachHangs

--Tim kiem thong tin khach hang
go
create PROCEDURE [dbo].[sp_khach_search1] (@page_index  INT, 
                                       @page_size   INT,
									   @ten_khach Nvarchar(50),
									   @dia_chi Nvarchar(250)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKH ASC)) AS RowNumber, 
                              k.Id,
							  k.TenKH,
							  k.DiaChi
                        INTO #Results1
                        FROM KhachHangs AS k
					    WHERE  (@ten_khach = '' Or k.TenKH like N'%'+@ten_khach+'%') and						
						(@dia_chi = '' Or k.DiaChi like N'%'+@dia_chi+'%');                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKH ASC)) AS RowNumber, 
                              k.Id,
							  k.TenKH,
							  k.DiaChi
                        INTO #Results2
                        FROM KhachHangs AS k
					    WHERE  (@ten_khach = '' Or k.TenKH like N'%'+@ten_khach+'%') and						
						(@dia_chi = '' Or k.DiaChi like N'%'+@dia_chi+'%');                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;                        
                        DROP TABLE #Results1; 
    END;
End;


-- Thong Ke khachHang
go
create PROCEDURE [dbo].[sp_thong_ke_khach] (@page_index  INT, 
                                       @page_size   INT,
									   @ten_khach Nvarchar(50),
									   @fr_NgayTao datetime, 
									   @to_NgayTao datetime
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.NgayTao ASC)) AS RowNumber, 
                              s.MaSanPham,
							  s.TenSanPham,
							  c.SoLuong,
							  c.DonGia,
							  h.NgayTao,
							  h.TenKH,
							  h.Diachi
                        INTO #Results1
                        FROM HoaDons  h
						inner join ChiTietHoaDons c on c.MaHoaDon = h.MaHoaDon
						inner join SanPhams s on s.MaSanPham = c.MaSanPham
					    WHERE  (@ten_khach = '' Or h.TenKH like N'%'+@ten_khach+'%') and						
						((@fr_NgayTao IS NULL
                        AND @to_NgayTao IS NULL)
                        OR (@fr_NgayTao IS NOT NULL
                            AND @to_NgayTao IS NULL
                            AND h.NgayTao >= @fr_NgayTao)
                        OR (@fr_NgayTao IS NULL
                            AND @to_NgayTao IS NOT NULL
                            AND h.NgayTao <= @to_NgayTao)
                        OR (h.NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao))              
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.NgayTao ASC)) AS RowNumber, 
                              s.MaSanPham,
							  s.TenSanPham,
							  c.SoLuong,
							  c.DonGia,
							  h.NgayTao,
							  h.TenKH,
							  h.Diachi
                        INTO #Results2
                        FROM HoaDons  h
						inner join ChiTietHoaDons c on c.MaHoaDon = h.MaHoaDon
						inner join SanPhams s on s.MaSanPham = c.MaSanPham
					    WHERE  (@ten_khach = '' Or h.TenKH like N'%'+@ten_khach+'%') and						
						((@fr_NgayTao IS NULL
                        AND @to_NgayTao IS NULL)
                        OR (@fr_NgayTao IS NOT NULL
                            AND @to_NgayTao IS NULL
                            AND h.NgayTao >= @fr_NgayTao)
                        OR (@fr_NgayTao IS NULL
                            AND @to_NgayTao IS NOT NULL
                            AND h.NgayTao <= @to_NgayTao)
                        OR (h.NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao))
						SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2                        
                        DROP TABLE #Results2; 
        END;
    END;


--- ********************HÓA ĐƠN************************

--taoj hoa don
go
alter PROCEDURE [dbo].[sp_hoadon_create]
(@TenKH              NVARCHAR(50), 
 @Diachi          NVARCHAR(250), 
 @TrangThai         bit,  
 @NgayTao datetime,
 @NgayDuyet datetime,
 @TongGia decimal(18, 0),
 @Email nvarchar(50),
 @SDT nvarchar(50),
 @DiaChiGiaoHang nvarchar(350),
 @list_json_chitiethoadon NVARCHAR(MAX)
)
AS
    BEGIN
		DECLARE @MaHoaDon INT;
        INSERT INTO HoaDons
                (TenKH, 
                 Diachi, 
                 TrangThai,
				 NgayTao, 
				 NgayDuyet,
				 TongGia ,
				 Email, 
				 SDT ,
				 DiaChiGiaoHang 
                )
                VALUES
                (@TenKH, 
                 @Diachi, 
                 @TrangThai,
				 @NgayTao ,
				 @NgayDuyet ,
				 @TongGia ,
				 @Email ,
				 @SDT,
				 @DiaChiGiaoHang 
                );

				SET @MaHoaDon = (SELECT SCOPE_IDENTITY());
                IF(@list_json_chitiethoadon IS NOT NULL)
                    BEGIN
                        INSERT INTO ChiTietHoaDons
						 (MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                          DonGia               
                        )
                    SELECT JSON_VALUE(p.value, '$.maSanPham'), 
                            @MaHoaDon, 
                            JSON_VALUE(p.value, '$.soLuong'), 
                            JSON_VALUE(p.value, '$.donGia')    
                    FROM OPENJSON(@list_json_chitiethoadon) AS p;
                END;
        SELECT '';
    END;

	--exec sp_hoadon_create @TenKH ='qqqqqq', 
	--						@Diachi='hy',
	--						@TrangThai=1,
	--						@list_json_chitiethoadon=N'[{"maSanPham": 31,"soLuong":12,"donGia":112222}]'


-- get by id hoa don
go
CREATE PROCEDURE [dbo].[sp_hoadon_get_by_id]
(@MaHoaDon        int)
AS
    BEGIN
        SELECT h.*, 
        (
            SELECT c.*
            FROM ChiTietHoaDons AS c
            WHERE h.MaHoaDon = c.MaHoaDon FOR JSON PATH
        ) AS list_json_chitiethoadon
        FROM HoaDons AS h
        WHERE  h.MaHoaDon = @MaHoaDon;
    END;





-- them xoa sua hoa don
go
create PROCEDURE [dbo].[update1_hoadon]
(@MaHoaDon        int, 
 @TenKH              NVARCHAR(50), 
 @Diachi          NVARCHAR(250), 
 @TrangThai         bit,  
  @NgayTao datetime,
 @NgayDuyet datetime,
 @TongGia decimal(18, 0),
 @Email nvarchar(50),
 @SDT nvarchar(50),
 @DiaChiGiaoHang nvarchar(350),
 @list_json_chitiethoadon NVARCHAR(MAX)
)
AS
    BEGIN
		UPDATE HoaDons
		SET
			TenKH  = @TenKH ,
			Diachi = @Diachi,
			TrangThai = @TrangThai,
			NgayTao	= @NgayTao,
			NgayDuyet	= @NgayDuyet ,
			TongGia 	= @TongGia ,
			Email	= @Email ,
			SDT	= @SDT ,
			DiaChiGiaoHang = @DiaChiGiaoHang 
		WHERE MaHoaDon = @MaHoaDon;
		
		IF(@list_json_chitiethoadon IS NOT NULL) 
		BEGIN
			 -- Insert data to temp table 
		   SELECT
			  JSON_VALUE(p.value, '$.maChiTietHoaDon') as maChiTietHoaDon,
			  JSON_VALUE(p.value, '$.maHoaDon') as maHoaDon,
			  JSON_VALUE(p.value, '$.maSanPham') as maSanPham,
			  JSON_VALUE(p.value, '$.soLuong') as soLuong,
			  JSON_VALUE(p.value, '$.donGia') as DonGia,
			  JSON_VALUE(p.value, '$.status') AS status 
			  INTO #Results 
		   FROM OPENJSON(@list_json_chitiethoadon) AS p;
		 
		 -- Insert data to table with STATUS = 1;
			INSERT INTO ChiTietHoaDons (MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                          DonGia ) 
			   SELECT
				  #Results.maSanPham,
				  @MaHoaDon,
				  #Results.soLuong,
				  #Results.DonGia			 
			   FROM  #Results 
			   WHERE #Results.status = '1' 
			
			-- Update data to table with STATUS = 2
			  UPDATE ChiTietHoaDons 
			  SET
				 SoLuong = #Results.soLuong,
				 DonGia = #Results.DonGia
			  FROM #Results 
			  WHERE  ChiTietHoaDons.maChiTietHoaDon = #Results.maChiTietHoaDon AND #Results.status = '2';
			
			-- Delete data to table with STATUS = 3
			DELETE C
			FROM ChiTietHoaDons C
			INNER JOIN #Results R
				ON C.maChiTietHoaDon=R.maChiTietHoaDon
			WHERE R.status = '3';
			DROP TABLE #Results;
		END;
        SELECT '';
    END;

go
--tim kiem hoa don
go
alter PROCEDURE [dbo].[sp_hoadon_search] (@page_index  INT, 
                                       @page_size   INT,
									   @ten_khach Nvarchar(50),
									   @dia_chi Nvarchar(250),
									   @trang_thai bit,
									   @ngayTao datetime
									  
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKH ASC)) AS RowNumber, 
                              h.MaHoaDon,
							  h.TenKH,
							  h.DiaChi,
							  h.TrangThai, 
							  h.NgayTao
                        INTO #Results1
                        FROM HoaDons AS h
					    WHERE  (@ten_khach = '' Or h.TenKH like N'%'+@ten_khach+'%') or						
						(@dia_chi = '' Or h.DiaChi like N'%'+@dia_chi+'%')
						or (@ngayTao = '' OR h.NgayTao = @ngayTao);               
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKH ASC)) AS RowNumber, 
                              h.MaHoaDon,
							  h.TenKH,
							  h.DiaChi,
							  h.TrangThai,
							  h.NgayTao
                        INTO #Results2
                        FROM HoaDons AS h
					    WHERE  (@ten_khach = '' Or h.TenKH like N'%'+@ten_khach+'%') or						
						(@dia_chi = '' Or h.DiaChi like N'%'+@dia_chi+'%')
						or (@ngayTao = '' OR h.NgayTao = @ngayTao);                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2              
                        DROP TABLE #Results1; 
    END;
End;



--- ********************HÓA ĐƠN NHẬP************************
GO
-- tao hoa don nhap

create PROCEDURE [dbo].[sp_hoadonnhap_create]
(@MaHoaDon              int, 
 @MaNhaPhanPhoi          int, 
 @NgayTao datetime,
 @KieuThanhToan nvarchar(MAX),
 @list_json_chitiethoadonnhap NVARCHAR(MAX)
)
AS
    BEGIN
		DECLARE @MaHoaDonNhap INT;
        INSERT INTO HoaDonNhaps
                (MaHoaDon, 
                 MaNhaPhanPhoi, 
				 NgayTao, 
				 KieuThanhToan
				
                )
                VALUES
                (@MaHoaDon, 
                 @MaNhaPhanPhoi, 
				 @NgayTao ,
				 @KieuThanhToan 
				
                );

				SET @MaHoaDon = (SELECT SCOPE_IDENTITY());
                IF(@list_json_chitiethoadonnhap IS NOT NULL)
                    BEGIN
                        INSERT INTO ChiTietHoaDonNhaps
						 (MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                          GiaNhap,
						  DonViTinh,
						  TongTien
                        )
                    SELECT JSON_VALUE(p.value, '$.maSanPham'), 
                            @MaHoaDon, 
                            JSON_VALUE(p.value, '$.soLuong'), 
                            JSON_VALUE(p.value, '$.giaNhap'),
							 JSON_VALUE(p.value, '$.donViTinh'),    
							  JSON_VALUE(p.value, '$.tongTien')    
                    FROM OPENJSON(@list_json_chitiethoadonnhap) AS p;
                END;
        SELECT '';
    END;



-- them xoa sua hoa don nhap
go
create PROCEDURE [dbo].[update1_hoadonnhap]
(@MaHoaDon              int, 
 @MaNhaPhanPhoi          int, 
 @NgayTao datetime,
 @KieuThanhToan nvarchar(MAX),
 @list_json_chitiethoadonnhap NVARCHAR(MAX)
)
AS
    BEGIN
		UPDATE HoaDonNhaps
		SET
				 MaHoaDon =  @MaHoaDon,
                 MaNhaPhanPhoi = @MaNhaPhanPhoi, 
				 NgayTao = @NgayTao, 
				 KieuThanhToan = @KieuThanhToan
		WHERE MaHoaDon = @MaHoaDon;
		
		IF(@list_json_chitiethoadonnhap IS NOT NULL) 
		BEGIN
			 -- Insert data to temp table 
		   SELECT
			  JSON_VALUE(p.value, '$.Id') as Id,
			  JSON_VALUE(p.value, '$.maHoaDon') as maHoaDon,
			  JSON_VALUE(p.value, '$.maSanPham') as maSanPham,
			  JSON_VALUE(p.value, '$.soLuong') as soLuong,
			  JSON_VALUE(p.value, '$.giaNhap') as GiaNhap,
			  JSON_VALUE(p.value, '$.donViTinh') as DonViTinh,    
			  JSON_VALUE(p.value, '$.tongTien') TongTien,
			  JSON_VALUE(p.value, '$.status') AS status 
			  INTO #Results 
		   FROM OPENJSON(@list_json_chitiethoadonnhap) AS p;
		 
		 -- Insert data to table with STATUS = 1;
			INSERT INTO ChiTietHoaDonNhaps (MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                           GiaNhap,
						  DonViTinh,
						  TongTien) 
			   SELECT
				  #Results.maSanPham,
				  @MaHoaDon,
				  #Results.soLuong,
				  #Results.GiaNhap,
				  #Results.DonViTinh,
				  #Results.TongTien
			   FROM  #Results 
			   WHERE #Results.status = '1' 
			
			-- Update data to table with STATUS = 2
			  UPDATE ChiTietHoaDonNhaps 
			  SET
				 SoLuong = #Results.soLuong,
				 GiaNhap = #Results.GiaNhap,
				 DonViTinh = #Results.DonViTinh
			  FROM #Results 
			  WHERE  ChiTietHoaDonNhaps.Id= #Results.Id AND #Results.status = '2';
			
			-- Delete data to table with STATUS = 3
			DELETE C
			FROM ChiTietHoaDonNhaps C
			INNER JOIN #Results R
				ON C.Id=R.Id
			WHERE R.status = '3';
			DROP TABLE #Results;
		END;
        SELECT '';
    END;



--Tai Khoan Mat Khau
go
create PROCEDURE [dbo].[sp_login](@taikhoan nvarchar(50), @matkhau nvarchar(50))
AS
    BEGIN
      SELECT  *
      FROM TaiKhoans
      where TenTaiKhoan= @taikhoan and MatKhau = @matkhau;
    END;