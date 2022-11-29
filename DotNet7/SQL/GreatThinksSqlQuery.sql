USE [master]
GO
/****** Object:  Database [GreatThinks]    Script Date: 29-11-2022 6.36.23 PM ******/
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
/****** Object:  Table [dbo].[Tbl_Accounts]    Script Date: 29-11-2022 6.36.23 PM ******/
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
/****** Object:  Table [dbo].[Tbl_DepositRd]    Script Date: 29-11-2022 6.36.23 PM ******/
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
/****** Object:  Table [dbo].[Tbl_LoanApplication]    Script Date: 29-11-2022 6.36.23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_LoanApplication](
	[Fld_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fld_MembershipNumber] [varchar](200) NULL,
	[Fld_LoanAccountNumber] [varchar](200) NULL,
	[Fld_PanNumber] [varchar](100) NULL,
	[Fld_RequiredLoanAmount] [decimal](18, 2) NULL,
	[Fld_Scheme] [varchar](100) NULL,
	[Fld_Roi] [decimal](18, 2) NULL,
	[Fld_DurationInDays] [int] NULL,
	[Fld_PromiseToPayDate] [date] NULL,
	[Fld_CreateDate] [date] NULL,
	[Fld_LoanSanctionDate] [date] NULL,
	[Fld_Creator] [varchar](100) NULL,
	[Fld_LoanStatus] [int] NULL,
	[Fld_PaymentMode] [varchar](100) NULL,
	[Fld_PayDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_MasterScroll]    Script Date: 29-11-2022 6.36.23 PM ******/
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
/****** Object:  Table [dbo].[Tbl_MasterUser]    Script Date: 29-11-2022 6.36.23 PM ******/
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
	[Fld_Status] [int] NULL,
	[Fld_Creator] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Members]    Script Date: 29-11-2022 6.36.23 PM ******/
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
	[Fld_CreateDate] [datetime] NULL,
	[Fld_Creator] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Scheme]    Script Date: 29-11-2022 6.36.23 PM ******/
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
	[Fld_SchemeType] [nvarchar](50) NULL,
	[Fld_PaymentMode] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Transaction]    Script Date: 29-11-2022 6.36.23 PM ******/
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
INSERT [dbo].[Tbl_Accounts] ([Fld_Id], [Fld_MembershipNumber], [Fld_AccountNumber], [Fld_SchemeCode], [Fld_CreateDate], [Fld_StartDate], [Fld_MaturityDate], [Fld_Amount], [Fld_MaturityAmount], [Fld_Creator], [Fld_Status]) VALUES (1, N'GT22112', N'221100001', N'RD001', CAST(N'2022-11-29' AS Date), CAST(N'2022-11-01' AS Date), CAST(N'2023-10-31' AS Date), CAST(1000.00 AS Decimal(18, 2)), NULL, N'System', 1)
GO
INSERT [dbo].[Tbl_Accounts] ([Fld_Id], [Fld_MembershipNumber], [Fld_AccountNumber], [Fld_SchemeCode], [Fld_CreateDate], [Fld_StartDate], [Fld_MaturityDate], [Fld_Amount], [Fld_MaturityAmount], [Fld_Creator], [Fld_Status]) VALUES (2, N'GT22115', N'221100002', N'FD1002', CAST(N'2022-11-29' AS Date), CAST(N'2022-12-01' AS Date), CAST(N'2023-06-01' AS Date), CAST(10000.00 AS Decimal(18, 2)), NULL, N'GT22111', 1)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_DepositRd] ON 
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (1, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 1, CAST(N'2022-11-01' AS Date), N'System', CAST(N'2022-11-29' AS Date), N'GT22111', N'R000001')
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (2, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2022-12-01' AS Date), N'System', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (3, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2023-01-01' AS Date), N'System', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (4, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2023-02-01' AS Date), N'System', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (5, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2023-03-01' AS Date), N'System', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (6, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2023-04-01' AS Date), N'System', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (7, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2023-05-01' AS Date), N'System', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (8, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2023-06-01' AS Date), N'System', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (9, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2023-07-01' AS Date), N'System', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (10, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2023-08-01' AS Date), N'System', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (11, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2023-09-01' AS Date), N'System', NULL, NULL, NULL)
GO
INSERT [dbo].[Tbl_DepositRd] ([Fld_Id], [Fld_AccountNumber], [Fld_Amount], [Fld_Status], [Fld_EmiDate], [Fld_Creator], [Fld_DepositDate], [Fld_Depositor], [Fld_ScrollNo]) VALUES (12, N'221100001', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2023-10-01' AS Date), N'System', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Tbl_DepositRd] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_LoanApplication] ON 
GO
INSERT [dbo].[Tbl_LoanApplication] ([Fld_Id], [Fld_MembershipNumber], [Fld_LoanAccountNumber], [Fld_PanNumber], [Fld_RequiredLoanAmount], [Fld_Scheme], [Fld_Roi], [Fld_DurationInDays], [Fld_PromiseToPayDate], [Fld_CreateDate], [Fld_LoanSanctionDate], [Fld_Creator], [Fld_LoanStatus], [Fld_PaymentMode], [Fld_PayDate]) VALUES (1, N'GT22112', N'PL10032211000001', N'NDDHY6767H', CAST(20000.00 AS Decimal(18, 2)), N'PL1003', CAST(24.00 AS Decimal(18, 2)), 182, CAST(N'2023-06-01' AS Date), CAST(N'2022-11-29' AS Date), CAST(N'2022-12-01' AS Date), N'GT22111', 0, N'CASH', NULL)
GO
SET IDENTITY_INSERT [dbo].[Tbl_LoanApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_MasterScroll] ON 
GO
INSERT [dbo].[Tbl_MasterScroll] ([Fld_Id], [Fld_ScrollNo], [Fld_Ref], [Fld_RefId], [Fld_Status], [Fld_CreateDate]) VALUES (1, N'R000001', N'RD DEPOSIT', 1, 0, CAST(N'2022-11-29T13:03:46.413' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tbl_MasterScroll] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_MasterUser] ON 
GO
INSERT [dbo].[Tbl_MasterUser] ([Fld_Id], [Fld_MembershipNumber], [Fld_UserId], [Fld_Password], [Fld_Permission], [Fld_CreateDate], [Fld_Status], [Fld_Creator]) VALUES (1, N'GT22111', N'GT22111', N'GT22111', 0, CAST(N'2022-11-29' AS Date), 1, NULL)
GO
INSERT [dbo].[Tbl_MasterUser] ([Fld_Id], [Fld_MembershipNumber], [Fld_UserId], [Fld_Password], [Fld_Permission], [Fld_CreateDate], [Fld_Status], [Fld_Creator]) VALUES (2, N'GT22112', N'GT22112', N'GT22112', 0, CAST(N'2022-11-29' AS Date), 1, NULL)
GO
INSERT [dbo].[Tbl_MasterUser] ([Fld_Id], [Fld_MembershipNumber], [Fld_UserId], [Fld_Password], [Fld_Permission], [Fld_CreateDate], [Fld_Status], [Fld_Creator]) VALUES (3, N'GT22113', N'GT22113', N'GT22113', 0, CAST(N'2022-11-29' AS Date), 1, NULL)
GO
INSERT [dbo].[Tbl_MasterUser] ([Fld_Id], [Fld_MembershipNumber], [Fld_UserId], [Fld_Password], [Fld_Permission], [Fld_CreateDate], [Fld_Status], [Fld_Creator]) VALUES (4, N'GT22114', N'GT22114', N'GT22114', 0, CAST(N'2022-11-29' AS Date), 1, NULL)
GO
INSERT [dbo].[Tbl_MasterUser] ([Fld_Id], [Fld_MembershipNumber], [Fld_UserId], [Fld_Password], [Fld_Permission], [Fld_CreateDate], [Fld_Status], [Fld_Creator]) VALUES (5, N'GT22115', N'GT22115', N'GT22115', 0, CAST(N'2022-11-29' AS Date), 1, N'GT22111')
GO
SET IDENTITY_INSERT [dbo].[Tbl_MasterUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Members] ON 
GO
INSERT [dbo].[Tbl_Members] ([Fld_Id], [Fld_MembershipNumber], [Fld_MemberName], [Fld_DOB], [Fld_FatherName], [Fld_MobileNumber], [Fld_EmailAddress], [Fld_AadharNumber], [Fld_MemberType], [Fld_Status], [Fld_CreateDate], [Fld_Creator]) VALUES (1, N'GT22111', N'Suresh Kumar Saini', CAST(N'2001-01-01' AS Date), N'CM', N'9057083587', N'Sureshsaini@gmail.com', N'123456789412', 1, 1, CAST(N'2022-11-29T12:41:23.330' AS DateTime), NULL)
GO
INSERT [dbo].[Tbl_Members] ([Fld_Id], [Fld_MembershipNumber], [Fld_MemberName], [Fld_DOB], [Fld_FatherName], [Fld_MobileNumber], [Fld_EmailAddress], [Fld_AadharNumber], [Fld_MemberType], [Fld_Status], [Fld_CreateDate], [Fld_Creator]) VALUES (2, N'GT22112', N'Mahaveer Saini', CAST(N'2000-05-01' AS Date), N'NL', N'810785234', N'mahveer@gamil.com', N'789456123051', 1, 1, CAST(N'2022-11-29T12:42:40.163' AS DateTime), NULL)
GO
INSERT [dbo].[Tbl_Members] ([Fld_Id], [Fld_MembershipNumber], [Fld_MemberName], [Fld_DOB], [Fld_FatherName], [Fld_MobileNumber], [Fld_EmailAddress], [Fld_AadharNumber], [Fld_MemberType], [Fld_Status], [Fld_CreateDate], [Fld_Creator]) VALUES (3, N'GT22113', N'Aman', CAST(N'1994-01-01' AS Date), N'DM', N'9649961034', N'Aman@gmail.com', N'125454545454', 1, 1, CAST(N'2022-11-29T12:44:27.027' AS DateTime), NULL)
GO
INSERT [dbo].[Tbl_Members] ([Fld_Id], [Fld_MembershipNumber], [Fld_MemberName], [Fld_DOB], [Fld_FatherName], [Fld_MobileNumber], [Fld_EmailAddress], [Fld_AadharNumber], [Fld_MemberType], [Fld_Status], [Fld_CreateDate], [Fld_Creator]) VALUES (4, N'GT22114', N'Banwari Saini', CAST(N'2001-01-01' AS Date), N'JM', N'1111111111', N'bm@gmail.com', N'121254512154', 1, 1, CAST(N'2022-11-29T12:45:01.893' AS DateTime), NULL)
GO
INSERT [dbo].[Tbl_Members] ([Fld_Id], [Fld_MembershipNumber], [Fld_MemberName], [Fld_DOB], [Fld_FatherName], [Fld_MobileNumber], [Fld_EmailAddress], [Fld_AadharNumber], [Fld_MemberType], [Fld_Status], [Fld_CreateDate], [Fld_Creator]) VALUES (5, N'GT22115', N'Norat Mali', CAST(N'2010-01-01' AS Date), N'NL', N'9694923030', N'norat@gmail.com', N'454545454564', 1, 1, CAST(N'2022-11-29T13:01:55.310' AS DateTime), N'GT22111')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Members] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Scheme] ON 
GO
INSERT [dbo].[Tbl_Scheme] ([Fld_Id], [Fld_SchemeName], [Fld_SchemeCode], [Fld_InterestRate], [Fld_CreateDate], [Fld_Status], [Fld_SchemeType], [Fld_PaymentMode]) VALUES (1, N'Saving For Emergency(RD)', N'RD001', CAST(12.00 AS Decimal(6, 2)), CAST(N'2022-11-29' AS Date), 1, N'RD', N'EMI')
GO
INSERT [dbo].[Tbl_Scheme] ([Fld_Id], [Fld_SchemeName], [Fld_SchemeCode], [Fld_InterestRate], [Fld_CreateDate], [Fld_Status], [Fld_SchemeType], [Fld_PaymentMode]) VALUES (2, N'Saving For Business(FD)', N'FD1002', CAST(10.00 AS Decimal(6, 2)), CAST(N'2022-11-29' AS Date), 1, N'FD', N'CASH')
GO
INSERT [dbo].[Tbl_Scheme] ([Fld_Id], [Fld_SchemeName], [Fld_SchemeCode], [Fld_InterestRate], [Fld_CreateDate], [Fld_Status], [Fld_SchemeType], [Fld_PaymentMode]) VALUES (3, N'Personal Loan(Cash)', N'PL1003', CAST(24.00 AS Decimal(6, 2)), CAST(N'2022-11-29' AS Date), 1, N'PL', N'CASH')
GO
INSERT [dbo].[Tbl_Scheme] ([Fld_Id], [Fld_SchemeName], [Fld_SchemeCode], [Fld_InterestRate], [Fld_CreateDate], [Fld_Status], [Fld_SchemeType], [Fld_PaymentMode]) VALUES (4, N'Personal Loan(EMI)', N'PL1004', CAST(18.00 AS Decimal(6, 2)), CAST(N'2022-11-29' AS Date), 1, N'PL', N'EMI')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Scheme] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Transaction] ON 
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (1, N'TXN202211290000001', N'R000001', CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'221100001', N'1', N'GT22111', CAST(N'2022-11-29T13:03:46.503' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Tbl_Transaction] ([Fld_Id], [Fld_TxnNo], [Fld_ScrollNo], [Fld_AmountCr], [Fld_AmountDr], [Fld_Narration], [Fld_Ledger], [Fld_OtherLedger], [Fld_Creator], [Fld_CreateDate], [Fld_Approver], [Fld_ApproveDate], [Fld_Status]) VALUES (2, N'TXN202211290000001', N'R000001', CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'RD EMI DEPOSIT', N'1', N'221100001', N'GT22111', CAST(N'2022-11-29T13:03:46.533' AS DateTime), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Transaction] OFF
GO
/****** Object:  StoredProcedure [dbo].[Sp_DepositAmount]    Script Date: 29-11-2022 6.36.23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_GetAccounts]    Script Date: 29-11-2022 6.36.23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_GetAccounts]
@accounttype varchar(100)='DEPOSIT'
as
begin
	if(@accounttype='DEPOSIT')
	begin
		select ta.Fld_MembershipNumber,tm.Fld_MemberName,Fld_AccountNumber,ts.Fld_SchemeName,ts.Fld_SchemeType,ta.Fld_Status,ta.Fld_Amount as Fld_Amount from Tbl_Accounts ta
		inner join Tbl_Scheme ts on ts.Fld_SchemeCode=ta.Fld_SchemeCode
		inner Join Tbl_Members tm on tm.Fld_MembershipNumber=ta.Fld_MembershipNumber

		select Fld_SchemeCode,Fld_SchemeName from Tbl_Scheme where Fld_SchemeType='FD' or Fld_SchemeType='RD'
	end
	else if(@accounttype='LOAN')
	begin
		select ta.Fld_MembershipNumber,tm.Fld_MemberName,Fld_LoanAccountNumber as Fld_AccountNumber,ts.Fld_SchemeName,ts.Fld_SchemeType,ta.Fld_LoanStatus as Fld_Status,ta.Fld_RequiredLoanAmount as Fld_Amount from Tbl_LoanApplication ta
		inner join Tbl_Scheme ts on ts.Fld_SchemeCode=ta.Fld_Scheme
		inner Join Tbl_Members tm on tm.Fld_MembershipNumber=ta.Fld_MembershipNumber


		select Fld_SchemeCode,Fld_SchemeName from Tbl_Scheme where Fld_SchemeType='PL'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllMembers]    Script Date: 29-11-2022 6.36.23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_GetDueAmountDetails]    Script Date: 29-11-2022 6.36.23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_LoanApplication]    Script Date: 29-11-2022 6.36.23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_LoanApplication]
@Fld_MembershipNumber varchar(200),
@Fld_RequiredLoanAmount varchar(200),
@Fld_LoanScheme varchar(100),
@Fld_PromiseToPayDate date,
@Fld_LoanSanctionDate date,
@Fld_Creator varchar(100),
@Fld_PanNumber varchar(100)
as
begin
	
		declare @loanAccountNumber varchar(100),@roi decimal(18,2),@duration int,@paymentmode varchar(50),@Flag int =0

		begin try
		select @paymentmode= Fld_PaymentMode,@roi=Fld_InterestRate from Tbl_Scheme where Fld_SchemeCode=@Fld_LoanScheme
		set @duration=(DATEDIFF(DAY,@Fld_LoanSanctionDate,@Fld_PromiseToPayDate));
		set @loanAccountNumber=((@Fld_LoanScheme)+(select format(GETUTCDATE(),'yyMM'))+(select format(isnull((select max(Fld_Id) from Tbl_LoanApplication),0)+1,'000000')));
		
		Insert into Tbl_LoanApplication([Fld_MembershipNumber], [Fld_LoanAccountNumber], [Fld_PanNumber], [Fld_RequiredLoanAmount], [Fld_Scheme], [Fld_Roi], [Fld_DurationInDays], [Fld_PromiseToPayDate], [Fld_CreateDate], [Fld_LoanSanctionDate], [Fld_Creator], [Fld_LoanStatus], [Fld_PaymentMode])
		values(@Fld_MembershipNumber,@loanAccountNumber,@Fld_PanNumber,@Fld_RequiredLoanAmount,@Fld_LoanScheme,@roi,@duration,@Fld_PromiseToPayDate,getutcdate(),@Fld_LoanSanctionDate,@Fld_Creator,0,@paymentmode)


		set @Flag=1
		end try
		begin catch
			set @Flag=0
		end catch

		select @Flag as Status,@loanAccountNumber as Fld_AccountNumber

	
end


/*
 select * from Tbl_LoanApplication


*/
GO
/****** Object:  StoredProcedure [dbo].[Sp_Login]    Script Date: 29-11-2022 6.36.23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Login]
@userName varchar(200),
@pwd varchar(200)
as
begin
	declare @flag int =0
	set @flag=(select count(Fld_Id) from Tbl_MasterUser where Fld_UserId=@userName and Fld_Password=@pwd and Fld_Status=1)
	
	if(@flag>0)
	begin
		select tmu.Fld_MembershipNumber,tmu.Fld_UserId,tm.Fld_MemberName,tm.Fld_MobileNumber,tm.Fld_EmailAddress,@flag as LoginStatus from Tbl_MasterUser tmu
		inner join Tbl_Members tm on tm.Fld_MembershipNumber=tmu.Fld_MembershipNumber
		where Fld_UserId=@userName
	end
	else
	begin

		select @flag as LoginStatus
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_MemberAddUpdate]    Script Date: 29-11-2022 6.36.23 PM ******/
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
@Fld_Creator varchar(100)='system',
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
		Fld_MemberType ,Fld_Status,Fld_CreateDate,Fld_Creator)
		values(@tempMembshipno,@Fld_MemberName,@Fld_DOB,@Fld_FatherName,@Fld_MobileNumber,@Fld_EmailAddress,@Fld_AadharNumber,
		@Fld_MemberType,1,GETUTCDATE(),@Fld_Creator)

		
		if(@Fld_MemberType=1)
		begin
			insert into Tbl_MasterUser(Fld_MembershipNumber,Fld_UserId,Fld_Password,Fld_Permission,Fld_CreateDate,Fld_Status,Fld_Creator)
			values(@tempMembshipno,@tempMembshipno,@tempMembshipno,0,GETUTCDATE(),1,@Fld_Creator)
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
/****** Object:  StoredProcedure [dbo].[Sp_OpenDepositAccount]    Script Date: 29-11-2022 6.36.23 PM ******/
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
