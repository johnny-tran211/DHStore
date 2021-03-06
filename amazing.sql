USE [master]
GO
/****** Object:  Database [AmazingStore]    Script Date: 4/5/2020 10:41:43 PM ******/
CREATE DATABASE [AmazingStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AmazingStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AmazingStore.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AmazingStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AmazingStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AmazingStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AmazingStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AmazingStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AmazingStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AmazingStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AmazingStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AmazingStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [AmazingStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AmazingStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AmazingStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AmazingStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AmazingStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AmazingStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AmazingStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AmazingStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AmazingStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AmazingStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AmazingStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AmazingStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AmazingStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AmazingStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AmazingStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AmazingStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AmazingStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AmazingStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AmazingStore] SET  MULTI_USER 
GO
ALTER DATABASE [AmazingStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AmazingStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AmazingStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AmazingStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AmazingStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AmazingStore]
GO
/****** Object:  Table [dbo].[CheckOut]    Script Date: 4/5/2020 10:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CheckOut](
	[CheckOutID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_CheckOut] PRIMARY KEY CLUSTERED 
(
	[CheckOutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CheckOutDetail]    Script Date: 4/5/2020 10:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CheckOutDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[CheckOutId] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Image] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_CheckOutDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items]    Script Date: 4/5/2020 10:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClothesName] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Image] [varchar](50) NOT NULL,
	[Description] [text] NULL,
	[CPU] [varchar](50) NULL,
	[RAM] [varchar](50) NULL,
	[Screen] [varchar](50) NULL,
	[OS] [varchar](50) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CheckOut] ON 

INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (65, N'dhoang2101@gmail.com', N'dasds', N'09014625460', N'3/4/2020', 2000)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (66, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'3/4/2020', 2500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (67, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'3/4/2020', 2500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (68, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'3/4/2020', 2500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (69, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'3/4/2020', 2000)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (70, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'3/4/2020', 1500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (71, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'3/4/2020', 1500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (72, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'3/4/2020', 1500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (73, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'3/4/2020', 1500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (74, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'3/4/2020', 1500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (75, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'3/4/2020', 500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (76, N'dhoang2101@gmail.com', N'dasds', N'09014625469', N'3/4/2020', 500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (77, N'dhoang2101@gmail.com', N'thong nhat', N'0901462546', N'3/4/2020', 9950)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (78, N'dhoang2101@gmail.com', N'Quang Trung', N'0908112233', N'3/4/2020', 2500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (79, N'duyhoangtran.johnny@gmail.com', N'Thong Nhat', N'0908993099', N'3/4/2020', 7000)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (80, N'duyhoangtran.johnny@gmail.com', N'Le Van Tho', N'0901462546', N'3/4/2020', 3300)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (81, N'dhoang2101@gmail.com', N'aaaaaa', N'0901462546', N'3/4/2020', 6600)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (82, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'3/4/2020', 2000)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (83, N'dhoang2101@gmail.com', N'dsdsad', N'0908993099', N'4/4/2020', 5400)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (84, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'4/4/2020', 400)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (85, N'dhoang2101@gmail.com', N'dsadsa', N'0901462546', N'4/4/2020', 7950)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (86, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'4/4/2020', 2500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (87, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'4/4/2020', 2500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (88, N'dhoang2101@gmail.com', N'dsadsa', N'0901462546', N'4/4/2020', 2500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (89, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'4/4/2020', 2500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (90, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'4/4/2020', 500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (91, N'dhoang2101@gmail.com', N'thong nhat', N'0901462546', N'5/4/2020', 2500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (92, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'5/4/2020', 2500)
INSERT [dbo].[CheckOut] ([CheckOutID], [Email], [Address], [Phone], [Date], [Price]) VALUES (93, N'dhoang2101@gmail.com', N'dasds', N'0901462546', N'5/4/2020', 2500)
SET IDENTITY_INSERT [dbo].[CheckOut] OFF
SET IDENTITY_INSERT [dbo].[CheckOutDetail] ON 

INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (20, 2, 65, N'Iphone 10', N'images/iphone/iphone-10.png', 1, 2000)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (21, 1, 66, N'Iphone 11', N'images/iphone/iphone-11.png', 1, 2500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (22, 1, 67, N'Iphone 11', N'images/iphone/iphone-11.png', 1, 2500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (23, 1, 68, N'Iphone 11', N'images/iphone/iphone-11.png', 1, 2500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (24, 2, 69, N'Iphone 10', N'images/iphone/iphone-10.png', 1, 2000)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (25, 3, 70, N'Iphone 8', N'images/iphone/iphone-8.png', 1, 1500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (26, 3, 71, N'Iphone 8', N'images/iphone/iphone-8.png', 1, 1500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (27, 3, 72, N'Iphone 8', N'images/iphone/iphone-8.png', 1, 1500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (28, 3, 73, N'Iphone 8', N'images/iphone/iphone-8.png', 1, 1500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (29, 3, 74, N'Iphone 8', N'images/iphone/iphone-8.png', 1, 1500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (30, 4, 75, N'Iphone 7', N'images/iphone/iphone-7.png', 1, 500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (31, 4, 76, N'Iphone 7', N'images/iphone/iphone-7.png', 1, 500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (32, 5, 77, N'Iphone 6', N'images/iphone/iphone-6.png', 1, 400)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (33, 6, 77, N'Iphone 5s', N'images/iphone/iphone-5s.png', 1, 350)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (34, 7, 77, N'Macbook Pro 2018', N'images/macbook/macbook-pro.png', 1, 2000)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (35, 15, 77, N'Macbook Air 2019', N'images/macbook/macbook-air2019.png', 1, 2200)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (36, 16, 77, N'Macbook Pro Touch 2018', N'images/macbook/macbook-pro-touch2018.png', 2, 2500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (37, 1, 78, N'Iphone 11', N'images/iphone/iphone-11.png', 1, 2500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (38, 2, 79, N'Iphone 10', N'images/iphone/iphone-10.png', 1, 2000)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (39, 1, 79, N'Iphone 11', N'images/iphone/iphone-11.png', 2, 2500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (40, 5, 80, N'Iphone 6', N'images/iphone/iphone-6.png', 3, 400)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (41, 6, 80, N'Iphone 5s', N'images/iphone/iphone-5s.png', 6, 350)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (42, 15, 81, N'Macbook Air 2019', N'images/macbook/macbook-air2019.png', 3, 2200)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (43, 2, 82, N'Iphone 10', N'images/iphone/iphone-10.png', 1, 2000)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (44, 4, 83, N'Iphone 7', N'images/iphone/iphone-7.png', 1, 500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (45, 5, 83, N'Iphone 6', N'images/iphone/iphone-6.png', 1, 400)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (46, 3, 83, N'Iphone 8', N'images/iphone/iphone-8.png', 3, 1500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (47, 5, 84, N'Iphone 6', N'images/iphone/iphone-6.png', 1, 400)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (48, 5, 85, N'Iphone 6', N'images/iphone/iphone-6.png', 1, 400)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (49, 4, 85, N'Iphone 7', N'images/iphone/iphone-7.png', 1, 500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (50, 6, 85, N'Iphone 5s', N'images/iphone/iphone-5s.png', 1, 350)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (51, 7, 85, N'Macbook Pro 2018', N'images/macbook/macbook-pro.png', 1, 2000)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (52, 15, 85, N'Macbook Air 2019', N'images/macbook/macbook-air2019.png', 1, 2200)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (53, 16, 85, N'Macbook Pro Touch 2018', N'images/macbook/macbook-pro-touch2018.png', 1, 2500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (54, 1, 89, N'Iphone 11', N'images/iphone/iphone-11.png', 1, 2500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (55, 4, 90, N'Iphone 7', N'images/iphone/iphone-7.png', 1, 500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (56, 1, 92, N'Iphone 11', N'images/iphone/iphone-11.png', 1, 2500)
INSERT [dbo].[CheckOutDetail] ([Id], [ItemId], [CheckOutId], [ProductName], [Image], [Quantity], [Price]) VALUES (57, 1, 93, N'Iphone 11', N'images/iphone/iphone-11.png', 1, 2500)
SET IDENTITY_INSERT [dbo].[CheckOutDetail] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([Id], [ClothesName], [Price], [Quantity], [Type], [Image], [Description], [CPU], [RAM], [Screen], [OS]) VALUES (1, N'Iphone 11', 2500, 3, N'Iphone', N'images/iphone/iphone-11.png', N'Color-wise, there’s a new midnight green color, a refreshed space gray, refreshed silver, and a new gold finish. Apple is also promoting a wider dynamic range display called Super Retina XDR. As was rumored, it has a new triple camera system — a triangular array of lenses in a rectangular camera bump.', N'Apple A13 Bionic', N'4 GB', N'IPS LCD, 6.1", Liquid Retina', N'iOS 13')
INSERT [dbo].[Items] ([Id], [ClothesName], [Price], [Quantity], [Type], [Image], [Description], [CPU], [RAM], [Screen], [OS]) VALUES (2, N'Iphone 10', 2000, 0, N'Iphone', N'images/iphone/iphone-10.png', N'Apple''s iPhone 8 uses an LCD display instead of OLED and the camera is less advanced, but it still takes fantastic photos along with 4K video, and the A11 Bionic processor is fast enough that it will hold up well for years to come. It is IP67 water resistant and features LTE Advanced speeds of up to 600Mb/s, but it does not have dual-SIM functionality.', N'Apple A13 Bionic', N'3 GB', N'IPS LCD, 6.1", Liquid Retina', N'iOS 13')
INSERT [dbo].[Items] ([Id], [ClothesName], [Price], [Quantity], [Type], [Image], [Description], [CPU], [RAM], [Screen], [OS]) VALUES (3, N'Iphone 8', 1500, 3, N'Iphone', N'images/iphone/iphone-8.png', N'Apple''s iPhone 8 uses an LCD display instead of OLED and the camera is less advanced, but it still takes fantastic photos along with 4K video, and the A11 Bionic processor is fast enough that it will hold up well for years to come. It is IP67 water resistant and features LTE Advanced speeds of up to 600Mb/s, but it does not have dual-SIM functionality.', N'Apple A11 Bionic', N'2 GB', N'LED-backlit IPS LCD, 4.7", Retina HD', N'iOS 12')
INSERT [dbo].[Items] ([Id], [ClothesName], [Price], [Quantity], [Type], [Image], [Description], [CPU], [RAM], [Screen], [OS]) VALUES (4, N'Iphone 7', 500, 1, N'Iphone', N'images/iphone/iphone-7.png', N'The new custom-designed Apple A10 Fusion chip features a new architecture that powers these innovations, making it the most powerful chip ever in a smartphone, while also getting more time between charges with the longest battery life ever in an iPhone. ', N'Apple A10 Fusion', N'2 GB', N'LED-backlit IPS LCD, 4.7", Retina HD', N'iOS 12')
INSERT [dbo].[Items] ([Id], [ClothesName], [Price], [Quantity], [Type], [Image], [Description], [CPU], [RAM], [Screen], [OS]) VALUES (5, N'Iphone 6', 400, 3, N'Iphone', N'images/iphone/iphone-6.png', N'The rear facing iSight camera in the iPhone 6 has an all new sensor that should handle everyday photography better than ever. HD video recording and slow-mo video have also gotten boosted to 60 fps and 240 fps, respectively. The front-facing FaceTime camera appears to remain largely unchanged.', N'Apple A8', N'1 GB', N'LED-backlit IPS LCD, 4.7", Retina HD', N'iOS 10')
INSERT [dbo].[Items] ([Id], [ClothesName], [Price], [Quantity], [Type], [Image], [Description], [CPU], [RAM], [Screen], [OS]) VALUES (6, N'Iphone 5s', 350, 5, N'Iphone', N'images/iphone/iphone-5s.png', N'Apple iPhone 5s smartphone was launched in September 2013. The phone comes with a 4.00-inch touchscreen display with a resolution of 640x1136 pixels at a pixel density of 326 pixels per inch (ppi) and an aspect ratio of 16:9.', N'Apple A7', N'1 GB', N'LED-backlit IPS LCD, 4", qHD', N'iOS 10')
INSERT [dbo].[Items] ([Id], [ClothesName], [Price], [Quantity], [Type], [Image], [Description], [CPU], [RAM], [Screen], [OS]) VALUES (7, N'Macbook Pro 2018', 2000, 3, N'Macbook', N'images/macbook/macbook-pro.png', N'The new MacBook Pro features a stunning 16-inch Retina display — the largest Retina display ever in a Mac notebook. It produces 500 nits of brightness for spectacular highlights and bright whites, while delivering deep blacks thanks to the precise photo alignment of liquid crystal molecules.', N'Up to 8-core Intel Core i9', N'16GB', N'
16-inch', N'Mac Os')
INSERT [dbo].[Items] ([Id], [ClothesName], [Price], [Quantity], [Type], [Image], [Description], [CPU], [RAM], [Screen], [OS]) VALUES (14, N'Macbook Air 2017', 1800, 8, N'Macbook', N'images/macbook/macbook-air2017.png', N'This isn’t the fastest MacBook out there, but the MacBook Air 2017 is still good enough to handle most things you’ll throw at it. Whether you’re surfing the web, doing some word processing or light photo editing, you’ll find a lot to love with the MacBook Air 2017.', N'Intel, Core i5', N'8GB', N'13.3 inch, 1440 x 900 pixels
', N'Mac Os')
INSERT [dbo].[Items] ([Id], [ClothesName], [Price], [Quantity], [Type], [Image], [Description], [CPU], [RAM], [Screen], [OS]) VALUES (15, N'Macbook Air 2019', 2200, 3, N'Macbook', N'images/macbook/macbook-air2019.png', N'MacBook Air now features the new Magic Keyboard, first seen on the 16-inch MacBook Pro. The refined scissor mechanism with 1 mm of travel delivers a responsive, comfortable, and quiet typing experience. The inverted-T arrow keys help you fly through lines of code, spreadsheets, or game environments.', N'Core i5', N'8GB', N'13.3 inch, 1440 x 900 pixels
', N'Mac Os')
INSERT [dbo].[Items] ([Id], [ClothesName], [Price], [Quantity], [Type], [Image], [Description], [CPU], [RAM], [Screen], [OS]) VALUES (16, N'Macbook Pro Touch 2018', 2500, 7, N'Macbook', N'images/macbook/macbook-pro-touch2018.png', N'As well as CPU and GPU upgrades that you’ll expect (which we’ll come to later), there’s a small but welcome change to the Thunderbolt 3 ports. Each of the Touch Bar models has four Thunderbolt 3 ports, and in previous versions the two on the right were subject to throttling. That’s no longer the case. ', N'2.7GHz Intel Core i7-8559U', N'16GB', N'NULL13.3-inch, 2,560 x 1,600 Retina display', N'Mac Os')
SET IDENTITY_INSERT [dbo].[Items] OFF
ALTER TABLE [dbo].[CheckOutDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckOutDetail_CheckOut] FOREIGN KEY([CheckOutId])
REFERENCES [dbo].[CheckOut] ([CheckOutID])
GO
ALTER TABLE [dbo].[CheckOutDetail] CHECK CONSTRAINT [FK_CheckOutDetail_CheckOut]
GO
ALTER TABLE [dbo].[CheckOutDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckOutDetail_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
ALTER TABLE [dbo].[CheckOutDetail] CHECK CONSTRAINT [FK_CheckOutDetail_Items]
GO
USE [master]
GO
ALTER DATABASE [AmazingStore] SET  READ_WRITE 
GO
