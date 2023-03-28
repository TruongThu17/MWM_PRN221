USE [master]
GO
/****** Object:  Database [MWMSystem]    Script Date: 3/28/2023 12:44:10 PM ******/
CREATE DATABASE [MWMSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MWMSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MWMSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MWMSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MWMSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MWMSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MWMSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MWMSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MWMSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MWMSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MWMSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MWMSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [MWMSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MWMSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MWMSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MWMSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MWMSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MWMSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MWMSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MWMSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MWMSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MWMSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MWMSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MWMSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MWMSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MWMSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MWMSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MWMSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MWMSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MWMSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [MWMSystem] SET  MULTI_USER 
GO
ALTER DATABASE [MWMSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MWMSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MWMSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MWMSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MWMSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MWMSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MWMSystem', N'ON'
GO
ALTER DATABASE [MWMSystem] SET QUERY_STORE = OFF
GO
USE [MWMSystem]
GO
/****** Object:  Table [dbo].[Billed]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](150) NOT NULL,
	[DateImport] [date] NULL,
	[IDCustomer] [int] NOT NULL,
	[TotalBill] [money] NULL,
	[Debt] [money] NULL,
	[Deposit] [money] NULL,
	[Status] [bit] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Billed] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Address] [nvarchar](300) NULL,
	[Note] [nvarchar](300) NULL,
	[Dob] [date] NULL,
	[Email] [varchar](250) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportProduct]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](150) NOT NULL,
	[DateImport] [date] NULL,
	[TotalBill] [money] NULL,
	[Supplier] [int] NULL,
	[CodeImport] [varchar](150) NULL,
	[Discount] [int] NULL,
 CONSTRAINT [PK_ImportProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InforImport]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InforImport](
	[IDImport] [int] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[ImportPrice] [money] NOT NULL,
	[DateExpiry] [date] NOT NULL,
	[Discount] [float] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[DateImport] [date] NOT NULL,
	[QuantityImport] [int] NOT NULL,
	[Shelves] [varchar](150) NOT NULL,
 CONSTRAINT [PK_InforImport] PRIMARY KEY CLUSTERED 
(
	[IDImport] ASC,
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Producer] [nvarchar](250) NULL,
	[ProductType] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[Unit] [nvarchar](250) NULL,
	[SalePrice] [money] NULL,
	[QuantityInStock] [int] NULL,
	[QuantityOrder] [int] NULL,
	[QuantitySold] [int] NULL,
	[TotalSales] [money] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReturnImport]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReturnImport](
	[IDReturn] [int] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[IDImport] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_ProductReturnImport] PRIMARY KEY CLUSTERED 
(
	[IDReturn] ASC,
	[IDProduct] ASC,
	[IDImport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsInBill]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsInBill](
	[IDBill] [int] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[Quatity] [int] NOT NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_ProductsInBill] PRIMARY KEY CLUSTERED 
(
	[IDBill] ASC,
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsReturn]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsReturn](
	[IDReturn] [int] NOT NULL,
	[IDBill] [int] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_ProductsReturn] PRIMARY KEY CLUSTERED 
(
	[IDReturn] ASC,
	[IDBill] ASC,
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Return]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Return](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](150) NOT NULL,
	[IDCustomer] [int] NOT NULL,
	[date] [date] NULL,
	[totalbill] [money] NULL,
	[IDBill] [int] NULL,
 CONSTRAINT [PK_Return] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReturnImportProduct]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnImportProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[totalbill] [money] NULL,
	[username] [varchar](150) NULL,
	[Suppiler] [int] NULL,
	[IDImport] [int] NULL,
 CONSTRAINT [PK_ReturnImportProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Email] [varchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [nvarchar](300) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/28/2023 12:44:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](150) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[Role] [int] NULL,
	[Name] [nvarchar](300) NULL,
	[Image] [varchar](300) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[Email] [varchar](150) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Billed] ON 
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (1, N'thutt', CAST(N'2023-03-02' AS Date), 1, 0.0000, 0.0000, 0.0000, 1, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (2, N'thutt', CAST(N'2023-01-03' AS Date), 2, 1000000.0000, 0.0000, 0.0000, 1, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (3, N'thutt', CAST(N'2023-02-23' AS Date), 3, 0.0000, 0.0000, 0.0000, 1, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (4, N'thutt', CAST(N'2023-03-02' AS Date), 4, 0.0000, 0.0000, 0.0000, 0, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (5, N'thutt', CAST(N'2023-03-02' AS Date), 5, 0.0000, 0.0000, 0.0000, 0, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (58, N'thutt', CAST(N'2023-03-20' AS Date), 1, 25000.0000, 25000.0000, 0.0000, 0, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (59, N'thutt', CAST(N'2023-03-20' AS Date), 1, 100000.0000, 100000.0000, 0.0000, 0, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (61, N'thutt', CAST(N'2023-03-20' AS Date), 1, 75000.0000, 0.0000, 0.0000, 1, 5)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (62, N'thutt', CAST(N'2023-03-27' AS Date), 1, 448.0000, 0.0000, 0.0000, 1, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (63, N'thutt', CAST(N'2023-03-27' AS Date), 21, 28.0000, 28.0000, 0.0000, 0, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (64, N'thutt', CAST(N'2023-03-27' AS Date), 1, 28.0000, 0.0000, 0.0000, 1, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (65, N'thutt', CAST(N'2023-03-27' AS Date), 1, 28.0000, 0.0000, 0.0000, 1, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (66, N'thutt', CAST(N'2023-03-27' AS Date), 1, 92.0000, 0.0000, 0.0000, 1, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (67, N'thutt', CAST(N'2023-03-27' AS Date), 1, 28.0000, 0.0000, 0.0000, 1, 0)
GO
INSERT [dbo].[Billed] ([ID], [Username], [DateImport], [IDCustomer], [TotalBill], [Debt], [Deposit], [Status], [Discount]) VALUES (68, N'thutt', CAST(N'2023-03-27' AS Date), 1, 28.0000, 0.0000, 0.0000, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Billed] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (1, N'Nguyễn Ngọc Anh', N'0999999999', N'Hà Nội', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (2, N'Nguyễn Thị Hạnh', N'0977777777', N'Hà Nội', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (3, N'Lê Văn Thắng', N'0123456789', N'Hà Nội', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (4, N'Lê Ngọc Hưng', N'0112222222', N'Hà Nội', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (5, N'Hoàng Văn Phú', N'0233445566', N'Hà Nội', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (6, N'Lê Đình Mạnh', N'0321456789', N'Thạch Thất', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (7, N'Nguyễn Ánh Hồng', N'0231456798', N'Ngọc Hà', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (8, N'Nguyễn Ngọc Nhung', N'0332245678', N'Thanh Trì', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (9, N'Trần Văn Minh', N'0123465789', N'Hà Nội', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (10, N'Lê Văn Hải', N'0111111111', N'Thanh Trì', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (11, N'Hoàng Ngọc Hưng', N'0311445566', N'Thạch Thất', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (12, N'a', N'111', N'sss', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (13, N'thu', N'0971341553', NULL, NULL, CAST(N'2023-03-14' AS Date), N'thu')
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (15, N's s', N'0971341553', N'hh', N't', CAST(N'2023-03-20' AS Date), N'thu@gmail.com')
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (18, N's s', N'0971341553', N'hh', N't', CAST(N'2023-02-26' AS Date), N'thu@gmail.com')
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (19, N'Nguyễn Ngọc Anha', N'0971341553', N'hh', N't', CAST(N'2023-03-21' AS Date), N'thu@gmail.com')
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (20, N'Nguyễn Ngọc Anha', N'0971341553', N'hh', N'a', CAST(N'2023-03-21' AS Date), N'thu@gmail.com')
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note], [Dob], [Email]) VALUES (21, N'thu', N'0971341553', N'hh', N'a', CAST(N'2023-03-28' AS Date), N'thu@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[ImportProduct] ON 
GO
INSERT [dbo].[ImportProduct] ([ID], [userName], [DateImport], [TotalBill], [Supplier], [CodeImport], [Discount]) VALUES (1, N'thutt', CAST(N'2023-02-27' AS Date), 101200000.0000, 1, N'IM01', 0)
GO
INSERT [dbo].[ImportProduct] ([ID], [userName], [DateImport], [TotalBill], [Supplier], [CodeImport], [Discount]) VALUES (2, N'thutt', CAST(N'2023-01-11' AS Date), 26200000.0000, 2, N'IM02', 0)
GO
INSERT [dbo].[ImportProduct] ([ID], [userName], [DateImport], [TotalBill], [Supplier], [CodeImport], [Discount]) VALUES (3, N'thutt', CAST(N'2023-01-22' AS Date), 39600000.0000, 1, N'IM03', 0)
GO
INSERT [dbo].[ImportProduct] ([ID], [userName], [DateImport], [TotalBill], [Supplier], [CodeImport], [Discount]) VALUES (4, N'thutt', CAST(N'2023-01-11' AS Date), 50800000.0000, 1, N'IM04', 0)
GO
INSERT [dbo].[ImportProduct] ([ID], [userName], [DateImport], [TotalBill], [Supplier], [CodeImport], [Discount]) VALUES (17, N'thutt', NULL, 2.9700, 1, NULL, 0)
GO
INSERT [dbo].[ImportProduct] ([ID], [userName], [DateImport], [TotalBill], [Supplier], [CodeImport], [Discount]) VALUES (18, N'thutt', NULL, 0.0000, 1, NULL, 0)
GO
INSERT [dbo].[ImportProduct] ([ID], [userName], [DateImport], [TotalBill], [Supplier], [CodeImport], [Discount]) VALUES (19, N'thutt', CAST(N'2023-03-25' AS Date), 0.9900, 1, N'aaa', 0)
GO
INSERT [dbo].[ImportProduct] ([ID], [userName], [DateImport], [TotalBill], [Supplier], [CodeImport], [Discount]) VALUES (20, N'thutt', CAST(N'2023-03-25' AS Date), 0.9900, 1, N'aaa', 0)
GO
INSERT [dbo].[ImportProduct] ([ID], [userName], [DateImport], [TotalBill], [Supplier], [CodeImport], [Discount]) VALUES (21, N'thutt', CAST(N'2023-03-23' AS Date), 0.9900, 1, N'aaa', 0)
GO
SET IDENTITY_INSERT [dbo].[ImportProduct] OFF
GO
INSERT [dbo].[InforImport] ([IDImport], [IDProduct], [ImportPrice], [DateExpiry], [Discount], [SupplierId], [DateImport], [QuantityImport], [Shelves]) VALUES (1, 1, 1270000.0000, CAST(N'2023-08-23' AS Date), 0, 1, CAST(N'2023-02-27' AS Date), 40, N'K1')
GO
INSERT [dbo].[InforImport] ([IDImport], [IDProduct], [ImportPrice], [DateExpiry], [Discount], [SupplierId], [DateImport], [QuantityImport], [Shelves]) VALUES (1, 2, 1260000.0000, CAST(N'2023-09-23' AS Date), 0, 1, CAST(N'2023-02-27' AS Date), 40, N'K2')
GO
INSERT [dbo].[InforImport] ([IDImport], [IDProduct], [ImportPrice], [DateExpiry], [Discount], [SupplierId], [DateImport], [QuantityImport], [Shelves]) VALUES (2, 1, 1310000.0000, CAST(N'2023-05-29' AS Date), 0, 2, CAST(N'2023-01-11' AS Date), 20, N'K3')
GO
INSERT [dbo].[InforImport] ([IDImport], [IDProduct], [ImportPrice], [DateExpiry], [Discount], [SupplierId], [DateImport], [QuantityImport], [Shelves]) VALUES (3, 3, 990000.0000, CAST(N'2023-05-20' AS Date), 0, 1, CAST(N'2023-01-22' AS Date), 40, N'K4')
GO
INSERT [dbo].[InforImport] ([IDImport], [IDProduct], [ImportPrice], [DateExpiry], [Discount], [SupplierId], [DateImport], [QuantityImport], [Shelves]) VALUES (4, 3, 1270000.0000, CAST(N'2023-05-23' AS Date), 0, 1, CAST(N'2023-01-11' AS Date), 40, N'K3')
GO
INSERT [dbo].[InforImport] ([IDImport], [IDProduct], [ImportPrice], [DateExpiry], [Discount], [SupplierId], [DateImport], [QuantityImport], [Shelves]) VALUES (21, 1, 1.0000, CAST(N'2023-03-25' AS Date), 1, 1, CAST(N'2023-03-23' AS Date), 1, N'k1')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (1, N'Xi Mang Bim Son PC400', N'Xi Mang Bim Son', 1, 1, N'Tan', 28.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (2, N'Xi Mang Bim Son PC30', N'Xi Mang Bim Son', 1, 1, N'Tan', 26000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (3, N'Xi Mang Cong Thanh PC40', N'Xi Mang Cong Thanh', 1, 1, N'Tan', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (4, N'Xi Mang Tam Diep PCB30', N'Xi Mang Tam Diep', 1, 1, N'Tan', 30000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (5, N'Xi Mang But Son PCB40', N'Xi Mang But Son', 1, 0, N'Tan', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (6, N'	Xi Mang But Son PCB30', N'Xi Mang But Son', 1, 1, N'Tan', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (7, N'	Xi Mang Vissai PCB40', N'Xi Mang Vissai', 1, 0, N'Tan', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (8, N'	Xi Mang Vissai PCB30', N'Xi Mang Vissai', 1, 0, N'Tan', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (9, N'D6,8', N'Hoa Phat', 2, 1, N'Kg', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (10, N'D6,8', N'Viet Duc', 2, 1, N'Kg', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (11, N'D8V', N'Hoa Phat', 2, 1, N'Kg', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (12, N'D10', N'Hoa Phat', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (13, N'D10', N'Viet Duc', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (14, N'D12', N'Hoa Phat', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (15, N'D12', N'Viet Duc', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (16, N'D14', N'Hoa Phat', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (17, N'D14', N'Viet Duc', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (18, N'D16', N'Hoa Phat', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (19, N'D16', N'Viet Duc', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (20, N'D18', N'Hoa Phat', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (21, N'D18', N'Viet Duc', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (22, N'D20', N'Hoa Phat', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (23, N'D20', N'Viet Duc', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (24, N'D22', N'Hoa Phat', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (25, N'D22', N'Viet Duc', 2, 1, N'Cay', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (26, N'D8V', N'Viet Duc', 2, 1, N'Kg', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (31, N'a', N'a', 1, 0, N't', 25000.0000, 0, 0, 0, 0.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status], [Unit], [SalePrice], [QuantityInStock], [QuantityOrder], [QuantitySold], [TotalSales]) VALUES (32, N'a', N'a', 1, 0, N'tan', 2222.0000, 22, 0, 0, 0.0000)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductReturnImport] ([IDReturn], [IDProduct], [IDImport], [Quantity], [Price]) VALUES (4, 1, 1, 0, 1270000.0000)
GO
INSERT [dbo].[ProductReturnImport] ([IDReturn], [IDProduct], [IDImport], [Quantity], [Price]) VALUES (4, 2, 1, 1, 1260000.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (58, 1, 5, 25000.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (59, 1, 5, 25000.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (59, 2, 5, 25000.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (59, 3, 5, 25000.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (59, 5, 5, 25000.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (62, 1, 0, 28.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (63, 1, 0, 28.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (64, 1, 0, 28.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (65, 1, 0, 28.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (66, 2, 0, 23.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (66, 3, 0, 0.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (67, 1, 0, 28.0000)
GO
INSERT [dbo].[ProductsInBill] ([IDBill], [IDProduct], [Quatity], [Price]) VALUES (68, 1, 0, 28.0000)
GO
INSERT [dbo].[ProductsReturn] ([IDReturn], [IDBill], [IDProduct], [Quantity], [Price]) VALUES (10, 58, 1, 0, 25000.0000)
GO
INSERT [dbo].[ProductsReturn] ([IDReturn], [IDBill], [IDProduct], [Quantity], [Price]) VALUES (11, 58, 1, 0, 25000.0000)
GO
INSERT [dbo].[ProductsReturn] ([IDReturn], [IDBill], [IDProduct], [Quantity], [Price]) VALUES (12, 58, 1, 0, 25000.0000)
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 
GO
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (1, N'Xi Măng')
GO
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (2, N'Sắt, Thép')
GO
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Return] ON 
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (1, N'thutt', 1, CAST(N'2023-03-27' AS Date), NULL, 1)
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (2, N'thutt', 1, CAST(N'2023-03-27' AS Date), NULL, 58)
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (3, N'thutt', 1, CAST(N'2023-03-27' AS Date), NULL, 58)
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (4, N'thutt', 1, CAST(N'2023-03-27' AS Date), NULL, 58)
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (5, N'thutt', 1, CAST(N'2023-03-27' AS Date), NULL, 58)
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (6, N'thutt', 1, CAST(N'2023-03-27' AS Date), NULL, 58)
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (7, N'thutt', 1, CAST(N'2023-03-27' AS Date), NULL, 58)
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (8, N'thutt', 1, CAST(N'2023-03-27' AS Date), NULL, 58)
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (9, N'thutt', 1, CAST(N'2023-03-27' AS Date), NULL, 58)
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (10, N'thutt', 1, CAST(N'2023-03-27' AS Date), NULL, 58)
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (11, N'thutt', 1, CAST(N'2023-03-27' AS Date), 0.0000, 58)
GO
INSERT [dbo].[Return] ([ID], [username], [IDCustomer], [date], [totalbill], [IDBill]) VALUES (12, N'thutt', 1, CAST(N'2023-03-27' AS Date), 25000.0000, 58)
GO
SET IDENTITY_INSERT [dbo].[Return] OFF
GO
SET IDENTITY_INSERT [dbo].[ReturnImportProduct] ON 
GO
INSERT [dbo].[ReturnImportProduct] ([ID], [Date], [totalbill], [username], [Suppiler], [IDImport]) VALUES (1, CAST(N'2023-03-20' AS Date), 0.0000, N'thutt', 1, 1)
GO
INSERT [dbo].[ReturnImportProduct] ([ID], [Date], [totalbill], [username], [Suppiler], [IDImport]) VALUES (2, CAST(N'2023-03-19' AS Date), 0.0000, N'thutt', 1, 1)
GO
INSERT [dbo].[ReturnImportProduct] ([ID], [Date], [totalbill], [username], [Suppiler], [IDImport]) VALUES (3, CAST(N'2023-03-27' AS Date), 101200000.0000, N'thutt', 1, 1)
GO
INSERT [dbo].[ReturnImportProduct] ([ID], [Date], [totalbill], [username], [Suppiler], [IDImport]) VALUES (4, CAST(N'2023-03-27' AS Date), 1260000.0000, N'thutt', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[ReturnImportProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'admin')
GO
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'cashier')
GO
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (3, N'inventorycontrol')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (1, N'CTy CP DTNL Xay dung Thuong mai Hoang Son', N'HoangSonCPTM@gmail.com', N'0971333554', N'Hà Nội')
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (2, N'CTy Cuong Quoc', N'CuongQuocct@gmail.com', N'0972777888', N'Hà Nội')
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (3, N'CTy CP TYT', N'CPTYT@gmail.com', N'0971333551', N'Hà Nội')
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (4, N'VLXD VietHome', N'VietHomevlxd1.2@gmail.com', N'0971342252', N'Hà Nội')
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (5, N'VLXD Thien An', N'ThienAnvlxd22@gmail.com', N'0971221122', N'Hà Nội')
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (6, N'CTy CP VLXD Song Day', N'Songdaycpvlxd@gmail.com', N'0972276558', N'Hà Nội')
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (7, N'CTy TNHH Fixmart', N'Fixmarttnhh@gmail.com', N'0972111333', N'Hà Nội')
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (8, N'thu', N'thu@gmail.com', N'0971341553', N'sdfa')
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (9, N'lam thoi', N'lamabc@gamil.com', N'0971341553', N'bbb')
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (10, N'lam thoi', N'lamabc@gamil.com', N'0971341553', N'uuuu')
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (11, N'lam thoi', N'lamabc@gamil.com', N'0971341553', N'hhh')
GO
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[User] ([Username], [Password], [Role], [Name], [Image], [Phone], [Address], [Email], [Status]) VALUES (N'cashier', N'123456', 2, N'Cashier', NULL, N'123456789', N'Ha Noi', N'Cashier@gmail.com', 1)
GO
INSERT [dbo].[User] ([Username], [Password], [Role], [Name], [Image], [Phone], [Address], [Email], [Status]) VALUES (N'thutt', N'123456', 1, N'Trương Thu', NULL, N'123456789', N'Hà Nội', N'thutt@gmail.com', 1)
GO
INSERT [dbo].[User] ([Username], [Password], [Role], [Name], [Image], [Phone], [Address], [Email], [Status]) VALUES (N'thutt2', N'123456', 1, N'Hoài Thu', NULL, N'987654321', N'Hà Nội', N'thutt2@gmai.com', 1)
GO
ALTER TABLE [dbo].[Billed]  WITH CHECK ADD  CONSTRAINT [FK_Billed_Customer] FOREIGN KEY([IDCustomer])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Billed] CHECK CONSTRAINT [FK_Billed_Customer]
GO
ALTER TABLE [dbo].[Billed]  WITH CHECK ADD  CONSTRAINT [FK_Billed_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Billed] CHECK CONSTRAINT [FK_Billed_User]
GO
ALTER TABLE [dbo].[ImportProduct]  WITH CHECK ADD  CONSTRAINT [FK_ImportProduct_Supplier] FOREIGN KEY([Supplier])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[ImportProduct] CHECK CONSTRAINT [FK_ImportProduct_Supplier]
GO
ALTER TABLE [dbo].[ImportProduct]  WITH CHECK ADD  CONSTRAINT [FK_ImportProduct_User] FOREIGN KEY([userName])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[ImportProduct] CHECK CONSTRAINT [FK_ImportProduct_User]
GO
ALTER TABLE [dbo].[InforImport]  WITH CHECK ADD  CONSTRAINT [FK_InforImport_ImportProduct] FOREIGN KEY([IDImport])
REFERENCES [dbo].[ImportProduct] ([ID])
GO
ALTER TABLE [dbo].[InforImport] CHECK CONSTRAINT [FK_InforImport_ImportProduct]
GO
ALTER TABLE [dbo].[InforImport]  WITH CHECK ADD  CONSTRAINT [FK_InforImport_Product] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[InforImport] CHECK CONSTRAINT [FK_InforImport_Product]
GO
ALTER TABLE [dbo].[InforImport]  WITH CHECK ADD  CONSTRAINT [FK_InforImport_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[InforImport] CHECK CONSTRAINT [FK_InforImport_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_Table_1] FOREIGN KEY([ProductType])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_ProductType_Table_1]
GO
ALTER TABLE [dbo].[ProductReturnImport]  WITH CHECK ADD  CONSTRAINT [FK_ProductReturnImport_InforImport] FOREIGN KEY([IDImport], [IDProduct])
REFERENCES [dbo].[InforImport] ([IDImport], [IDProduct])
GO
ALTER TABLE [dbo].[ProductReturnImport] CHECK CONSTRAINT [FK_ProductReturnImport_InforImport]
GO
ALTER TABLE [dbo].[ProductReturnImport]  WITH CHECK ADD  CONSTRAINT [FK_ProductReturnImport_ReturnImportProduct] FOREIGN KEY([IDReturn])
REFERENCES [dbo].[ReturnImportProduct] ([ID])
GO
ALTER TABLE [dbo].[ProductReturnImport] CHECK CONSTRAINT [FK_ProductReturnImport_ReturnImportProduct]
GO
ALTER TABLE [dbo].[ProductsInBill]  WITH CHECK ADD  CONSTRAINT [FK_ProductsInBill_Billed] FOREIGN KEY([IDBill])
REFERENCES [dbo].[Billed] ([ID])
GO
ALTER TABLE [dbo].[ProductsInBill] CHECK CONSTRAINT [FK_ProductsInBill_Billed]
GO
ALTER TABLE [dbo].[ProductsInBill]  WITH CHECK ADD  CONSTRAINT [FK_ProductsInBill_Product] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductsInBill] CHECK CONSTRAINT [FK_ProductsInBill_Product]
GO
ALTER TABLE [dbo].[ProductsReturn]  WITH CHECK ADD  CONSTRAINT [FK_ProductsReturn_ProductsInBill] FOREIGN KEY([IDBill], [IDProduct])
REFERENCES [dbo].[ProductsInBill] ([IDBill], [IDProduct])
GO
ALTER TABLE [dbo].[ProductsReturn] CHECK CONSTRAINT [FK_ProductsReturn_ProductsInBill]
GO
ALTER TABLE [dbo].[ProductsReturn]  WITH CHECK ADD  CONSTRAINT [FK_ProductsReturn_Return] FOREIGN KEY([IDReturn])
REFERENCES [dbo].[Return] ([ID])
GO
ALTER TABLE [dbo].[ProductsReturn] CHECK CONSTRAINT [FK_ProductsReturn_Return]
GO
ALTER TABLE [dbo].[Return]  WITH CHECK ADD  CONSTRAINT [FK_Return_Billed] FOREIGN KEY([IDBill])
REFERENCES [dbo].[Billed] ([ID])
GO
ALTER TABLE [dbo].[Return] CHECK CONSTRAINT [FK_Return_Billed]
GO
ALTER TABLE [dbo].[Return]  WITH CHECK ADD  CONSTRAINT [FK_Return_Customer] FOREIGN KEY([IDCustomer])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Return] CHECK CONSTRAINT [FK_Return_Customer]
GO
ALTER TABLE [dbo].[Return]  WITH CHECK ADD  CONSTRAINT [FK_Return_User] FOREIGN KEY([username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Return] CHECK CONSTRAINT [FK_Return_User]
GO
ALTER TABLE [dbo].[ReturnImportProduct]  WITH CHECK ADD  CONSTRAINT [FK_ReturnImportProduct_ImportProduct] FOREIGN KEY([IDImport])
REFERENCES [dbo].[ImportProduct] ([ID])
GO
ALTER TABLE [dbo].[ReturnImportProduct] CHECK CONSTRAINT [FK_ReturnImportProduct_ImportProduct]
GO
ALTER TABLE [dbo].[ReturnImportProduct]  WITH CHECK ADD  CONSTRAINT [FK_ReturnImportProduct_Supplier] FOREIGN KEY([Suppiler])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[ReturnImportProduct] CHECK CONSTRAINT [FK_ReturnImportProduct_Supplier]
GO
ALTER TABLE [dbo].[ReturnImportProduct]  WITH CHECK ADD  CONSTRAINT [FK_ReturnImportProduct_User] FOREIGN KEY([username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[ReturnImportProduct] CHECK CONSTRAINT [FK_ReturnImportProduct_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [MWMSystem] SET  READ_WRITE 
GO
