USE [master]
GO
/****** Object:  Database [QLNhaHang_BTL]    Script Date: 11/23/2024 4:08:11 PM ******/
CREATE DATABASE [QLNhaHang_BTL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNhaHang_BTL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLNhaHang_BTL.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLNhaHang_BTL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLNhaHang_BTL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLNhaHang_BTL] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNhaHang_BTL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNhaHang_BTL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLNhaHang_BTL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNhaHang_BTL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNhaHang_BTL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLNhaHang_BTL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNhaHang_BTL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLNhaHang_BTL] SET  MULTI_USER 
GO
ALTER DATABASE [QLNhaHang_BTL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNhaHang_BTL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNhaHang_BTL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNhaHang_BTL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNhaHang_BTL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLNhaHang_BTL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLNhaHang_BTL] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLNhaHang_BTL] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLNhaHang_BTL]
GO
/****** Object:  Table [dbo].[NguyenLieu]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieu](
	[NL_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNguyenLieu] [nvarchar](100) NULL,
	[GiaTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[NL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongThuc]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongThuc](
	[CT_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[NL_ID] [int] NULL,
	[SoLuong] [decimal](18, 2) NOT NULL,
	[GhiChu] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[cau3]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[cau3] 
(
	@id int
)
returns table
as
return
	select CongThuc.NL_ID, TenNguyenLieu
	from CongThuc
	inner join NguyenLieu on CongThuc.NL_ID = NguyenLieu.NL_ID
	where CongThuc.Product_ID = @id
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[DH_ID] [int] IDENTITY(1,1) NOT NULL,
	[KH_ID] [int] NULL,
	[Ban_ID] [int] NULL,
	[KM_ID] [int] NULL,
	[GioVao] [datetime] NULL,
	[GioRa] [datetime] NULL,
	[TongTien] [money] NULL,
	[NV_ID] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
	[TrangThai] [bit] NULL,
	[VanChuyen] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[CTHD_ID] [int] IDENTITY(1,1) NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [money] NULL,
	[DH_ID] [int] NOT NULL,
	[Product_ID] [int] NULL,
	[Ghichu] [nvarchar](500) NULL,
	[GiamGia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CTHD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[cau4]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[cau4]
(
	@id int,
	@thang int,
	@nam int
)
returns table
as
return
	
	select Product_ID, SUM(ThanhTien) as DoanhThu, SUM(ThanhTien) - 
	(select SUM(SoLuong*GiaTien)
	from NguyenLieu
	inner join CongThuc on CongThuc.NL_ID = NguyenLieu.NL_ID
	where @id = CongThuc.Product_ID
	group by CongThuc.Product_ID) as LoiNhuan
	from ChiTietHoaDon
	inner join DonHang on ChiTietHoaDon.DH_ID = DonHang.DH_ID
	where @id = Product_ID and @thang = month(DonHang.GioRa) and @nam = YEAR(DonHang.GioRa)
	group by ChiTietHoaDon.Product_ID
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[Ban_ID] [int] IDENTITY(1,1) NOT NULL,
	[SoChoNgoi] [int] NULL,
	[Ghi Chu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Ban_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Cate_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSanPham] [nvarchar](100) NULL,
	[MoTa] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[CTHDN_ID] [int] IDENTITY(1,1) NOT NULL,
	[HDN_ID] [int] NOT NULL,
	[NL_ID] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[CTHDN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[HDN_ID] [int] IDENTITY(1,1) NOT NULL,
	[NCC_ID] [int] NOT NULL,
	[NV_ID] [int] NOT NULL,
	[NgayLapHoaDon] [datetime] NULL,
	[NgayNhanHang] [datetime] NULL,
	[TongSoTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[HDN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[KH_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [varchar](15) NULL,
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[PathPhoto] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[KH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[KM_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenKhuyenMai] [nvarchar](100) NULL,
	[GiamGia] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[KM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NgayCong]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NgayCong](
	[NC_ID] [int] IDENTITY(1,1) NOT NULL,
	[NgayCong] [date] NULL,
	[CaLam] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[NCC_ID] [int] NOT NULL,
	[TenNhaCungCap] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[NCC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[NV_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhanVien] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](200) NULL,
	[HeSoLuong] [decimal](5, 2) NULL,
	[PathPhoto] [nvarchar](100) NULL,
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[SoDienThoai] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[NV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NV_NC]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NV_NC](
	[NVNC_ID] [int] IDENTITY(1,1) NOT NULL,
	[NV_ID] [int] NULL,
	[NC_ID] [int] NULL,
	[KiemTra] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NVNC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NV_PQ]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NV_PQ](
	[NV_PQ_ID] [int] IDENTITY(1,1) NOT NULL,
	[NV_ID] [int] NULL,
	[PQ_ID] [int] NULL,
	[MoTa] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[NV_PQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[PQ_ID] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Cate_ID] [int] NULL,
	[TenSanPham] [nvarchar](100) NULL,
	[MoTa] [nvarchar](500) NULL,
	[GiaTien] [money] NULL,
	[PathPhoto] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductConditions]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductConditions](
	[ProductCondition_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NULL,
	[Condition] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCondition_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thuong]    Script Date: 11/23/2024 4:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thuong](
	[T_ID] [int] IDENTITY(1,1) NOT NULL,
	[NV_ID] [int] NULL,
	[TenThuong] [nvarchar](100) NULL,
	[TienThuong] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[T_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ban] ON 

INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (1, 1, N'Tên Khách gọi Đồ: Dung')
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (2, 10, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (3, 20, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (4, 2, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (5, 10, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (6, 10, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (7, 2, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (8, 2, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (9, 6, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (10, 8, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (11, 3, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (12, 4, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (13, 5, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (14, 6, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (15, 7, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (16, 3, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (17, 2, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (18, 4, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (19, 6, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (20, 7, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (21, 8, NULL)
INSERT [dbo].[Ban] ([Ban_ID], [SoChoNgoi], [Ghi Chu]) VALUES (22, 5, NULL)
SET IDENTITY_INSERT [dbo].[Ban] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Cate_ID], [TenLoaiSanPham], [MoTa]) VALUES (1, N'COFFEE', NULL)
INSERT [dbo].[Category] ([Cate_ID], [TenLoaiSanPham], [MoTa]) VALUES (2, N'FREEZE', NULL)
INSERT [dbo].[Category] ([Cate_ID], [TenLoaiSanPham], [MoTa]) VALUES (3, N'TEA', NULL)
INSERT [dbo].[Category] ([Cate_ID], [TenLoaiSanPham], [MoTa]) VALUES (4, N'JUICE', NULL)
INSERT [dbo].[Category] ([Cate_ID], [TenLoaiSanPham], [MoTa]) VALUES (5, N'HOT DRINK', NULL)
INSERT [dbo].[Category] ([Cate_ID], [TenLoaiSanPham], [MoTa]) VALUES (6, N'SIGNATURE', NULL)
INSERT [dbo].[Category] ([Cate_ID], [TenLoaiSanPham], [MoTa]) VALUES (7, N'TOPPING', NULL)
INSERT [dbo].[Category] ([Cate_ID], [TenLoaiSanPham], [MoTa]) VALUES (8, N'CAKE', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (181, 2, 60000.0000, 122, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (182, 2, 50000.0000, 123, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (183, 2, 60000.0000, 124, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (184, 3, 90000.0000, 125, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (185, 2, 60000.0000, 126, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (189, 2, 50000.0000, 129, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (190, 2, 60000.0000, 131, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (191, 2, 60000.0000, 132, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (192, 3, 90000.0000, 133, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (193, 2, 56000.0000, 135, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (224, 2, 60000.0000, 166, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (227, 2, 60000.0000, 170, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (234, 3, 114000.0000, 174, 8, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (246, 2, 60000.0000, 204, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (247, 2, 60000.0000, 205, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (248, 2, 50000.0000, 205, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (249, 2, 60000.0000, 206, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (250, 2, 56000.0000, 206, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (251, 3, 90000.0000, 207, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (252, 2, 60000.0000, 211, 35, N'Trạng Thái:  Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (253, 2, 50000.0000, 211, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (255, 3, 90000.0000, 212, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (256, 3, 105000.0000, 214, 2, N'Trạng Thái: Ít đá Ghi Chú: Ngọt', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (257, 2, 50000.0000, 215, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (258, 3, 75000.0000, 216, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (259, 3, 84000.0000, 217, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (260, 2, 60000.0000, 219, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (261, 2, 60000.0000, 220, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (262, 2, 60000.0000, 222, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (263, 3, 75000.0000, 222, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (264, 4, 120000.0000, 224, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (265, 2, 50000.0000, 224, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (266, 2, 60000.0000, 226, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (267, 3, 90000.0000, 227, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (268, 3, 90000.0000, 229, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (272, 4, 120000.0000, 232, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (273, 2, 60000.0000, 234, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (274, 2, 60000.0000, 236, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (275, 2, 60000.0000, 237, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (276, 1, 30000.0000, 239, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (277, 1, 30000.0000, 240, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (278, 3, 75000.0000, 240, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (279, 2, 98000.0000, 241, 15, N'Trạng Thái:  Ghi Chú: sieu mát', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (282, 5, 150000.0000, 242, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (283, 1, 30000.0000, 243, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (284, 2, 60000.0000, 244, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (285, 2, 50000.0000, 245, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (286, 3, 90000.0000, 246, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (289, 2, 60000.0000, 251, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (290, 2, 60000.0000, 252, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (292, 1, 30000.0000, 254, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (293, 1, 25000.0000, 254, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (294, 2, 60000.0000, 255, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (295, 3, 90000.0000, 256, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (296, 3, 75000.0000, 256, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (297, 2, 60000.0000, 263, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (298, 2, 56000.0000, 263, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (299, 1, 25000.0000, 264, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (300, 3, 90000.0000, 266, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (301, 2, 50000.0000, 266, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (302, 2, 60000.0000, 266, 9, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (303, 1000, 40000000.0000, 267, 19, N'Trạng Thái: Ít ngọt Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (304, 2, 56000.0000, 270, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (305, 8, 240000.0000, 275, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (306, 4, 100000.0000, 275, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (309, 3, 90000.0000, 279, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (311, 4, 100000.0000, 280, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (312, 3, 84000.0000, 280, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (313, 2, 60000.0000, 281, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (314, 3, 75000.0000, 282, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (315, 2, 60000.0000, 283, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (316, 2, 60000.0000, 284, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (317, 2, 50000.0000, 286, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (318, 3, 90000.0000, 289, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (319, 3, 84000.0000, 289, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (320, 3, 90000.0000, 292, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (321, 2, 60000.0000, 294, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (322, 3, 90000.0000, 295, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (324, 1, 40000.0000, 297, 11, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (325, 3, 90000.0000, 298, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (326, 4, 112000.0000, 298, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (327, 4, 160000.0000, 298, 10, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (328, 2, 60000.0000, 299, 9, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (329, 4, 120000.0000, 301, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (330, 3, 147000.0000, 301, 15, N'Trạng Thái:  Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (331, 4, 120000.0000, 302, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (332, 4, 160000.0000, 302, 10, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (333, 2, 60000.0000, 303, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (334, 5, 150000.0000, 304, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (336, 3, 75000.0000, 304, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (339, 2, 76000.0000, 305, 8, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (340, 2, 60000.0000, 306, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (341, 2, 60000.0000, 307, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (342, 2, 60000.0000, 308, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (343, 1, 40000.0000, 309, 37, N'Trạng Thái:  Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (344, 3, 90000.0000, 309, 35, N'Trạng Thái:  Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (345, 1, 30000.0000, 312, 1, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (346, 2, 100000.0000, 312, 29, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (347, 5, 190000.0000, 312, 8, NULL, NULL)
GO
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (348, 9, 360000.0000, 312, 17, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (349, 1, 30000.0000, 312, 1, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (350, 1, 30000.0000, 312, 1, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (352, 2, 60000.0000, 313, 1, N'Trạng Thái: Đá Ghi Chú: Cho thêm ít Đường', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (353, 3, 114000.0000, 314, 8, N'Trạng Thái: Đá Ghi Chú: Dũng', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (354, 3, 90000.0000, 316, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (355, 1, 25000.0000, 317, 6, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (356, 3, 90000.0000, 318, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (357, 1, 25000.0000, 319, 6, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (358, 4, 152000.0000, 319, 8, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (359, 5, 200000.0000, 319, 10, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (360, 4, 120000.0000, 320, 1, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (361, 5, 125000.0000, 320, 6, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (362, 1, 30000.0000, 321, 1, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (363, 8, 224000.0000, 321, 7, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (364, 1, 30000.0000, 322, 1, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (365, 1, 30000.0000, 322, 9, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (366, 1, 28000.0000, 322, 7, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (367, 1, 25000.0000, 323, 6, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (368, 2, 50000.0000, 326, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (369, 4, 120000.0000, 327, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (370, 3, 147000.0000, 327, 14, N'Trạng Thái:  Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (371, 1, 30000.0000, 325, 1, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (372, 1, 25000.0000, 325, 6, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (373, 1, 28000.0000, 325, 7, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (374, 1, 38000.0000, 325, 8, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (375, 1, 30000.0000, 329, 1, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (376, 1, 28000.0000, 329, 7, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (377, 1, 40000.0000, 330, 11, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (378, 1, 28000.0000, 330, 7, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (379, 2, 60000.0000, 334, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (380, 2, 76000.0000, 334, 8, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (381, 3, 90000.0000, 335, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (382, 4, 120000.0000, 336, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (383, 3, 90000.0000, 337, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (384, 1, 30000.0000, 332, 1, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (385, 3, 90000.0000, 344, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (386, 1, 25000.0000, 339, 6, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (387, 1, 28000.0000, 339, 7, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (388, 3, 75000.0000, 347, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (389, 4, 120000.0000, 347, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (390, 3, 84000.0000, 347, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (391, 2, 50000.0000, 348, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (402, 3, 90000.0000, 353, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (403, 1, 30000.0000, 354, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (404, 1, 25000.0000, 354, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (405, 1, 30000.0000, 355, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (406, 1, 25000.0000, 355, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (407, 3, 90000.0000, 356, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (408, 2, 50000.0000, 357, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (409, 2, 50000.0000, 359, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (410, 2, 50000.0000, 360, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (411, 1, 30000.0000, 361, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (412, 1, 25000.0000, 361, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (413, 1, 28000.0000, 361, 7, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (414, 1, 30000.0000, 362, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (415, 1, 25000.0000, 362, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (416, 1, 30000.0000, 363, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (417, 1, 25000.0000, 363, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (418, 1, 30000.0000, 364, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (419, 1, 25000.0000, 364, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (420, 1, 28000.0000, 364, 7, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (421, 1, 30000.0000, 365, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (422, 1, 25000.0000, 365, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (423, 1, 30000.0000, 365, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (424, 1, 30000.0000, 366, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (425, 1, 25000.0000, 366, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (426, 1, 30000.0000, 366, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (427, 1, 30000.0000, 367, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (428, 1, 25000.0000, 367, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (429, 1, 30000.0000, 367, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (430, 1, 30000.0000, 368, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (431, 1, 25000.0000, 368, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (432, 1, 30000.0000, 369, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (433, 1, 30000.0000, 370, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (434, 1, 30000.0000, 371, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (435, 1, 28000.0000, 371, 7, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (436, 1, 30000.0000, 372, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (437, 1, 30000.0000, 373, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (438, 1, 30000.0000, 374, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (439, 1, 25000.0000, 374, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (440, 3, 90000.0000, 376, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (441, 2, 50000.0000, 377, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (442, 3, 90000.0000, 378, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (443, 1, 30000.0000, 379, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (444, 2, 76000.0000, 381, 8, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (445, 3, 75000.0000, 382, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (446, 2, 56000.0000, 383, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (447, 2, 60000.0000, 385, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (448, 1, 30000.0000, 386, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (449, 1, 30000.0000, 387, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (450, 1, 30000.0000, 388, 9, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (451, 1, 30000.0000, 391, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (452, 1, 30000.0000, 392, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (453, 2, 50000.0000, 393, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (454, 3, 84000.0000, 395, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (455, 2, 76000.0000, 396, 8, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (456, 1, 30000.0000, 397, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (457, 1, 30000.0000, 398, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (458, 1, 30000.0000, 399, 1, NULL, 0)
GO
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (459, 1, 25000.0000, 399, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (460, 10, 300000.0000, 400, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (461, 1, 30000.0000, 401, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (462, 1, 50000.0000, 402, 12, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (463, 2, 60000.0000, 403, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (464, 1, 25000.0000, 404, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (465, 2, 56000.0000, 405, 7, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (466, 1, 30000.0000, 406, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (467, 1, 25000.0000, 406, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (468, 2, 50000.0000, 407, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (469, 1, 30000.0000, 408, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (470, 2, 60000.0000, 410, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (471, 2, 70000.0000, 410, 2, N'Trạng Thái: Bớt chua Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (472, 1, 35000.0000, 411, 2, N'Trạng Thái: Bớt chua Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (473, 2, 60000.0000, 412, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (474, 2, 60000.0000, 413, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (475, 2, 50000.0000, 414, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (476, 2, 76000.0000, 414, 8, N'Trạng Thái: Đá Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (477, 2, 60000.0000, 416, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (478, 1, 30000.0000, 417, 21, N'Trạng Thái: Ít ngọt Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (479, 1, 25000.0000, 417, 6, N'Trạng Thái: Ít đường Ghi Chú: hahahah', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (480, 2, 50000.0000, 418, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (481, 2, 98000.0000, 420, 14, N'Trạng Thái:  Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (482, 2, 50000.0000, 421, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (483, 2, 50000.0000, 422, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (484, 3, 75000.0000, 423, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (485, 2, 60000.0000, 424, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (486, 1, 35000.0000, 426, 2, N'Trạng Thái: Bớt chua Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (488, 3, 75000.0000, 426, 6, N'Trạng Thái: Ít đường Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (489, 1, 30000.0000, 427, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (490, 1, 30000.0000, 429, 1, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (491, 1, 25000.0000, 429, 6, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (492, 1, 30000.0000, 430, 1, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (493, 1, 25000.0000, 430, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (494, 1, 28000.0000, 430, 7, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (495, 1, 25000.0000, 431, 6, NULL, 0)
INSERT [dbo].[ChiTietHoaDon] ([CTHD_ID], [SoLuong], [ThanhTien], [DH_ID], [Product_ID], [Ghichu], [GiamGia]) VALUES (496, 2, 60000.0000, 432, 1, N'Trạng Thái: Nóng Ghi Chú: ', NULL)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonNhap] ON 

INSERT [dbo].[ChiTietHoaDonNhap] ([CTHDN_ID], [HDN_ID], [NL_ID], [SoLuong], [ThanhTien]) VALUES (1, 2, 1, 10, 100000.0000)
INSERT [dbo].[ChiTietHoaDonNhap] ([CTHDN_ID], [HDN_ID], [NL_ID], [SoLuong], [ThanhTien]) VALUES (2, 2, 1, 10, 100000.0000)
INSERT [dbo].[ChiTietHoaDonNhap] ([CTHDN_ID], [HDN_ID], [NL_ID], [SoLuong], [ThanhTien]) VALUES (3, 2, 1, 15, 150000.0000)
INSERT [dbo].[ChiTietHoaDonNhap] ([CTHDN_ID], [HDN_ID], [NL_ID], [SoLuong], [ThanhTien]) VALUES (4, 2, 1, 15, 150000.0000)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[CongThuc] ON 

INSERT [dbo].[CongThuc] ([CT_ID], [Product_ID], [NL_ID], [SoLuong], [GhiChu]) VALUES (1, 2, 1, CAST(5.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[CongThuc] ([CT_ID], [Product_ID], [NL_ID], [SoLuong], [GhiChu]) VALUES (2, 2, 4, CAST(1.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[CongThuc] ([CT_ID], [Product_ID], [NL_ID], [SoLuong], [GhiChu]) VALUES (3, 2, 3, CAST(1.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[CongThuc] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (2, 2, NULL, NULL, CAST(N'2024-12-10T05:08:40.000' AS DateTime), CAST(N'2024-12-10T05:30:00.000' AS DateTime), 10000.0000, 1, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (3, 2, NULL, NULL, CAST(N'2022-12-10T01:18:20.000' AS DateTime), CAST(N'2022-12-10T05:30:00.000' AS DateTime), 5000.0000, 1, NULL, 1, 0)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (4, 3, NULL, NULL, CAST(N'2022-12-10T01:08:51.000' AS DateTime), CAST(N'2022-12-10T03:30:00.000' AS DateTime), 0.0000, 3, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (8, NULL, 17, NULL, CAST(N'2024-12-11T00:00:00.000' AS DateTime), CAST(N'2024-12-11T00:00:00.000' AS DateTime), 0.0000, 3, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (9, NULL, 10, NULL, CAST(N'2024-10-22T11:18:47.020' AS DateTime), CAST(N'2024-10-22T12:14:23.020' AS DateTime), 0.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (92, NULL, 4, NULL, CAST(N'2024-10-24T00:48:31.993' AS DateTime), CAST(N'2024-10-24T01:13:37.993' AS DateTime), 0.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (94, NULL, 22, NULL, CAST(N'2024-10-24T00:19:13.687' AS DateTime), CAST(N'2024-10-24T01:17:17.687' AS DateTime), 0.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (95, NULL, 16, NULL, CAST(N'2024-10-24T01:14:40.897' AS DateTime), CAST(N'2024-10-24T08:33:50.897' AS DateTime), 0.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (97, NULL, 2, NULL, CAST(N'2024-10-24T13:06:39.453' AS DateTime), CAST(N'2024-10-24T15:03:09.453' AS DateTime), 0.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (98, NULL, 10, NULL, CAST(N'2024-10-24T13:46:43.447' AS DateTime), CAST(N'2024-10-24T15:16:36.447' AS DateTime), 0.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (100, NULL, 14, NULL, CAST(N'2024-10-24T00:47:32.897' AS DateTime), CAST(N'2024-10-24T16:23:11.897' AS DateTime), 0.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (116, NULL, 12, NULL, CAST(N'2024-10-24T16:22:19.267' AS DateTime), CAST(N'2024-10-24T21:46:24.267' AS DateTime), 0.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (117, NULL, 21, NULL, CAST(N'2024-10-24T03:38:26.357' AS DateTime), CAST(N'2024-10-24T22:10:54.357' AS DateTime), 0.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (120, NULL, 21, NULL, CAST(N'2024-10-24T08:38:24.917' AS DateTime), CAST(N'2024-10-24T22:21:30.917' AS DateTime), 0.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (121, NULL, 1, NULL, CAST(N'2024-10-24T10:22:49.013' AS DateTime), CAST(N'2024-10-24T22:23:13.013' AS DateTime), 0.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (122, NULL, 13, NULL, CAST(N'2024-10-24T20:02:58.157' AS DateTime), CAST(N'2024-10-24T22:41:58.157' AS DateTime), 60000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (123, NULL, 20, NULL, CAST(N'2024-10-24T03:09:02.630' AS DateTime), CAST(N'2024-10-24T22:45:12.630' AS DateTime), 50000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (124, NULL, 3, NULL, CAST(N'2024-10-24T18:33:04.473' AS DateTime), CAST(N'2024-10-24T22:50:11.473' AS DateTime), 60000.0000, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (125, NULL, 8, NULL, CAST(N'2024-10-25T00:07:56.913' AS DateTime), CAST(N'2024-10-25T08:14:58.913' AS DateTime), 90000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (126, NULL, 12, NULL, CAST(N'2024-10-25T02:22:47.630' AS DateTime), CAST(N'2024-10-25T08:21:40.630' AS DateTime), 60000.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (127, NULL, 21, NULL, CAST(N'2024-10-25T02:11:37.643' AS DateTime), CAST(N'2024-10-25T08:25:04.643' AS DateTime), 0.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (128, NULL, 15, NULL, CAST(N'2024-10-25T06:50:24.820' AS DateTime), CAST(N'2024-10-25T09:31:13.820' AS DateTime), 0.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (129, NULL, 22, NULL, CAST(N'2024-10-25T07:44:10.670' AS DateTime), CAST(N'2024-10-25T09:36:20.670' AS DateTime), 50000.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (131, NULL, 5, NULL, CAST(N'2024-10-25T00:33:15.810' AS DateTime), CAST(N'2024-10-25T09:38:04.810' AS DateTime), 60000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (132, NULL, 11, NULL, CAST(N'2024-10-25T07:16:41.263' AS DateTime), CAST(N'2024-10-25T09:40:11.263' AS DateTime), 60000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (133, NULL, 7, NULL, CAST(N'2024-10-25T06:54:09.233' AS DateTime), CAST(N'2024-10-25T09:42:05.233' AS DateTime), 90000.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (135, NULL, 20, NULL, CAST(N'2024-10-25T01:03:08.760' AS DateTime), CAST(N'2024-10-25T09:45:47.760' AS DateTime), 56000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (136, NULL, 6, NULL, CAST(N'2024-10-25T04:41:27.383' AS DateTime), CAST(N'2024-10-25T09:49:57.383' AS DateTime), 0.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (137, NULL, 19, NULL, CAST(N'2024-10-25T04:10:17.107' AS DateTime), CAST(N'2024-10-25T09:52:07.107' AS DateTime), 0.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (138, NULL, 4, NULL, CAST(N'2024-10-25T07:36:10.723' AS DateTime), CAST(N'2024-10-25T09:53:28.723' AS DateTime), 0.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (139, NULL, 6, NULL, CAST(N'2024-10-25T08:28:07.497' AS DateTime), CAST(N'2024-10-25T09:55:05.497' AS DateTime), 0.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (141, NULL, 14, NULL, CAST(N'2024-10-25T08:08:16.627' AS DateTime), CAST(N'2024-10-25T10:02:34.627' AS DateTime), 0.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (142, NULL, 1, NULL, CAST(N'2024-10-25T01:08:13.873' AS DateTime), CAST(N'2024-10-25T10:09:16.873' AS DateTime), 0.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (144, NULL, 10, NULL, CAST(N'2024-10-25T00:25:13.093' AS DateTime), CAST(N'2024-10-25T10:12:04.093' AS DateTime), 0.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (145, NULL, 5, NULL, CAST(N'2024-10-25T07:59:38.607' AS DateTime), CAST(N'2024-10-25T10:13:07.607' AS DateTime), 0.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (147, NULL, 11, NULL, CAST(N'2024-10-25T06:56:58.693' AS DateTime), CAST(N'2024-10-25T10:15:59.693' AS DateTime), 0.0000, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (148, NULL, 22, NULL, CAST(N'2024-10-25T07:22:01.893' AS DateTime), CAST(N'2024-10-25T10:18:25.893' AS DateTime), 0.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (149, NULL, 18, NULL, CAST(N'2024-10-25T03:19:42.540' AS DateTime), CAST(N'2024-10-25T10:19:21.540' AS DateTime), 0.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (150, NULL, 22, NULL, CAST(N'2024-10-25T03:57:02.447' AS DateTime), CAST(N'2024-10-25T10:21:14.447' AS DateTime), 0.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (151, NULL, 4, NULL, CAST(N'2024-10-25T05:25:24.630' AS DateTime), CAST(N'2024-10-25T10:22:46.630' AS DateTime), 0.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (153, NULL, 22, NULL, CAST(N'2024-10-25T03:43:02.053' AS DateTime), CAST(N'2024-10-25T10:31:01.053' AS DateTime), 0.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (154, NULL, 9, NULL, CAST(N'2024-10-25T09:08:54.530' AS DateTime), CAST(N'2024-10-25T13:11:16.530' AS DateTime), 0.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (156, NULL, 5, NULL, CAST(N'2024-10-25T06:16:38.320' AS DateTime), CAST(N'2024-10-25T13:28:27.320' AS DateTime), 0.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (157, NULL, 8, NULL, CAST(N'2024-10-25T07:16:27.100' AS DateTime), CAST(N'2024-10-25T13:42:19.100' AS DateTime), 0.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (158, NULL, 1, NULL, CAST(N'2024-10-25T00:14:24.557' AS DateTime), CAST(N'2024-10-25T13:47:08.557' AS DateTime), 0.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (159, NULL, 16, NULL, CAST(N'2024-10-25T08:46:52.380' AS DateTime), CAST(N'2024-10-25T13:50:45.380' AS DateTime), 0.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (160, NULL, 12, NULL, CAST(N'2024-10-25T04:13:03.030' AS DateTime), CAST(N'2024-10-25T14:03:57.030' AS DateTime), 0.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (161, NULL, 11, NULL, CAST(N'2024-10-25T13:30:44.143' AS DateTime), CAST(N'2024-10-25T14:09:21.143' AS DateTime), 0.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (162, NULL, 14, NULL, CAST(N'2024-10-25T11:15:13.323' AS DateTime), CAST(N'2024-10-25T14:16:13.323' AS DateTime), 0.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (163, NULL, 2, NULL, CAST(N'2024-10-25T06:06:27.320' AS DateTime), CAST(N'2024-10-25T14:23:15.320' AS DateTime), 0.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (164, NULL, 5, NULL, CAST(N'2024-10-25T03:09:49.223' AS DateTime), CAST(N'2024-10-25T14:36:55.223' AS DateTime), 0.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (165, NULL, 9, NULL, CAST(N'2024-10-25T06:57:22.487' AS DateTime), CAST(N'2024-10-25T14:39:30.487' AS DateTime), 0.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (166, NULL, 18, NULL, CAST(N'2024-10-25T04:49:51.563' AS DateTime), CAST(N'2024-10-25T14:45:23.563' AS DateTime), 60000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (167, NULL, 4, NULL, CAST(N'2024-10-25T00:03:07.563' AS DateTime), CAST(N'2024-10-25T14:47:23.563' AS DateTime), 0.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (168, NULL, 19, NULL, CAST(N'2024-10-25T12:25:22.063' AS DateTime), CAST(N'2024-10-25T14:51:21.063' AS DateTime), 0.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (170, NULL, 22, NULL, CAST(N'2024-10-25T14:14:12.613' AS DateTime), CAST(N'2024-10-25T15:14:32.613' AS DateTime), 60000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (171, NULL, 22, NULL, CAST(N'2024-10-25T04:49:21.540' AS DateTime), CAST(N'2024-10-25T15:16:00.540' AS DateTime), 0.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (172, NULL, 22, NULL, CAST(N'2024-10-25T13:13:19.447' AS DateTime), CAST(N'2024-10-25T15:21:11.447' AS DateTime), 0.0000, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (173, NULL, 8, NULL, CAST(N'2024-10-25T11:56:18.573' AS DateTime), CAST(N'2024-10-25T15:22:30.573' AS DateTime), 0.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (174, NULL, 19, NULL, CAST(N'2024-10-25T01:33:00.837' AS DateTime), CAST(N'2024-10-25T15:23:44.837' AS DateTime), 114000.0000, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (175, NULL, 6, NULL, CAST(N'2024-10-25T05:17:22.053' AS DateTime), CAST(N'2024-10-25T15:29:05.053' AS DateTime), 0.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (176, NULL, 14, NULL, CAST(N'2024-10-26T05:31:05.563' AS DateTime), CAST(N'2024-10-26T12:44:58.563' AS DateTime), 0.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (179, NULL, 20, NULL, CAST(N'2024-10-26T09:14:34.370' AS DateTime), CAST(N'2024-10-26T13:51:03.370' AS DateTime), 0.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (204, NULL, 18, NULL, CAST(N'2024-10-27T09:59:34.990' AS DateTime), CAST(N'2024-10-27T15:56:41.990' AS DateTime), 60000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (205, NULL, 8, NULL, CAST(N'2024-10-27T02:49:46.893' AS DateTime), CAST(N'2024-10-27T21:10:38.893' AS DateTime), 110000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (206, NULL, 2, NULL, CAST(N'2024-10-27T10:51:55.903' AS DateTime), CAST(N'2024-10-27T21:15:30.903' AS DateTime), 116000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (207, NULL, 8, NULL, CAST(N'2024-10-27T17:14:48.853' AS DateTime), CAST(N'2024-10-27T21:21:38.853' AS DateTime), 90000.0000, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (211, NULL, 4, NULL, CAST(N'2024-10-27T14:13:06.977' AS DateTime), CAST(N'2024-10-27T21:37:20.977' AS DateTime), 110000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (212, NULL, 15, NULL, CAST(N'2024-10-27T18:17:14.580' AS DateTime), CAST(N'2024-10-27T21:39:10.580' AS DateTime), 90000.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (214, NULL, 2, NULL, CAST(N'2024-10-27T09:37:41.073' AS DateTime), CAST(N'2024-10-27T21:51:04.073' AS DateTime), 105000.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (215, NULL, 17, NULL, CAST(N'2024-10-27T07:32:23.240' AS DateTime), CAST(N'2024-10-27T22:07:57.240' AS DateTime), 50000.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (216, NULL, 22, NULL, CAST(N'2024-10-27T13:32:37.877' AS DateTime), CAST(N'2024-10-27T22:49:39.877' AS DateTime), 75000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (217, NULL, 1, NULL, CAST(N'2024-10-27T05:25:17.407' AS DateTime), CAST(N'2024-10-27T22:52:51.407' AS DateTime), 84000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (219, NULL, 15, NULL, CAST(N'2024-10-28T00:11:17.653' AS DateTime), CAST(N'2024-10-28T00:28:43.653' AS DateTime), 60000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (220, NULL, 18, NULL, CAST(N'2024-10-28T00:17:52.020' AS DateTime), CAST(N'2024-10-28T00:30:36.020' AS DateTime), 60000.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (222, NULL, 12, NULL, CAST(N'2024-10-28T00:31:02.790' AS DateTime), CAST(N'2024-10-28T00:33:04.790' AS DateTime), 135000.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (224, NULL, 10, NULL, CAST(N'2024-10-28T00:26:22.653' AS DateTime), CAST(N'2024-10-28T00:38:29.653' AS DateTime), 170000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (226, NULL, 5, NULL, CAST(N'2024-10-28T00:22:18.290' AS DateTime), CAST(N'2024-10-28T00:43:32.290' AS DateTime), 60000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (227, NULL, 11, NULL, CAST(N'2024-10-28T00:45:48.733' AS DateTime), CAST(N'2024-10-28T00:46:25.733' AS DateTime), 90000.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (229, NULL, 17, NULL, CAST(N'2024-10-28T00:23:13.173' AS DateTime), CAST(N'2024-10-28T00:50:44.173' AS DateTime), 90000.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (231, NULL, 13, NULL, CAST(N'2024-10-28T00:42:44.733' AS DateTime), CAST(N'2024-10-28T00:53:48.733' AS DateTime), 0.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (232, NULL, 17, NULL, CAST(N'2024-10-28T00:22:20.680' AS DateTime), CAST(N'2024-10-28T00:57:20.680' AS DateTime), 120000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (234, NULL, 3, NULL, CAST(N'2024-10-28T00:30:28.813' AS DateTime), CAST(N'2024-10-28T01:00:25.813' AS DateTime), 60000.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (236, NULL, 1, NULL, CAST(N'2024-10-28T00:20:54.037' AS DateTime), CAST(N'2024-10-28T01:03:00.037' AS DateTime), 60000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (237, NULL, 15, NULL, CAST(N'2024-10-28T00:23:41.247' AS DateTime), CAST(N'2024-10-28T01:06:52.247' AS DateTime), 60000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (239, NULL, 17, NULL, CAST(N'2024-10-28T00:17:40.477' AS DateTime), CAST(N'2024-10-28T01:09:51.477' AS DateTime), 30000.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (240, NULL, 8, NULL, CAST(N'2024-10-28T00:20:33.740' AS DateTime), CAST(N'2024-10-28T01:16:31.740' AS DateTime), 105000.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (241, NULL, 14, NULL, CAST(N'2024-10-28T00:07:27.830' AS DateTime), CAST(N'2024-10-28T01:17:49.830' AS DateTime), 98000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (242, NULL, 3, NULL, CAST(N'2024-10-28T15:15:48.870' AS DateTime), CAST(N'2024-10-28T17:45:10.870' AS DateTime), 150000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (243, NULL, 1, NULL, CAST(N'2024-10-29T07:34:48.143' AS DateTime), CAST(N'2024-10-29T09:17:13.143' AS DateTime), 30000.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (244, NULL, 18, NULL, CAST(N'2024-10-29T06:29:40.317' AS DateTime), CAST(N'2024-10-29T09:18:54.317' AS DateTime), 60000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (245, NULL, 15, NULL, CAST(N'2024-10-29T03:09:50.953' AS DateTime), CAST(N'2024-10-29T09:19:52.953' AS DateTime), 50000.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (246, NULL, 10, NULL, CAST(N'2024-10-30T09:15:21.370' AS DateTime), CAST(N'2024-10-30T17:18:26.370' AS DateTime), 90000.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (248, NULL, 22, NULL, CAST(N'2024-10-31T08:25:49.687' AS DateTime), CAST(N'2024-10-31T17:45:01.687' AS DateTime), 0.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (251, NULL, 10, NULL, CAST(N'2024-10-31T21:16:15.237' AS DateTime), CAST(N'2024-10-31T22:13:53.237' AS DateTime), 60000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (252, NULL, 11, NULL, CAST(N'2024-10-31T07:40:25.870' AS DateTime), CAST(N'2024-10-31T22:17:08.870' AS DateTime), 60000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (253, NULL, 10, NULL, CAST(N'2024-10-31T09:58:46.033' AS DateTime), CAST(N'2024-10-31T22:18:24.033' AS DateTime), 0.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (254, NULL, 17, NULL, CAST(N'2024-10-31T11:11:46.170' AS DateTime), CAST(N'2024-10-31T22:20:40.170' AS DateTime), 55000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (255, NULL, 14, NULL, CAST(N'2024-10-31T00:16:20.807' AS DateTime), CAST(N'2024-10-31T22:21:55.807' AS DateTime), 60000.0000, 6, NULL, 1, 1)
GO
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (256, NULL, 13, NULL, CAST(N'2024-11-01T01:56:33.193' AS DateTime), CAST(N'2024-11-01T09:27:04.193' AS DateTime), 165000.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (263, NULL, 19, NULL, CAST(N'2024-11-01T08:32:14.710' AS DateTime), CAST(N'2024-11-01T13:32:43.710' AS DateTime), 116000.0000, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (264, NULL, 8, NULL, CAST(N'2024-11-01T07:27:54.177' AS DateTime), CAST(N'2024-11-01T13:34:52.177' AS DateTime), 25000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (266, NULL, 3, NULL, CAST(N'2024-11-01T13:43:09.203' AS DateTime), CAST(N'2024-11-01T14:49:30.203' AS DateTime), 200000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (267, NULL, 20, NULL, CAST(N'2024-11-01T11:15:31.170' AS DateTime), CAST(N'2024-11-01T14:51:49.170' AS DateTime), 40000000.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (270, NULL, 15, NULL, CAST(N'2024-11-01T12:27:02.693' AS DateTime), CAST(N'2024-11-01T15:00:53.693' AS DateTime), 56000.0000, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (275, NULL, 5, NULL, CAST(N'2024-11-01T08:20:07.493' AS DateTime), CAST(N'2024-11-01T15:10:06.493' AS DateTime), 340000.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (276, NULL, 16, NULL, CAST(N'2024-11-02T10:49:39.120' AS DateTime), CAST(N'2024-11-02T17:24:02.120' AS DateTime), NULL, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (277, NULL, 10, NULL, CAST(N'2024-11-02T06:28:07.210' AS DateTime), CAST(N'2024-11-02T17:24:22.210' AS DateTime), NULL, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (278, NULL, 15, NULL, CAST(N'2024-11-02T08:48:01.147' AS DateTime), CAST(N'2024-11-02T17:25:32.147' AS DateTime), NULL, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (279, NULL, 7, NULL, CAST(N'2024-11-02T16:06:42.140' AS DateTime), CAST(N'2024-11-02T17:30:17.140' AS DateTime), 90000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (280, NULL, 19, NULL, CAST(N'2024-11-02T10:25:41.963' AS DateTime), CAST(N'2024-11-02T17:40:30.963' AS DateTime), 184000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (281, NULL, 13, NULL, CAST(N'2024-11-02T07:32:01.667' AS DateTime), CAST(N'2024-11-02T17:45:57.667' AS DateTime), 60000.0000, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (282, NULL, 6, NULL, CAST(N'2024-11-02T05:51:34.780' AS DateTime), CAST(N'2024-11-02T17:52:21.780' AS DateTime), 75000.0000, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (283, NULL, 10, NULL, CAST(N'2024-11-02T11:23:24.073' AS DateTime), CAST(N'2024-11-02T17:52:55.073' AS DateTime), 60000.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (284, NULL, 9, NULL, CAST(N'2024-11-02T06:14:20.857' AS DateTime), CAST(N'2024-11-02T18:28:59.857' AS DateTime), 60000.0000, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (285, NULL, 19, NULL, CAST(N'2024-11-02T01:46:00.767' AS DateTime), CAST(N'2024-11-02T18:33:54.767' AS DateTime), NULL, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (286, NULL, 8, NULL, CAST(N'2024-11-02T03:55:21.523' AS DateTime), CAST(N'2024-11-02T18:46:24.523' AS DateTime), 50000.0000, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (287, NULL, 13, NULL, CAST(N'2024-11-02T07:50:59.750' AS DateTime), CAST(N'2024-11-02T18:59:06.750' AS DateTime), NULL, 12, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (288, NULL, 18, NULL, CAST(N'2024-11-02T17:35:27.810' AS DateTime), CAST(N'2024-11-02T19:14:01.810' AS DateTime), NULL, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (289, NULL, 17, NULL, CAST(N'2024-11-02T08:34:15.847' AS DateTime), CAST(N'2024-11-02T19:16:35.847' AS DateTime), 174000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (290, NULL, 6, NULL, CAST(N'2024-11-02T16:25:21.763' AS DateTime), CAST(N'2024-11-02T19:19:03.763' AS DateTime), NULL, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (291, NULL, 8, NULL, CAST(N'2024-11-02T01:16:11.253' AS DateTime), CAST(N'2024-11-02T19:21:33.253' AS DateTime), NULL, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (292, NULL, 20, NULL, CAST(N'2024-11-02T04:03:46.443' AS DateTime), CAST(N'2024-11-02T19:23:22.443' AS DateTime), 90000.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (293, NULL, 18, NULL, CAST(N'2024-11-02T05:37:42.120' AS DateTime), CAST(N'2024-11-02T19:26:47.120' AS DateTime), NULL, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (294, NULL, 20, NULL, CAST(N'2024-11-02T06:56:29.147' AS DateTime), CAST(N'2024-11-02T19:28:12.147' AS DateTime), 60000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (295, NULL, 19, NULL, CAST(N'2024-11-02T11:21:01.213' AS DateTime), CAST(N'2024-11-02T19:28:54.213' AS DateTime), 90000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (296, NULL, 6, NULL, CAST(N'2024-11-02T09:58:32.137' AS DateTime), CAST(N'2024-11-02T19:29:43.137' AS DateTime), NULL, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (297, NULL, 8, NULL, CAST(N'2024-11-02T09:31:36.767' AS DateTime), CAST(N'2024-11-02T19:44:57.767' AS DateTime), 40000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (298, NULL, 1, NULL, CAST(N'2024-11-02T07:07:41.033' AS DateTime), CAST(N'2024-11-02T19:50:36.033' AS DateTime), 362000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (299, NULL, 3, NULL, CAST(N'2024-11-02T19:31:21.347' AS DateTime), CAST(N'2024-11-02T20:05:41.347' AS DateTime), 60000.0000, 7, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (300, NULL, 4, NULL, CAST(N'2024-11-03T01:07:58.750' AS DateTime), CAST(N'2024-11-03T01:42:55.750' AS DateTime), NULL, 6, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (301, NULL, 1, NULL, CAST(N'2024-11-03T00:17:17.893' AS DateTime), CAST(N'2024-11-03T01:46:04.893' AS DateTime), 267000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (302, NULL, 7, NULL, CAST(N'2024-11-03T00:18:44.627' AS DateTime), CAST(N'2024-11-03T01:49:11.627' AS DateTime), 280000.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (303, NULL, 10, NULL, CAST(N'2024-11-03T00:44:31.457' AS DateTime), CAST(N'2024-11-03T01:50:06.457' AS DateTime), 60000.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (304, NULL, 18, NULL, CAST(N'2024-11-03T00:01:09.160' AS DateTime), CAST(N'2024-11-03T22:43:52.160' AS DateTime), 225000.0000, 8, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (305, NULL, 11, NULL, CAST(N'2024-11-05T00:02:41.920' AS DateTime), CAST(N'2024-11-05T07:48:45.920' AS DateTime), 76000.0000, 11, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (306, NULL, 11, NULL, CAST(N'2024-11-05T06:26:14.567' AS DateTime), CAST(N'2024-11-05T08:58:50.567' AS DateTime), 60000.0000, 9, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (307, NULL, 1, NULL, CAST(N'2024-11-05T01:01:29.080' AS DateTime), CAST(N'2024-11-05T09:04:01.080' AS DateTime), 60000.0000, 1, NULL, 1, 0)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (308, NULL, 1, NULL, CAST(N'2024-11-05T01:06:16.440' AS DateTime), CAST(N'2024-11-05T09:36:40.440' AS DateTime), 60000.0000, 10, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (309, NULL, 1, NULL, NULL, CAST(N'2024-11-05T20:41:12.880' AS DateTime), 130000.0000, NULL, NULL, NULL, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (311, 13, NULL, NULL, CAST(N'2024-11-06T14:11:58.927' AS DateTime), NULL, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (312, 7, NULL, NULL, CAST(N'2024-11-06T14:37:24.750' AS DateTime), NULL, 740000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (313, NULL, 2, NULL, NULL, CAST(N'2024-11-06T21:04:07.840' AS DateTime), 60000.0000, NULL, NULL, NULL, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (314, NULL, 1, NULL, NULL, CAST(N'2024-11-06T21:05:08.977' AS DateTime), 114000.0000, NULL, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (315, NULL, 3, NULL, NULL, CAST(N'2024-11-06T21:16:30.473' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (316, NULL, 1, NULL, NULL, CAST(N'2024-11-06T21:21:25.207' AS DateTime), 90000.0000, NULL, NULL, 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (317, 7, NULL, NULL, CAST(N'2024-11-07T00:40:52.633' AS DateTime), NULL, 25000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (318, NULL, 1, NULL, NULL, CAST(N'2024-11-07T00:58:29.613' AS DateTime), 90000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (319, 7, NULL, NULL, CAST(N'2024-11-07T00:59:42.817' AS DateTime), NULL, 377000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (320, 7, NULL, NULL, CAST(N'2024-11-07T01:07:23.147' AS DateTime), NULL, 245000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (321, 7, NULL, NULL, CAST(N'2024-11-07T01:25:31.953' AS DateTime), NULL, 254000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (322, 7, NULL, NULL, CAST(N'2024-11-07T01:31:18.610' AS DateTime), CAST(N'2024-11-07T01:31:37.297' AS DateTime), 88000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (323, 7, NULL, NULL, CAST(N'2024-11-07T01:31:39.080' AS DateTime), CAST(N'2024-11-07T15:51:57.300' AS DateTime), 25000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', 1, 0)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (324, NULL, NULL, NULL, NULL, CAST(N'2024-11-07T15:51:34.453' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (325, 7, NULL, NULL, CAST(N'2024-11-07T15:51:59.113' AS DateTime), CAST(N'2024-11-07T22:19:55.647' AS DateTime), 121000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', 1, 0)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (326, NULL, 1, NULL, NULL, CAST(N'2024-11-07T15:52:54.070' AS DateTime), 50000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (327, NULL, 1, NULL, NULL, CAST(N'2024-11-07T22:17:02.020' AS DateTime), 267000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (328, NULL, NULL, NULL, NULL, CAST(N'2024-11-07T22:19:02.637' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (329, 7, NULL, NULL, CAST(N'2024-11-07T22:20:04.197' AS DateTime), CAST(N'2024-11-08T09:56:56.537' AS DateTime), 58000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', 1, 0)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (330, 7, NULL, NULL, CAST(N'2024-11-08T09:59:21.367' AS DateTime), CAST(N'2024-11-08T10:04:23.703' AS DateTime), 68000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', 1, 1)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (331, NULL, NULL, NULL, NULL, CAST(N'2024-11-08T10:03:58.513' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (332, 7, NULL, NULL, CAST(N'2024-11-08T10:04:25.037' AS DateTime), CAST(N'2024-11-08T11:04:12.703' AS DateTime), 30000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', 1, 0)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (333, NULL, NULL, NULL, NULL, CAST(N'2024-11-08T10:05:22.203' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (334, NULL, 2, NULL, NULL, CAST(N'2024-11-08T10:14:17.963' AS DateTime), 136000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (335, NULL, 1, NULL, NULL, CAST(N'2024-11-08T10:15:05.610' AS DateTime), 90000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (336, NULL, 1, NULL, CAST(N'2024-11-08T10:25:36.577' AS DateTime), NULL, 120000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (337, NULL, 1, NULL, CAST(N'2024-11-08T10:36:58.147' AS DateTime), NULL, 90000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (338, NULL, NULL, NULL, CAST(N'2024-11-08T10:38:11.363' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (339, 7, NULL, NULL, CAST(N'2024-11-08T11:04:14.410' AS DateTime), CAST(N'2024-11-08T15:18:50.213' AS DateTime), 53000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (340, NULL, NULL, NULL, CAST(N'2024-11-08T13:33:53.610' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (341, NULL, NULL, NULL, CAST(N'2024-11-08T14:50:36.820' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (342, NULL, NULL, NULL, CAST(N'2024-11-08T15:10:54.323' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (343, NULL, NULL, NULL, CAST(N'2024-11-08T15:11:17.330' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (344, NULL, 1, NULL, CAST(N'2024-11-08T15:11:22.807' AS DateTime), NULL, 90000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (345, 7, NULL, NULL, CAST(N'2024-11-08T15:18:52.063' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (346, NULL, NULL, NULL, CAST(N'2024-11-11T14:16:14.457' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (347, NULL, NULL, NULL, CAST(N'2024-11-11T14:16:30.360' AS DateTime), NULL, 279000.0000, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (348, NULL, 1, NULL, CAST(N'2024-11-12T02:00:00.737' AS DateTime), NULL, 50000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (349, NULL, 1, NULL, CAST(N'2024-11-12T02:19:21.730' AS DateTime), CAST(N'2024-11-12T02:19:25.553' AS DateTime), 121000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (350, NULL, 7, NULL, CAST(N'2024-11-12T02:20:20.160' AS DateTime), CAST(N'2024-11-12T02:20:25.900' AS DateTime), 191000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (351, NULL, 2, NULL, CAST(N'2024-11-12T02:29:42.847' AS DateTime), CAST(N'2024-11-12T02:29:43.603' AS DateTime), 83000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (352, NULL, 3, NULL, CAST(N'2024-11-12T02:31:47.417' AS DateTime), CAST(N'2024-11-12T02:31:49.123' AS DateTime), 83000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (353, NULL, 1, NULL, CAST(N'2024-11-12T02:35:34.713' AS DateTime), NULL, 90000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (354, NULL, 5, NULL, CAST(N'2024-11-12T02:46:38.833' AS DateTime), CAST(N'2024-11-12T02:46:40.757' AS DateTime), 110000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (355, NULL, 1, NULL, CAST(N'2024-11-12T02:48:48.657' AS DateTime), CAST(N'2024-11-12T02:48:50.783' AS DateTime), 110000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (356, NULL, 1, NULL, CAST(N'2024-11-12T02:49:51.177' AS DateTime), NULL, 90000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (357, NULL, 2, NULL, CAST(N'2024-11-12T02:55:59.633' AS DateTime), NULL, 50000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (358, NULL, NULL, NULL, CAST(N'2024-11-12T02:56:32.173' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (359, NULL, 3, NULL, CAST(N'2024-11-12T02:56:43.197' AS DateTime), NULL, 50000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (360, NULL, 7, NULL, CAST(N'2024-11-12T02:57:14.990' AS DateTime), NULL, 50000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (361, NULL, 1, NULL, CAST(N'2024-11-12T03:07:01.450' AS DateTime), CAST(N'2024-11-12T03:07:02.507' AS DateTime), 166000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (362, NULL, 1, NULL, CAST(N'2024-11-12T03:17:55.297' AS DateTime), CAST(N'2024-11-12T03:17:56.703' AS DateTime), 110000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (363, NULL, 1, NULL, CAST(N'2024-11-12T03:17:55.297' AS DateTime), CAST(N'2024-11-12T03:18:03.367' AS DateTime), 110000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (364, NULL, 3, NULL, CAST(N'2024-11-12T03:18:30.527' AS DateTime), CAST(N'2024-11-12T03:18:32.490' AS DateTime), 166000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (365, NULL, 1, NULL, CAST(N'2024-11-12T03:26:25.263' AS DateTime), CAST(N'2024-11-12T03:26:26.560' AS DateTime), 225000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (366, NULL, 1, NULL, CAST(N'2024-11-12T03:26:25.263' AS DateTime), CAST(N'2024-11-12T03:26:38.010' AS DateTime), 225000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (367, NULL, 1, NULL, CAST(N'2024-11-12T03:26:57.980' AS DateTime), CAST(N'2024-11-12T03:27:01.850' AS DateTime), 225000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (368, NULL, 2, NULL, CAST(N'2024-11-12T03:52:12.777' AS DateTime), CAST(N'2024-11-12T03:52:14.323' AS DateTime), 110000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (369, NULL, 5, NULL, CAST(N'2024-11-12T04:04:25.340' AS DateTime), CAST(N'2024-11-12T04:04:27.073' AS DateTime), 60000.0000, 5, NULL, 1, NULL)
GO
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (370, NULL, 5, NULL, CAST(N'2024-11-12T04:04:25.340' AS DateTime), CAST(N'2024-11-12T04:04:34.163' AS DateTime), 60000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (371, NULL, 5, NULL, CAST(N'2024-11-12T04:04:38.450' AS DateTime), CAST(N'2024-11-12T04:04:39.617' AS DateTime), 116000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (372, NULL, 7, NULL, CAST(N'2024-11-12T04:12:40.113' AS DateTime), CAST(N'2024-11-12T04:12:42.787' AS DateTime), 60000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (373, NULL, 7, NULL, CAST(N'2024-11-12T04:12:40.113' AS DateTime), CAST(N'2024-11-12T04:13:03.343' AS DateTime), 90000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (374, NULL, 4, NULL, CAST(N'2024-11-12T13:03:27.560' AS DateTime), CAST(N'2024-11-12T13:03:28.737' AS DateTime), 110000.0000, 5, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (375, NULL, NULL, NULL, CAST(N'2024-11-12T13:26:53.503' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (376, NULL, 5, NULL, CAST(N'2024-11-12T13:28:26.110' AS DateTime), NULL, 90000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (377, NULL, 1, NULL, CAST(N'2024-11-12T13:31:20.757' AS DateTime), NULL, 50000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (378, NULL, 7, NULL, CAST(N'2024-11-12T13:34:08.693' AS DateTime), NULL, 90000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (379, NULL, 8, NULL, CAST(N'2024-11-12T13:35:05.060' AS DateTime), NULL, 30000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (380, NULL, NULL, NULL, CAST(N'2024-11-12T13:41:30.957' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (381, NULL, 10, NULL, CAST(N'2024-11-12T13:42:18.213' AS DateTime), NULL, 76000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (382, NULL, 11, NULL, CAST(N'2024-11-12T13:50:45.217' AS DateTime), NULL, 75000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (383, NULL, 12, NULL, CAST(N'2024-11-12T13:52:45.057' AS DateTime), NULL, 56000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (384, NULL, NULL, NULL, CAST(N'2024-11-12T14:05:49.613' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (385, NULL, 4, NULL, CAST(N'2024-11-12T14:06:31.060' AS DateTime), NULL, 60000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (386, NULL, 1, NULL, CAST(N'2024-11-12T14:12:02.037' AS DateTime), NULL, 30000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (387, NULL, 2, NULL, CAST(N'2024-11-12T14:20:50.807' AS DateTime), NULL, 30000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (388, NULL, 4, NULL, CAST(N'2024-11-12T14:26:03.160' AS DateTime), NULL, 30000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (389, NULL, NULL, NULL, CAST(N'2024-11-12T14:29:28.250' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (390, NULL, NULL, NULL, CAST(N'2024-11-12T14:29:45.727' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (391, NULL, 5, NULL, CAST(N'2024-11-12T14:29:49.827' AS DateTime), NULL, 30000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (392, NULL, 8, NULL, CAST(N'2024-11-12T14:31:21.933' AS DateTime), NULL, 30000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (393, NULL, 9, NULL, CAST(N'2024-11-12T14:49:47.933' AS DateTime), NULL, 50000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (394, NULL, NULL, NULL, CAST(N'2024-11-12T14:51:48.707' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (395, NULL, 11, NULL, CAST(N'2024-11-12T14:52:40.293' AS DateTime), NULL, 84000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (396, NULL, 5, NULL, CAST(N'2024-11-12T14:57:09.437' AS DateTime), NULL, 76000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (397, NULL, 11, NULL, CAST(N'2024-11-12T15:17:28.173' AS DateTime), NULL, 30000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (398, NULL, 1, NULL, CAST(N'2024-11-12T15:30:31.577' AS DateTime), NULL, 30000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (399, NULL, 1, NULL, CAST(N'2024-11-12T15:32:46.233' AS DateTime), CAST(N'2024-11-12T15:33:03.273' AS DateTime), 110000.0000, 1, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (400, NULL, 1, NULL, CAST(N'2024-11-12T15:47:28.560' AS DateTime), CAST(N'2024-11-12T15:48:07.267' AS DateTime), 600000.0000, 1, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (401, NULL, 1, NULL, CAST(N'2024-11-12T15:53:16.567' AS DateTime), CAST(N'2024-11-12T15:53:18.127' AS DateTime), 60000.0000, 1, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (402, NULL, 4, NULL, CAST(N'2024-11-12T15:54:47.167' AS DateTime), CAST(N'2024-11-12T15:54:50.193' AS DateTime), 100000.0000, 1, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (403, NULL, 2, NULL, CAST(N'2024-11-12T15:56:37.877' AS DateTime), NULL, 60000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (404, NULL, 1, NULL, CAST(N'2024-11-12T15:59:51.537' AS DateTime), CAST(N'2024-11-12T15:59:53.010' AS DateTime), 50000.0000, 1, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (405, NULL, 1, NULL, CAST(N'2024-11-12T21:20:31.817' AS DateTime), NULL, 56000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (406, NULL, 1, NULL, CAST(N'2024-11-12T21:22:17.337' AS DateTime), CAST(N'2024-11-12T21:22:24.353' AS DateTime), 110000.0000, 1, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (407, NULL, 1, NULL, CAST(N'2024-11-12T21:26:48.887' AS DateTime), NULL, 50000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (408, NULL, 1, NULL, CAST(N'2024-11-12T21:27:22.740' AS DateTime), NULL, 30000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (409, NULL, NULL, NULL, CAST(N'2024-11-13T22:31:51.687' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (410, NULL, 1, NULL, CAST(N'2024-11-14T21:06:22.053' AS DateTime), NULL, 130000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (411, NULL, 1, NULL, CAST(N'2024-11-14T21:07:17.057' AS DateTime), NULL, 35000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (412, NULL, 1, NULL, CAST(N'2024-11-14T21:10:33.407' AS DateTime), NULL, 60000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (413, NULL, 1, NULL, CAST(N'2024-11-14T21:11:11.090' AS DateTime), NULL, 60000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (414, NULL, 1, NULL, CAST(N'2024-11-14T21:11:39.010' AS DateTime), NULL, 126000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (415, NULL, NULL, NULL, CAST(N'2024-11-14T21:13:00.970' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (416, NULL, 1, NULL, CAST(N'2024-11-14T21:20:44.643' AS DateTime), NULL, 60000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (417, NULL, 1, NULL, CAST(N'2024-11-14T21:25:23.927' AS DateTime), NULL, 55000.0000, NULL, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (418, NULL, 1, NULL, CAST(N'2024-11-14T21:27:21.187' AS DateTime), NULL, 50000.0000, NULL, N'Dung', 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (419, NULL, NULL, NULL, CAST(N'2024-11-14T21:28:25.483' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (420, NULL, 1, NULL, CAST(N'2024-11-14T21:33:54.350' AS DateTime), NULL, 98000.0000, NULL, N'Dung', 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (421, NULL, 1, NULL, CAST(N'2024-11-14T21:38:10.610' AS DateTime), NULL, 50000.0000, NULL, N'Dung', 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (422, NULL, 1, NULL, CAST(N'2024-11-15T03:14:08.873' AS DateTime), NULL, 50000.0000, NULL, N'Dung', 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (423, NULL, 1, NULL, CAST(N'2024-11-15T04:32:31.587' AS DateTime), NULL, 75000.0000, NULL, N'Dung', 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (424, NULL, 1, NULL, CAST(N'2024-11-15T13:13:52.550' AS DateTime), NULL, 60000.0000, NULL, N'Dung', 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (425, NULL, NULL, NULL, CAST(N'2024-11-15T13:28:12.570' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (426, NULL, 2, NULL, CAST(N'2024-11-15T13:30:56.610' AS DateTime), NULL, 110000.0000, NULL, N'Dung', 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (427, NULL, 3, NULL, CAST(N'2024-11-15T13:36:18.560' AS DateTime), NULL, 30000.0000, NULL, N'Dung', 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (428, NULL, NULL, NULL, CAST(N'2024-11-15T13:37:51.443' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (429, 7, NULL, NULL, CAST(N'2024-11-15T13:51:30.020' AS DateTime), CAST(N'2024-11-15T13:53:49.137' AS DateTime), 55000.0000, NULL, N'Thông Tin Giao Hàng : Số Điện Thoại: 0345252554Địa Chỉ: Số Nhà 7A21 Nghĩa Tân', 1, 0)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (430, NULL, 2, NULL, CAST(N'2024-11-21T23:43:47.260' AS DateTime), CAST(N'2024-11-21T23:43:54.763' AS DateTime), 166000.0000, 1, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (431, NULL, 4, NULL, CAST(N'2024-11-21T23:45:29.103' AS DateTime), CAST(N'2024-11-21T23:45:30.527' AS DateTime), 50000.0000, 1, NULL, 1, NULL)
INSERT [dbo].[DonHang] ([DH_ID], [KH_ID], [Ban_ID], [KM_ID], [GioVao], [GioRa], [TongTien], [NV_ID], [GhiChu], [TrangThai], [VanChuyen]) VALUES (432, NULL, 1, NULL, CAST(N'2024-11-23T16:00:04.943' AS DateTime), NULL, 60000.0000, NULL, N'Dung', 1, NULL)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonNhap] ON 

INSERT [dbo].[HoaDonNhap] ([HDN_ID], [NCC_ID], [NV_ID], [NgayLapHoaDon], [NgayNhanHang], [TongSoTien]) VALUES (2, 1, 1, CAST(N'2024-12-10T00:00:00.000' AS DateTime), CAST(N'2024-12-20T00:00:00.000' AS DateTime), 500000.0000)
INSERT [dbo].[HoaDonNhap] ([HDN_ID], [NCC_ID], [NV_ID], [NgayLapHoaDon], [NgayNhanHang], [TongSoTien]) VALUES (3, 1, 1, CAST(N'2024-12-10T00:00:00.000' AS DateTime), CAST(N'2024-12-20T00:00:00.000' AS DateTime), 0.0000)
SET IDENTITY_INSERT [dbo].[HoaDonNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([KH_ID], [TenKhachHang], [DiaChi], [SoDienThoai], [TaiKhoan], [MatKhau], [PathPhoto]) VALUES (2, N'Trương Quảng Đông', N'Số 3, Ngõ 20 Hoàng Cầu', N'0987598714', N'001', N'001', N'/asset/img/imgWeb/anh1.jpg')
INSERT [dbo].[KhachHang] ([KH_ID], [TenKhachHang], [DiaChi], [SoDienThoai], [TaiKhoan], [MatKhau], [PathPhoto]) VALUES (3, N'Nguyễn Đức Dũng', N'Số nhà 22A, Ngõ 105 Đường Láng', N'032765421', N'002', N'002', N'/asset/img/imgWeb/anh2.jpg')
INSERT [dbo].[KhachHang] ([KH_ID], [TenKhachHang], [DiaChi], [SoDienThoai], [TaiKhoan], [MatKhau], [PathPhoto]) VALUES (5, N'Đỗ Văn A', N'Số nhà 22B, đường Cầu Giấy', N'092646798', N'003', N'003', N'/asset/img/imgWeb/anh3.jpg')
INSERT [dbo].[KhachHang] ([KH_ID], [TenKhachHang], [DiaChi], [SoDienThoai], [TaiKhoan], [MatKhau], [PathPhoto]) VALUES (7, N'Nguyễn Minh Châu', N'Số Nhà 7A21 Nghĩa Tân', N'0345252554', N'mchau@gmail.com', N'001', N'/asset/img/imgWeb/anh4.jpg')
INSERT [dbo].[KhachHang] ([KH_ID], [TenKhachHang], [DiaChi], [SoDienThoai], [TaiKhoan], [MatKhau], [PathPhoto]) VALUES (8, N'Nguyễn Đức Hiền', N'326 Trần Cung', N'0972747513', N'duchien@gmail.com', N'005', N'/asset/img/imgWeb/anh6.jpeg')
INSERT [dbo].[KhachHang] ([KH_ID], [TenKhachHang], [DiaChi], [SoDienThoai], [TaiKhoan], [MatKhau], [PathPhoto]) VALUES (10, N'Nguyễn Thị Ngọc Bích', N'399 Trần Quốc Hoàn', N'0988656783', N'Bich@gmail.com', N'006', N'/asset/img/imgWeb/anh5.jpg')
INSERT [dbo].[KhachHang] ([KH_ID], [TenKhachHang], [DiaChi], [SoDienThoai], [TaiKhoan], [MatKhau], [PathPhoto]) VALUES (11, N'Trần Thị Thảo', N'321 Cầu Giấy', N'0977566554', N'Thao@gmail.com', N'996', N'/asset/img/imgWeb/anh9.jpeg')
INSERT [dbo].[KhachHang] ([KH_ID], [TenKhachHang], [DiaChi], [SoDienThoai], [TaiKhoan], [MatKhau], [PathPhoto]) VALUES (13, N'ducdung', NULL, NULL, N'duccdung999@gmail.com', N'003', NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NgayCong] ON 

INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (1, CAST(N'2024-10-01' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (2, CAST(N'2024-10-02' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (3, CAST(N'2024-10-03' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (4, CAST(N'2024-10-04' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (5, CAST(N'2024-10-05' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (6, CAST(N'2024-10-06' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (7, CAST(N'2024-10-07' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (8, CAST(N'2024-10-08' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (9, CAST(N'2024-10-09' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (10, CAST(N'2024-10-10' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (11, CAST(N'2024-11-11' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (12, CAST(N'2024-10-10' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (13, CAST(N'2024-10-11' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (14, CAST(N'2024-10-12' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (15, CAST(N'2024-10-13' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (16, CAST(N'2024-10-14' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (17, CAST(N'2024-10-15' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (18, CAST(N'2024-10-16' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (19, CAST(N'2024-10-17' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (20, CAST(N'2024-10-18' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (21, CAST(N'2024-10-19' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (22, CAST(N'2024-10-20' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (23, CAST(N'2024-10-21' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (24, CAST(N'2024-10-22' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (25, CAST(N'2024-10-23' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (26, CAST(N'2024-10-24' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (27, CAST(N'2024-10-25' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (28, CAST(N'2024-10-26' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (29, CAST(N'2024-10-27' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (30, CAST(N'2024-10-28' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (31, CAST(N'2024-10-29' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (32, CAST(N'2024-10-30' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (33, CAST(N'2024-10-31' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (34, CAST(N'2024-11-01' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (35, CAST(N'2024-11-02' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (36, CAST(N'2024-11-03' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (37, CAST(N'2024-11-04' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (38, CAST(N'2024-11-05' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (39, CAST(N'2024-11-06' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (40, CAST(N'2024-11-07' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (41, CAST(N'2024-11-08' AS Date), N'Ca Chiều')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (42, CAST(N'2024-11-09' AS Date), N'Ca Sáng')
INSERT [dbo].[NgayCong] ([NC_ID], [NgayCong], [CaLam]) VALUES (43, CAST(N'2024-11-10' AS Date), N'Ca Chiều')
SET IDENTITY_INSERT [dbo].[NgayCong] OFF
GO
SET IDENTITY_INSERT [dbo].[NguyenLieu] ON 

INSERT [dbo].[NguyenLieu] ([NL_ID], [TenNguyenLieu], [GiaTien]) VALUES (1, N'Gạo', 10000.0000)
INSERT [dbo].[NguyenLieu] ([NL_ID], [TenNguyenLieu], [GiaTien]) VALUES (2, N'Rau muống', 10000.0000)
INSERT [dbo].[NguyenLieu] ([NL_ID], [TenNguyenLieu], [GiaTien]) VALUES (3, N'Thịt Bò ', 50000.0000)
INSERT [dbo].[NguyenLieu] ([NL_ID], [TenNguyenLieu], [GiaTien]) VALUES (4, N'Dầu Ăn', 50000.0000)
INSERT [dbo].[NguyenLieu] ([NL_ID], [TenNguyenLieu], [GiaTien]) VALUES (5, N'Thịt Lợn', 100000.0000)
SET IDENTITY_INSERT [dbo].[NguyenLieu] OFF
GO
INSERT [dbo].[NhaCungCap] ([NCC_ID], [TenNhaCungCap], [DiaChi], [Phone]) VALUES (1, N'Bách Hóa Xanh', N'23 Nghĩa Tân, Cầu Giấy , Hà Nội', N'0988738565')
INSERT [dbo].[NhaCungCap] ([NCC_ID], [TenNhaCungCap], [DiaChi], [Phone]) VALUES (2, N'Cung Cấp Cafr', N'385 Hoàng Quốc Việt, cầu Giấyi', N'0961848526')
INSERT [dbo].[NhaCungCap] ([NCC_ID], [TenNhaCungCap], [DiaChi], [Phone]) VALUES (3, N'Cung Cấp Trè', N'311 Chùa Láng , Đốn Đa , Hà Nội', N'19001212')
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([NV_ID], [TenNhanVien], [NgaySinh], [DiaChi], [HeSoLuong], [PathPhoto], [TaiKhoan], [MatKhau], [GioiTinh], [SoDienThoai]) VALUES (1, N'Admin', NULL, NULL, NULL, NULL, N'admin', N'admin', NULL, NULL)
INSERT [dbo].[NhanVien] ([NV_ID], [TenNhanVien], [NgaySinh], [DiaChi], [HeSoLuong], [PathPhoto], [TaiKhoan], [MatKhau], [GioiTinh], [SoDienThoai]) VALUES (3, N'Hoàng Văn Thi', CAST(N'2003-02-02' AS Date), N'Bắc Giang', CAST(1.30 AS Decimal(5, 2)), N'/asset/img/imgWeb/anh1.jpg', N'006', N'002', N'Nam', N'0987654321')
INSERT [dbo].[NhanVien] ([NV_ID], [TenNhanVien], [NgaySinh], [DiaChi], [HeSoLuong], [PathPhoto], [TaiKhoan], [MatKhau], [GioiTinh], [SoDienThoai]) VALUES (5, N'Trịnh Văn Quyết', CAST(N'2001-10-01' AS Date), N'Hòa Bình', CAST(1.50 AS Decimal(5, 2)), N'/asset/img/imgWeb/anh2.jpg', N'003', N'003', N'Nam', N'0912345678')
INSERT [dbo].[NhanVien] ([NV_ID], [TenNhanVien], [NgaySinh], [DiaChi], [HeSoLuong], [PathPhoto], [TaiKhoan], [MatKhau], [GioiTinh], [SoDienThoai]) VALUES (6, N'Trần Đức Nghĩa', CAST(N'2003-12-02' AS Date), N'Hà Nội', CAST(1.60 AS Decimal(5, 2)), N'/asset/img/imgWeb/anh3.jpg', N'004', N'004', N'Nam', N'0923456789')
INSERT [dbo].[NhanVien] ([NV_ID], [TenNhanVien], [NgaySinh], [DiaChi], [HeSoLuong], [PathPhoto], [TaiKhoan], [MatKhau], [GioiTinh], [SoDienThoai]) VALUES (7, N'Nguyễn Văn Cuong', CAST(N'2000-12-30' AS Date), N'Ninh Bình', CAST(1.30 AS Decimal(5, 2)), N'/asset/img/imgWeb/anh4.jpg', N'005', N'005', N'Nam', N'0934567890')
INSERT [dbo].[NhanVien] ([NV_ID], [TenNhanVien], [NgaySinh], [DiaChi], [HeSoLuong], [PathPhoto], [TaiKhoan], [MatKhau], [GioiTinh], [SoDienThoai]) VALUES (8, N'Đỗ Văn Dũng', CAST(N'2001-11-21' AS Date), N'Bắc Giang', CAST(1.30 AS Decimal(5, 2)), N'/asset/img/imgWeb/anh5.jpg', N'008', N'002', N'Nam', N'0945678901')
INSERT [dbo].[NhanVien] ([NV_ID], [TenNhanVien], [NgaySinh], [DiaChi], [HeSoLuong], [PathPhoto], [TaiKhoan], [MatKhau], [GioiTinh], [SoDienThoai]) VALUES (9, N'Phạm Nam Thư', CAST(N'2003-10-22' AS Date), N'Nam Định', CAST(1.30 AS Decimal(5, 2)), N'/asset/img/imgWeb/anh6.jpeg', N'007', N'002', N'Nữ', N'0956789012')
INSERT [dbo].[NhanVien] ([NV_ID], [TenNhanVien], [NgaySinh], [DiaChi], [HeSoLuong], [PathPhoto], [TaiKhoan], [MatKhau], [GioiTinh], [SoDienThoai]) VALUES (10, N'Nguyễn Đức Dũng', CAST(N'2004-02-06' AS Date), N'Bắc Giang', CAST(1.30 AS Decimal(5, 2)), N'/asset/img/imgWeb/anh7.jpg', N'duccdung', N'123', N'Nam', N'0967890123')
INSERT [dbo].[NhanVien] ([NV_ID], [TenNhanVien], [NgaySinh], [DiaChi], [HeSoLuong], [PathPhoto], [TaiKhoan], [MatKhau], [GioiTinh], [SoDienThoai]) VALUES (11, N'Nguyễn Đức Nam', CAST(N'2000-03-06' AS Date), N'Bắc Ninh', CAST(1.20 AS Decimal(5, 2)), N'/asset/img/imgWeb/anh8.jpg', N'MrNam', N'456', N'Nam', N'0978901234')
INSERT [dbo].[NhanVien] ([NV_ID], [TenNhanVien], [NgaySinh], [DiaChi], [HeSoLuong], [PathPhoto], [TaiKhoan], [MatKhau], [GioiTinh], [SoDienThoai]) VALUES (12, N'Trần Đăng Tuấn', CAST(N'2001-03-05' AS Date), N'Nam Định', CAST(1.20 AS Decimal(5, 2)), N'/asset/img/imgWeb/anh9.jpeg', N'Tân', N'444', N'Nam', N'0989012345')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[NV_NC] ON 

INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (1, 3, 1, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (2, 3, 2, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (3, 3, 3, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (4, 3, 4, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (5, 3, 5, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (6, 3, 6, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (7, 3, 7, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (8, 3, 8, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (9, 3, 20, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (10, 3, 10, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (11, 5, 1, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (12, 5, 2, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (13, 5, 3, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (14, 5, 4, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (15, 5, 5, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (16, 5, 6, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (17, 5, 7, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (18, 5, 8, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (19, 5, 9, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (20, 5, 10, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (21, 6, 1, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (22, 6, 2, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (23, 6, 3, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (24, 6, 4, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (25, 6, 5, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (26, 6, 6, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (27, 6, 7, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (28, 6, 8, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (29, 6, 9, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (30, 6, 10, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (31, 7, 1, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (32, 7, 2, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (33, 7, 3, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (34, 7, 4, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (35, 7, 5, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (36, 7, 6, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (37, 7, 7, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (38, 7, 8, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (39, 7, 9, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (40, 7, 10, 1)
INSERT [dbo].[NV_NC] ([NVNC_ID], [NV_ID], [NC_ID], [KiemTra]) VALUES (41, 3, 11, 1)
SET IDENTITY_INSERT [dbo].[NV_NC] OFF
GO
SET IDENTITY_INSERT [dbo].[NV_PQ] ON 

INSERT [dbo].[NV_PQ] ([NV_PQ_ID], [NV_ID], [PQ_ID], [MoTa]) VALUES (1, 1, 1, N'Admin quy?n admin')
INSERT [dbo].[NV_PQ] ([NV_PQ_ID], [NV_ID], [PQ_ID], [MoTa]) VALUES (2, 3, 2, N'Nhân viên quy?n nhân viên')
INSERT [dbo].[NV_PQ] ([NV_PQ_ID], [NV_ID], [PQ_ID], [MoTa]) VALUES (3, 5, 2, N'Nhân viên quy?n nhân viên')
INSERT [dbo].[NV_PQ] ([NV_PQ_ID], [NV_ID], [PQ_ID], [MoTa]) VALUES (4, 6, 2, N'Nhân viên quy?n nhân viên')
INSERT [dbo].[NV_PQ] ([NV_PQ_ID], [NV_ID], [PQ_ID], [MoTa]) VALUES (5, 7, 2, N'Nhân viên quy?n nhân viên')
INSERT [dbo].[NV_PQ] ([NV_PQ_ID], [NV_ID], [PQ_ID], [MoTa]) VALUES (6, 8, 2, N'Nhân viên quy?n nhân viên')
INSERT [dbo].[NV_PQ] ([NV_PQ_ID], [NV_ID], [PQ_ID], [MoTa]) VALUES (7, 9, 2, N'Nhân viên quy?n nhân viên')
INSERT [dbo].[NV_PQ] ([NV_PQ_ID], [NV_ID], [PQ_ID], [MoTa]) VALUES (8, 10, 2, N'Nhân viên quy?n nhân viên')
INSERT [dbo].[NV_PQ] ([NV_PQ_ID], [NV_ID], [PQ_ID], [MoTa]) VALUES (9, 11, 2, N'Nhân viên quy?n nhân viên')
INSERT [dbo].[NV_PQ] ([NV_PQ_ID], [NV_ID], [PQ_ID], [MoTa]) VALUES (10, 12, 2, N'Nhân viên quy?n nhân viên')
SET IDENTITY_INSERT [dbo].[NV_PQ] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([PQ_ID], [TenQuyen]) VALUES (1, N'Admin')
INSERT [dbo].[PhanQuyen] ([PQ_ID], [TenQuyen]) VALUES (2, N'Nhan vien')
INSERT [dbo].[PhanQuyen] ([PQ_ID], [TenQuyen]) VALUES (3, N'Quan Lý')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (1, 1, N'Cafe muối', N'Cà phê muối với hương vị đậm đà và vị mặn nhẹ từ muối, mang đến trải nghiệm mới lạ cho người thưởng thức.', 30000.0000, N'/asset/img/imgWeb/caffemuoi.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (2, 2, N'Freeze chanh', N'Thức uống đá xay vị chanh tươi mát, chua dịu, giúp giải nhiệt và mang lại cảm giác sảng khoái.', 35000.0000, N'/asset/img/imgWeb/chanhtuyet.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (3, 3, N'Trà đào cam sả', N'Trá đào cam sả kết hợp giữa vị ngọt của đào, vị chua của cam và hương thơm của sả, tạo cảm giác thanh mát.', 35000.0000, N'/asset/img/imgWeb/Tradaocamsa.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (4, 4, N'Cam vắt', N'Nước cam vắt tươi, nguyên chất, giàu vitamin C, mang lại sự tươi mát và năng lượng cho ngày dài.', 10000.0000, N'/asset/img/imgWeb/camvat.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (6, 1, N'Đen đá', N'Cà phê đen pha với đá, giữ nguyên hương vị cà phê đậm đà và mạnh mẽ, phù hợp cho người thích vị cà phê nguyên bản.', 25000.0000, N'/asset/img/imgWeb/cafeden.jpeg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (7, 1, N'Nâu đá', N'Cà phê nâu đá với vị đắng nhẹ của cà phê hòa quyện cùng vị ngọt của sữa, mang đến cảm giác dễ chịu.', 28000.0000, N'/asset/img/imgWeb/cafenau.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (8, 1, N'Bạc sỉu', N'Cà phê bạc sỉu với tỉ lệ sữa nhiều hơn cà phê, cho hương vị ngọt ngào và nhẹ nhàng, phù hợp cho người không uống đậm.', 38000.0000, N'/asset/img/imgWeb/bacxiu.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (9, 1, N'Americano', N'Cà phê Americano với hương vị nhẹ nhàng, được pha loãng từ espresso, phù hợp để nhâm nhi trong thời gian dài.', 30000.0000, N'/asset/img/imgWeb/americano.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (10, 1, N'Capuchino', N'Capuchino pha từ espresso, sữa nóng và bọt sữa, mang đến hương vị cân bằng giữa đắng nhẹ và béo ngọt.', 40000.0000, N'/asset/img/imgWeb/capuchino.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (11, 1, N'Bạc sỉu bạc hà', N'Cà phê bạc sỉu bạc hà độc đáo, kết hợp giữa vị cà phê sữa truyền thống và hương bạc hà tươi mát.', 40000.0000, N'/asset/img/imgWeb/Bacsiubacha.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (12, 2, N'Freeze matcha', N'Freeze matcha đá xay với vị trà xanh matcha Nhật Bản, đậm đà và thanh mát, phù hợp với người yêu thích matcha.', 50000.0000, N'/asset/img/imgWeb/matchadasay.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (13, 2, N'Freeze việt quất', N'Freeze việt quất đá xay, mang lại hương vị chua ngọt đặc trưng của việt quất, vừa sảng khoái vừa bổ dưỡng.', 10000.0000, N'asset/img/imgWeb\mksdfbft.vmi.jpeg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (14, 1, N'Cafe cốt dừa', N'Cà phê cốt dừa với lớp cốt dừa béo ngậy hòa quyện với cà phê đậm đà, tạo nên trải nghiệm độc đáo và thơm ngon.', 49000.0000, N'/asset/img/imgWeb/cafecotdua.png')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (15, 2, N'Freeze chocolate', N'Freeze chocolate đá xay với vị sô cô la ngọt ngào, mát lạnh, thích hợp cho những người yêu thích hương vị sô cô la.', 49000.0000, N'/asset/img/imgWeb/chocolatedasay.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (16, 3, N'Hồng trà', N'Hồng trà đậm đà, được pha từ lá trà đen, giúp thư giãn và cung cấp năng lượng cho cơ thể.', 35000.0000, N'/asset/img/imgWeb/Hongtra.jpeg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (17, 3, N'Hồng trà machiato', N'Hồng trà machiato với lớp kem béo mịn bên trên, kết hợp với hồng trà đậm đà, mang lại sự hòa quyện tuyệt vời.', 40000.0000, N'/asset/img/imgWeb/hongtramachiato.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (18, 3, N'Olong thanh mát', N'Trá oolong thanh mát với hương vị nhẹ nhàng, giúp giải nhiệt và tốt cho sức khỏe.', 49000.0000, N'/asset/img/imgWeb/olongthanhmat.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (19, 3, N'Olong sen vàng', N'Trá oolong sen vàng với hương sen thơm ngát, kết hợp vị trà oolong nhẹ nhàng, giúp thư giãn tinh thần.', 40000.0000, N'/asset/img/imgWeb/olongsenvang.jpeg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (20, 3, N'Olong cremy', N'Thức uống trà oolong thơm ngon, béo ngậy với lớp kem sữa mềm mịn bên trên, phù hợp cho những ai yêu thích hương vị đậm đà.', 45000.0000, N'/asset/img/imgWeb/olongcream.png')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (21, 4, N'Dứa ép', N'Nước ép từ những quả dứa tươi ngon, giàu vitamin C, giúp thanh lọc cơ thể và mang lại cảm giác tươi mát.', 30000.0000, N'/asset/img/imgWeb/duaep.jpeg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (22, 4, N'Bưởi ép', N'Nước ép bưởi tươi ngon, chua nhẹ, giúp giảm cân và cung cấp nhiều vitamin cho cơ thể.', 30000.0000, N'/asset/img/imgWeb/buoiep.jpeg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (23, 4, N'Dưa hấu ép', N'Nước ép dưa hấu tươi mát, thanh lọc cơ thể và giải nhiệt ngày hè, mang đến cảm giác sảng khoái.', 35000.0000, N'/asset/img/imgWeb/duahauep.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (24, 4, N'Sinh tố bơ', N'Sinh tố bơ mịn màng, béo ngậy, giàu dinh dưỡng, là thức uống hoàn hảo cho sức khỏe và làn da.', 40000.0000, N'/asset/img/imgWeb/sinhtobo.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (25, 5, N'Cacao', N'Bột cacao nguyên chất, thơm ngon, giúp tăng năng lượng và mang lại cảm giác thư giãn.', 45000.0000, N'/asset/img/imgWeb/cacao.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (26, 5, N'Trà cam quế', N'Trà cam quế thanh mát với hương vị chua nhẹ của cam và thơm nồng của quế, giúp thư giãn.', 45000.0000, N'/asset/img/imgWeb/tracamque.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (27, 5, N'Trà hoa cúc', N'Trà hoa cúc nhẹ nhàng, giúp giảm căng thẳng và mang lại cảm giác thư giãn tuyệt vời.', 49000.0000, N'/asset/img/imgWeb/trahoacuc.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (28, 5, N'Trà hoa nhài', N'Trà hoa nhài tinh khiết, thanh tao với hương thơm dịu nhẹ, giúp thư giãn và tịnh tâm.', 45000.0000, N'/asset/img/imgWeb/trahoanhai.webp')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (29, 6, N'Cafe DBA', N'Cafe DBA đậm đà, được pha chế từ những hạt cà phê chất lượng cao, mang đến trải nghiệm tuyệt vời.', 50000.0000, N'/asset/img/imgWeb/DBA.jpeg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (30, 6, N'Đồ ăn DBA', N'Đồ ăn nhẹ DBA với hương vị độc đáo, giúp bữa ăn thêm phong phú và đa dạng hơn.', 50000.0000, N'/asset/img/imgWeb/BanhDBA.webp')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (31, 7, N'Hạt sen', N'Hạt sen giòn bùi, là món ăn vặt ngon và bổ dưỡng, rất tốt cho sức khỏe và giấc ngủ.', 5000.0000, N'/asset/img/imgWeb/Hatsen.jpeg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (32, 7, N'Nha đam', N'Thức uống nha đam tươi mát, thanh lọc cơ thể, giúp làn da khỏe mạnh và đẹp tự nhiên.', 5000.0000, N'/asset/img/imgWeb/Nhadam.webp')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (33, 7, N'Trân châu', N'Trân châu dẻo dai, được làm từ bột sắn chất lượng cao, là topping không thể thiếu cho trà sữa.', 5000.0000, N'/asset/img/imgWeb/tranchau.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (34, 7, N'Thạch ', N'Thạch dẻo nhiều màu sắc, ngọt ngào và hấp dẫn, là lựa chọn hoàn hảo cho các loại đồ uống.', 5000.0000, N'/asset/img/imgWeb/thach.webp')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (35, 8, N'Bánh dâu tây', N'Bánh dâu tây tươi mát, ngọt ngào với lớp kem mịn màng và dâu tây tươi ngon.', 30000.0000, N'/asset/img/imgWeb/banhdauay.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (36, 8, N'Bánh chuối', N'Bánh chuối thơm lừng, mềm mịn và bổ dưỡng, là món tráng miệng tuyệt vời cho mọi bữa ăn.', 35000.0000, N'/asset/img/imgWeb/banhhchuoi.jpeg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (37, 8, N'Bánh bông lan', N'Bánh bông lan mềm mại với lớp kem mịn và hương vị ngọt ngào, thích hợp cho các buổi tiệc trà.', 40000.0000, N'/asset/img/imgWeb/banhbonglan.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (38, 8, N'Bánh su kem', N'Bánh su kem béo ngậy, nhân kem mịn màng tan chảy trong miệng, phù hợp với mọi lứa tuổi.', 45000.0000, N'/asset/img/imgWeb/banhsukem.webp')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (39, 2, N'Freeze Kem Bơ', N'Freeze Kem Bơ mát lạnh, kết hợp giữa kem béo ngậy và hương vị bơ thơm ngon, giải nhiệt mùa hè.', 100000.0000, N'asset/img/imgWeb\kg0ffpbt.l2n.jpg')
INSERT [dbo].[Product] ([Product_ID], [Cate_ID], [TenSanPham], [MoTa], [GiaTien], [PathPhoto]) VALUES (41, 1, N'Freeze bưởi', N'ngon', 50000.0000, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductConditions] ON 

INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (1, 1, N'Đá')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (2, 1, N'Nóng')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (3, 2, N'Ít đá')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (4, 2, N'Bớt chua')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (5, 3, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (6, 4, N'Nóng')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (7, 4, N'Đá')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (8, 4, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (9, 6, N'Không đường')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (10, 6, N'Ít đường')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (11, 7, N'Ít sữa')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (12, 7, N'Nóng')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (13, 8, N'Nóng')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (14, 8, N'Đá')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (15, 9, N'Nóng')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (16, 9, N'Đá')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (17, 10, N'Nóng')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (18, 10, N'Đá')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (19, 11, N'Nóng')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (20, 11, N'Đá')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (21, 12, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (22, 13, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (23, 17, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (24, 17, N'Nóng')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (25, 18, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (26, 19, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (27, 20, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (28, 21, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (29, 22, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (30, 23, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (31, 24, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (32, 25, N'Nóng')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (33, 26, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (34, 27, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (35, 28, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (36, 29, N'Ít ngọt')
INSERT [dbo].[ProductConditions] ([ProductCondition_ID], [Product_ID], [Condition]) VALUES (37, 30, N'Ít ngọt')
SET IDENTITY_INSERT [dbo].[ProductConditions] OFF
GO
SET IDENTITY_INSERT [dbo].[Thuong] ON 

INSERT [dbo].[Thuong] ([T_ID], [NV_ID], [TenThuong], [TienThuong]) VALUES (1, 1, N'Thu?ng nang su?t', 500000.0000)
INSERT [dbo].[Thuong] ([T_ID], [NV_ID], [TenThuong], [TienThuong]) VALUES (2, 1, N'Thu?ng tháng', 300000.0000)
INSERT [dbo].[Thuong] ([T_ID], [NV_ID], [TenThuong], [TienThuong]) VALUES (3, 1, N'Thu?ng nam', 1000000.0000)
INSERT [dbo].[Thuong] ([T_ID], [NV_ID], [TenThuong], [TienThuong]) VALUES (4, 1, N'Thu?ng hoàn thành d? án', 750000.0000)
SET IDENTITY_INSERT [dbo].[Thuong] OFF
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT ((0)) FOR [VanChuyen]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_DH_ID] FOREIGN KEY([DH_ID])
REFERENCES [dbo].[DonHang] ([DH_ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_DonHang_DH_ID]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([HDN_ID])
REFERENCES [dbo].[HoaDonNhap] ([HDN_ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD FOREIGN KEY([NL_ID])
REFERENCES [dbo].[NguyenLieu] ([NL_ID])
GO
ALTER TABLE [dbo].[CongThuc]  WITH CHECK ADD FOREIGN KEY([NL_ID])
REFERENCES [dbo].[NguyenLieu] ([NL_ID])
GO
ALTER TABLE [dbo].[CongThuc]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([Ban_ID])
REFERENCES [dbo].[Ban] ([Ban_ID])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([KH_ID])
REFERENCES [dbo].[KhachHang] ([KH_ID])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([KM_ID])
REFERENCES [dbo].[KhuyenMai] ([KM_ID])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([NV_ID])
REFERENCES [dbo].[NhanVien] ([NV_ID])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([NCC_ID])
REFERENCES [dbo].[NhaCungCap] ([NCC_ID])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([NV_ID])
REFERENCES [dbo].[NhanVien] ([NV_ID])
GO
ALTER TABLE [dbo].[NV_NC]  WITH CHECK ADD  CONSTRAINT [FK_NV_NC_NgayCong] FOREIGN KEY([NC_ID])
REFERENCES [dbo].[NgayCong] ([NC_ID])
GO
ALTER TABLE [dbo].[NV_NC] CHECK CONSTRAINT [FK_NV_NC_NgayCong]
GO
ALTER TABLE [dbo].[NV_NC]  WITH CHECK ADD  CONSTRAINT [FK_NV_NC_NhanVien] FOREIGN KEY([NV_ID])
REFERENCES [dbo].[NhanVien] ([NV_ID])
GO
ALTER TABLE [dbo].[NV_NC] CHECK CONSTRAINT [FK_NV_NC_NhanVien]
GO
ALTER TABLE [dbo].[NV_PQ]  WITH CHECK ADD FOREIGN KEY([NV_ID])
REFERENCES [dbo].[NhanVien] ([NV_ID])
GO
ALTER TABLE [dbo].[NV_PQ]  WITH CHECK ADD FOREIGN KEY([PQ_ID])
REFERENCES [dbo].[PhanQuyen] ([PQ_ID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Cate_ID])
REFERENCES [dbo].[Category] ([Cate_ID])
GO
ALTER TABLE [dbo].[ProductConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProductCondition_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductConditions] CHECK CONSTRAINT [FK_ProductCondition_Product]
GO
ALTER TABLE [dbo].[Thuong]  WITH CHECK ADD FOREIGN KEY([NV_ID])
REFERENCES [dbo].[NhanVien] ([NV_ID])
GO
/****** Object:  StoredProcedure [dbo].[cau2]    Script Date: 11/23/2024 4:08:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[cau2]
@NVID int, @thang int, @nam int
as
	 
	select HeSoLuong * 200000 * COUNT(NV_NC.NV_ID)
	from NhanVien
	inner join NV_NC on NhanVien.NV_ID = NV_NC.NV_ID
	inner join NgayCong on NV_NC.NC_ID = NgayCong.NC_ID
	where @NVID = NhanVien.NV_ID and @thang = MONTH(NgayCong) and @nam = YEAR(NgayCong)
	group by NhanVien.HeSoLuong
GO
/****** Object:  StoredProcedure [dbo].[cau8]    Script Date: 11/23/2024 4:08:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[cau8]
	@NVID int,
	@thang int,
	@nam int
as
	begin
	select *
	from HoaDonNhap
	where @NVID = HoaDonNhap.NV_ID and @thang = MONTH(NgayNhanHang) and @nam = YEAR(NgayNhanHang)
	end
GO
USE [master]
GO
ALTER DATABASE [QLNhaHang_BTL] SET  READ_WRITE 
GO
