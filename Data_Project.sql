use CongTyXayDung
go

INSERT INTO PhongBan (MaPB, TenPB, TruongPhong) VALUES
('PB001', N'Quản lý Dự án', Null),
('PB002', N'Kỹ thuật & Thiết kế', null),
('PB003', N'Hành chính - Kế toán', null);
go

INSERT INTO ChucVu (MaCV, TenCV) VALUES
('CV001', N'Giám đốc Dự án'),
('CV002', N'Kỹ sư Xây dựng'),
('CV003', N'Quản lý Hành chính'),
('CV004', N'Kế toán trưởng');
go

INSERT INTO NhanVien (MaNV, HoNV, TenNV, NgaySinh, GioiTinh, DiaChi, QQuan, email, SDT, Luong, MaPB, MaCV) VALUES
('NV001', N'Nguyễn', N'Văn An', '1985-05-15', 'Nam', N'10 Hai Bà Trưng, HN', N'Hà Nội', 'an.nguyen@ctxd.com', '0987123456', 35000000, 'PB001', 'CV001'),
('NV002', N'Trần', N'Thị Bình', '1990-11-20', 'Nữ', N'25 Lê Lợi, HCM', N'TP.HCM', 'binh.tran@ctxd.com', '0901234567', 25000000, 'PB001', 'CV002'),
('NV003', N'Lê', N'Văn Chính', '1992-03-01', 'Nam', N'12 Lý Thường Kiệt, ĐN', N'Đà Nẵng', 'chinh.le@ctxd.com', '0912345678', 22000000, 'PB002', 'CV002'),
('NV004', N'Phạm', N'Thị Mai', '1988-08-28', 'Nữ', N'33 Phan Đình Phùng, HN', N'Hà Nội', 'mai.pham@ctxd.com', '0978876543', 28000000, 'PB002', 'CV004'),
('NV005', N'Đỗ', N'Minh Huy', '1995-07-07', 'Nam', N'44 CMT8, HCM', N'TP.HCM', 'huy.do@ctxd.com', '0909987654', 18000000, 'PB003', 'CV003');
go

UPDATE PhongBan 
SET TruongPhong = 'NV001' 
WHERE MaPB = 'PB001'; 

UPDATE PhongBan 
SET TruongPhong = 'NV004' 
WHERE MaPB = 'PB002';

UPDATE PhongBan 
SET TruongPhong = 'NV005' 
WHERE MaPB = 'PB003';

INSERT INTO KhachHang (MaKH, TenKH, SDT, Email) VALUES
('KH001', N'Công ty Bất động sản A', '0243888999', 'bds.a@info.com'),
('KH002', N'Tập đoàn Phát triển X', '0289000111', 'tapdoanx@mail.com');
go

INSERT INTO DuAn (MaDA, TenDA, DiaDiem, MaPB, KinhPhi, NgayKhoiCong, NgayKetThucDuKien, TrangThai, MaKH) VALUES
('DA001', N'Chung cư cao cấp S1', N'TP.HCM', 'PB001', 500000000000.00, '2024-01-10', '2026-12-31', N'Đang thi công', 'KH001'),
('DA002', N'Khu phức hợp văn phòng', N'Hà Nội', 'PB002', 300000000000.00, '2025-03-01', '2027-06-30', N'Đang thiết kế', 'KH002');
go

INSERT INTO PhanCong (MaNV, MaDA, VaiTro, NgayBatDauCongViec, NgayKetThucCongViec) VALUES
('NV001', 'DA001', N'Giám sát Tổng thể', '2024-01-10', '2026-12-31'),
('NV002', 'DA001', N'Kỹ sư hiện trường', '2024-03-01', '2026-12-31'),
('NV003', 'DA002', N'Kỹ sư thiết kế chính', '2025-03-01', '2025-12-31'),
('NV004', 'DA002', N'Quản lý Hợp đồng', '2025-02-01', '2027-06-30');
go

INSERT INTO NhaCungCap (MaNCC, TenNCC, SDT, Email, DiaChi, LoaiHinh) VALUES
('NCC001', N'Công ty Thép Hòa Phát', '0243999888', 'sales@hoaphat.com', N'KCN Phố Nối A, Hưng Yên', 'VatTu'),
('NCC002', N'Xi măng Hà Tiên', '0283888777', 'contact@hatien.com', N'Kiên Lương, Kiên Giang', 'VatTu'),
('NCC003', N'Máy Xây Dựng Komatsu', '0909123123', 'vn@komatsu.com', N'KCN Thăng Long, Hà Nội', 'ThietBi');
go

INSERT INTO KhoVatTu (MaVatTu, TenVatTu, DonViTinh, MoTa) VALUES
('VT001', N'Thép cuộn phi 6', N'Tấn', N'Thép xây dựng chịu lực'),
('VT002', N'Xi măng PCB40', N'Bao', N'Xi măng đa dụng 50kg/bao'),
('VT003', N'Cát vàng', N'm3', N'Cát đổ bê tông'),
('VT004', N'Gạch ống 4 lỗ', N'Cái', N'Gạch tuynel xây tường'),
('VT005', N'Sơn ngoại thất', N'Lít', N'Sơn chống thấm ngoài trời');
go

--INSERT INTO KhoThietBi (MaThietBi, TenThietBi, SoSeri, TrangThai) VALUES
--('TB001', N'Máy xúc đào Hitachi', 10001, N'Đang sử dụng'),
--('TB002', N'Máy trộn bê tông 350L', 10002, N'Sẵn sàng'),
--('TB003', N'Máy đầm cóc', 10003, N'Đang sửa chữa'),
--('TB004', N'Cần cẩu tháp', 10004, N'Đang sử dụng'),
--('TB005', N'Máy phát điện công nghiệp', 10005, N'Sẵn sàng');
--go

INSERT INTO ThongTinDonNhapHang (MaDonHang, NgayDatHang, MaDA, MaNCC, TongGiaTri, TrangThai) VALUES
('DH001', '2024-02-15', 'DA001', 'NCC001', 500000000, N'Đã giao hàng'),
('DH002', '2024-02-20', 'DA001', 'NCC002', 150000000, N'Đã giao hàng'),
('DH003', '2025-03-10', 'DA002', 'NCC003', 2000000000, N'Đã duyệt'),
('DH004', '2025-04-01', 'DA002', 'NCC001', 0, N'Chờ duyệt'); -- Đơn mới tạo chưa có chi tiết nên giá = 0
go

ALTER TABLE KhoThietBi DROP CONSTRAINT CHK_ThietBi_TrangThai;
GO

-- 1.2 Chuyển cột TrangThai và TenThietBi sang NVARCHAR (để lưu tiếng Việt đúng)
ALTER TABLE KhoThietBi ALTER COLUMN TrangThai NVARCHAR(20);
ALTER TABLE KhoThietBi ALTER COLUMN TenThietBi NVARCHAR(50);
GO

-- 1.3 Tạo lại ràng buộc Check
ALTER TABLE KhoThietBi 
ADD CONSTRAINT CHK_ThietBi_TrangThai 
CHECK (TrangThai IN (N'Sẵn sàng', N'Đang sửa chữa', N'Đang sử dụng', N'Thanh lý'));
GO

-- BƯỚC 2: NHẬP LẠI DỮ LIỆU KHO THIẾT BỊ (Đã sửa lỗi)
INSERT INTO KhoThietBi (MaThietBi, TenThietBi, SoSeri, TrangThai) VALUES
('TB001', N'Máy xúc đào Hitachi', 10001, N'Đang sử dụng'),
('TB002', N'Máy trộn bê tông 350L', 10002, N'Sẵn sàng'),
('TB003', N'Máy đầm cóc', 10003, N'Đang sửa chữa'),
('TB004', N'Cần cẩu tháp', 10004, N'Đang sử dụng'),
('TB005', N'Máy phát điện công nghiệp', 10005, N'Sẵn sàng');
GO

-- BƯỚC 3: NHẬP LẠI DỮ LIỆU CHI TIẾT HÓA ĐƠN (Lúc nãy bị lỗi do thiếu thiết bị)
INSERT INTO ChiTietHoaDonNhapHang (MaHoaDon, MaDonHang, MaVatTu, MaThietBi, SoLuong, DonGia) VALUES
('HD001', 'DH001', 'VT001', NULL, 25, 20000000), 
('HD002', 'DH002', 'VT002', NULL, 1000, 90000),  
('HD003', 'DH002', 'VT003', NULL, 200, 300000),   
('HD004', 'DH003', NULL, 'TB001', 1, 1500000000), 
('HD005', 'DH003', NULL, 'TB002', 2, 250000000);  
GO