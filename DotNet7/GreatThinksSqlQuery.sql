USE [master]
GO
/****** Object:  Database [GreatThinks]    Script Date: 24-11-2022 5.12.25 PM ******/
CREATE DATABASE [GreatThinks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GreatThinks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GreatThinks.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GreatThinks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GreatThinks_log.ldf' , SIZE = 270336KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GreatThinks] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GreatThinks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GreatThinks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GreatThinks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GreatThinks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GreatThinks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GreatThinks] SET ARITHABORT OFF 
GO
ALTER DATABASE [GreatThinks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GreatThinks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GreatThinks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GreatThinks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GreatThinks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GreatThinks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GreatThinks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GreatThinks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GreatThinks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GreatThinks] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GreatThinks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GreatThinks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GreatThinks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GreatThinks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GreatThinks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GreatThinks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GreatThinks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GreatThinks] SET RECOVERY FULL 
GO
ALTER DATABASE [GreatThinks] SET  MULTI_USER 
GO
ALTER DATABASE [GreatThinks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GreatThinks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GreatThinks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GreatThinks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GreatThinks] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GreatThinks] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GreatThinks', N'ON'
GO
ALTER DATABASE [GreatThinks] SET QUERY_STORE = OFF
GO
USE [GreatThinks]
GO
/****** Object:  Table [dbo].[Tbl_Accounts]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Accounts](
	[Fld_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fld_MembershipNumber] [varchar](200) NULL,
	[Fld_AccountNumber] [varchar](200) NULL,
	[Fld_SchemeCode] [varchar](50) NULL,
	[Fld_CreateDate] [date] NULL,
	[Fld_StartDate] [date] NULL,
	[Fld_MaturityDate] [date] NULL,
	[Fld_Amount] [decimal](18, 2) NULL,
	[Fld_MaturityAmount] [decimal](18, 2) NULL,
	[Fld_Creator] [varchar](100) NULL,
	[Fld_Status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_DepositRd]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_DepositRd](
	[Fld_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fld_AccountNumber] [varchar](200) NULL,
	[Fld_Amount] [decimal](18, 2) NULL,
	[Fld_Status] [int] NULL,
	[Fld_EmiDate] [date] NULL,
	[Fld_Creator] [varchar](100) NULL,
	[Fld_DepositDate] [date] NULL,
	[Fld_Depositor] [varchar](100) NULL,
	[Fld_ScrollNo] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_MasterScroll]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_MasterScroll](
	[Fld_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fld_ScrollNo] [varchar](200) NULL,
	[Fld_Ref] [varchar](100) NULL,
	[Fld_RefId] [int] NULL,
	[Fld_Status] [int] NULL,
	[Fld_CreateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_MasterUser]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_MasterUser](
	[Fld_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fld_MembershipNumber] [varchar](200) NULL,
	[Fld_UserId] [varchar](100) NULL,
	[Fld_Password] [varchar](100) NULL,
	[Fld_Permission] [int] NULL,
	[Fld_CreateDate] [date] NULL,
	[Fld_Status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Members]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Members](
	[Fld_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fld_MembershipNumber] [varchar](100) NULL,
	[Fld_MemberName] [varchar](200) NULL,
	[Fld_DOB] [date] NULL,
	[Fld_FatherName] [varchar](200) NULL,
	[Fld_MobileNumber] [varchar](25) NULL,
	[Fld_EmailAddress] [varchar](50) NULL,
	[Fld_AadharNumber] [varchar](20) NULL,
	[Fld_MemberType] [int] NULL,
	[Fld_Status] [int] NULL,
	[Fld_CreateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Scheme]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Scheme](
	[Fld_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fld_SchemeName] [varchar](100) NULL,
	[Fld_SchemeCode] [varchar](100) NULL,
	[Fld_InterestRate] [decimal](6, 2) NULL,
	[Fld_CreateDate] [date] NULL,
	[Fld_Status] [int] NULL,
	[Fld_SchemeType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Transaction]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Transaction](
	[Fld_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fld_TxnNo] [nvarchar](max) NULL,
	[Fld_ScrollNo] [nvarchar](200) NULL,
	[Fld_AmountCr] [decimal](18, 2) NULL,
	[Fld_AmountDr] [decimal](18, 2) NULL,
	[Fld_Narration] [nvarchar](max) NULL,
	[Fld_Ledger] [nvarchar](200) NULL,
	[Fld_OtherLedger] [nvarchar](200) NULL,
	[Fld_Creator] [varchar](100) NULL,
	[Fld_CreateDate] [datetime] NULL,
	[Fld_Approver] [varchar](100) NULL,
	[Fld_ApproveDate] [datetime] NULL,
	[Fld_Status] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Accounts] ON 
GO
INSERT [dbo].[Tbl_Accounts] ([Fld_Id], [Fld_MembershipNumber], [Fld_AccountNumber], [Fld_SchemeCode], [Fld_CreateDate], [Fld_StartDate], [Fld_MaturityDate], [Fld_Amount], [Fld_MaturityAmount], [Fld_Creator], [Fld_Status]) VALUES (1, N'GT22111', N'221100001', N'RD001', CAST(N'2022-11-22' AS Date), CAST(N'2022-11-22' AS Date), CAST(N'2023-02-23' AS Date), CAST(3242.00 AS Decimal(18, 2)), NULL, N'Suresh', 1)
GO
INSERT [dbo].[Tbl_Accounts] ([Fld_Id], [Fld_MembershipNumber], [Fld_AccountNumber], [Fld_SchemeCode], [Fld_CreateDate], [Fld_StartDate], [Fld_MaturityDate], [Fld_Amount], [Fld_MaturityAmount], [Fld_Creator], [Fld_Status]) VALUES (2, N'GT22110', N'221100002', N'RD001', CAST(N'2022-11-23' AS Date), CAST(N'2022-11-23' AS Date), CAST(N'2023-04-23' AS Date), CAST(100.00 AS Decimal(18, 2)), NULL, N'Suresh', 1)
GO
INSERT [dbo].[Tbl_Accounts] ([Fld_Id], [Fld_MembershipNumber], [Fld_AccountNumber], [Fld_SchemeCode], [Fld_CreateDate], [Fld_StartDate], [Fld_MaturityDate], [Fld_Amount], [Fld_MaturityAmount], [Fld_Creator], [Fld_Status]) VALUES (3, N'GT22110', N'221100003', N'RD001', CAST(N'2022-11-23' AS Date), CAST(N'2022-11-23' AS Date), CAST(N'2023-04-23' AS Date), CAST(500.00 AS Decimal(18, 2)), NULL, N'Suresh', 1)
GO
INSERT [dbo].[Tbl_Accounts] ([Fld_Id], [Fld_MembershipNumber], [Fld_AccountNumber], [Fld_SchemeCode], [Fld_CreateDate], [Fld_StartDate], [Fld_MaturityDate], [Fld_Amount], [Fld_MaturityAmount], [Fld_Creator], [Fld_Status]) VALUES (4, N'GT22110', N'221100004', N'RD001', CAST(N'2022-11-23' AS Date), CAST(N'2022-11-23' AS Date), CAST(N'2022-11-24' AS Date), CAST(50.00 AS Decimal(18, 2)), NULL, N'Suresh', 1)
GO
INSERT [dbo].[Tbl_Accounts] ([Fld_Id], [Fld_MembershipNumber], [Fld_AccountNumber], [Fld_SchemeCode], [Fld_CreateDate], [Fld_StartDate], [Fld_MaturityDate], [Fld_Amount], [Fld_MaturityAmount], [Fld_Creator], [Fld_Status]) VALUES (5, N'GT22112', N'221100005', N'RD001', CAST(N'2022-11-23' AS Date), CAST(N'2022-11-23' AS Date), CAST(N'2023-03-24' AS Date), CAST(10.00 AS Decimal(18, 2)), NULL, N'Suresh', 1)
GO
INSERT [dbo].[Tbl_Accounts] ([Fld_Id], [Fld_MembershipNumber], [Fld_AccountNumber], [Fld_SchemeCode], [Fld_CreateDate], [Fld_StartDate], [Fld_MaturityDate], [Fld_Amount], [Fld_MaturityAmount], [Fld_Creator], [Fld_Status]) VALUES (7, N'GT22114', N'221100007', N'RD001', CAST(N'2022-11-24' AS Date), CAST(N'2022-11-24' AS Date), CAST(N'2023-01-24' AS Date), CAST(50.00 AS Decimal(18, 2)), NULL, N'Suresh', 1)
GO
INSERT [dbo].[Tbl_Accounts] ([Fld_Id], [Fld_MembershipNumber], [Fld_AccountNumber], [Fld_SchemeCode], [Fld_CreateDate], [Fld_StartDate], [Fld_MaturityDate], [Fld_Amount], [Fld_MaturityAmount], [Fld_Creator], [Fld_Status]) VALUES (6, N'GT22112', N'221100006', N'RD001', CAST(N'2022-11-24' AS Date), CAST(N'2022-11-24' AS Date), CAST(N'2023-04-24' AS Date), CAST(250.00 AS Decimal(18, 2)), NULL, N'Suresh', 1)
GO
INSERT [dbo].[Tbl_Accounts] ([Fld_Id], [Fld_MembershipNumber], [Fld_AccountNumber], [Fld_SchemeCode], [Fld_CreateDate], [Fld_StartDate], [Fld_MaturityDate], [Fld_Amount], [Fld_MaturityAmount], [Fld_Creator], [Fld_Status]) VALUES (8, N'GT22114', N'221100008', N'RD001', CAST(N'2022-11-24' AS Date), CAST(N'2023-01-01' AS Date), CAST(N'2023-03-01' AS Date), CAST(100.00 AS Decimal(18, 2)), NULL, N'System', 1)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_DepositRd] ON 
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (1, N'221100006', CAST(250.00 AS Decimal(18, 2)), 1, CAST(N'2022-11-24' AS Date), N'Suresh', CAST(N'2022-11-24' AS Date), N'System', N'R000001')
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (2, N'221100006', CAST(250.00 AS Decimal(18, 2)), 1, CAST(N'2022-12-24' AS Date), N'Suresh', CAST(N'2022-11-24' AS Date), N'System', N'R000002')
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (3, N'221100006', CAST(250.00 AS Decimal(18, 2)), 1, CAST(N'2023-01-24' AS Date), N'Suresh', CAST(N'2022-11-24' AS Date), N'System', N'R000003')
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (4, N'221100006', CAST(250.00 AS Decimal(18, 2)), 1, CAST(N'2023-02-24' AS Date), N'Suresh', CAST(N'2022-11-24' AS Date), N'System', N'R000004')
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (5, N'221100006', CAST(250.00 AS Decimal(18, 2)), 1, CAST(N'2023-03-24' AS Date), N'Suresh', CAST(N'2022-11-24' AS Date), N'System', N'R000005')
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (6, N'221100006', CAST(250.00 AS Decimal(18, 2)), 1, CAST(N'2023-04-24' AS Date), N'Suresh', CAST(N'2022-11-24' AS Date), N'System', N'R000006')
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (7, N'221100007', CAST(50.00 AS Decimal(18, 2)), 1, CAST(N'2022-11-24' AS Date), N'Suresh', CAST(N'2022-11-24' AS Date), N'System', N'R000007')
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (8, N'221100007', CAST(50.00 AS Decimal(18, 2)), 0, CAST(N'2022-12-24' AS Date), N'Suresh', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (9, N'221100007', CAST(50.00 AS Decimal(18, 2)), 0, CAST(N'2023-01-24' AS Date), N'Suresh', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (10, N'221100008', CAST(100.00 AS Decimal(18, 2)), 1, CAST(N'2023-01-01' AS Date), N'System', CAST(N'2022-11-24' AS Date), N'System', N'R000008')
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (11, N'221100008', CAST(100.00 AS Decimal(18, 2)), 0, CAST(N'2023-02-01' AS Date), N'System', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (12, N'221100008', CAST(100.00 AS Decimal(18, 2)), 0, CAST(N'2023-03-01' AS Date), N'System', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Tbl_DepositRd] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_MasterScroll] ON 
GO
INSERT [dbo].[Tbl_MasterScroll] ([Fld_Id], [Fld_ScrollNo], [Fld_Ref], [Fld_RefId], [Fld_Status], [Fld_CreateDate]) VALUES (1, N'R000001', N'RD DEPOSIT', 1, 0, CAST(N'2022-11-24T10:42:10.607' AS DateTime))
GO
INSERT [dbo].[Tbl_MasterScroll] ([Fld_Id], [Fld_ScrollNo], [Fld_Ref], [Fld_RefId], [Fld_Status], [Fld_CreateDate]) VALUES (2, N'R000002', N'RD DEPOSIT', 2, 0, CAST(N'2022-11-24T10:43:30.580' AS DateTime))
GO
INSERT [dbo].[Tbl_MasterScroll] ([Fld_Id], [Fld_ScrollNo], [Fld_Ref], [Fld_RefId], [Fld_Status], [Fld_CreateDate]) VALUES (3, N'R000003', N'RD DEPOSIT', 3, 0, CAST(N'2022-11-24T10:44:43.980' AS DateTime))
GO
INSERT [dbo].[Tbl_MasterScroll] ([Fld_Id], [Fld_ScrollNo], [Fld_Ref], [Fld_RefId], [Fld_Status], [Fld_CreateDate]) VALUES (4, N'R000004', N'RD DEPOSIT', 4, 0, CAST(N'2022-11-24T10:45:03.270' AS DateTime))
GO
INSERT [dbo].[Tbl_MasterScroll] ([Fld_Id], [Fld_ScrollNo], [Fld_Ref], [Fld_RefId], [Fld_Status], [Fld_CreateDate]) VALUES (5, N'R000005', N'RD DEPOSIT', 5, 0, CAST(N'2022-11-24T10:45:14.430' AS DateTime))
GO
INSERT [dbo].[Tbl_MasterScroll] ([Fld_Id], [Fld_ScrollNo], [Fld_Ref], [Fld_RefId], [Fld_Status], [Fld_CreateDate]) VALUES (6, N'R000006', N'RD DEPOSIT', 6, 0, CAST(N'2022-11-24T10:45:26.410' AS DateTime))
GO
INSERT [dbo].[Tbl_MasterScroll] ([Fld_Id], [Fld_ScrollNo], [Fld_Ref], [Fld_RefId], [Fld_Status], [Fld_CreateDate]) VALUES (7, N'R000007', N'RD DEPOSIT', 7, 0, CAST(N'2022-11-24T11:16:09.817' AS DateTime))
GO
INSERT [dbo].[Tbl_MasterScroll] ([Fld_Id], [Fld_ScrollNo], [Fld_Ref], [Fld_RefId], [Fld_Status], [Fld_CreateDate]) VALUES (8, N'R000008', N'RD DEPOSIT', 10, 0, CAST(N'2022-11-24T11:27:04.580' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tbl_MasterScroll] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_MasterUser] ON 
GO
INSERT [dbo].[Tbl_MasterUser] ([Fld_Id], [Fld_MembershipNumber], [Fld_UserId], [Fld_Password], [Fld_Permission], [Fld_CreateDate], [Fld_Status]) VALUES (1, N'GT22114', N'GT22114', N'GT22114', 0, CAST(N'2022-11-22' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Tbl_MasterUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Members] ON 
GO
INSERT [dbo].[Tbl_Members] ([Fld_Id], [Fld_MembershipNumber], [Fld_MemberName], [Fld_DOB], [Fld_FatherName], [Fld_MobileNumber], [Fld_EmailAddress], [Fld_AadharNumber], [Fld_MemberType], [Fld_Status], [Fld_CreateDate]) VALUES (1, N'GT22110', N'Suresh Kumar Saini', CAST(N'2010-10-08' AS Date), N'Chhotu Lal Mali', N'9057083587', N'Sureshsaini@gmail.com', N'125425636563', 1, 1, CAST(N'2022-11-21T12:17:31.727' AS DateTime))
GO
INSERT [dbo].[Tbl_Members] ([Fld_Id], [Fld_MembershipNumber], [Fld_MemberName], [Fld_DOB], [Fld_FatherName], [Fld_MobileNumber], [Fld_EmailAddress], [Fld_AadharNumber], [Fld_MemberType], [Fld_Status], [Fld_CreateDate]) VALUES (2, N'GT22111', N'Suresh', CAST(N'2001-10-10' AS Date), N'Kumar', N'9057854885', N'Suresh@gmail.com', N'542545215221', 2, 1, CAST(N'2022-11-21T12:20:05.403' AS DateTime))
GO
INSERT [dbo].[Tbl_Members] ([Fld_Id], [Fld_MembershipNumber], [Fld_MemberName], [Fld_DOB], [Fld_FatherName], [Fld_MobileNumber], [Fld_EmailAddress], [Fld_AadharNumber], [Fld_MemberType], [Fld_Status], [Fld_CreateDate]) VALUES (3, N'GT22112', N'Mahaveer Saini', CAST(N'2011-11-22' AS Date), N'MS', N'9878969858', N'mahveer@gamil.com', N'253652365236', 2, 1, CAST(N'2022-11-22T05:06:06.647' AS DateTime))
GO
INSERT [dbo].[Tbl_Members] ([Fld_Id], [Fld_MembershipNumber], [Fld_MemberName], [Fld_DOB], [Fld_FatherName], [Fld_MobileNumber], [Fld_EmailAddress], [Fld_AadharNumber], [Fld_MemberType], [Fld_Status], [Fld_CreateDate]) VALUES (4, N'GT22114', N'Aman ', CAST(N'2001-02-01' AS Date), N'Am', N'9057854885', N'Suresh@gmail.com', N'423423423434', 1, 1, CAST(N'2022-11-22T11:16:06.013' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tbl_Members] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Scheme] ON 
GO
INSERT [dbo].[Tbl_Scheme] ([Fld_Id], [Fld_SchemeName], [Fld_SchemeCode], [Fld_InterestRate], [Fld_CreateDate], [Fld_Status], [Fld_SchemeType]) VALUES (1, N'Regular RD', N'RD001', CAST(12.00 AS Decimal(6, 2)), CAST(N'2022-11-22' AS Date), 1, N'RD')
GO
INSERT [dbo].[Tbl_Scheme] ([Fld_Id], [Fld_SchemeName], [Fld_SchemeCode], [Fld_InterestRate], [Fld_CreateDate], [Fld_Status], [Fld_SchemeType]) VALUES (2, N'Regular FD', N'FD001', CAST(12.00 AS Decimal(6, 2)), CAST(N'2022-11-22' AS Date), 1, N'FD')
GO
INSERT [dbo].[Tbl_Scheme] ([Fld_Id], [Fld_SchemeName], [Fld_SchemeCode], [Fld_InterestRate], [Fld_CreateDate], [Fld_Status], [Fld_SchemeType]) VALUES (3, N'Regular FD', N'FD002', CAST(12.00 AS Decimal(6, 2)), CAST(N'2022-11-22' AS Date), 1, N'FD')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Scheme] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Transaction] ON 
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (1, N'TXN202211240000001', N'R000001', CAST(0.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'221100006', N'1', N'System', CAST(N'2022-11-24T10:42:10.663' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (2, N'TXN202211240000001', N'R000001', CAST(250.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'1', N'221100006', N'System', CAST(N'2022-11-24T10:42:10.690' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (3, N'TXN202211240000003', N'R000002', CAST(0.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'221100006', N'1', N'System', CAST(N'2022-11-24T10:43:30.583' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (4, N'TXN202211240000003', N'R000002', CAST(250.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'1', N'221100006', N'System', CAST(N'2022-11-24T10:43:30.583' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (5, N'TXN202211240000005', N'R000003', CAST(0.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'221100006', N'1', N'System', CAST(N'2022-11-24T10:44:43.980' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (6, N'TXN202211240000005', N'R000003', CAST(250.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'1', N'221100006', N'System', CAST(N'2022-11-24T10:44:43.980' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (7, N'TXN202211240000007', N'R000004', CAST(0.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'221100006', N'1', N'System', CAST(N'2022-11-24T10:45:03.273' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (8, N'TXN202211240000007', N'R000004', CAST(250.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'1', N'221100006', N'System', CAST(N'2022-11-24T10:45:03.273' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (9, N'TXN202211240000009', N'R000005', CAST(0.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'221100006', N'1', N'System', CAST(N'2022-11-24T10:45:14.433' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (10, N'TXN202211240000009', N'R000005', CAST(250.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'1', N'221100006', N'System', CAST(N'2022-11-24T10:45:14.433' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (11, N'TXN202211240000011', N'R000006', CAST(0.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'221100006', N'1', N'System', CAST(N'2022-11-24T10:45:26.410' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (12, N'TXN202211240000011', N'R000006', CAST(250.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'1', N'221100006', N'System', CAST(N'2022-11-24T10:45:26.410' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (13, N'TXN202211240000013', N'R000007', CAST(0.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'221100007', N'1', N'System', CAST(N'2022-11-24T11:16:09.817' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (14, N'TXN202211240000013', N'R000007', CAST(50.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'1', N'221100007', N'System', CAST(N'2022-11-24T11:16:09.817' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (15, N'TXN202211240000015', N'R000008', CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'221100008', N'1', N'System', CAST(N'2022-11-24T11:27:04.580' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (16, N'TXN202211240000015', N'R000008', CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'1', N'221100008', N'System', CAST(N'2022-11-24T11:27:04.580' AS DateTime), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Transaction] OFF
GO
/****** Object:  StoredProcedure [dbo].[Sp_DepositAmount]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_DepositAmount]
@emiId int,
@Creator nvarchar(100)='System'
as
begin
	


	declare @scroll varchar(50),@amount decimal(18,2),@accountnumber varchar(100),@flag int=0,@txnno varchar(500)
	
	set @flag=(select count(Fld_Id) from Tbl_DepositRd where Fld_Id=@emiId and Fld_Status=0)

	if(@flag>0)
	begin
		set @scroll='R'+(select format(isnull(max(Fld_id),0)+1,'000000') from Tbl_MasterScroll)
		set @amount=(select Fld_Amount from Tbl_DepositRd where Fld_Id=@emiId)
		set @accountnumber=(select Fld_AccountNumber from Tbl_DepositRd where Fld_Id=@emiId)
		set @txnno='TXN'+format(GETUTCDATE(),'yyyyMMdd')+(select format(isnull(max(Fld_id),0)+1,'0000000') from Tbl_Transaction)

		


		insert into Tbl_MasterScroll(Fld_ScrollNo,Fld_Ref,Fld_RefId,Fld_Status,Fld_CreateDate)
		values(@scroll,'RD DEPOSIT',@emiId,0,GETUTCDATE())

		update Tbl_DepositRd set Fld_Status=1,Fld_ScrollNo=@scroll,Fld_Depositor=@Creator,Fld_DepositDate=GETUTCDATE() where Fld_Id=@emiId

		insert into Tbl_Transaction(Fld_TxnNo,Fld_ScrollNo,Fld_AmountCr,Fld_AmountDr,Fld_Narration,Fld_Ledger,Fld_OtherLedger,Fld_Creator,Fld_CreateDate,Fld_Status)
		values(@txnno,@scroll,0,@amount,'RD EMI DEPOSIT',@accountnumber,1,@Creator,GETUTCDATE(),0)

		insert into Tbl_Transaction(Fld_TxnNo,Fld_ScrollNo,Fld_AmountCr,Fld_AmountDr,Fld_Narration,Fld_Ledger,Fld_OtherLedger,Fld_Creator,Fld_CreateDate,Fld_Status)
		values(@txnno,@scroll,@amount,0,'RD EMI DEPOSIT',1,@accountnumber,@Creator,GETUTCDATE(),0)
	
		set @flag=1

	end
	else
	begin
		set @flag=0
	end

	select @flag as Flag,isnull(@txnno,'') as TxnNo


end





--select * from Tbl_DepositRd
--select * from Tbl_Masterscroll
--select * from Tbl_Transaction


/*
exec Sp_DepositAmount 9


Scroll:-
R-DepositRd
F-DepositFd

Loan-


create table Tbl_MasterScroll(Fld_Id int identity(1,1),Fld_ScrollNo varchar(200),Fld_Ref varchar(100),Fld_RefId int,Fld_Status int,
Fld_CreateDate datetime)



create table Tbl_Transaction(Fld_Id int identity(1,1),Fld_TxnNo nvarchar(max),Fld_ScrollNo nvarchar(200),Fld_AmountCr decimal(18,2),Fld_AmountDr decimal(18,2),
Fld_Narration nvarchar(max),Fld_Ledger nvarchar(200),Fld_OtherLedger nvarchar(200),Fld_Creator varchar(100),Fld_CreateDate datetime,Fld_Approver varchar(100),Fld_ApproveDate datetime,
Fld_Status int)

drop table Tbl_Transaction

select * from Tbl_DepositRd
0-unchanged,default
1-Active,Approved,open
2-Block,Rejected,closed
3



*/
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAccounts]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_GetAccounts]
as
begin

	select ta.Fld_MembershipNumber,tm.Fld_MemberName,Fld_AccountNumber,ts.Fld_SchemeName,ts.Fld_SchemeType,ta.Fld_Status from Tbl_Accounts ta
	inner join Tbl_Scheme ts on ts.Fld_SchemeCode=ta.Fld_SchemeCode
	inner Join Tbl_Members tm on tm.Fld_MembershipNumber=ta.Fld_MembershipNumber
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllMembers]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_GetAllMembers]
@MembershipNumber varchar(100)='',
@CommandText varchar(50)=''
as
begin
	if(@CommandText='All')
	begin
		select Fld_Id,Fld_MemberName,Fld_MembershipNumber,Fld_MobileNumber,Fld_EmailAddress,Fld_MemberType,Fld_CreateDate from Tbl_Members		
	end
	else
	begin
		select Fld_Id,Fld_MemberName,Fld_MembershipNumber,Fld_MobileNumber,Fld_EmailAddress,Fld_MemberType,Fld_CreateDate from Tbl_Members
		WHERE Fld_MembershipNumber=@MembershipNumber
	end


end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetDueAmountDetails]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_GetDueAmountDetails]
@accountNumber varchar(100)
as
begin
	select top(1) TD.Fld_Id,tm.Fld_MemberName ,TD.Fld_EmiDate,TD.Fld_Amount,format(TD.Fld_EmiDate,'dd MMMM yyyy') as Fld_PayDate from Tbl_DepositRd TD
	left join Tbl_Accounts ta on ta.Fld_AccountNumber=TD.Fld_AccountNumber
	left join Tbl_Members tm  on tm.Fld_MembershipNumber=ta.Fld_MembershipNumber
	where ta.Fld_Status=1 and TD.Fld_Status=0 and TD.Fld_AccountNumber=@accountNumber
	order by td.fld_EmiDate asc
	
end


/*
Exec Sp_GetDueAmountDetails 221100003

*/

GO
/****** Object:  StoredProcedure [dbo].[Sp_MemberAddUpdate]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_MemberAddUpdate]
@Fld_Id int=0,
@Fld_MembershipNumber varchar(100)='',
@Fld_MemberName varchar(200),
@Fld_DOB datetime,
@Fld_FatherName varchar(200),
@Fld_MobileNumber varchar(25),
@Fld_EmailAddress varchar(50),
@Fld_AadharNumber varchar(20),
@Fld_MemberType int=2,
--@Fld_Status int,
@CommandType nvarchar(20)='Add'
as
begin
 Declare @Flag int=0
	if(@CommandType='Add')
	begin
		
		Declare @tempMembshipno varchar(100),@topId varchar(10);
		set @topId=(select ISNULL(MAX(Fld_Id),0)+1 from Tbl_Members)
		set @tempMembshipno='GT'+Format(GETUTCDATE(),'yyMM')+@topId

		
		

		insert into Tbl_Members(Fld_MembershipNumber,Fld_MemberName,Fld_DOB,Fld_FatherName,Fld_MobileNumber,Fld_EmailAddress,Fld_AadharNumber,
		Fld_MemberType ,Fld_Status,Fld_CreateDate)
		values(@tempMembshipno,@Fld_MemberName,@Fld_DOB,@Fld_FatherName,@Fld_MobileNumber,@Fld_EmailAddress,@Fld_AadharNumber,
		@Fld_MemberType,1,GETUTCDATE())

		
		if(@Fld_MemberType=1)
		begin
			insert into Tbl_MasterUser(Fld_MembershipNumber,Fld_UserId,Fld_Password,Fld_Permission,Fld_CreateDate,Fld_Status)
			values(@tempMembshipno,@tempMembshipno,@tempMembshipno,0,GETUTCDATE(),1)
		end
		
		
		
		set @Flag=1
		----select * from Tbl_Members
		select @tempMembshipno as Fld_MembershipNumber,@Flag as Fld_Status
	end
	else
	begin
		select 'test2'
	end
	--select * from Tbl_Members
end


/*




Status=>>>>>>>>>>
0 -->Faild
1 -->Success


select * from Tbl_Members

exec Sp_MemberAddUpdate  @Fld_MembershipNumber = '',@Fld_MemberName = 'Suresh Kumar saini',@Fld_DOB = null,@Fld_FatherName = 'CL Mali',
@Fld_MobileNumber = '9057083587',@Fld_EmailAddress = 'SureshSaini7133@gmial.com',@Fld_AadharNumber = '729945377133',@Fld_MemberType = 2,@CommandType = 'Add'

*/


--select 'GT'+Format(GETUTCDATE(),'yyMM')



GO
/****** Object:  StoredProcedure [dbo].[Sp_OpenDepositAccount]    Script Date: 24-11-2022 5.12.26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[Sp_OpenDepositAccount]
@Fld_MembershipNumber varchar(200),
@Fld_SchemeCode varchar(100),
@Fld_MaturityDate date,
@Fld_Amount decimal(18,2),
@Fld_Creator varchar(100),
@Fld_StartDate date=getutcdate
as
begin
	begin try 
		
		declare @AccNo varchar(100),@flag int=0
		set @AccNo=Format(GETUTCDATE(),'yyMM')+(SELECT format( ISNULL(MAX(Fld_Id),0)+1,'00000') FROM Tbl_Accounts)
		
		insert into Tbl_Accounts(Fld_MembershipNumber,Fld_AccountNumber,Fld_SchemeCode,Fld_CreateDate,Fld_MaturityDate,Fld_Amount,Fld_Creator,Fld_Status,Fld_StartDate)
		values(@Fld_MembershipNumber,@AccNo,@Fld_SchemeCode,getutcdate(),@Fld_MaturityDate,@Fld_Amount,@Fld_Creator,1,@Fld_StartDate)
		
		Declare @scheme varchar(100),@monthcount varchar(20)
		set @scheme=(select Fld_SchemeType from Tbl_scheme where Fld_SchemeCode=@Fld_SchemeCode)
		set @monthcount=(DATEDIFF(month,@Fld_StartDate,DATEADD(month,1,@Fld_MaturityDate)))
	
	declare  @i int=0
	if(@scheme='RD')
		begin
			while(@i< @monthcount)
			begin
				insert into Tbl_DepositRd(Fld_AccountNumber,Fld_Amount,Fld_Status,Fld_EmiDate,Fld_Creator)
				values(@AccNo,@Fld_Amount,0,DATEADD(MONTH, @i, @Fld_StartDate),@Fld_Creator)
				set @i= @i+1
			end
		end



		set @flag=1;
	
	end try
	begin catch
		set @flag=0
	end catch

	select @AccNo as Fld_AccountNumber,@flag as Fld_Status
end


--SELECT DATEDIFF(month, '2017/08/25', '2017/09/25') AS DateDiff;

--select DATEADD(MONTH, 1, '2017/12/25')
GO
USE [master]
GO
ALTER DATABASE [GreatThinks] SET  READ_WRITE 
GO
