USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 03/24/2022 10:35:59 ******/
CREATE DATABASE [Assignment] ON  PRIMARY 
( NAME = N'Assignment', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Assignment.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Assignment_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Assignment_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Assignment] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Assignment] SET  READ_WRITE
GO
ALTER DATABASE [Assignment] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Assignment] SET  MULTI_USER
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[userid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[varid] [int] NULL,
	[comment] [nvarchar](500) NULL,
	[rating] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[phonenumber] [varchar](50) NULL,
	[address1] [nvarchar](200) NULL,
	[address2] [nvarchar](200) NULL,
	[city] [nvarchar](50) NULL,
	[zip] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[shipname] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](50) NULL,
	[shipaddress] [nvarchar](100) NULL,
	[shipaddress2] [nvarchar](100) NULL,
	[city] [nvarchar](50) NULL,
	[zip] [varchar](50) NULL,
	[shippingfee] [float] NULL,
	[totalprice] [float] NULL,
	[orderdate] [varchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Account_Role]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Role](
	[id] [int] NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_Account_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[role] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[sdesc] [nvarchar](500) NULL,
	[category_id] [int] NULL,
	[longdesc] [text] NULL,
	[subcategory_id] [int] NULL,
	[brand_id] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variation]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_Variation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Media]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Media](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alt] [nvarchar](200) NULL,
	[link] [text] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_Product_Media] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 03/24/2022 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[var_id] [int] NULL,
	[price] [float] NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Order_Account]    Script Date: 03/24/2022 10:35:59 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([user_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
/****** Object:  ForeignKey [FK_Account_Role_Account]    Script Date: 03/24/2022 10:35:59 ******/
ALTER TABLE [dbo].[Account_Role]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role_Account] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Account_Role] CHECK CONSTRAINT [FK_Account_Role_Account]
GO
/****** Object:  ForeignKey [FK_Account_Role_Role]    Script Date: 03/24/2022 10:35:59 ******/
ALTER TABLE [dbo].[Account_Role]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role_Role] FOREIGN KEY([role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Account_Role] CHECK CONSTRAINT [FK_Account_Role_Role]
GO
/****** Object:  ForeignKey [FK_Product_Brand]    Script Date: 03/24/2022 10:35:59 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
/****** Object:  ForeignKey [FK_Product_Category]    Script Date: 03/24/2022 10:35:59 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
/****** Object:  ForeignKey [FK_Product_SubCategory]    Script Date: 03/24/2022 10:35:59 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([subcategory_id])
REFERENCES [dbo].[SubCategory] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
/****** Object:  ForeignKey [FK_Variation_Product]    Script Date: 03/24/2022 10:35:59 ******/
ALTER TABLE [dbo].[Variation]  WITH CHECK ADD  CONSTRAINT [FK_Variation_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Variation] CHECK CONSTRAINT [FK_Variation_Product]
GO
/****** Object:  ForeignKey [FK_Product_Media_Product]    Script Date: 03/24/2022 10:35:59 ******/
ALTER TABLE [dbo].[Product_Media]  WITH CHECK ADD  CONSTRAINT [FK_Product_Media_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product_Media] CHECK CONSTRAINT [FK_Product_Media_Product]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Order]    Script Date: 03/24/2022 10:35:59 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Product]    Script Date: 03/24/2022 10:35:59 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
