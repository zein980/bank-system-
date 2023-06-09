USE [master]
GO
/****** Object:  Database [BankDB]    Script Date: 5/30/2022 9:42:53 PM ******/
CREATE DATABASE [BankDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BankDB', FILENAME = N'D:\SqlServer\MSSQL15.MSSQLSERVER01\MSSQL\DATA\BankDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BankDB_log', FILENAME = N'D:\SqlServer\MSSQL15.MSSQLSERVER01\MSSQL\DATA\BankDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BankDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BankDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BankDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BankDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BankDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BankDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BankDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BankDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BankDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BankDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BankDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BankDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BankDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BankDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BankDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BankDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BankDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BankDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BankDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BankDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BankDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BankDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BankDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BankDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BankDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BankDB] SET  MULTI_USER 
GO
ALTER DATABASE [BankDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BankDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BankDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BankDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BankDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BankDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BankDB', N'ON'
GO
ALTER DATABASE [BankDB] SET QUERY_STORE = OFF
GO
USE [BankDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/30/2022 9:42:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Balance] [int] NOT NULL,
	[Acctype] [varchar](20) NOT NULL,
	[Account_number] [int] IDENTITY(1,1) NOT NULL,
	[Branch_number] [int] NOT NULL,
	[Code] [int] NULL,
	[SSN] [int] NOT NULL,
 CONSTRAINT [PK__Account__46F3B8850F90B297] PRIMARY KEY CLUSTERED 
(
	[Account_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 5/30/2022 9:42:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[Name] [varchar](25) NOT NULL,
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Bank__A25C5AA6B162AAB8] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 5/30/2022 9:42:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[Address] [varchar](30) NOT NULL,
	[Branch_number] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
 CONSTRAINT [PK__Branch__2FBFA281CCD2C73D] PRIMARY KEY CLUSTERED 
(
	[Branch_number] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/30/2022 9:42:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Address] [varchar](30) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Name] [varchar](25) NOT NULL,
	[SSN] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Customer__CA1E8E3D60EF8761] PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EC]    Script Date: 5/30/2022 9:42:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EC](
	[Em_ID] [int] NOT NULL,
	[SSN] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Em_ID] ASC,
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/30/2022 9:42:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[number_of_loans_] [int] NULL,
	[Name] [varchar](25) NOT NULL,
	[Em_ID] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[Branch_number] [int] NOT NULL,
	[Code] [int] NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK__Employee__AF78B5F977305591] PRIMARY KEY CLUSTERED 
(
	[Em_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 5/30/2022 9:42:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan](
	[Loan_amount] [int] NOT NULL,
	[Loan_type] [varchar](50) NOT NULL,
	[Loan_number] [int] IDENTITY(1,1) NOT NULL,
	[Branch_number] [int] NOT NULL,
	[Code] [int] NULL,
	[SSN] [int] NOT NULL,
	[Em_ID] [int] NULL,
	[Pending] [int] NOT NULL,
	[Paid] [int] NOT NULL,
 CONSTRAINT [PK__Loan__B3A704CD31F1BBAE] PRIMARY KEY CLUSTERED 
(
	[Loan_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Balance], [Acctype], [Account_number], [Branch_number], [Code], [SSN]) VALUES (250, N'Commercial', 1, 1, 1, 1)
INSERT [dbo].[Account] ([Balance], [Acctype], [Account_number], [Branch_number], [Code], [SSN]) VALUES (2550, N'Personal', 2, 2, 2, 10)
INSERT [dbo].[Account] ([Balance], [Acctype], [Account_number], [Branch_number], [Code], [SSN]) VALUES (2950, N'Industry', 3, 2, 2, 10)
INSERT [dbo].[Account] ([Balance], [Acctype], [Account_number], [Branch_number], [Code], [SSN]) VALUES (4000, N'Personal', 5, 4, 2, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([Name], [Code], [Address]) VALUES (N'bank1', 1, N'6 octoper')
INSERT [dbo].[Bank] ([Name], [Code], [Address]) VALUES (N'Bank2', 2, N'maady')
SET IDENTITY_INSERT [dbo].[Bank] OFF
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([Address], [Branch_number], [Code]) VALUES (N'6 octoper', 1, 1)
INSERT [dbo].[Branch] ([Address], [Branch_number], [Code]) VALUES (N'maady', 2, 2)
INSERT [dbo].[Branch] ([Address], [Branch_number], [Code]) VALUES (N'mid cairo', 3, 1)
INSERT [dbo].[Branch] ([Address], [Branch_number], [Code]) VALUES (N'mid giza', 4, 2)
INSERT [dbo].[Branch] ([Address], [Branch_number], [Code]) VALUES (N'alexandria', 5, 2)
INSERT [dbo].[Branch] ([Address], [Branch_number], [Code]) VALUES (N'maady', 7, 1)
INSERT [dbo].[Branch] ([Address], [Branch_number], [Code]) VALUES (N'suez', 8, 1)
SET IDENTITY_INSERT [dbo].[Branch] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Address], [Phone], [Name], [SSN], [username], [password]) VALUES (N'maady', N'01115003763', N'mahmoud', 1, N'mahmoud', N'mahmoud')
INSERT [dbo].[Customer] ([Address], [Phone], [Name], [SSN], [username], [password]) VALUES (N'6 octoper', N'01127626807', N'kareem', 4, N'kareem', N'kareem')
INSERT [dbo].[Customer] ([Address], [Phone], [Name], [SSN], [username], [password]) VALUES (N'cairo', N'012', N'Youssef', 6, N'Joe99', N'joe')
INSERT [dbo].[Customer] ([Address], [Phone], [Name], [SSN], [username], [password]) VALUES (N'giza', N'011', N'Zeinab', 7, N'zeinab', N'zzz')
INSERT [dbo].[Customer] ([Address], [Phone], [Name], [SSN], [username], [password]) VALUES (N'giza', N'012', N'aya', 9, N'aya', N'aya')
INSERT [dbo].[Customer] ([Address], [Phone], [Name], [SSN], [username], [password]) VALUES (N'Dar Alslam', N'012', N'amgad', 10, N'lucifer', N'lucifer')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[EC] ([Em_ID], [SSN]) VALUES (2, 1)
INSERT [dbo].[EC] ([Em_ID], [SSN]) VALUES (3, 1)
INSERT [dbo].[EC] ([Em_ID], [SSN]) VALUES (3, 4)
INSERT [dbo].[EC] ([Em_ID], [SSN]) VALUES (4, 1)
INSERT [dbo].[EC] ([Em_ID], [SSN]) VALUES (5, 7)
INSERT [dbo].[EC] ([Em_ID], [SSN]) VALUES (7, 9)
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([number_of_loans_], [Name], [Em_ID], [password], [username], [Branch_number], [Code], [Phone], [Address]) VALUES (0, N'admin', 1, N'admin', N'admin', 1, 1, NULL, NULL)
INSERT [dbo].[Employee] ([number_of_loans_], [Name], [Em_ID], [password], [username], [Branch_number], [Code], [Phone], [Address]) VALUES (0, N'employee1', 2, N'em1', N'em1', 1, 1, N'050', N'asuan')
INSERT [dbo].[Employee] ([number_of_loans_], [Name], [Em_ID], [password], [username], [Branch_number], [Code], [Phone], [Address]) VALUES (NULL, N'ahmed', 3, N'ahm', N'ahmed1', 1, 1, N'0100', N'sinai')
INSERT [dbo].[Employee] ([number_of_loans_], [Name], [Em_ID], [password], [username], [Branch_number], [Code], [Phone], [Address]) VALUES (NULL, N'Amgad', 4, N'123', N'lucifer', 4, 2, NULL, NULL)
INSERT [dbo].[Employee] ([number_of_loans_], [Name], [Em_ID], [password], [username], [Branch_number], [Code], [Phone], [Address]) VALUES (NULL, N'Kareem', 5, N'k9', N'kareem9', 5, 2, N'011', N'giza')
INSERT [dbo].[Employee] ([number_of_loans_], [Name], [Em_ID], [password], [username], [Branch_number], [Code], [Phone], [Address]) VALUES (NULL, N'ahmed', 6, N'ah', N'ahmed', 5, 2, N'010', N'alex')
INSERT [dbo].[Employee] ([number_of_loans_], [Name], [Em_ID], [password], [username], [Branch_number], [Code], [Phone], [Address]) VALUES (NULL, N'em3', 7, N'em3', N'em3', 5, 2, N'0122', N'suez')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Loan] ON 

INSERT [dbo].[Loan] ([Loan_amount], [Loan_type], [Loan_number], [Branch_number], [Code], [SSN], [Em_ID], [Pending], [Paid]) VALUES (250, N'Industry', 1, 1, 1, 1, 3, 0, 1)
INSERT [dbo].[Loan] ([Loan_amount], [Loan_type], [Loan_number], [Branch_number], [Code], [SSN], [Em_ID], [Pending], [Paid]) VALUES (500, N'Commerical', 6, 2, 2, 4, 3, 0, 1)
INSERT [dbo].[Loan] ([Loan_amount], [Loan_type], [Loan_number], [Branch_number], [Code], [SSN], [Em_ID], [Pending], [Paid]) VALUES (1550, N'Industry', 9, 7, 1, 4, 3, 0, 1)
INSERT [dbo].[Loan] ([Loan_amount], [Loan_type], [Loan_number], [Branch_number], [Code], [SSN], [Em_ID], [Pending], [Paid]) VALUES (2000, N'Personal', 11, 7, 1, 1, 3, 0, 1)
INSERT [dbo].[Loan] ([Loan_amount], [Loan_type], [Loan_number], [Branch_number], [Code], [SSN], [Em_ID], [Pending], [Paid]) VALUES (2500, N'Commercial', 12, 1, 1, 10, 4, 1, 0)
INSERT [dbo].[Loan] ([Loan_amount], [Loan_type], [Loan_number], [Branch_number], [Code], [SSN], [Em_ID], [Pending], [Paid]) VALUES (7000, N'Industry', 13, 2, 2, 10, 2, 1, 0)
SET IDENTITY_INSERT [dbo].[Loan] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employee]    Script Date: 5/30/2022 9:42:53 PM ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [IX_Employee] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_pending]  DEFAULT ((1)) FOR [Pending]
GO
ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_Paid]  DEFAULT ((0)) FOR [Paid]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__33D4B598] FOREIGN KEY([Branch_number], [Code])
REFERENCES [dbo].[Branch] ([Branch_number], [Code])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__33D4B598]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__SSN__34C8D9D1] FOREIGN KEY([SSN])
REFERENCES [dbo].[Customer] ([SSN])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__SSN__34C8D9D1]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK__Branch__Code__267ABA7A] FOREIGN KEY([Code])
REFERENCES [dbo].[Bank] ([Code])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK__Branch__Code__267ABA7A]
GO
ALTER TABLE [dbo].[EC]  WITH CHECK ADD  CONSTRAINT [FK__EC__Em_ID__37A5467C] FOREIGN KEY([Em_ID])
REFERENCES [dbo].[Employee] ([Em_ID])
GO
ALTER TABLE [dbo].[EC] CHECK CONSTRAINT [FK__EC__Em_ID__37A5467C]
GO
ALTER TABLE [dbo].[EC]  WITH CHECK ADD  CONSTRAINT [FK__EC__SSN__38996AB5] FOREIGN KEY([SSN])
REFERENCES [dbo].[Customer] ([SSN])
GO
ALTER TABLE [dbo].[EC] CHECK CONSTRAINT [FK__EC__SSN__38996AB5]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Employee__2B3F6F97] FOREIGN KEY([Branch_number], [Code])
REFERENCES [dbo].[Branch] ([Branch_number], [Code])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Employee__2B3F6F97]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK__Loan__2F10007B] FOREIGN KEY([Branch_number], [Code])
REFERENCES [dbo].[Branch] ([Branch_number], [Code])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK__Loan__2F10007B]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK__Loan__Em_ID__30F848ED] FOREIGN KEY([Em_ID])
REFERENCES [dbo].[Employee] ([Em_ID])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK__Loan__Em_ID__30F848ED]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK__Loan__SSN__300424B4] FOREIGN KEY([SSN])
REFERENCES [dbo].[Customer] ([SSN])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK__Loan__SSN__300424B4]
GO
USE [master]
GO
ALTER DATABASE [BankDB] SET  READ_WRITE 
GO
