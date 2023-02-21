USE [master]
GO
/****** Object:  Database [MWMSystem]    Script Date: 2/21/2023 10:33:42 AM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 2/21/2023 10:33:42 AM ******/
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
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformationProduct]    Script Date: 2/21/2023 10:33:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformationProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImportPrice] [float] NULL,
	[SalePrice] [float] NULL,
	[DateExpiry] [date] NULL,
	[QuantityInstock] [int] NULL,
	[Unit] [varchar](150) NULL,
	[Status] [bit] NOT NULL,
	[SupplierId] [int] NULL,
	[DateImport] [date] NULL,
	[Note] [nvarchar](200) NULL,
	[QuantityImport] [int] NULL,
	[Shelves] [varchar](150) NULL,
	[Discount] float null,
 CONSTRAINT [PK_InformationProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/21/2023 10:33:42 AM ******/
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
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 2/21/2023 10:33:42 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 2/21/2023 10:33:42 AM ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 2/21/2023 10:33:42 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/21/2023 10:33:42 AM ******/
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
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note]) VALUES (1, N'Nguyễn Ngọc Anh', N'0999999999', N'Hà Nội', N'Thân thiết')
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note]) VALUES (2, N'Nguyễn Thị Hạnh', N'0977777777', N'Hà Nội', NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note]) VALUES (3, N'Lê Văn Thắng', N'0123456789', N'Hà Nội', NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note]) VALUES (4, N'Lê Ngọc Hưng', N'0112222222', N'Hà Nội', NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note]) VALUES (5, N'Hoàng Văn Phú', N')233445566', N'Hà Nội', NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note]) VALUES (6, N'Lê Đình Mạnh', N'0321456789', N'Thạch Thất', NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note]) VALUES (7, N'Nguyễn Ánh Hồng', N'0231456798', N'Ngọc Hà', NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note]) VALUES (8, N'Nguyễn Ngọc Nhung', N'0332245678', N'Thanh Trì', NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note]) VALUES (9, N'Trần Văn Minh', N'0123465789', N'Hà Nội', NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note]) VALUES (10, N'Lê Văn Hải', N'0111111111', N'Thanh Trì', NULL)
GO
INSERT [dbo].[Customer] ([ID], [Name], [Phone], [Address], [Note]) VALUES (11, N'Hoàng Ngọc Hưng', N'0311445566', N'Thạch Thất', NULL)
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[InformationProduct] ON 
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (1, 2, 1270000, 1350000, CAST(N'2023-01-22' AS Date), 40, N'Tan', 1, 1, CAST(N'2023-06-21' AS Date), NULL, 40, N'K1',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (2, 2, 1260000, 1350000, CAST(N'2023-02-22' AS Date), 40, N'Tan', 1, 1, CAST(N'2023-07-21' AS Date), NULL, 40, N'K2',0.03)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (3, 2, 1270000, 1350000, CAST(N'2023-01-20' AS Date), 40, N'Tan', 1, 2, CAST(N'2023-06-21' AS Date), NULL, 40, N'K3',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (4, 1, 1310000, 1460000, CAST(N'2023-02-07' AS Date), 40, N'Tan', 1, 2, CAST(N'2023-06-21' AS Date), NULL, 40, N'K4',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (5, 1, 1330000, 1460000, CAST(N'2023-02-27' AS Date), 40, N'Tan', 1, 2, CAST(N'2023-07-27' AS Date), NULL, 60, N'K5',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (6, 3, 990000, 1140000, CAST(N'2023-02-27' AS Date), 90, N'Tan', 1, 3, CAST(N'2022-02-21' AS Date), NULL, 90, N'K6',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (7, 4, 970000, 1170000, CAST(N'2022-05-22' AS Date), 60, N'Tan', 1, 5, CAST(N'2022-02-21' AS Date), NULL, 60, N'K7',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (8, 4, 980000, 1170000, CAST(N'2022-03-22' AS Date), 40, N'Tan', 1, 4, CAST(N'2022-01-21' AS Date), NULL, 40, N'K8',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (9, 4, 980000, 1170000, CAST(N'2022-04-20' AS Date), 30, N'Tan', 1, 1, CAST(N'2022-02-21' AS Date), NULL, 30, N'K9',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (10, 5, 990000, 1190000, CAST(N'2022-02-20' AS Date), 0, N'Tan', 0, 1, CAST(N'2021-12-21' AS Date), NULL, 0, N'K10',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (11, 7, 1270000, 1320000, CAST(N'2021-03-21' AS Date), 0, N'Tan', 0, 7, CAST(N'2021-01-21' AS Date), NULL, 0, N'K11',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (12, 8, 1270000, 1350000, CAST(N'2021-02-02' AS Date), 0, N'Tan', 0, 6, CAST(N'2020-12-21' AS Date), NULL, 0, N'K12',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (13, 9, 17250, 18350, NULL, 9998000, N'Kg', 1, 1, CAST(N'2022-01-21' AS Date), NULL, 9998000, N'K13',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (14, 9, 17000, 18350, NULL, 50000000, N'Kg', 1, 2, CAST(N'2021-02-20' AS Date), NULL, 50000000, N'K14',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (15, 10, 17250, 18300, NULL, 80000000, N'Kg', 1, 1, CAST(N'2022-03-01' AS Date), NULL, 80000000, N'K15',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (16, 11, 17200, 18300, NULL, 80000000, N'Kg', 1, 1, CAST(N'2022-02-01' AS Date), NULL, 80000000, N'K16',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (17, 26, 17200, 18300, NULL, 80000000, N'Kg', 1, 1, CAST(N'2022-02-01' AS Date), N'', 80000000, N'K17',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (18, 12, 97000, 114000, NULL, 10000000, N'Cay', 1, 4, CAST(N'2022-01-11' AS Date), N'', 10000000, N'K18',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (19, 13, 96000, 113000, NULL, 79998000, N'Cay', 1, 4, CAST(N'2022-03-01' AS Date), N'', 79998000, N'K19',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (20, 14, 160000, 180000, NULL, 997000, N'Cay', 1, 4, CAST(N'2022-01-01' AS Date), N'', 997000, N'K20',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (21, 16, 227000, 247000, NULL, 1000000, N'Cay', 1, 4, CAST(N'2022-02-01' AS Date), N'', 1000000, N'K21',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (22, 17, 221000, 245000, NULL, 8000000, N'Cay', 1, 4, CAST(N'2022-03-01' AS Date), N'', 8000000, N'K22',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (23, 18, 289000, 313000, NULL, 1000000, N'Cay', 1, 4, CAST(N'2022-01-01' AS Date), N'', 1000000, N'K23',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (24, 19, 287100, 311500, NULL, 8000000, N'Cay', 1, 4, CAST(N'2022-02-01' AS Date), N'', 8000000, N'K24',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (25, 20, 381500, 408000, NULL, 997000, N'Cay', 1, 4, CAST(N'2022-01-01' AS Date), N'', 997000, N'K25',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (26, 21, 380000, 405000, NULL, 8000000, N'Cay', 1, 4, CAST(N'2022-03-01' AS Date), N'', 8000000, N'K26',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (27, 22, 485500, 506000, NULL, 1000000, N'Cay', 1, 4, CAST(N'2022-01-01' AS Date), N'', 1000000, N'K27',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (28, 23, 470500, 499000, NULL, 8000000, N'Cay', 1, 4, CAST(N'2022-02-01' AS Date), N'', 8000000, N'K28',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves], [Discount]) VALUES (29, 24, 590000, 610000, NULL, 997000, N'Cay', 1, 4, CAST(N'2022-01-01' AS Date), N'', 997000, N'K29',0)
GO
INSERT [dbo].[InformationProduct] ([ID], [ProductId], [ImportPrice], [SalePrice], [DateExpiry], [QuantityInstock], [Unit], [Status], [SupplierId], [DateImport], [Note], [QuantityImport], [Shelves]) VALUES (30, 25, 585500, 605000, NULL, 8000000, N'Cay', 1, 4, CAST(N'2022-01-01' AS Date), N'', 8000000, N'K30',0)
GO
SET IDENTITY_INSERT [dbo].[InformationProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (1, N'Xi Mang Bim Son PC40', N'Xi Mang Bim Son', 1, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (2, N'Xi Mang Bim Son PC30', N'Xi Mang Bim Son', 1, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (3, N'Xi Mang Cong Thanh PC40', N'Xi Mang Cong Thanh', 1, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (4, N'Xi Mang Tam Diep PCB30', N'Xi Mang Tam Diep', 1, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (5, N'Xi Mang But Son PCB40', N'Xi Mang But Son', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (6, N'	Xi Mang But Son PCB30', N'Xi Mang But Son', 1, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (7, N'	Xi Mang Vissai PCB40', N'Xi Mang Vissai', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (8, N'	Xi Mang Vissai PCB30', N'Xi Mang Vissai', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (9, N'D6,8', N'Hoa Phat', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (10, N'D6,8', N'Viet Duc', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (11, N'D8V', N'Hoa Phat', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (12, N'D10', N'Hoa Phat', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (13, N'D10', N'Viet Duc', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (14, N'D12', N'Hoa Phat', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (15, N'D12', N'Viet Duc', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (16, N'D14', N'Hoa Phat', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (17, N'D14', N'Viet Duc', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (18, N'D16', N'Hoa Phat', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (19, N'D16', N'Viet Duc', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (20, N'D18', N'Hoa Phat', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (21, N'D18', N'Viet Duc', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (22, N'D20', N'Hoa Phat', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (23, N'D20', N'Viet Duc', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (24, N'D22', N'Hoa Phat', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (25, N'D22', N'Viet Duc', 2, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Producer], [ProductType], [Status]) VALUES (26, N'D8V', N'Viet Duc', 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 
GO
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (1, N'Xi Măng')
GO
INSERT [dbo].[ProductType] ([ID], [Name]) VALUES (2, N'Sắt, Thép')
GO
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'admin')
GO
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'supperadmin')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (1, N'CTy CP DTNL Xay dung Thuong mai Hoang Son', N'HoangSonCPTM@gmail.com', N'0971333555', N'Hà Nội')
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
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[User] ([Username], [Password], [Role], [Name], [Image], [Phone], [Address], [Email], [Status]) VALUES (N'thutt', N'123456', 1, N'Trương Thu', NULL, N'123456789', N'Hà Nội', N'thutt@gmail.com', 1)
GO
INSERT [dbo].[User] ([Username], [Password], [Role], [Name], [Image], [Phone], [Address], [Email], [Status]) VALUES (N'thutt2', N'123456', 2, N'Hoài Thu', NULL, N'987654321', N'Hà Nội', N'thutt2@gmai.com', 1)
GO
ALTER TABLE [dbo].[InformationProduct]  WITH CHECK ADD  CONSTRAINT [FK_InformationProduct_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[InformationProduct] CHECK CONSTRAINT [FK_InformationProduct_Product]
GO
ALTER TABLE [dbo].[InformationProduct]  WITH CHECK ADD  CONSTRAINT [FK_InformationProduct_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[InformationProduct] CHECK CONSTRAINT [FK_InformationProduct_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_Table_1] FOREIGN KEY([ProductType])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_ProductType_Table_1]
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
