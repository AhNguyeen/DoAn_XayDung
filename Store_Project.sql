	USE CongTyXayDung
go
SET DATEFORMAT dmy
go

---------------------------------------------------
----------------------CHỨC VỤ----------------------
---------------------------------------------------
CREATE PROC sp_LayDSChucVu
AS
	SELECT *
	FROM ChucVu
	ORDER BY MaCV ASC
--- exec sp_LayDSChucVu
GO

CREATE PROC sp_ThemChucVu(@macv nvarchar(10), @tencv char(50))
AS
	INSERT INTO ChucVu(MaCV, TenCV)
	VALUES (@macv, @tencv)
GO

CREATE PROC sp_XoaChucVu(@macv nvarchar(10))
AS
	DELETE
	FROM ChucVu
	WHERE MaCV = @macv
GO

CREATE PROC sp_SuaChucVu(@macv nvarchar(10), @tencv char(50))
AS
	UPDATE ChucVu
	SET TenCV = @tencv
	WHERE MaCV = @macv
GO

CREATE PROC sp_TimChucVuTheoMa (@macv nvarchar(10))
AS
	SELECT *
	FROM ChucVu
	WHERE MaCV = @macv
GO

CREATE PROC sp_TimChucVuTheoTen (@tencv char(50))
AS
	SELECT *
	FROM ChucVu
	WHERE TenCV COLLATE Vietnamese_CI_AI LIKE N'%' + @tencv + N'%'
GO
---------------------------------------------------
---------------------PHÒNG BAN---------------------
---------------------------------------------------
CREATE PROC sp_LayDSPhongBan
AS
	SELECT *
	FROM PhongBan
	ORDER BY MaPB ASC
--- exec sp_LayDSPhongBan
GO

CREATE PROC sp_ThemPhongBan(@maPB nvarchar(10), @tenPB char(50), @truongphong nvarchar(10) = null)
AS
	INSERT INTO PhongBan(MaPB, TenPB, TruongPhong)
	VALUES (@maPB, @tenPB, @truongphong)
GO

CREATE PROC sp_XoaPhongBan(@maPB nvarchar(10))
AS
	DELETE
	FROM PhongBan
	WHERE MaPB = @maPB
GO

CREATE PROC sp_SuaPhongBan(@maPB nvarchar(10), @tenPB char(50), @truongphong nvarchar(10) = null)
AS
	UPDATE PhongBan
	SET TenPB = @tenPB, TruongPhong = @truongphong
	WHERE MaPB = @maPB
GO

CREATE PROC sp_TimPhongBanTheoMa (@maPB nvarchar(10))
AS
	SELECT *
	FROM PhongBan
	WHERE MaPB = @maPB
GO

CREATE PROC sp_TimPhongBanTheoTen (@tenPB char(50))
AS
	SELECT *
	FROM PhongBan
	WHERE TenPB COLLATE Vietnamese_CI_AI LIKE N'%' + @tenPB + N'%'
GO
---------------------------------------------------
---------------------NHÂN VIÊN---------------------
---------------------------------------------------
CREATE PROC sp_LayDSNhanVien
AS
	SELECT *
	FROM NhanVien
	ORDER BY MaNV ASC
--- exec sp_LayDSNhanVien
GO

CREATE PROC sp_ThemNhanVien(@manv nvarchar(10), @honv nvarchar(10), @tennv char(50), @ngaysinh date, @gioitinh varchar(10), @diachi nvarchar(50), @qquan nvarchar(50), @email nvarchar(50), @sdt varchar(15), @luong int, @mapb nvarchar(10), @macv nvarchar(10) )
AS
	INSERT INTO NhanVien(MaNV, HoNV, TenNV, NgaySinh, GioiTinh, DiaChi, QQuan, email, SDT, Luong, MaPB, MaCV)
	VALUES (@manv, @honv, @tennv, @ngaysinh, @gioitinh, @diachi, @qquan, @email, @sdt, @luong, @mapb, @macv )
GO

CREATE PROC sp_XoaNhanVien(@maNV nvarchar(10))
AS
	DELETE 
	FROM PhanCong 
	WHERE MaNV = @MaNV;

	UPDATE PhongBan 
	SET TruongPhong = NULL 
	WHERE TruongPhong = @MaNV;

	DELETE
	FROM NhanVien
	WHERE MaNV = @maNV
GO

CREATE PROC sp_SuaNhanVien(@manv nvarchar(10), @honv nvarchar(10), @tennv char(50), @ngaysinh date, @gioitinh varchar(10), @diachi nvarchar(50), @qquan nvarchar(50), @email nvarchar(50), @sdt varchar(15), @luong int, @mapb nvarchar(10), @macv nvarchar(10) )
AS
	UPDATE NhanVien
	SET HoNV = @honv,
        TenNV = @tennv,
        NgaySinh = @ngaySinh,
        GioiTinh = @gioiTinh,
        DiaChi = @diaChi,
        QQuan = @qquan,
        Email = @email,
        SDT = @sdt,
        Luong = @luong,
        MaPB = @mapb,
        MaCV = @macv
	WHERE MaNV = @maNV
GO

CREATE PROC sp_TimNhanVienTheoMa (@maNV nvarchar(10))
AS
	SELECT *
	FROM NhanVien
	WHERE MaNV = @maNV
GO

CREATE PROC sp_TimNhanVienTheoTen (@tenNV char(50))
AS
	SELECT *
	FROM NhanVien
	WHERE TenNV COLLATE Vietnamese_CI_AI LIKE N'%' + @tenNV + N'%'
GO
-----------------------------------------------------
------------------------DỰ ÁN------------------------
-----------------------------------------------------
CREATE PROC sp_LayDSDuAn
AS
	SELECT *
	FROM DuAn
	ORDER BY MaDA ASC
--- exec sp_LayDSDuAn
GO

CREATE PROC sp_ThemDuAn(@mada nvarchar(10), @tenda nvarchar(50), @diadiem nvarchar(50), @mapb nvarchar(10), @kinhphi decimal(18,2), @ngaykhoicong date, @ngayketthucdukien date, @trangthai nvarchar(20), @makh nvarchar(10))
AS
	INSERT INTO DuAn(MaDA, TenDA, DiaDiem, MaPB, KinhPhi, NgayKhoiCong, NgayKetThucDuKien, TrangThai, MaKH)
	VALUES (@mada, @tenda, @diadiem, @mapb, @kinhphi, @ngaykhoicong, @ngayketthucdukien, @trangthai, @makh)
GO

CREATE PROC sp_XoaDuAn(@maDA nvarchar(10))
AS
	DELETE
	FROM DuAn
	WHERE MaDA = @maDA
GO

CREATE PROC sp_SuaDuAn(@mada nvarchar(10), @tenda nvarchar(50), @diadiem nvarchar(50), @mapb nvarchar(10), @kinhphi decimal(18,2), @ngaykhoicong date, @ngayketthucdukien date, @trangthai nvarchar(20), @makh nvarchar(10))
AS
	UPDATE DuAn
	SET TenDA = @tenda, 
		DiaDiem = @diadiem,
        MaPB = @mapb,
        KinhPhi = @kinhphi,
        NgayKhoiCong = @ngaykhoicong,
        NgayKetThucDuKien = @ngayketthucdukien,
        TrangThai = @trangthai,
        MaKH = @makh
	WHERE MaDA = @mada
GO

CREATE PROC sp_TimDuAnTheoMa (@maDA nvarchar(10))
AS
	SELECT *
	FROM DuAn
	WHERE MaDA = @maDA
GO

CREATE PROC sp_TimDuAnTheoTen (@tenDA char(50))
AS
	SELECT *
	FROM DuAn
	WHERE TenDA COLLATE Vietnamese_CI_AI LIKE N'%' + @tenDA + N'%'
GO
----------------------------------------------------
---------------------KHÁCH HÀNG---------------------
----------------------------------------------------
CREATE PROC sp_LayDSKhachHang
AS
	SELECT *
	FROM KhachHang
	ORDER BY MaKH ASC
--- exec sp_LayDSKhachHang
GO

CREATE PROC sp_ThemKhachHang(@makh nvarchar(10), @tenkh nvarchar(50), @sdt nvarchar(10), @email nvarchar(20))
AS
	INSERT INTO KhachHang(MaKH, TenKH, SDT, Email)
	VALUES (@makh, @tenkh, @sdt, @email)
GO

CREATE PROC sp_XoaKhachHang(@maKH nvarchar(10))
AS
	DELETE
	FROM KhachHang
	WHERE MaKH = @maKH
GO

CREATE PROC sp_SuaKhachHang(@makh nvarchar(10), @tenkh nvarchar(50), @sdt nvarchar(10), @email nvarchar(20))
AS
	UPDATE KhachHang
	SET TenKH = @tenkh, 
		SDT = @sdt,
		Email = @email
	WHERE MaKH = @maKH
GO

CREATE PROC sp_TimKhachHangTheoMa (@maKH nvarchar(10))
AS
	SELECT *
	FROM KhachHang
	WHERE MaKH = @maKH
GO

CREATE PROC sp_TimKhachHangTheoTen (@tenKH char(50))
AS
	SELECT *
	FROM KhachHang
	WHERE TenKH COLLATE Vietnamese_CI_AI LIKE N'%' + @tenKH + N'%'
GO
----------------------------------------------------
--------------------NHÀ CUNG CẤP--------------------
----------------------------------------------------
---Lấy danh sách thông tin nhà cung cấp
CREATE PROC sp_LayDSNhaCungCap
AS
	SELECT *
	FROM NhaCungCap
GO

---Thêm thông tin nhà cung cấp
CREATE PROC sp_ThemNhaCungCap (@maNCC nvarchar(10), @tenNCC nvarchar(50), @sdt nvarchar(15), @email nvarchar(20), @diaChi nvarchar(200), @loaiHinh nvarchar(20))
AS
	INSERT INTO NhaCungCap (MaNCC, TenNCC, SDT, Email, DiaChi, LoaiHinh)
	VALUES (@maNCC, @tenNCC, @sdt, @email, @diaChi, @loaiHinh)
GO

---Xóa thông tin nhà cung cấp
CREATE PROC sp_XoaNhaCungCap (@maNCC nvarchar(10))
AS
	DELETE 
	FROM NhaCungCap
	WHERE MaNCC = @maNCC
GO

---Sửa thông tin nhà cung cấp
CREATE PROC sp_SuaNhaCungCap (@maNCC nvarchar(10), @tenNCC nvarchar(50), @sdt nvarchar(15), @email nvarchar(20), @diaChi nvarchar(200), @loaiHinh nvarchar(20))
AS
	UPDATE NhaCungCap
	SET TenNCC = @tenNCC, SDT = @sdt, Email = @email, DiaChi = @diaChi, LoaiHinh = @loaiHinh
	WHERE MaNCC = @maNCC
GO

---Tìm thông tin theo tên của nhà cung cấp
CREATE PROC sp_TimTheoTenNhaCungCap (@tenNCC nvarchar(50))
AS
	SELECT *
	FROM NhaCungCap
	WHERE TenNCC COLLATE vietnamese_ci_as LIKE N'%' + @tenNCC + N'%'
GO

---Tìm thông tin theo mã của nhà cung cấp
CREATE PROC sp_TimTheoMaNhaCungCap (@maNCC nvarchar(10))
AS
	SELECT *
	FROM NhaCungCap
	WHERE MaNCC COLLATE vietnamese_ci_as LIKE N'%' + @maNCC + N'%'
GO

----------------------------------------------------
--------------------KHO THIẾT BỊ--------------------
----------------------------------------------------
---Lấy danh sách thông tin kho thiết bị
CREATE PROC sp_LayDSKhoThietBi
AS
	SELECT *
	FROM KhoThietBi
GO

---Thêm thông tin kho thiết bị
CREATE PROC sp_ThemKhoThietBi (@maThietBi nvarchar(10), @tenThietBi nvarchar(50), @soSeri int, @trangThai nvarchar(20))
AS
	INSERT INTO KhoThietBi (MaThietBi, TenThietBi, SoSeri, TrangThai)
	VALUES (@maThietBi, @tenThietBi, @soSeri, @trangThai)
GO

---Xóa thông tin kho thiết bị
CREATE PROC sp_XoaKhoThietBi (@maThietBi nvarchar(10))
AS
	DELETE
	FROM KhoThietBi
	WHERE MaThietBi = @maThietBi
GO

---Sửa thông tin kho thiết bị
CREATE PROC sp_SuaKhoThietBi (@maThietBi nvarchar(10), @tenThietBi nvarchar(50), @soSeri int, @trangThai nvarchar(20))
AS
	UPDATE KhoThietBi
	SET TenThietBi = @tenThietBi, SoSeri = @soSeri, TrangThai = @trangThai
	WHERE MaThietBi = @maThietBi
GO

---Tìm kho thiết bị theo tên thiết bị
CREATE PROC sp_TimTheoTenThietBi (@tenThietBi nvarchar(50))
AS
	SELECT *
	FROM KhoThietBi
	WHERE TenThietBi COLLATE vietnamese_ci_as LIKE N'%' + @tenThietBi + N'%'
GO

---Tìm kho thiết bị theo mã thiết bị
CREATE PROC sp_TimTheoMaThietBi (@maThietBi nvarchar(10))
AS
	SELECT *
	FROM KhoThietBi
	WHERE MaThietBi COLLATE vietnamese_ci_as LIKE N'%' + @maThietBi + N'%'
GO

----------------------------------------------------
---------------------KHO VẬT TƯ---------------------
----------------------------------------------------
---Lấy danh sách thông tin kho vật tư
CREATE PROC sp_LayDSKhoVatTu
AS
	SELECT *
	FROM KhoVatTu
GO

---Thêm thông tin kho vật tư
CREATE PROC sp_ThemKhoVatTu (@maVatTu nvarchar(10), @tenVatTu nvarchar(50), @donViTinh nvarchar(20), @moTa nvarchar(500))
AS
	INSERT INTO KhoVatTu(MaVatTu, TenVatTu, DonViTinh, MoTa)
	VALUES (@maVatTu, @tenVatTu, @donViTinh, @moTa)
GO

---Xóa thông tin kho vật tư
CREATE PROC sp_XoaKhoVatTu (@maVatTu nvarchar(10))
AS
	DELETE
	FROM KhoVatTu
	WHERE MaVatTu = @maVatTu
GO

---Sửa thông tin kho vật tư
CREATE PROC sp_SuaKhoVatTu (@maVatTu nvarchar(10), @tenVatTu nvarchar(50), @donViTinh nvarchar(20), @moTa nvarchar(500))
AS
	UPDATE KhoVatTu
	SET TenVatTu = @tenVatTu, DonViTinh = @donViTinh, MoTa = @moTa
	WHERE MaVatTu = @maVatTu
GO

---Tìm kho thiết bị theo tên thiết bị
CREATE PROC sp_TimTheoTenVatTu (@tenVatTu nvarchar(50))
AS
	SELECT *
	FROM KhoVatTu
	WHERE TenVatTu COLLATE vietnamese_ci_as LIKE N'%' + @tenVatTu + N'%'
GO

---Tìm kho thiết bị theo mã thiết bị
CREATE PROC sp_TimTheoMaVatTu (@maVatTu nvarchar(10))
AS
	SELECT *
	FROM KhoVatTu
	WHERE MaVatTu COLLATE vietnamese_ci_as LIKE N'%' + @maVatTu + N'%'
GO

----------------------------------------------------
--------------THÔNG TIN ĐƠN NHẬP HÀNG---------------
----------------------------------------------------
---Lấy danh sách thông tin đơn nhập hàng
CREATE PROC sp_LayDSThongTinDonNhapHang
AS
	SELECT *
	FROM ThongTinDonNhapHang
GO

---Thêm thông tin đơn nhập hàng
CREATE PROC sp_ThemThongTinDonNhapHang (@maDonHang nvarchar(10), @ngayDatHang date, @maDA nvarchar(10),@maNCC nvarchar(10), @tongGiaTri decimal(18,2), @trangThai nvarchar(20))
AS
	INSERT INTO ThongTinDonNhapHang (MaDonHang, NgayDatHang, MaDA, MaNCC, TongGiaTri, TrangThai)
	VALUES (@maDonHang, @ngayDatHang, @maDA, @maNCC, @tongGiaTri, @trangThai)
GO

---Xóa thông tin đơn nhập hàng
CREATE PROC sp_XoaThongTinDonNhapHang (@maDonHang nvarchar(10))
AS
	DELETE
	FROM ThongTinDonNhapHang
	WHERE MaDonHang = @maDonHang
GO

---Sửa thông tin đơn nhập hàng
CREATE PROC sp_SuaThongTinDonNhapHang (@maDonHang nvarchar(10), @ngayDatHang date, @maDA nvarchar(10),@maNCC nvarchar(10), @tongGiaTri decimal(18,2), @trangThai nvarchar(20))
AS
	UPDATE ThongTinDonNhapHang
	SET NgayDatHang = @ngayDatHang, MaDA = @maDA, MaNCC = @maNCC, TongGiaTri = @tongGiaTri, TrangThai = @trangThai
	WHERE MaDonHang = @maDonHang
GO

---Tìm thông tin đơn nhập hàng theo mã đơn nhập hàng
CREATE PROC sp_TimTheoMaThongTinDonNhapHang (@maDonHang nvarchar(10))
AS
	SELECT *
	FROM ThongTinDonNhapHang
	WHERE MaDonHang = @maDonHang
GO

----------------------------------------------------
-------------CHI TIẾT HÓA ĐƠN NHẬP HÀNG-------------
----------------------------------------------------
---Lấy danh sách chi tiết hóa đơn nhập hàng
CREATE PROC sp_LayDSChiTietHoaDonNhapHang
AS
	SELECT *
	FROM ChiTietHoaDonNhapHang
GO

---Thêm thông tin chi tiết hóa đơn nhập hàng
CREATE PROC sp_ThemChiTietHoaDonNhapHang (@maHoaDon nvarchar(10), @maDonHang nvarchar(10), @maVatTu nvarchar(10), @maThietBi nvarchar(10), @soLuong decimal(18,2), @donGia decimal(18,2))
AS
	INSERT INTO ChiTietHoaDonNhapHang (MaHoaDon, MaDonHang, MaVatTu, MaThietBi, SoLuong, DonGia)
	VALUES (@maHoaDon, @maDonHang, @maVatTu, @maThietBi, @soLuong, @donGia)
GO

---Xóa thông tin chi tiết hóa đơn nhập hàng
CREATE PROC sp_XoaChiTietHoaDonNhapHang (@maHoaDon nvarchar(10))
AS
	DELETE 
	FROM ChiTietHoaDonNhapHang
	WHERE MaHoaDon = @maHoaDon
GO

---Sửa thông tin chi tiết hóa đơn nhập hàng
CREATE PROC sp_SuaChiTietHoaDonNhapHang (@maHoaDon nvarchar(10), @maDonHang nvarchar(10), @maVatTu nvarchar(10), @maThietBi nvarchar(10), @soLuong decimal(18,2), @donGia decimal(18,2))
AS
	UPDATE ChiTietHoaDonNhapHang
	SET MaDonHang = @maDonHang, MaVatTu = @maVatTu, MaThietBi = @maThietBi, SoLuong = @soLuong, DonGia = @donGia
	WHERE MaHoaDon = @maHoaDon
GO

---Tìm chi tiết hóa đơn nhập hàng theo mã hóa đơn
CREATE PROC sp_TimChiTietHoaDonNhapHangTheoMa (@maHoaDon nvarchar(10))
AS
	SELECT *
	FROM ChiTietHoaDonNhapHang
	WHERE MaHoaDon = @maHoaDon
GO