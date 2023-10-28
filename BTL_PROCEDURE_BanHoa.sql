use BTLThayDong125211


--Các storted Proc


--- ********************KHÁCH HÀNG************************
go
-- Hiển thị khách hàng theo id
create PROCEDURE sp_khach_get_by_id(
	@ID int 
)
as
Begin
	SELECT * FROM KhachHangs WHERE Id = @ID;
end

go
--cập nhật thông tin khách hàng
create PROCEDURE update_khachhang(
	@KhachHangID int ,H
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





go
alter PROCEDURE BanChay
AS
BEGIN
    SELECT TOP 5 -- Số lượng sản phẩm bán chạy bạn muốn lấy
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
END;



--tim kiem san pham
go
alter PROCEDURE [dbo].[sp_SanPham_search] (@page_index  INT, 
                                       @page_size   INT,
									   @tenSanPham Nvarchar(50),
									   @gia decimal(18, 0),
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
					    WHERE  (@tenSanPham = '' Or h.TenSanPham like N'%'+@tenSanPham+'%') 
						;               
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
					     WHERE  (@tenSanPham = '' Or h.TenSanPham like N'%'+@tenSanPham+'%') ;              
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2              
                        DROP TABLE #Results1; 
    END;
End;

go
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

create PROCEDURE [dbo].[create_ChuyenMuc](
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
create PROCEDURE delete_ChuyenMuc(
	@MaChuyenMuc int
)
as
Begin
	delete from ChuyenMucs where MaChuyenMuc = @MaChuyenMuc
end
select*from KhachHangs

--Tim kiem thong tin chuyen muc
go
create PROCEDURE [dbo].[sp_ChuyenMuc_search1] (@page_index  INT, 
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



select*from TaiKhoans





-- Them xoa sua hien thi tim kiem NHA PHAN PHOI