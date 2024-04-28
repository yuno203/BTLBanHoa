use BTLThayDong125211


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

CREATE PROCEDURE dbo.InsertKhachHang
    @TenKH nvarchar(50),
    @GioiTinh bit,
    @DiaChi nvarchar(250),
    @SDT nvarchar(50),
    @Email nvarchar(250)
AS
BEGIN
    INSERT INTO dbo.KhachHangs (TenKH, GioiTinh, DiaChi, SDT, Email)
    VALUES (@TenKH, @GioiTinh, @DiaChi, @SDT, @Email);
END;


--cập nhật thông tin khách hàng
alter PROCEDURE update_khachhang(
	@Id int ,
	@TenKH Varchar(255),
	@Email nvarchar(255),
	@DiaChi nvarchar(255),
	@GioiTinh bit,
    @SDT nvarchar(50)
)
as
Begin
	update KhachHangs 
	set  TenKH = @TenKH , Email = @Email, DiaChi = @DiaChi, GioiTinh = @GioiTinh, SDT = @SDT
	where Id =@Id
end

--Xoa thong tin khach hang theo id
go
create PROCEDURE delete_khachhang(
	@Id int
)
as
Begin
	delete from KhachHangs where Id = @Id
end
select*from KhachHangs

--Tim kiem thong tin khach hang
go
alter PROCEDURE [dbo].[sp_khach_search1] (@page_index  INT, 
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
							  k.DiaChi,
							  k.SDT,
							  k.Email
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
							  k.DiaChi,
							   k.SDT,
							  k.Email
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
alter PROCEDURE [dbo].[sp_thong_ke_khach] (@page_index  INT, 
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
							  s.AnhDaiDien,
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
							   s.AnhDaiDien,
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

	go

ALTER PROCEDURE [dbo].[sp_thong_ke_khach1] (
    @page_index INT,
    @page_size INT,
    @ten_khach NVARCHAR(50),
    @fr_NgayTao DATETIME,
    @to_NgayTao DATETIME
)
AS
BEGIN
    DECLARE @RecordCount BIGINT;

    IF (@page_size <> 0)
    BEGIN
        SET NOCOUNT ON;

        SELECT
            (ROW_NUMBER() OVER (ORDER BY s.MaSanPham ASC, h.NgayTao ASC)) AS RowNumber,
            s.MaSanPham,
            s.TenSanPham,
            s.AnhDaiDien,
            FORMAT(SUM(c.SoLuong), '#,###') AS TotalQuantity,
            FORMAT(AVG(c.DonGia), '#,###.##') AS AveragePrice,
            FORMAT(MAX(c.DonGia), '#,###.##') AS MaxPrice,
            FORMAT(MIN(c.DonGia), '#,###.##') AS MinPrice,
            FORMAT(MAX(h.NgayTao), 'yyyy-MM-dd') AS NgayTao,
            h.TenKH,
            h.Diachi
        INTO #Results1
        FROM HoaDons h
            INNER JOIN ChiTietHoaDons c ON c.MaHoaDon = h.MaHoaDon
            INNER JOIN SanPhams s ON s.MaSanPham = c.MaSanPham
        WHERE (@ten_khach = '' OR h.TenKH LIKE N'%' + @ten_khach + '%')
            AND (
                (@fr_NgayTao IS NULL AND @to_NgayTao IS NULL)
                OR (@fr_NgayTao IS NOT NULL AND @to_NgayTao IS NULL AND h.NgayTao >= @fr_NgayTao)
                OR (@fr_NgayTao IS NULL AND @to_NgayTao IS NOT NULL AND h.NgayTao <= @to_NgayTao)
                OR (h.NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao)
            )
        GROUP BY s.MaSanPham, s.TenSanPham, s.AnhDaiDien, h.TenKH, h.Diachi, h.NgayTao
        ORDER BY s.MaSanPham, h.NgayTao;

        SELECT
            *
        FROM #Results1
        ORDER BY RowNumber
        OFFSET (@page_index - 1) * @page_size ROWS
        FETCH NEXT @page_size ROWS ONLY;

        DROP TABLE #Results1;
    END;
    ELSE
    BEGIN
        SET NOCOUNT ON;

        SELECT
            (ROW_NUMBER() OVER (ORDER BY s.MaSanPham ASC, h.NgayTao ASC)) AS RowNumber,
            s.MaSanPham,
            s.TenSanPham,
            s.AnhDaiDien,
            FORMAT(SUM(c.SoLuong), '#,###') AS TotalQuantity,
            FORMAT(AVG(c.DonGia), '#,###.##') AS AveragePrice,
            FORMAT(MAX(c.DonGia), '#,###.##') AS MaxPrice,
            FORMAT(MIN(c.DonGia), '#,###.##') AS MinPrice,
            FORMAT(MAX(h.NgayTao), 'yyyy-MM-dd') AS NgayTao,
            h.TenKH,
            h.Diachi
        INTO #Results2
        FROM HoaDons h
            INNER JOIN ChiTietHoaDons c ON c.MaHoaDon = h.MaHoaDon
            INNER JOIN SanPhams s ON s.MaSanPham = c.MaSanPham
        WHERE (@ten_khach = '' OR h.TenKH LIKE N'%' + @ten_khach + '%')
            AND (
                (@fr_NgayTao IS NULL AND @to_NgayTao IS NULL)
                OR (@fr_NgayTao IS NOT NULL AND @to_NgayTao IS NULL AND h.NgayTao >= @fr_NgayTao)
                OR (@fr_NgayTao IS NULL AND @to_NgayTao IS NOT NULL AND h.NgayTao <= @to_NgayTao)
                OR (h.NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao)
            )
        GROUP BY s.MaSanPham, s.TenSanPham, s.AnhDaiDien, h.TenKH, h.Diachi, h.NgayTao
        ORDER BY s.MaSanPham, h.NgayTao;

        SELECT
            *
        FROM #Results2
        ORDER BY RowNumber
        OFFSET (@page_index - 1) * @page_size ROWS
        FETCH NEXT @page_size ROWS ONLY;

        DROP TABLE #Results2;
    END;
END;




DECLARE @PageIndex INT = 1;
DECLARE @PageSize INT = 10;
DECLARE @TenKhach NVARCHAR(50) = ''; -- Provide the customer name or leave it empty for all customers
DECLARE @FrNgayTao DATETIME = '2023-01-01'; -- Provide the start date
DECLARE @ToNgayTao DATETIME = '2023-12-31'; -- Provide the end date
go
-- Execute the stored procedure
EXEC [dbo].[sp_thong_ke_khach1]
    @page_index = 1,
    @page_size = 10,
    @ten_khach = '',
    @fr_NgayTao = '2023-01-01',
    @to_NgayTao = '2023-12-31';

	go
alter PROCEDURE [dbo].[sp_thong_ke_san_pham_ban_chay] (
    @top_n INT,
    @page_index INT,
    @page_size INT
)
AS
BEGIN
    DECLARE @RecordCount BIGINT;

    IF (@page_size <> 0)
    BEGIN
        SET NOCOUNT ON;

        SELECT
            MaSanPham,
            TenSanPham,
            AnhDaiDien,
            TotalQuantitySold
        INTO #Results1
        FROM (
            SELECT
                s.MaSanPham,
                s.TenSanPham,
                s.AnhDaiDien,
                SUM(c.SoLuong) AS TotalQuantitySold,
                ROW_NUMBER() OVER (ORDER BY SUM(c.SoLuong) DESC) AS RowNum
            FROM
                HoaDons h
                INNER JOIN ChiTietHoaDons c ON c.MaHoaDon = h.MaHoaDon
                INNER JOIN SanPhams s ON s.MaSanPham = c.MaSanPham
            GROUP BY
                s.MaSanPham, s.TenSanPham, s.AnhDaiDien
        ) AS RankedProducts
        WHERE RowNum BETWEEN (@page_index - 1) * @page_size + 1 AND ((@page_index - 1) * @page_size + 1) + @page_size - 1;

        SELECT @RecordCount = COUNT(*)
        FROM (
            SELECT
                s.MaSanPham
            FROM
                HoaDons h
                INNER JOIN ChiTietHoaDons c ON c.MaHoaDon = h.MaHoaDon
                INNER JOIN SanPhams s ON s.MaSanPham = c.MaSanPham
            GROUP BY
                s.MaSanPham
        ) AS CountQuery;

        SELECT
            *,
            @RecordCount AS RecordCount
        FROM #Results1;

        DROP TABLE #Results1;
    END;
    ELSE
    BEGIN
        -- Handle the case when page_size is 0 (no pagination)
        SET NOCOUNT ON;

        SELECT TOP (@top_n)
            s.MaSanPham,
            s.TenSanPham,
            s.AnhDaiDien,
            SUM(c.SoLuong) AS TotalQuantitySold
        INTO #Results2
        FROM
            HoaDons h
            INNER JOIN ChiTietHoaDons c ON c.MaHoaDon = h.MaHoaDon
            INNER JOIN SanPhams s ON s.MaSanPham = c.MaSanPham
        GROUP BY
            s.MaSanPham, s.TenSanPham, s.AnhDaiDien
        ORDER BY
            TotalQuantitySold DESC;

        SELECT @RecordCount = COUNT(*)
        FROM (
            SELECT
                s.MaSanPham
            FROM
                HoaDons h
                INNER JOIN ChiTietHoaDons c ON c.MaHoaDon = h.MaHoaDon
                INNER JOIN SanPhams s ON s.MaSanPham = c.MaSanPham
            GROUP BY
                s.MaSanPham
        ) AS CountQuery;

        SELECT
            *,
            @RecordCount AS RecordCount
        FROM #Results2;

        DROP TABLE #Results2;
    END;
END;


exec sp_thong_ke_san_pham_ban_chay 2, 1, 5



create PROCEDURE [dbo].[sp_thong_ke_san_pham_ban_cham] (
    @top_n INT,
    @page_index INT,
    @page_size INT
)
AS
BEGIN
    DECLARE @RecordCount BIGINT;

    IF (@page_size <> 0)
    BEGIN
        SET NOCOUNT ON;

        SELECT
            MaSanPham,
            TenSanPham,
            AnhDaiDien,
            TotalQuantitySold
        INTO #Results3
        FROM (
            SELECT
                s.MaSanPham,
                s.TenSanPham,
                s.AnhDaiDien,
                SUM(c.SoLuong) AS TotalQuantitySold,
                ROW_NUMBER() OVER (ORDER BY SUM(c.SoLuong) ASC) AS RowNum
            FROM
                HoaDons h
                INNER JOIN ChiTietHoaDons c ON c.MaHoaDon = h.MaHoaDon
                INNER JOIN SanPhams s ON s.MaSanPham = c.MaSanPham
            GROUP BY
                s.MaSanPham, s.TenSanPham, s.AnhDaiDien
        ) AS RankedProducts
        WHERE RowNum BETWEEN (@page_index - 1) * @page_size + 1 AND ((@page_index - 1) * @page_size + 1) + @page_size - 1;

        SELECT @RecordCount = COUNT(*)
        FROM (
            SELECT
                s.MaSanPham
            FROM
                HoaDons h
                INNER JOIN ChiTietHoaDons c ON c.MaHoaDon = h.MaHoaDon
                INNER JOIN SanPhams s ON s.MaSanPham = c.MaSanPham
            GROUP BY
                s.MaSanPham
        ) AS CountQuery;

        SELECT
            *,
            @RecordCount AS RecordCount
        FROM #Results3;

        DROP TABLE #Results3;
    END;
    ELSE
    BEGIN
        -- Handle the case when page_size is 0 (no pagination)
        SET NOCOUNT ON;

        SELECT TOP (@top_n)
            s.MaSanPham,
            s.TenSanPham,
            s.AnhDaiDien,
            SUM(c.SoLuong) AS TotalQuantitySold
        INTO #Results4
        FROM
            HoaDons h
            INNER JOIN ChiTietHoaDons c ON c.MaHoaDon = h.MaHoaDon
            INNER JOIN SanPhams s ON s.MaSanPham = c.MaSanPham
        GROUP BY
            s.MaSanPham, s.TenSanPham, s.AnhDaiDien
        ORDER BY
            TotalQuantitySold ASC;

        SELECT @RecordCount = COUNT(*)
        FROM (
            SELECT
                s.MaSanPham
            FROM
                HoaDons h
                INNER JOIN ChiTietHoaDons c ON c.MaHoaDon = h.MaHoaDon
                INNER JOIN SanPhams s ON s.MaSanPham = c.MaSanPham
            GROUP BY
                s.MaSanPham
        ) AS CountQuery;

        SELECT
            *,
            @RecordCount AS RecordCount
        FROM #Results4;

        DROP TABLE #Results4;
    END;
END;

exec sp_thong_ke_san_pham_ban_cham 2, 1, 5
--- ********************HÓA ĐƠN************************

--taoj hoa don
go
ALTER PROCEDURE [dbo].[sp_hoadon_create]
(
    @TenKH NVARCHAR(50), 
    @Diachi NVARCHAR(250), 
    @TrangThai BIT,  
    @NgayTao DATETIME,
    @NgayDuyet DATETIME,
    @TongGia DECIMAL(18, 0),
    @Email NVARCHAR(50),
    @SDT NVARCHAR(50),
    @DiaChiGiaoHang NVARCHAR(350),
    @list_json_chitiethoadon NVARCHAR(MAX)
)
AS
BEGIN
    DECLARE @MaHoaDon INT;
    
    INSERT INTO HoaDons
    (
        TenKH, 
        Diachi, 
        TrangThai,
        NgayTao, 
        NgayDuyet,
        TongGia,
        Email, 
        SDT,
        DiaChiGiaoHang 
    )
    VALUES
    (
        @TenKH, 
        @Diachi, 
        @TrangThai,
        @NgayTao,
        @NgayDuyet,
        @TongGia,
        @Email,
        @SDT,
        @DiaChiGiaoHang 
    );

    SET @MaHoaDon = (SELECT SCOPE_IDENTITY());
    
    IF(@list_json_chitiethoadon IS NOT NULL)
    BEGIN
        INSERT INTO ChiTietHoaDons
        (
            MaSanPham, 
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
alter PROCEDURE [dbo].[sp_hoadon_get_by_id]
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
go
alter PROCEDURE [dbo].[sp_hoadonnhap_get_by_id]
(@MaHoaDon        int)
AS
    BEGIN
        SELECT h.*, 
        (
            SELECT c.*
            FROM ChiTietHoaDonNhaps AS c
            WHERE h.MaHoaDon = c.MaHoaDon FOR JSON PATH
        ) AS list_json_chitiethoadonnhap
        FROM HoaDonNhaps AS h
        WHERE  h.MaHoaDon = @MaHoaDon;
    END;
go



Alter PROCEDURE dbo.sp_hoadon_get_by_id
    @MaHoaDon int
AS
BEGIN
    SELECT
        hd.MaHoaDon,
        hd.TrangThai,
        hd.NgayTao,
        hd.NgayDuyet,
        hd.TongGia,
        hd.TenKH,
        hd.GioiTinh,
        hd.Diachi,
        hd.Email,
        hd.SDT,
        hd.DiaChiGiaoHang,
        hd.ThoiGianGiaoHang,
        cthd.MaChiTietHoaDon,
        cthd.MaSanPham,
        cthd.SoLuong,
        cthd.DonGia
    FROM dbo.HoaDons hd
    INNER JOIN dbo.ChiTietHoaDons cthd ON hd.MaHoaDon = cthd.MaHoaDon
    WHERE hd.MaHoaDon = @MaHoaDon;
END
exec sp_hoadon_get_by_id '7'
go

alter PROCEDURE GetHoaDonInfo
    @MaHoaDon int
AS
BEGIN
    SELECT
        HD.MaHoaDon,
        HD.TrangThai,
        HD.NgayTao,
        HD.NgayDuyet,
        HD.TongGia,
        HD.TenKH,
        HD.GioiTinh,
        HD.Diachi,
        HD.Email,
        HD.SDT,
        HD.DiaChiGiaoHang,
        HD.ThoiGianGiaoHang,
        CTHD.MaChiTietHoaDon,
        SP.TenSanPham,
        SP.AnhDaiDien,
        CTHD.SoLuong,
        CTHD.DonGia
    FROM dbo.HoaDons HD
    INNER JOIN dbo.ChiTietHoaDons CTHD ON HD.MaHoaDon = CTHD.MaHoaDon
    INNER JOIN dbo.SanPhams SP ON CTHD.MaSanPham = SP.MaSanPham
    WHERE HD.MaHoaDon = @MaHoaDon;
END;
exec GetHoaDonInfo 2
alter proc sp_getbyidchitiethoadon(@MaHoaDon int)
as
begin
	select					h.MaHoaDon,
							c.MaChiTietHoaDon,
							  c.MaSanPham,
                              s.TenSanPham,
							  s.AnhDaiDien,
							  c.SoLuong,
							  c.DonGia
                        FROM HoaDons AS h
						inner join ChiTietHoaDons c on c.MaHoaDon = h.MaHoaDon
						inner join SanPhams s on s.MaSanPham = c.MaSanPham
	where h.MaHoaDon = @MaHoaDon
end
----

exec sp_getbyidchitiethoadon 2
go
create proc sp_getbyidcm(@MaChuyenMuc int)
as
begin
	select					h.MaChuyenMuc,
							  s.MaSanPham,
                              s.TenSanPham,
							  s.AnhDaiDien,
							  s.SoLuong,
							  s.Gia
                        FROM ChuyenMucs AS h
						inner join SanPhams s on s.MaChuyenMuc = h.MaChuyenMuc
	where h.MaChuyenMuc = @MaChuyenMuc
end
exec  sp_getbyidcm 4

--
CREATE PROCEDURE [dbo].[sp_getbyidchitiethoadonnhap]
    @MaHoaDon INT
AS
BEGIN
    SELECT
        hn.MaHoaDon,
        ct.MaSanPham,
        s.TenSanPham,
        s.AnhDaiDien,
        ct.SoLuong,
        ct.GiaNhap
    FROM
        HoaDonNhaps AS hn
        INNER JOIN ChiTietHoaDonNhaps ct ON ct.MaHoaDon = hn.MaHoaDon
        INNER JOIN SanPhams s ON s.MaSanPham = ct.MaSanPham
    WHERE
        hn.MaHoaDon = @MaHoaDon;
END;
exec sp_getbyidchitiethoadonnhap 2

--capnhatchitiethoadon
CREATE PROCEDURE ThemChiTietHoaDon
    @MaHoaDon int,
    @MaSanPham int,
    @SoLuong int,
    @DonGia decimal(18, 0)
AS
BEGIN
    -- Kiểm tra xem chi tiết hóa đơn đã tồn tại chưa
    IF NOT EXISTS (SELECT 1 FROM dbo.ChiTietHoaDons WHERE MaHoaDon = @MaHoaDon AND MaSanPham = @MaSanPham)
    BEGIN
        -- Thêm chi tiết hóa đơn mới
        INSERT INTO dbo.ChiTietHoaDons (MaHoaDon, MaSanPham, SoLuong, DonGia)
        VALUES (@MaHoaDon, @MaSanPham, @SoLuong, @DonGia);
    END
    ELSE
    BEGIN
        -- Nếu đã tồn tại, có thể cập nhật số lượng hoặc giá
        UPDATE dbo.ChiTietHoaDons
        SET SoLuong = SoLuong + @SoLuong, DonGia = @DonGia
        WHERE MaHoaDon = @MaHoaDon AND MaSanPham = @MaSanPham;
    END
END;
-- Gọi stored procedure với các tham số cần thiết
EXEC ThemChiTietHoaDon 
    @MaHoaDon = 2,   -- Thay  bằng Mã hóa đơn thực tế
    @MaSanPham = 24, -- Thay  bằng Mã sản phẩm thực tế
    @SoLuong = 5,
    @DonGia = 50000;



go
-----\
--CREATE PROCEDURE dbo.GetSanPhamsAndChiTietHoaDonsByMaHoaDon
--    @MaHoaDon int
--AS
--BEGIN
--    SELECT SP.MaSanPham, SP.TenSanPham, SP.AnhDaiDien, SP.Gia, SP.GiaGiam, SP.SoLuong AS SanPhamSoLuong, SP.TrangThai AS SanPhamTrangThai, SP.LuotXem, SP.DacBiet,
--           CTHD.MaChiTietHoaDon,CTHD.MaHoaDon, CTHD.SoLuong AS SoLuongChiTiet, CTHD.DonGia
--    FROM SanPhams SP
--    INNER JOIN ChiTietHoaDons CTHD ON SP.MaSanPham = CTHD.MaSanPham
--    INNER JOIN HoaDons HD ON CTHD.MaHoaDon = HD.MaHoaDon
--    WHERE HD.MaHoaDon = @MaHoaDon;
--END




--cập nhật hóa đơn
alter PROCEDURE [dbo].[update_HoadonWithChiTiet]
(
    @MaHoaDon int, 
    @TenKH nvarchar(50), 
    @Diachi nvarchar(250), 
    @TrangThai bit,  
    @NgayTao datetime,
    @NgayDuyet datetime,
    @TongGia decimal(18, 0),
    @Email nvarchar(50),
    @SDT nvarchar(50),
    @DiaChiGiaoHang nvarchar(350),
    @list_json_chitiethoadon nvarchar(max)
)
AS
BEGIN
    -- Cập nhật thông tin hóa đơn
    UPDATE HoaDons
    SET
        TenKH = @TenKH,
        Diachi = @Diachi,
        TrangThai = @TrangThai,
        NgayTao = @NgayTao,
        NgayDuyet = @NgayDuyet,
        TongGia = @TongGia,
        Email = @Email,
        SDT = @SDT,
        DiaChiGiaoHang = @DiaChiGiaoHang
    WHERE MaHoaDon = @MaHoaDon;

    -- Xóa các chi tiết hóa đơn liên quan đến @MaHoaDon
    DELETE FROM ChiTietHoaDons
    WHERE MaHoaDon = @MaHoaDon;

    -- Nếu có chi tiết hóa đơn mới
    IF (@list_json_chitiethoadon IS NOT NULL) 
    BEGIN
        -- Insert data to temp table 
        SELECT
            JSON_VALUE(p.value, '$.maSanPham') as MaSanPham,
            JSON_VALUE(p.value, '$.soLuong') as SoLuong,
            JSON_VALUE(p.value, '$.donGia') as DonGia
        INTO #Results 
        FROM OPENJSON(@list_json_chitiethoadon) AS p;

        -- Insert chi tiết hóa đơn mới
        INSERT INTO ChiTietHoaDons (MaHoaDon, MaSanPham, SoLuong, DonGia)
        SELECT
            @MaHoaDon,
            #Results.MaSanPham,
            #Results.SoLuong,
            #Results.DonGia
        FROM #Results;

        -- Xóa bảng tạm
        DROP TABLE #Results;
    END;
END;

exec [update_HoadonWithChiTiet] '1','b'
go



go
--xoa hóa đơn
create PROCEDURE [dbo].[delete_hoadonWithChiTiet]
(@MaHoaDon int)
AS
BEGIN
    -- Xóa chi tiết sản phẩm liên quan
    DELETE FROM ChiTietHoaDons
    WHERE MaHoaDon = @MaHoaDon;

    -- Xóa sản phẩm
    DELETE FROM HoaDons
    WHERE MaHoaDon = @MaHoaDon;
END;
exec [delete_hoadonWithChiTiet] 13

go


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
							  h.Diachi,
							  h.TrangThai, 
							  h.NgayTao,
							  h.DiaChiGiaoHang,
							  h.Email,
							  h.SDT
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
							  h.Diachi,
							  h.TrangThai,
							  h.NgayTao,
							   h.DiaChiGiaoHang,
							  h.Email,
							  h.SDT
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

ALTER PROCEDURE [dbo].[sp_hoadonnhap_create]
(
    @MaNhaPhanPhoi INT, 
    @NgayTao DATETIME,
    @KieuThanhToan NVARCHAR(MAX),
    @list_json_chitiethoadonnhap NVARCHAR(MAX)
)
AS
BEGIN
    DECLARE @MaHoaDonNhap INT;

    -- Insert into HoaDonNhaps without specifying MaHoaDon
    INSERT INTO HoaDonNhaps
    (
        MaNhaPhanPhoi, 
        NgayTao, 
        KieuThanhToan
    )
    VALUES
    (
        @MaNhaPhanPhoi, 
        @NgayTao,
        @KieuThanhToan
    );

    -- Retrieve the automatically generated MaHoaDon
    SET @MaHoaDonNhap = SCOPE_IDENTITY();

    -- Check if the JSON data is not NULL
    IF (@list_json_chitiethoadonnhap IS NOT NULL)
    BEGIN
        -- Insert into ChiTietHoaDonNhaps using the generated MaHoaDon
        INSERT INTO ChiTietHoaDonNhaps
        (
            MaSanPham, 
            MaHoaDon,
            SoLuong, 
            GiaNhap,
            DonViTinh,
            TongTien
        )
        SELECT 
            JSON_VALUE(p.value, '$.maSanPham'), 
            @MaHoaDonNhap, 
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
alter PROCEDURE [dbo].[update1_hoadonnhap]
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

--------------------------------------------
go
--timkiemhoadonnhap
 alter PROCEDURE [dbo].[sp_hoadonnhap_search]
 (
     @page_index  INT, 
     @page_size   INT,
     @ma_hoa_don  INT,
     @ma_nha_phan_phoi INT,
     @ngay_tao datetime,
     @kieu_thanh_toan nvarchar(MAX)
 )
 AS
 BEGIN
     DECLARE @RecordCount BIGINT;
     IF(@page_size <> 0)
     BEGIN
         SET NOCOUNT ON;
         SELECT(ROW_NUMBER() OVER(ORDER BY NgayTao ASC)) AS RowNumber, 
               hn.MaHoaDon,
               hn.MaNhaPhanPhoi,
               hn.NgayTao,
               hn.KieuThanhToan,
               ct.MaSanPham,
               ct.SoLuong,
               ct.GiaNhap,
               ct.DonViTinh,
               ct.TongTien
         INTO #Results1
         FROM HoaDonNhaps AS hn
         LEFT JOIN ChiTietHoaDonNhaps AS ct ON hn.MaHoaDon = ct.MaHoaDon
         WHERE  (@ma_hoa_don IS NULL OR hn.MaHoaDon = @ma_hoa_don)
               AND (@ma_nha_phan_phoi IS NULL OR hn.MaNhaPhanPhoi = @ma_nha_phan_phoi)
               AND (@ngay_tao IS NULL OR hn.NgayTao = @ngay_tao)
               AND (@kieu_thanh_toan IS NULL OR hn.KieuThanhToan LIKE N'%'+@kieu_thanh_toan+'%');
         SELECT @RecordCount = COUNT(*)
        
         SELECT *, 
                @RecordCount AS RecordCount
         FROM #Results1
         WHERE ROWNUMBER BETWEEN (@page_index - 1) * @page_size + 1 AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
               OR @page_index = -1;
         DROP TABLE #Results1; 
     END;
     ELSE
     BEGIN
         SET NOCOUNT ON;
        SELECT(ROW_NUMBER() OVER(ORDER BY NgayTao ASC)) AS RowNumber, 
               hn.MaHoaDon,
               hn.MaNhaPhanPhoi,
               hn.NgayTao,
               hn.KieuThanhToan,
               ct.MaSanPham,
               ct.SoLuong,
               ct.GiaNhap,
               ct.DonViTinh,
               ct.TongTien
         INTO #Results2
         FROM HoaDonNhaps AS hn
         LEFT JOIN ChiTietHoaDonNhaps AS ct ON hn.MaHoaDon = ct.MaHoaDon
         WHERE  (@ma_hoa_don IS NULL OR hn.MaHoaDon = @ma_hoa_don)
               AND (@ma_nha_phan_phoi IS NULL OR hn.MaNhaPhanPhoi = @ma_nha_phan_phoi)
               AND (@ngay_tao IS NULL OR hn.NgayTao = @ngay_tao)
               AND (@kieu_thanh_toan IS NULL OR hn.KieuThanhToan LIKE N'%'+@kieu_thanh_toan+'%');
         SELECT @RecordCount = COUNT(*)
         SELECT *, 
                @RecordCount AS RecordCount
         
        FROM #Results2

        DROP TABLE #Results2;
     END;
 END;
 go
 create PROCEDURE [dbo].[delete_hoadonnhapWithChiTiet]
(@MaHoaDon int)
AS
BEGIN
    -- Xóa chi tiết sản phẩm liên quan
    DELETE FROM ChiTietHoaDonNhaps
    WHERE MaHoaDon = @MaHoaDon;

    -- Xóa sản phẩm
    DELETE FROM HoaDonNhaps
    WHERE MaHoaDon = @MaHoaDon;
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



GO
----------- SẢN PHẨM -------------------
--get san pham
alter PROCEDURE sp_SanPham_get_by_id(
	@MaSanPham int 
)
as
Begin
	SELECT * FROM SanPhams WHERE MaSanPham = @MaSanPham;
end

go
create proc sp_getbyidchitietCM(@MaChuyenMuc int)
as
begin
	select					c.MaChuyenMuc,
							c.TenChuyenMuc,
							  s.MaSanPham,
                              s.TenSanPham,
							  s.AnhDaiDien,
							  s.Gia
							
                        FROM ChuyenMucs AS c
						inner join SanPhams s on s.MaChuyenMuc = c.MaChuyenMuc
						
	where c.MaChuyenMuc = @MaChuyenMuc
end
go
alter PROCEDURE [dbo].[sp_SanPham_create]
(
 @MaChuyenMuc          int, 
 @TenSanPham nvarchar(150),
 @AnhDaiDien nvarchar(350),
 @Gia decimal(18, 0),
 @GiaGiam decimal(18, 0),
 @SoLuong int,
 @TrangThai bit,
 @LuotXem int,
 @DacBiet bit,
 @list_json_chitietsanpham NVARCHAR(MAX)
)
AS
    BEGIN
		DECLARE @MaSanPham INT;
        INSERT INTO SanPhams
                (
                 MaChuyenMuc, 
				 TenSanPham, 
				 AnhDaiDien,
				Gia,
				GiaGiam,
				SoLuong,
				TrangThai,
				LuotXem,
				DacBiet
                )
                VALUES
                (
                 @MaChuyenMuc, 
				 @TenSanPham ,
				 @AnhDaiDien ,
				@Gia,
				@GiaGiam,
				@SoLuong,
				@TrangThai,
				@LuotXem,
				@DacBiet
                );

				SET @MaSanPham = (SELECT SCOPE_IDENTITY());
                IF(@list_json_chitietsanpham IS NOT NULL)
                    BEGIN
                        INSERT INTO ChiTietSanPhams
						 (
						  MaSanPham,
                          MaNhaSanXuat, 
                           MoTa,
						  ChiTiet
                        )
                    SELECT 
			   @MaSanPham,
			  JSON_VALUE(p.value, '$.maNhaSanXuat') as MaNhaSanXuat,
			  JSON_VALUE(p.value, '$.moTa') as MoTa,
			  JSON_VALUE(p.value, '$.chiTiet') as ChiTiet
			
                    FROM OPENJSON(@list_json_chitietsanpham) AS p;
                END;
        SELECT '';
    END;



-- them xoa sua San Pham
go
create PROCEDURE [dbo].[update1_SanPham]
(@MaSanPham              int, 
 @MaChuyenMuc          int, 
 @TenSanPham nvarchar(150),
 @AnhDaiDien nvarchar(350),
 @Gia decimal(18, 0),
 @GiaGiam decimal(18, 0),
 @SoLuong int,
 @TrangThai bit,
 @LuotXem int,
 @DacBiet bit,
 @list_json_chitietsanpham NVARCHAR(MAX)
)
AS
    BEGIN
		UPDATE SanPhams
		SET
				
                 MaChuyenMuc = @MaChuyenMuc, 
				 TenSanPham = @TenSanPham, 
				 AnhDaiDien = @AnhDaiDien,
				 Gia  =  @Gia ,
				 GiaGiam  =  @GiaGiam ,
				 SoLuong  =  @SoLuong ,
				 TrangThai  =  @TrangThai ,
				 LuotXem  =  @LuotXem ,
				 DacBiet  =  @DacBiet 
	
		WHERE MaSanPham = @MaSanPham;
		
		IF(@list_json_chitietsanpham IS NOT NULL) 
		BEGIN
			 -- Insert data to temp table 
		   SELECT
			  JSON_VALUE(p.value, '$.maChiTietSanPham') as MaChiTietSanPham,
			  JSON_VALUE(p.value, '$.maSanPham') as MaSanPham,
			  JSON_VALUE(p.value, '$.maNhaSanXuat') as MaNhaSanXuat,
			  JSON_VALUE(p.value, '$.moTa') as MoTa,
			  JSON_VALUE(p.value, '$.chiTiet') as ChiTiet,
			  JSON_VALUE(p.value, '$.status') AS status 
			  INTO #Results 
		   FROM OPENJSON(@list_json_chitietsanpham) AS p;
		 
		 -- Insert data to table with STATUS = 1;
			INSERT INTO ChiTietSanPhams (MaChiTietSanPham, 
						  MaSanPham,
                          MaNhaSanXuat, 
                           MoTa,
						  ChiTiet
						  ) 
			   SELECT
				  #Results.MaChiTietSanPham,
				  @MaSanPham,
				  #Results.MaNhaSanXuat,
				  #Results.MoTa,
				  #Results.ChiTiet
				
			   FROM  #Results 
			   WHERE #Results.status = '1' 
			
			-- Update data to table with STATUS = 2
			  UPDATE ChiTietSanPhams 
			  SET
				 MaNhaSanXuat = #Results.MaNhaSanXuat,
				 MoTa = #Results.MoTa,
				 ChiTiet = #Results.ChiTiet
			  FROM #Results 
			  WHERE  ChiTietSanPhams.MaChiTietSanPham= #Results.MaChiTietSanPham AND #Results.status = '2';
			
			-- Delete data to table with STATUS = 3
			DELETE C
			FROM ChiTietSanPhams C
			INNER JOIN #Results R
				ON C.MaChiTietSanPham=R.MaChiTietSanPham
			WHERE R.status = '3';
			DROP TABLE #Results;
		END;
        SELECT '';
    END;






go

alter PROCEDURE [dbo].[update_SanPhamWithChiTiet]
(@MaSanPham int,
 @MaChuyenMuc int,
 @TenSanPham nvarchar(150),
 @AnhDaiDien nvarchar(350),
 @Gia decimal(18, 0),
 @GiaGiam decimal(18, 0),
 @SoLuong int,
 @TrangThai bit,
 @LuotXem int,
 @DacBiet bit,
 @list_json_chitietsanpham NVARCHAR(MAX))
AS
BEGIN
    -- Cập nhật thông tin sản phẩm
    UPDATE SanPhams
    SET
        MaChuyenMuc = @MaChuyenMuc, 
        TenSanPham = @TenSanPham, 
        AnhDaiDien = @AnhDaiDien,
        Gia = @Gia,
        GiaGiam = @GiaGiam,
        SoLuong = @SoLuong,
        TrangThai = @TrangThai,
        LuotXem = @LuotXem,
        DacBiet = @DacBiet
    WHERE MaSanPham = @MaSanPham;

    -- Xóa các chi tiết sản phẩm liên quan
    DELETE FROM ChiTietSanPhams
    WHERE MaSanPham = @MaSanPham;

    -- Nếu có chi tiết sản phẩm mới
    IF (@list_json_chitietsanpham IS NOT NULL) 
    BEGIN
        -- Insert data to temp table 
        SELECT
            JSON_VALUE(p.value, '$.maNhaSanXuat') as MaNhaSanXuat,
            JSON_VALUE(p.value, '$.moTa') as MoTa,
            JSON_VALUE(p.value, '$.chiTiet') as ChiTiet
        INTO #Results 
        FROM OPENJSON(@list_json_chitietsanpham) AS p;

        -- Insert chi tiết sản phẩm mới
        INSERT INTO ChiTietSanPhams (MaSanPham, MaNhaSanXuat, MoTa, ChiTiet)
        SELECT
            @MaSanPham,
            #Results.MaNhaSanXuat,
            #Results.MoTa,
            #Results.ChiTiet
        FROM #Results;

        -- Xóa bảng tạm
        DROP TABLE #Results;
    END;
END;

go




--xoa san pham
alter PROCEDURE [dbo].[delete_SanPhamWithChiTiet]
(@MaSanPham int)
AS
BEGIN
    -- Xóa chi tiết sản phẩm liên quan
    DELETE FROM ChiTietSanPhams
    WHERE MaSanPham = @MaSanPham;

    -- Xóa sản phẩm
    DELETE FROM SanPhams
    WHERE MaSanPham = @MaSanPham;
END;
exec [delete_SanPhamWithChiTiet] 9

go




--- xoa nhieu
--ALTER PROCEDURE [dbo].[DeleteMultipleProducts]
--    @MaSanPham NVARCHAR(MAX)
--AS
--BEGIN
--    DECLARE @Sql NVARCHAR(MAX)

--    -- Tạo câu lệnh SQL để xóa sản phẩm và chi tiết sản phẩm liên quan
--    SET @Sql = N'DELETE FROM ChiTietSanPhams WHERE MaSanPham IN (' + @MaSanPham + N');
--                 DELETE FROM SanPhams WHERE MaSanPham IN (' + @MaSanPham + N');'

--    -- Thực hiện câu lệnh SQL
--    EXEC sp_executesql @Sql
--END;

go
ALTER PROCEDURE [dbo].[DeleteMultipleProducts]
    @MaSanPham NVARCHAR(MAX)
AS
BEGIN
    -- Chuyển danh sách mã sản phẩm từ chuỗi thành bảng tạm
    DECLARE @SanPhamIds TABLE (MaSanPham INT)
    INSERT INTO @SanPhamIds
    SELECT value FROM STRING_SPLIT(@MaSanPham, ',')

    -- Xóa chi tiết sản phẩm liên quan
    DELETE FROM ChiTietSanPhams
    WHERE MaSanPham IN (SELECT MaSanPham FROM @SanPhamIds)

    -- Xóa sản phẩm
    DELETE FROM SanPhams
    WHERE MaSanPham IN (SELECT MaSanPham FROM @SanPhamIds)
END;
exec [DeleteMultipleProducts] 48
go

create PROCEDURE sp_sanpham_all
as
Begin
	SELECT SanPhams.MaSanPham,
	SanPhams.MaChuyenMuc,
	SanPhams.AnhDaiDien,
	SanPhams.TenSanPham,
	SanPhams.Gia,
	SanPhams.GiaGiam,
	SanPhams.SoLuong,
	SanPhams.TrangThai,
	SanPhams.LuotXem,
	SanPhams.DacBiet
	FROM SanPhams 
end

CREATE PROCEDURE GetSanPhamChuyenMucData
AS
BEGIN
    SELECT 
        sp.MaSanPham,
        sp.MaChuyenMuc,
        sp.TenSanPham,
        sp.AnhDaiDien,
        sp.Gia,
        sp.GiaGiam,
        sp.SoLuong,
        sp.TrangThai,
        sp.LuotXem,
        sp.DacBiet,
        cm.MaChuyenMucCha,
        cm.TenChuyenMuc,
        cm.DacBiet AS ChuyenMucDacBiet,
        cm.NoiDung
    FROM dbo.SanPhams sp
    INNER JOIN dbo.ChuyenMucs cm ON sp.MaChuyenMuc = cm.MaChuyenMuc;
END;


go
alter PROCEDURE BanChay
AS
BEGIN
    SELECT TOP 6 -- Số lượng sản phẩm bán chạy bạn muốn lấy
        SP.MaSanPham,
        SP.TenSanPham,
        SP.AnhDaiDien,
        SP.Gia,
        SP.GiaGiam,
        SP.SoLuong,
        SP.TrangThai,
        SP.LuotXem,
        SP.DacBiet
    FROM SanPhams SP
    INNER JOIN ChiTietHoaDons CTHD ON SP.MaSanPham = CTHD.MaSanPham
    GROUP BY SP.MaSanPham, SP.TenSanPham, SP.AnhDaiDien, SP.Gia, SP.GiaGiam, SP.SoLuong, SP.TrangThai, SP.LuotXem, SP.DacBiet
    ORDER BY SUM(CTHD.SoLuong) DESC; -- Sắp xếp theo số lượng bán giảm dần
End;
	exec BanChay
--tim kiem san pham
go
alter PROCEDURE [dbo].[sp_SanPham_search] (@page_index  INT, 
                                       @page_size   INT,
									   @tenSanPham Nvarchar(50),
									    @giaFrom DECIMAL(18, 0),
										@giaTo DECIMAL(18, 0),
									   @SoLuong int
									  
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenSanPham ASC)) AS RowNumber, 
							  h.MaSanPham,
                              h.TenSanPham,
							  h.Gia,
							  h.SoLuong,
							  h.MaChuyenMuc,
							  h.AnhDaiDien
                        INTO #Results1
                        FROM SanPhams AS h
					      WHERE (@TenSanPham = '' or h.TenSanPham like '%'+@TenSanPham +'%')		
						  	and (@SoLuong =0 OR h.SoLuong = @SoLuong)
							and(@giaFrom = 0 or h.Gia >= @giaFrom)
							and (@giaTo = 0 or h.Gia <= @giaTo)
      
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
                              ORDER BY TenSanPham ASC)) AS RowNumber, 
							  h.MaSanPham,
                              h.TenSanPham,
							  h.Gia,
							  h.SoLuong,
							  h.MaChuyenMuc,
							   h.AnhDaiDien
                        INTO #Results2
                        FROM SanPhams AS h
					  WHERE (@TenSanPham = '' or h.TenSanPham like '%'+@TenSanPham +'%')		
						  	and (@SoLuong =0 OR h.SoLuong = @SoLuong)
							and(@giaFrom = 0 or h.Gia >= @giaFrom)
							and (@giaTo = 0 or h.Gia <= @giaTo)
             
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2              
                        DROP TABLE #Results1; 
    END;
End;
exec sp_SanPham_search 1,6,N'Hoa',10000,20000,0
go
alter PROCEDURE [dbo].[sp_SanPham_search_user] (@page_index  INT, 
                                       @page_size   INT,
									   @tenSanPham Nvarchar(50),
									   @maChuyenMuc int,
									    @giaFrom DECIMAL(18, 0),
										@giaTo DECIMAL(18, 0),
									   @SoLuong int,
									   @dacBiet bit
									  
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenSanPham ASC)) AS RowNumber, 
							  h.MaSanPham,
                              h.TenSanPham,
							  h.Gia,
							  h.SoLuong,
							  h.MaChuyenMuc,
							  h.AnhDaiDien,
							  h.LuotXem,
							  h.DacBiet
                        INTO #Results1
                        FROM SanPhams AS h
					      WHERE (@TenSanPham = '' or h.TenSanPham like '%'+@TenSanPham +'%')	
						  and(@maChuyenMuc =0 or @maChuyenMuc = h.MaChuyenMuc)
						  	and (@SoLuong =0 OR h.SoLuong = @SoLuong)
							and(@giaFrom = 0 or h.Gia >= @giaFrom)
							and (@giaTo = 0 or h.Gia <= @giaTo)
							and (@DacBiet = 1 or h.DacBiet = 1)
      
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
                              ORDER BY TenSanPham ASC)) AS RowNumber, 
							  h.MaSanPham,
                              h.TenSanPham,
							  h.Gia,
							  h.SoLuong,
							  h.MaChuyenMuc,
							   h.AnhDaiDien,
							   h.LuotXem,
							   h.DacBiet
                        INTO #Results2
                        FROM SanPhams AS h
					  WHERE (@TenSanPham = '' or h.TenSanPham like '%'+@TenSanPham +'%')
					   and(@maChuyenMuc =0 or @maChuyenMuc = h.MaChuyenMuc)
						  	and (@SoLuong =0 OR h.SoLuong = @SoLuong)
							and(@giaFrom = 0 or h.Gia >= @giaFrom)
							and (@giaTo = 0 or h.Gia <= @giaTo)
							and (@DacBiet = 1 or h.DacBiet = 1)
             
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2              
                        DROP TABLE #Results1; 
    END;
End;
exec sp_SanPham_search_user 1, 6,''
go
create PROCEDURE [dbo].[sp_SanPham_searchad] (@page_index  INT, 
                                       @page_size   INT,
									   @tenSanPham Nvarchar(50),
									    @gia DECIMAL(18, 0),
									   @SoLuong int
									  
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenSanPham ASC)) AS RowNumber, 
							  h.MaSanPham,
                              h.TenSanPham,
							  h.Gia,
							  h.SoLuong,
							  h.MaChuyenMuc,
							  h.AnhDaiDien
                        INTO #Results1
                        FROM SanPhams AS h
					      WHERE (@TenSanPham = '' or h.TenSanPham like '%'+@TenSanPham +'%')		
						  	and (@SoLuong =0 OR h.SoLuong = @SoLuong)
							and(@gia= 0 or h.Gia = @gia)
							
      
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
                              ORDER BY TenSanPham ASC)) AS RowNumber, 
							  h.MaSanPham,
                              h.TenSanPham,
							  h.Gia,
							  h.SoLuong,
							  h.MaChuyenMuc,
							   h.AnhDaiDien
                        INTO #Results2
                        FROM SanPhams AS h
					   WHERE (@TenSanPham = '' or h.TenSanPham like '%'+@TenSanPham +'%')		
						  	and (@SoLuong =0 OR h.SoLuong = @SoLuong)
							and(@gia= 0 or h.Gia = @gia)
             
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2              
                        DROP TABLE #Results1; 
    END;
End;
-- Them xoa sua hien thi tim kiem CHUYEN MUC
alter PROCEDURE sp_chuyenmuc_get_by_id(
	@MaChuyenMuc int 
)
as
Begin
	SELECT * FROM ChuyenMucs WHERE MaChuyenMuc = @MaChuyenMuc;
end
go
create PROCEDURE sp_item_all
as
Begin
	SELECT ChuyenMucs.MaChuyenMuc,
	ChuyenMucs.MaChuyenMucCha,
	ChuyenMucs.TenChuyenMuc,
	ChuyenMucs.NoiDung,
	ChuyenMucs.DacBiet
	FROM ChuyenMucs 
end
go
create PROCEDURE spban_item_all
as
Begin
	SELECT SanPhams.MaSanPham,
	SanPhams.TenSanPham,
	SanPhams.Gia,
	SanPhams.SoLuong,
	SanPhams.AnhDaiDien
	FROM SanPhams 
end
--create PROCEDURE [dbo].[sp_item_all]
--AS
--    BEGIN
--        SELECT item.item_id, 
--               item.item_group_id, 
--               item.item_image, 
--			   item.item_name, 
--			   item.item_price                         
--        FROM item 
--    END;
--tao chuyen muc

alter PROCEDURE [dbo].[create_ChuyenMuc](
	@MaChuyenMucCha int,
	@TenChuyenMuc nvarchar(50),
	@DacBiet bit,
	@NoiDung nvarchar(max)
	
	)
As
BEGIN
	insert into ChuyenMucs(MaChuyenMucCha,TenChuyenMuc,DacBiet,NoiDung)
	values(@MaChuyenMucCha,@TenChuyenMuc,@DacBiet,@NoiDung)
END
go




--cập nhật thông tin chuyen muc
create PROCEDURE update_ChuyenMuc(
	 @MaChuyenMuc int,
	@MaChuyenMucCha int,
	@TenChuyenMuc nvarchar(50),
	@DacBiet bit,
	@NoiDung nvarchar(max)
)
as
Begin
	update ChuyenMucs
	set  MaChuyenMucCha = @MaChuyenMucCha , TenChuyenMuc = @TenChuyenMuc, DacBiet = @DacBiet,NoiDung=@NoiDung
	where MaChuyenMuc =@MaChuyenMuc
end

--Xoa thong tinchuye3n muc
go
alter PROCEDURE delete_ChuyenMuc(
	@MaChuyenMuc int
)
as
Begin
	delete from ChuyenMucs where MaChuyenMuc = @MaChuyenMuc
end
exec  delete_ChuyenMuc 11
select*from ChuyenMucs

--Tim kiem thong tin chuyen muc
go
alter PROCEDURE [dbo].[sp_ChuyenMuc_search1] (@page_index  INT, 
                                       @page_size   INT,
									   @ten_ChuyenMuc Nvarchar(50)
									 
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenChuyenMuc ASC)) AS RowNumber, 
                              c.MaChuyenMuc,
							  c.TenChuyenMuc,
							  c.DacBiet,
							  c.NoiDung
                        INTO #Results1
                        FROM ChuyenMucs AS c
					    WHERE  (@ten_ChuyenMuc = '' Or c.TenChuyenMuc like N'%'+@ten_ChuyenMuc+'%');                   
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
                              ORDER BY TenChuyenMuc ASC)) AS RowNumber, 
                              c.MaChuyenMuc,
							  c.TenChuyenMuc,
							  c.DacBiet,
							  c.NoiDung
                        INTO #Results2
                        FROM ChuyenMucs AS c
					    WHERE  (@ten_ChuyenMuc = '' Or c.TenChuyenMuc like N'%'+@ten_ChuyenMuc+'%');                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;                        
                        DROP TABLE #Results1; 
    END;
End;



select*from TaiKhoans


go


--NCC
create proc sp_item_allnpp
as
begin
	select*from NhaPhanPhois
end
-- tạo nhà cung cấp
go
CREATE PROCEDURE sp_create_nhacungcap
(
    @TenNhaPhanPhoi NVARCHAR(250),
    @DiaChi NVARCHAR(MAX),
    @SoDienThoai NVARCHAR(50),
	@Fax nvarchar(50),
	@MoTa nvarchar(max)
)
AS
BEGIN
    INSERT INTO NhaPhanPhois(TenNhaPhanPhoi, DiaChi, SoDienThoai,Fax,MoTa)
    VALUES (@TenNhaPhanPhoi, @DiaChi, @SoDienThoai,@Fax,@MoTa);
END;
go
-- cập nhật nhà cung cấp
CREATE PROCEDURE sp_update_nhacungcap
(
    @MaNhaPhanPhoi INT,
    @TenNhaPhanPhoi NVARCHAR(250),
    @DiaChi NVARCHAR(MAX),
    @SoDienThoai NVARCHAR(50),
	@Fax nvarchar(50),
	@MoTa nvarchar(max)
)
AS
BEGIN
    UPDATE NhaPhanPhois
    SET
        TenNhaPhanPhoi = @TenNhaPhanPhoi,
        DiaChi = @DiaChi,
        SoDienThoai = @SoDienThoai,
		Fax = @Fax,
		MoTa = @MoTa
    WHERE MaNhaPhanPhoi = @MaNhaPhanPhoi
END;
go
-- xóa nhà cung cấp
CREATE PROCEDURE sp_delete_nhacungcap
(
    @MaNhaPhanPhoi INT
)
AS
BEGIN
    DELETE FROM NhaPhanPhois
    WHERE  MaNhaPhanPhoi = @MaNhaPhanPhoi;
END;
go
-- lấy ra id nhà cung cấp
CREATE PROCEDURE sp_get_NhaCungCapByID
(
     @MaNhaPhanPhoi INT
)
AS
BEGIN
    SELECT * FROM NhaPhanPhois WHERE MaNhaPhanPhoi = @MaNhaPhanPhoi;
END;

-- Them xoa sua hien thi tim kiem NHA PHAN PHOI
