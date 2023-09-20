create database BTLThayDong
use BTLThayDong
-- Bảng cho các loại hoa
CREATE TABLE LoaiHoa (
    LoaiHoaID INT PRIMARY KEY,
    TenLoai NVARCHAR(250) NOT NULL,
    MoTa NVarchar(255)
);

-- Bảng cho các sản phẩm hoa
CREATE TABLE SanPhamHoa (
    SanPhamHoaID INT PRIMARY KEY,
    TenSanPham NVARCHAR(255) NOT NULL,
    Gia DECIMAL(10, 2) NOT NULL,
    MoTa Nvarchar(255),
    LoaiHoaID INT,
    FOREIGN KEY (LoaiHoaID) REFERENCES LoaiHoa(LoaiHoaID)
);

-- Bảng cho khách hàng
CREATE TABLE KhachHang (
    KhachHangID INT PRIMARY KEY,
    TenKhachHang VARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    DiaChi Nvarchar(255)
);

-- Bảng cho các đơn đặt hàng
CREATE TABLE DonDatHang (
    DonDatHangID INT PRIMARY KEY,
    KhachHangID INT,
    NgayDat DATE NOT NULL,
    CONSTRAINT FK_KhachHang_DonDatHang FOREIGN KEY (KhachHangID) REFERENCES KhachHang(KhachHangID)
);

-- Bảng chi tiết đơn đặt hàng
CREATE TABLE ChiTietDonDatHang (
    ChiTietDonDatHangID INT PRIMARY KEY,
    DonDatHangID INT,
    SanPhamHoaID INT,
    SoLuong INT NOT NULL,
    FOREIGN KEY (DonDatHangID) REFERENCES DonDatHang(DonDatHangID),
    FOREIGN KEY (SanPhamHoaID) REFERENCES SanPhamHoa(SanPhamHoaID)
);
INSERT INTO LoaiHoa (LoaiHoaID,TenLoai, MoTa)
VALUES
    ('01','Hoa Hồng', 'Hoa hồng đỏ đẹp và quyến rũ.'),
    ('02','Hoa Lan', 'Hoa lan tượng trưng cho sự rạng ngời và quý phái.'),
    ('03','Hoa Cúc', 'Hoa cúc tượng trưng cho sự trong trắng và tinh khiết.');


INSERT INTO SanPhamHoa (TenSanPham, Gia, MoTa, LoaiHoaID)
VALUES
    ('Hoa Hồng Đỏ', 15.99, 'Hoa hồng đỏ tươi sáng.', 1),
    ('Hoa Lan Trắng', 19.99, 'Hoa lan trắng thanh khiết.', 2),
    ('Hoa Cúc Vàng', 12.99, 'Hoa cúc vàng tinh khôi.', 3);

INSERT INTO KhachHang (KhachHangID,TenKhachHang, Email, DiaChi)
VALUES
    ('01','Nguyễn Văn A', 'nguyenvana@example.com', '123 Đường ABC, Quận XYZ'),
    ('02','Trần Thị B', 'tranthib@example.com', '456 Đường DEF, Quận LMN'),
    ('03','Lê Văn C', 'levanc@example.com', '789 Đường GHI, Quận OPQ');

select*from KhachHang
INSERT INTO DonDatHang (KhachHangID, NgayDat)
VALUES
    (1, '2023-09-13'),
    (2, '2023-09-14'),
    (3, '2023-09-15');

INSERT INTO ChiTietDonDatHang (DonDatHangID, SanPhamHoaID, SoLuong)
VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3);

go
--Thêm thông tin khách hàng
create PROCEDURE create_khachhang(
	@KhachHangID int ,
	@TenKhachHang Varchar(255),
	@Email nvarchar(255),
	@DiaChi nvarchar(255)
	)
As
BEGIN
	insert into KhachHang(KhachHangID,TenKhachHang,Email,DiaChi)
	values(@KhachHangID,@TenKhachHang,@Email,@DiaChi)
END
 
go
-- Hiển thị khách hàng theo id
create PROCEDURE sp_khach_get_by_id(
	@KhachHangID int 
)
as
Begin
	SELECT * FROM KhachHang WHERE KhachHangID = @KhachHangID;
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
	update KhachHang 
	set  TenKhachHang = @TenKhachHang , Email = @Email, DiaChi = @DiaChi
	where KhachHangID =@KhachHangID 
end

--Xoa thong tin khach hang theo id
go
alter PROCEDURE delete_khachhang(
	@KhachHangID int
)
as
Begin
	delete from KhachHang where KhachHangID = @KhachHangID
end
select*from KhachHang


 