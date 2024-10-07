use master
go
drop database QuanLySanPham

USE master;  -- Chuyển về cơ sở dữ liệu master
ALTER DATABASE QuanLySanPham SET SINGLE_USER WITH ROLLBACK IMMEDIATE;  -- Ngắt tất cả kết nối
DROP DATABASE QuanLySanPham;  -- Xóa cơ sở dữ liệu

create database QuanLySanPham
go
use QuanLySanPham
go

-- Tạo bảng Catalog
CREATE TABLE Catalog (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CatalogCode NVARCHAR(250) NOT NULL,
    CatalogName NVARCHAR(250) NOT NULL
);

-- Tạo bảng Product
CREATE TABLE Product (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CatalogId INT NOT NULL,
    ProductCode NVARCHAR(50) NOT NULL,
    ProductName NVARCHAR(MAX) NOT NULL,
    Picture NVARCHAR(MAX),
    UnitPrice FLOAT,
    FOREIGN KEY (CatalogId) REFERENCES Catalog(Id)
);

-- Thêm dữ liệu vào bảng Catalog
INSERT INTO Catalog (CatalogCode, CatalogName) VALUES
('DM1', 'Điện Thoại'),
('DM2', 'Máy Tính'),
('DM3', 'Thời trang'),
('DM4', 'Gia Dụng'),
('CAT113', 'Hàng cháy nổ');

-- Thêm dữ liệu vào bảng Product
INSERT INTO Product (CatalogId, ProductCode, ProductName, Picture, UnitPrice) VALUES
(1, 'PRO01', 'Samsung J7', NULL, 10000000),
(1, 'PRO02', 'iPhone X', NULL, 30000000),
(2, 'PRO03', 'Laptop Dell Inspiron 1500', NULL, 12000000),
(3, 'PRO04', 'Laptop Dell Inspiron 3000', NULL, 13000000),
(4, 'PRO05', 'Acer', NULL, 9000000);
-- Cập nhật dữ liệu trong bảng Product
UPDATE Product
SET Picture = 
    CASE 
        WHEN ProductCode = 'PRO01' THEN 'PRO01.png'
        WHEN ProductCode = 'PRO02' THEN 'PRO02.png'
        WHEN ProductCode = 'PRO03' THEN 'PRO03.png'
        WHEN ProductCode = 'PRO04' THEN 'PRO04.png'
        WHEN ProductCode = 'PRO05' THEN 'PRO05.png'
        ELSE Picture  -- Giữ nguyên nếu không khớp
    END
WHERE ProductCode IN ('PRO01', 'PRO02', 'PRO03', 'PRO04', 'PRO05');