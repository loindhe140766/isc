USE [master]
GO
/****** Object:  Database [baloshop]    Script Date: 3/16/2022 9:13:23 AM ******/
CREATE DATABASE [baloshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'baloshop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\baloshop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'baloshop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\baloshop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [baloshop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [baloshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [baloshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [baloshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [baloshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [baloshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [baloshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [baloshop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [baloshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [baloshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [baloshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [baloshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [baloshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [baloshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [baloshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [baloshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [baloshop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [baloshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [baloshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [baloshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [baloshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [baloshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [baloshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [baloshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [baloshop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [baloshop] SET  MULTI_USER 
GO
ALTER DATABASE [baloshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [baloshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [baloshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [baloshop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [baloshop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [baloshop] SET QUERY_STORE = OFF
GO
USE [baloshop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/16/2022 9:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](80) NULL,
	[Account_Detail_Id] [int] NULL,
	[Role_ID] [int] NULL,
	[Status] [int] NULL,
	[Create_Date] [date] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Detail]    Script Date: 3/16/2022 9:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Detail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Phone_Number] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Account_Detail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/16/2022 9:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/16/2022 9:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account_Id] [int] NULL,
	[Create_Date] [date] NULL,
	[Total_Price] [decimal](18, 0) NULL,
	[Note] [nvarchar](1000) NULL,
	[Status] [int] NULL,
	[SellBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 3/16/2022 9:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_Id] [int] NULL,
	[Product_Id] [int] NULL,
	[Product_Name] [nvarchar](200) NULL,
	[Product_Quantity] [int] NULL,
	[Product_Price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Other_Address]    Script Date: 3/16/2022 9:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Other_Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Phone_Number] [nvarchar](100) NULL,
	[Address] [nvarchar](2000) NULL,
	[Order_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/16/2022 9:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Category_Id] [int] NULL,
	[Price] [float] NULL,
	[Description] [nvarchar](1200) NULL,
	[Quantity] [int] NULL,
	[Status] [int] NULL,
	[Image_Link] [nvarchar](200) NULL,
	[Note] [nvarchar](1000) NULL,
	[SellBy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/16/2022 9:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_Account]    Script Date: 3/16/2022 9:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_Order]    Script Date: 3/16/2022 9:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_Product]    Script Date: 3/16/2022 9:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Email], [Password], [Account_Detail_Id], [Role_ID], [Status], [Create_Date]) VALUES (1, N'admin@gmail.com', N'123456', 1, 1, 1, CAST(N'2018-08-10' AS Date))
INSERT [dbo].[Account] ([Id], [Email], [Password], [Account_Detail_Id], [Role_ID], [Status], [Create_Date]) VALUES (2, N'mod@gmail.com', N'1234567', 2, 2, 1, CAST(N'2018-08-10' AS Date))
INSERT [dbo].[Account] ([Id], [Email], [Password], [Account_Detail_Id], [Role_ID], [Status], [Create_Date]) VALUES (3, N'customer2@gmail.com', N'123456', 3, 2, 1, CAST(N'2018-08-20' AS Date))
INSERT [dbo].[Account] ([Id], [Email], [Password], [Account_Detail_Id], [Role_ID], [Status], [Create_Date]) VALUES (4, N'seller1@gmail.com', N'1', 5, 4, 1, CAST(N'2022-03-14' AS Date))
INSERT [dbo].[Account] ([Id], [Email], [Password], [Account_Detail_Id], [Role_ID], [Status], [Create_Date]) VALUES (5, N'seller2@gmail.com', N'1', 7, 4, 1, CAST(N'2022-03-14' AS Date))
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Account_Detail] ON 

INSERT [dbo].[Account_Detail] ([Id], [Name], [Phone_Number], [Gender], [Address]) VALUES (1, N'Trần Thế Vinh', N'01645090445', 1, N'22 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội')
INSERT [dbo].[Account_Detail] ([Id], [Name], [Phone_Number], [Gender], [Address]) VALUES (2, N'Trần Văn Bình', N'01646352891', 1, N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội')
INSERT [dbo].[Account_Detail] ([Id], [Name], [Phone_Number], [Gender], [Address]) VALUES (3, N'Nguyễn Đức Lợi', N'0973876107', 1, N'Đại Học FPT, KM29, Khu công nghệ cao Láng Hòa Lạc, Xã Thạch Hoà, Huyện Thạch Thất, Hà Nội')
INSERT [dbo].[Account_Detail] ([Id], [Name], [Phone_Number], [Gender], [Address]) VALUES (5, N'Đỗ Tuấn Long', N'123456789', 1, N'FPT')
INSERT [dbo].[Account_Detail] ([Id], [Name], [Phone_Number], [Gender], [Address]) VALUES (7, N'Khuất Đình Hùng', N'5132647', 1, N'FPT')
SET IDENTITY_INSERT [dbo].[Account_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Category]) VALUES (1, N'cây cảnh bé')
INSERT [dbo].[Categories] ([Id], [Category]) VALUES (2, N'cây cảnh lớn')
INSERT [dbo].[Categories] ([Id], [Category]) VALUES (3, N'cây trồng ngoài nhà')
INSERT [dbo].[Categories] ([Id], [Category]) VALUES (4, N'Hồ cá koi')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (1, 2, CAST(N'2021-03-18' AS Date), CAST(4200000 AS Decimal(18, 0)), NULL, 1, 4)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (2, 2, CAST(N'2021-03-22' AS Date), CAST(4434000 AS Decimal(18, 0)), NULL, 2, 4)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (3, 2, CAST(N'2021-03-27' AS Date), CAST(6000000 AS Decimal(18, 0)), NULL, 3, 4)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (4, 2, CAST(N'2021-03-27' AS Date), CAST(2234000 AS Decimal(18, 0)), N'', 4, 4)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (5, 2, CAST(N'2021-03-28' AS Date), CAST(2234000 AS Decimal(18, 0)), NULL, 5, 4)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (6, 2, CAST(N'2021-03-28' AS Date), CAST(2200000 AS Decimal(18, 0)), NULL, 6, 5)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (7, 1, CAST(N'2021-03-28' AS Date), CAST(2234000 AS Decimal(18, 0)), NULL, 7, 5)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (8, 2, CAST(N'2021-03-28' AS Date), CAST(5000000 AS Decimal(18, 0)), NULL, 3, 5)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (9, 2, CAST(N'2021-03-29' AS Date), CAST(2000000 AS Decimal(18, 0)), N'', 3, 5)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (11, 2, CAST(N'2021-03-29' AS Date), CAST(2234000 AS Decimal(18, 0)), NULL, 4, 5)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (12, 1, CAST(N'2021-03-29' AS Date), CAST(4400000 AS Decimal(18, 0)), NULL, 3, 4)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (13, 2, CAST(N'2021-03-29' AS Date), CAST(850000 AS Decimal(18, 0)), NULL, 2, 4)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (15, 2, CAST(N'2021-03-30' AS Date), CAST(2200000 AS Decimal(18, 0)), NULL, 5, 4)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (16, 1, CAST(N'2021-03-30' AS Date), CAST(750000 AS Decimal(18, 0)), NULL, 1, 4)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (17, 2, CAST(N'2021-03-30' AS Date), CAST(2200000 AS Decimal(18, 0)), NULL, 3, 5)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (18, 3, CAST(N'2021-03-31' AS Date), CAST(2234000 AS Decimal(18, 0)), NULL, 6, 5)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (19, 3, CAST(N'2021-03-31' AS Date), CAST(5134000 AS Decimal(18, 0)), NULL, 3, 5)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (20, 2, CAST(N'2022-03-13' AS Date), CAST(2200000 AS Decimal(18, 0)), NULL, 2, 5)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (21, 2, CAST(N'2022-03-16' AS Date), CAST(150000 AS Decimal(18, 0)), NULL, 2, 4)
INSERT [dbo].[Order] ([Id], [Account_Id], [Create_Date], [Total_Price], [Note], [Status], [SellBy]) VALUES (22, 2, CAST(N'2022-03-16' AS Date), CAST(4702000 AS Decimal(18, 0)), NULL, 2, 5)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (1, 1, 2, N'Cây chuối cảnh', 1, CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (2, 1, 1, N'Cây bonsai', 1, CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (3, 2, 3, N'Cây kim ngân', 1, CAST(2234000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (4, 2, 4, N'Cây kim ngân(new)', 1, CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (5, 3, 1, N'Cây bonsai', 3, CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (6, 4, 3, N'Cây kim ngân', 1, CAST(2234000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (7, 5, 3, N'Cây kim ngân', 1, CAST(2234000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (8, 6, 2, N'Cây chuối cảnh', 1, CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (9, 7, 3, N'Cây kim ngân', 1, CAST(2234000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (10, 8, 16, N'Cây trúc mây', 1, CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (11, 9, 1, N'Cây bonsai', 1, CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (12, 10, 18, N'Cây cúc tần Ấn Độ', 1, CAST(3400000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (13, 11, 3, N'Cây kim ngân', 1, CAST(2234000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (14, 12, 4, N'Cây kim ngân(new)', 1, CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (15, 12, 5, N'Cây lan ý', 1, CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (16, 13, 10, N'Cây xương rồng', 1, CAST(850000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (17, 14, 10, N'Cây xương rồng', 1, CAST(850000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (18, 15, 2, N'Cây chuối cảnh', 1, CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (19, 16, 9, N'Cây trường sinh', 1, CAST(750000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (20, 17, 5, N'Cây lan ý', 1, CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (21, 18, 3, N'Cây kim ngân', 1, CAST(2234000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (22, 19, 5, N'Cây lan ý', 1, CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (23, 19, 7, N'Cây phát tài', 1, CAST(1234000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (24, 19, 10, N'Cây xương rồng', 2, CAST(850000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (25, 20, 2, N'Cây chuối cảnh', 1, CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (26, 21, 19, N'Sen Đá', 3, CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (27, 22, 3, N'Cây kim ngân', 1, CAST(2234000 AS Decimal(18, 0)))
INSERT [dbo].[Order_Detail] ([Id], [Order_Id], [Product_Id], [Product_Name], [Product_Quantity], [Product_Price]) VALUES (28, 22, 7, N'Cây phát tài', 2, CAST(1234000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Other_Address] ON 

INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (1, N'Trần Thế Vinh', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 1)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (2, N'Trần Thế Vinh', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 2)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (3, N'Nguyễn Minh Toán', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 3)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (4, N'', N'', N'', 4)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (5, N'Trần Thế Vinh', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 5)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (6, N'Trần Thế Vinh', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 6)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (7, N'Nguyễn Đức Lợi', N'01645090445', N'22 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 7)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (8, N'Trần Văn Bình', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 8)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (9, N'', N'', N'', 9)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (10, N'Đỗ Tuấn Long', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 10)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (11, N'Trần Thế Vinh', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 11)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (12, N'Trần Thế Vinh', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 12)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (13, N'Trần Thế Vinh', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 13)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (14, N'Hùng', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 14)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (15, N'Trần Thế Vinh', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 15)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (16, N'Trần Thế Vinh', N'01645090445', N'22 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 16)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (17, N'Trần Thế Vinh', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 17)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (18, N'Nguyễn Minh Toán', N'0973876107', N'Đại Học FPT, KM29, Khu công nghệ cao Láng Hòa Lạc, Xã Thạch Hoà, Huyện Thạch Thất, Hà Nội', 18)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (19, N'Nguyễn Minh Toán', N'0973876107', N'Đại Học FPT, KM29, Khu công nghệ cao Láng Hòa Lạc, Xã Thạch Hoà, Huyện Thạch Thất, Hà Nội', 19)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (20, N'Nguyễn Đức Lợi', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 20)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (21, N'Trần Văn Bình', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 21)
INSERT [dbo].[Other_Address] ([Id], [Name], [Phone_Number], [Address], [Order_Id]) VALUES (22, N'Trần Văn Bình', N'01646352891', N'44 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội', 22)
SET IDENTITY_INSERT [dbo].[Other_Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (1, N'Cây bonsai', 1, 2000000, N'Trang trí nội thất phòng làm việc giám đốc bằng cây xanh đang là xu hướng hàng đầu hiện nay. <br> Đây là một gợi ý tuyệt vời được nhiều lãnh đạo lựa chọn. <br> Cây không chỉ mang đến một vẻ đẹp trang nhã, quý phái, tràn đầy sức sống mà còn có khả năng lọc không khí cực tốt. ', 10, 1, N'caybonsai.jpg', NULL, 4)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (2, N'Cây chuối cảnh', 2, 2200000, N'Trang trí nội thất phòng làm việc giám đốc bằng cây xanh đang là xu hướng hàng đầu hiện nay. <br> Đây là một gợi ý tuyệt vời được nhiều lãnh đạo lựa chọn. <br> Cây không chỉ mang đến một vẻ đẹp trang nhã, quý phái, tràn đầy sức sống mà còn có khả năng lọc không khí cực tốt. ', 1, 2, N'caychuoicanh.jpg', NULL, 4)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (3, N'Cây kim ngân', 1, 2234000, N'Trang trí nội thất phòng làm việc giám đốc bằng cây xanh đang là xu hướng hàng đầu hiện nay. <br> Đây là một gợi ý tuyệt vời được nhiều lãnh đạo lựa chọn. <br> Cây không chỉ mang đến một vẻ đẹp trang nhã, quý phái, tràn đầy sức sống mà còn có khả năng lọc không khí cực tốt. ', 19, 1, N'caykimngan.jpg', NULL, 5)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (4, N'Cây kim ngân(new)', 1, 2200000, N'Trang trí nội thất phòng làm việc giám đốc bằng cây xanh đang là xu hướng hàng đầu hiện nay. <br> Đây là một gợi ý tuyệt vời được nhiều lãnh đạo lựa chọn. <br> Cây không chỉ mang đến một vẻ đẹp trang nhã, quý phái, tràn đầy sức sống mà còn có khả năng lọc không khí cực tốt. ', 3, 1, N'caykimngann.jpg', NULL, 4)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (5, N'Cây lan ý', 2, 2200000, N'Trang trí nội thất phòng làm việc giám đốc bằng cây xanh đang là xu hướng hàng đầu hiện nay. <br> Đây là một gợi ý tuyệt vời được nhiều lãnh đạo lựa chọn. <br> Cây không chỉ mang đến một vẻ đẹp trang nhã, quý phái, tràn đầy sức sống mà còn có khả năng lọc không khí cực tốt. ', 2, 1, N'caylany.jpg', NULL, 4)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (6, N'Cây lưỡi hổ', 1, 1234000, N'Trang trí nội thất phòng làm việc giám đốc bằng cây xanh đang là xu hướng hàng đầu hiện nay. <br> Đây là một gợi ý tuyệt vời được nhiều lãnh đạo lựa chọn. <br> Cây không chỉ mang đến một vẻ đẹp trang nhã, quý phái, tràn đầy sức sống mà còn có khả năng lọc không khí cực tốt. ', 5, 1, N'cayluoiho.jpg', NULL, 4)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (7, N'Cây phát tài', 1, 1234000, N'Trang trí nội thất phòng làm việc giám đốc bằng cây xanh đang là xu hướng hàng đầu hiện nay. <br> Đây là một gợi ý tuyệt vời được nhiều lãnh đạo lựa chọn. <br> Cây không chỉ mang đến một vẻ đẹp trang nhã, quý phái, tràn đầy sức sống mà còn có khả năng lọc không khí cực tốt. ', 1, 2, N'cayphatai.jpg', NULL, 5)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (8, N'Cây tai thỏ', 1, 750000, N'Trang trí nội thất phòng làm việc giám đốc bằng cây xanh đang là xu hướng hàng đầu hiện nay. <br> Đây là một gợi ý tuyệt vời được nhiều lãnh đạo lựa chọn. <br> Cây không chỉ mang đến một vẻ đẹp trang nhã, quý phái, tràn đầy sức sống mà còn có khả năng lọc không khí cực tốt. ', 3, 2, N'caytaitho.jpg', NULL, 5)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (9, N'Cây trường sinh', 1, 750000, N'Trang trí nội thất phòng làm việc giám đốc bằng cây xanh đang là xu hướng hàng đầu hiện nay. <br> Đây là một gợi ý tuyệt vời được nhiều lãnh đạo lựa chọn. <br> Cây không chỉ mang đến một vẻ đẹp trang nhã, quý phái, tràn đầy sức sống mà còn có khả năng lọc không khí cực tốt. ', 4, 1, N'caytruongsinh.jpg', NULL, 5)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (10, N'Cây xương rồng', 1, 850000, N'Trang trí nội thất phòng làm việc giám đốc bằng cây xanh đang là xu hướng hàng đầu hiện nay. <br> Đây là một gợi ý tuyệt vời được nhiều lãnh đạo lựa chọn. <br> Cây không chỉ mang đến một vẻ đẹp trang nhã, quý phái, tràn đầy sức sống mà còn có khả năng lọc không khí cực tốt. ', 1, 1, N'cayxuongrong.jpg', NULL, 5)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (15, N'Cây trúc chậu Nhật', 2, 6500000, NULL, 4, 1, N'caytrucchaunhat.jpg', NULL, 5)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (16, N'Cây trúc mây', 3, 5000000, NULL, 4, 1, N'caytrucmay.jpg', NULL, 4)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (17, N'Cây bàng Singapore', 2, 4000000, NULL, 4, 2, N'caybang.jpg', NULL, 4)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (18, N'Cây cúc tần Ấn Độ', 3, 3400000, NULL, 4, 2, N'caycuctanando.jpg', NULL, 4)
INSERT [dbo].[Products] ([Id], [Name], [Category_Id], [Price], [Description], [Quantity], [Status], [Image_Link], [Note], [SellBy]) VALUES (19, N'Sen Đá', 1, 50000, N'Trang trí nội thất phòng làm việc giám đốc bằng cây xanh đang là xu hướng hàng đầu hiện nay. <br> Đây là một gợi ý tuyệt vời được nhiều lãnh đạo lựa chọn. <br> Cây không chỉ mang đến một vẻ đẹp trang nhã, quý phái, tràn đầy sức sống mà còn có khả năng lọc không khí cực tốt. ', 27, 1, N'THỎ BẢY MÀU.jpg', NULL, 4)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Customer')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Employee')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (4, N'Seller')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status_Account] ON 

INSERT [dbo].[Status_Account] ([Id], [Status]) VALUES (1, N'Đang hoạt động')
INSERT [dbo].[Status_Account] ([Id], [Status]) VALUES (2, N'Đang chờ duyệt')
INSERT [dbo].[Status_Account] ([Id], [Status]) VALUES (3, N'Ngừng sử dụng')
SET IDENTITY_INSERT [dbo].[Status_Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Status_Order] ON 

INSERT [dbo].[Status_Order] ([Id], [Status]) VALUES (1, N'Đang xử lý')
INSERT [dbo].[Status_Order] ([Id], [Status]) VALUES (2, N'Đang giao hàng')
INSERT [dbo].[Status_Order] ([Id], [Status]) VALUES (3, N'Giao hàng thành công')
INSERT [dbo].[Status_Order] ([Id], [Status]) VALUES (4, N'Đang hủy đơn hàng')
INSERT [dbo].[Status_Order] ([Id], [Status]) VALUES (5, N'Đã hủy bỏ')
SET IDENTITY_INSERT [dbo].[Status_Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Status_Product] ON 

INSERT [dbo].[Status_Product] ([Id], [Status]) VALUES (1, N'Còn hàng')
INSERT [dbo].[Status_Product] ([Id], [Status]) VALUES (2, N'Giảm giá')
INSERT [dbo].[Status_Product] ([Id], [Status]) VALUES (3, N'Hết hàng')
INSERT [dbo].[Status_Product] ([Id], [Status]) VALUES (4, N'Ngừng kinh doanh')
SET IDENTITY_INSERT [dbo].[Status_Product] OFF
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Creat_Date]  DEFAULT (getdate()) FOR [Create_Date]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [Create_Date]
GO
USE [master]
GO
ALTER DATABASE [baloshop] SET  READ_WRITE 
GO
