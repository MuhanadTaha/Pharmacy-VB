USE [master]
GO
/****** Object:  Database [PharmDB]    Script Date: 2023-05-19 6:07:42 PM ******/
CREATE DATABASE [PharmDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PharmDB', FILENAME = N'C:\Users\user\PharmDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PharmDB_log', FILENAME = N'C:\Users\user\PharmDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PharmDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PharmDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PharmDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PharmDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PharmDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PharmDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PharmDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PharmDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PharmDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PharmDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PharmDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PharmDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PharmDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PharmDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PharmDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PharmDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PharmDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PharmDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PharmDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PharmDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PharmDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PharmDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PharmDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PharmDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PharmDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PharmDB] SET  MULTI_USER 
GO
ALTER DATABASE [PharmDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PharmDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PharmDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PharmDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PharmDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PharmDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PharmDB] SET QUERY_STORE = OFF
GO
USE [PharmDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2023-05-19 6:07:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cateogries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryOrders]    Script Date: 2023-05-19 6:07:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryOrders](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[NameProducts] [varchar](350) NOT NULL,
	[NameCategories] [varchar](350) NULL,
	[BuyerUser] [varchar](350) NOT NULL,
	[Price] [int] NOT NULL,
	[Arrive] [varchar](350) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2023-05-19 6:07:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[NameProducts] [varchar](350) NOT NULL,
	[NameCategories] [varchar](350) NULL,
	[BuyerUser] [varchar](350) NOT NULL,
	[Price] [int] NOT NULL,
	[Arrive] [varchar](350) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2023-05-19 6:07:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Description] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[Quantity] [int] NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[signup]    Script Date: 2023-05-19 6:07:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[signup](
	[fName] [varchar](50) NOT NULL,
	[lName] [varchar](50) NOT NULL,
	[mobile] [varchar](50) NOT NULL,
	[dob] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[cPassword] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[authorized] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Oral medication')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'By injection')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2004, N'Intravenous solutions')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3002, N'Vaccine')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3004, N'Antiseptics')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryOrders] ON 

INSERT [dbo].[HistoryOrders] ([IdOrder], [NameProducts], [NameCategories], [BuyerUser], [Price], [Arrive]) VALUES (17, N'Concor', N'Oral medication', N'abd@gmail.com', 18, N'No')
INSERT [dbo].[HistoryOrders] ([IdOrder], [NameProducts], [NameCategories], [BuyerUser], [Price], [Arrive]) VALUES (18, N'Acamole', N'Oral medication', N'abd@gmail.com', 51, N'No')
SET IDENTITY_INSERT [dbo].[HistoryOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([IdOrder], [NameProducts], [NameCategories], [BuyerUser], [Price], [Arrive]) VALUES (4047, N'B12', N'Oral medication', N'doqa@mailinator.com', 12, N'No')
INSERT [dbo].[Orders] ([IdOrder], [NameProducts], [NameCategories], [BuyerUser], [Price], [Arrive]) VALUES (4048, N'Pfizer', N'Vaccine', N'doqa@mailinator.com', 50, N'No')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Price], [Description], [Image], [Quantity], [date]) VALUES (2002, N'Acamole', 1, 51, N'resid11ence11', N'Acamol.jpg', 23, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Price], [Description], [Image], [Quantity], [date]) VALUES (2003, N'Panadol', 1, 4, N'residence11', N'panadol.png', 2, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Price], [Description], [Image], [Quantity], [date]) VALUES (2004, N'Concor', 1, 18, N'for the heart', N'concor.jpg', 4, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Price], [Description], [Image], [Quantity], [date]) VALUES (2005, N'B12', 1, 12, N'Vitamin', N'B12.jpg', 0, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Price], [Description], [Image], [Quantity], [date]) VALUES (2006, N'Insulin', 2, 14, N'for diabetics', N'Inzulín.jpg', 2, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Price], [Description], [Image], [Quantity], [date]) VALUES (2007, N'Penicillin', 2, 27, N'Antibiotic', N'penc.jpg', 489, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Price], [Description], [Image], [Quantity], [date]) VALUES (2008, N'Glucose ', 2004, 30, N'Solution', N'download.jfif', 28, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Price], [Description], [Image], [Quantity], [date]) VALUES (2009, N'Pfizer', 3002, 50, N'For patients with Covid 19', N'Pfizer_logo.png', 86, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Price], [Description], [Image], [Quantity], [date]) VALUES (2010, N'Dettol', 3004, 15, N'Antiseptics', N'51fFgtFBshL._SL1000_.jpg', 11, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Price], [Description], [Image], [Quantity], [date]) VALUES (2011, N'Band Aid Antiseptics', 3004, 12, N'Antiseptics', N'bab_381372020880_us_antiseptic_liquid_6oz_00000.png', 12, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Products] ([ID], [Name], [CategoryId], [Price], [Description], [Image], [Quantity], [date]) VALUES (3006, N'Desiree Espinoza', 2, 667, N'Ullam dolor et duis ', N'void.png', 753, CAST(N'2023-05-19' AS Date))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[signup] ([fName], [lName], [mobile], [dob], [email], [password], [cPassword], [gender], [authorized]) VALUES (N'miteryhi@mailinator.com', N'Martha', N'Nguyen', N'Reprehenderit modi s', N'abd@gmail.com', N'123', N'123', N'Male', N'admin')
INSERT [dbo].[signup] ([fName], [lName], [mobile], [dob], [email], [password], [cPassword], [gender], [authorized]) VALUES (N'Salvador', N'Decker', N'Sit fuga Porro tot', N'1976-04-22', N'gufi@mailinator.com', N'Pa$$w0rd!', N'Pa$$w0rd!', N'Male', N'admin')
INSERT [dbo].[signup] ([fName], [lName], [mobile], [dob], [email], [password], [cPassword], [gender], [authorized]) VALUES (N'Derek', N'Cooke', N'Expedita aut fugiat', N'1980-06-14', N'ficu@mailinator.com', N'Pa$$w0rd!', N'Pa$$w0rd!', N'Male', N'customer')
INSERT [dbo].[signup] ([fName], [lName], [mobile], [dob], [email], [password], [cPassword], [gender], [authorized]) VALUES (N'Harlan', N'Greene', N'Aperiam numquam volu', N'2017-02-13', N'vihepadaxo@mailinator.com', N'Pa$$w0rd!', N'Pa$$w0rd!', N'Male', N'customer')
GO
USE [master]
GO
ALTER DATABASE [PharmDB] SET  READ_WRITE 
GO
