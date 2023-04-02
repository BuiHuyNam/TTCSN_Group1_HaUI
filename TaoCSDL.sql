USE [master]
GO
--Tạo cơ sở dữ liệu
CREATE DATABASE QLBanHang
ON PRIMARY (NAME = 'QLBanHang', FILENAME = 'D:\QLBanHang.mdf', SIZE = 8, MAXSIZE = UNLIMITED, FILEGROWTH = 64)
LOG ON (NAME = 'QLBanHang_log', FILENAME = 'D:\QLBanHang_log.ldf', SIZE = 8, MAXSIZE = UNLIMITED, FILEGROWTH = 64)

GO
USE [QLBanHang]
GO
--Tạo cấu trúc bảng và các ràng buộc
CREATE TABLE HangSX(MaHangSX NCHAR(10) NOT NULL CONSTRAINT PK_HangSX PRIMARY KEY, TenHang NVARCHAR(20), DiaChi NVARCHAR(30), SoDT NVARCHAR(20), Email NVARCHAR(30))
CREATE TABLE SanPham(MaSP NCHAR(10) NOT NULL CONSTRAINT PK_SanPham PRIMARY KEY, MaHangSX NCHAR(10), TenSP NVARCHAR(20), SoLuong INT, MauSac NVARCHAR(20), GiaBan MONEY, DonViTinh NCHAR(10), MoTa NVARCHAR(MAX), CONSTRAINT FK_SanPham_HangSX FOREIGN KEY(MaHangSX) REFERENCES HangSX(MaHangSX))
CREATE TABLE NhanVien(MaNV NCHAR(10) NOT NULL CONSTRAINT PK_NhanVien PRIMARY KEY, TenNV NVARCHAR(20), GioiTinh NCHAR(10), DiaChi NVARCHAR(30), SoDT NVARCHAR(20), Email NVARCHAR(30), TenPhong NVARCHAR(30))
CREATE TABLE PNhap(SoHDN NCHAR(10) NOT NULL CONSTRAINT PK_SoHDN PRIMARY KEY, NgayNhap DATE, MaNV NCHAR(10), CONSTRAINT FK_PNhap_NhanVien FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV))
CREATE TABLE Nhap(SoHDN NCHAR(10) NOT NULL CONSTRAINT PK_Nhap PRIMARY KEY, MaSP NCHAR(10), SoLuongN INT, DonGiaN MONEY, CONSTRAINT FK_Nhap_PNhap FOREIGN KEY(SoHDN) REFERENCES PNhap(SoHDN), CONSTRAINT FK_Nhap_SanPham FOREIGN KEY(MaSP) REFERENCES SanPham(MaSP))
CREATE TABLE PXuat(SoHDX NCHAR(10) NOT NULL CONSTRAINT PK_SoHDX PRIMARY KEY, NgayXuat DATE, MaNV NCHAR(10), CONSTRAINT FK_PXuat_NhanVien FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV))
CREATE TABLE Xuat(SoHDX NCHAR(10) NOT NULL CONSTRAINT PK_Xuat PRIMARY KEY, MaSP NCHAR(10), SoLuongX INT, CONSTRAINT FK_Xuat_PXuat FOREIGN KEY(SoHDX) REFERENCES PXuat(SoHDX), CONSTRAINT FK_Xuat_SanPham FOREIGN KEY(MaSP) REFERENCES SanPham(MaSP))
--Nhập dữ liệu
INSERT INTO HangSX VALUES	(N'H01', N'Samsung', N'Korea', N'011-08271717', N'ss@gmail.com.kr'), 
							(N'H02', N'OPPO', N'China', N'081-08626262', N'oppo@gmail.com.cn'), 
							(N'H03', N'Vinfone', N'Việt Nam', N'084-098262626', N'vf@gmail.com.vn')
INSERT INTO NhanVien VALUES	(N'NV01', N'Nguyễn Thị Thu', N'Nữ', N'Hà Nội', N'0982626521', N'thu@gmail.com', N'Kế toán'),
							(N'NV02', N'Lê Văn Nam', N'Nam', N'Bắc Ninh', N'0972525252', N'nam@gmail.com', N'Vật tư'),
							(N'NV03', N'Trần Hòa Bình', N'Nam', N'Hà Nội', N'0328388388', N'hb@gmail.com', N'Kế toán')
INSERT INTO SanPham VALUES	(N'SP01', N'H02', N'F1 Plus', 100, N'Xám', 7000000, N'Chiếc', N'Hàng cận cao cấp'),
							(N'SP02', N'H01', N'Galaxy Note11', 50, N'Đỏ', 19000000, N'Chiếc', N'Hàng cao cấp'),
							(N'SP03', N'H02', N'F3 Lite', 200, N'Nâu', 3000000, N'Chiếc', N'Hàng phổ thông'),
							(N'SP04', N'H03', N'Vjoy3', 200, N'Xám', 1500000, N'Chiếc', N'Hàng phổ thồn'),
							(N'SP05', N'H01', N'Galaxy V21', 500, N'Nâu', 8000000, N'Chiếc', N'Hàng cận cao cấp')
INSERT INTO PNhap VALUES	(N'N01', '2/5/2019', N'NV01'),
							(N'N02', '4/7/2020', N'NV02'),
							(N'N03', '5/17/2020', N'NV02'),
							(N'N04', '3/22/2020', N'NV03'),
							(N'N05', '7/7/2020', N'NV01')
INSERT INTO Nhap VALUES		(N'N01', 'SP02', 10, 17000000),
							(N'N02', 'SP01', 30, 6000000),
							(N'N03', 'SP04', 20, 1200000),
							(N'N04', 'SP01', 10, 6200000),
							(N'N05', 'SP05', 20, 7000000)
INSERT INTO PXuat VALUES	(N'X01', '6/14/2020', N'NV02'),
							(N'X02', '3/5/2019', N'NV03'),
							(N'X03', '12/12/2020', N'NV01'),
							(N'X04', '6/2/2020', N'NV02'),
							(N'X05', '5/18/2020', N'NV01')
INSERT INTO Xuat VALUES		(N'X01', 'SP03', 5),
							(N'X02', 'SP01', 3),
							(N'X03', 'SP02', 1),
							(N'X04', 'SP03', 2),
							(N'X05', 'SP05', 1)