USE [master]
GO
/****** Object:  Database [DAn_Web2]    Script Date: 4/25/2017 7:34:37 PM ******/
CREATE DATABASE [DAn_Web2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DAn_Web2', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DAn_Web2.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DAn_Web2_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DAn_Web2_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DAn_Web2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DAn_Web2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DAn_Web2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DAn_Web2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DAn_Web2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DAn_Web2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DAn_Web2] SET ARITHABORT OFF 
GO
ALTER DATABASE [DAn_Web2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DAn_Web2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DAn_Web2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DAn_Web2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DAn_Web2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DAn_Web2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DAn_Web2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DAn_Web2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DAn_Web2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DAn_Web2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DAn_Web2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DAn_Web2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DAn_Web2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DAn_Web2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DAn_Web2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DAn_Web2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DAn_Web2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DAn_Web2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DAn_Web2] SET  MULTI_USER 
GO
ALTER DATABASE [DAn_Web2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DAn_Web2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DAn_Web2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DAn_Web2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DAn_Web2', N'ON'
GO
USE [DAn_Web2]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/25/2017 7:34:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 4/25/2017 7:34:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[UserName] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[DienThoai] [char](15) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Admin] [int] NOT NULL CONSTRAINT [DF_User_Admin]  DEFAULT ((0)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/25/2017 7:34:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/25/2017 7:34:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/25/2017 7:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/25/2017 7:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/25/2017 7:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDH]    Script Date: 4/25/2017 7:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietDH](
	[MaDH] [int] NULL,
	[MaSP] [varchar](100) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [varchar](50) NULL,
	[TongTien] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChungLoai]    Script Date: 4/25/2017 7:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChungLoai](
	[MaCL] [int] NOT NULL,
	[TenCL] [nvarchar](100) NULL,
 CONSTRAINT [PK_ChungLoai] PRIMARY KEY CLUSTERED 
(
	[MaCL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 4/25/2017 7:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[IDCmt] [int] IDENTITY(1,1) NOT NULL,
	[UserCmt] [varchar](50) NOT NULL,
	[NoiDung] [nvarchar](4000) NOT NULL,
	[MaSP] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[IDCmt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 4/25/2017 7:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[NgayDatHang] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[SDT] [char](15) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[TinhTrang] [int] NULL,
	[GhiChu] [nvarchar](1000) NULL,
	[Tongtien] [int] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 4/25/2017 7:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [nvarchar](100) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
	[MaCL] [int] NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/25/2017 7:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[MaSP] [varchar](100) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[Gia] [varchar](50) NOT NULL,
	[MoTa] [nvarchar](4000) NULL,
	[LoaiSP] [nvarchar](100) NOT NULL,
	[Hinh] [varchar](1000) NULL,
	[HeDieuHanh] [nvarchar](100) NULL,
	[LuotXem] [int] NULL,
	[NgayDangSP] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201703301442272_InitialCreate', N'SmartShop.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB72DB36107DEF4CFF81C3A7A433116DE725F548C938B2DD7A1ADB99D0C96B0626211953126409C895BFAD0FFDA4FE4201DE495C088AD42D2F1E895CEC2E760F16B723FFF7CFBFD30FEB30B09E6142508467F6E9E4C4B620F6221FE1E5CC5ED1C59B77F687F73FFF34BDF2C3B5F5AD907BCBE5584B4C66F613A5F1B9E310EF0986804C42E42511891674E245A103FCC8393B39F9D5393D75205361335D9635FDB2C2148530FDC2BECE23ECC198AE40701BF93020F973F6C64DB55A77208424061E9CD96E0812EA3E45F12493B5AD8B0001E6870B83856D018C230A28F3F2FC2B812E4D22BC7463F600040F2F3164720B1010987B7F5E899B76E4E48C77C4A91A6E1408BBEC22EBE4150B067DE1EEA51D9DD9373E4C1F7D8902589764B27FC097C603F6E87312C53061D27051B6B72DA7D9CE69372C9BD5DA7017582069C2B26F5BB760FD09E2257D62B8387B675BD7680DFDE2491EC5AF1831B0B0463459B1AF77AB20008F012CDF3B5A9BFCAFC62AFB38DCEAD4A9C2AB0DFA451C07C84B53CA9093D8D6474060EE1B83D6A4484AF6D2314A20979D070085BBCFE20DA66FCF24B1A90D10974609FC0D6298000AFDCF805298E0CAF9AEECA51DE3C64648A181A56F20586DC1D41D7846CB341E2DA3599EBFC0207D499E502C0142EAD9F74CF43A89423E6225E94F25BEBBD12AF1781722ADD8034896906E88E2064A7FE0D2C1FB3752F9D01BFA0C08F93B4AFCDF0179DABA31177AAB8465CFA5208C7788F5147D645CB41730EE407B31284C5DFD142D11EE763515D3BA5A49685DAD89F575952BEBF6944B691D2D05B47E5652323737AA1F69D7372922BCB15848A4A2A90DF6F819F9ED6955D1A210669EF42F558567BB2E57AD6EEEDA7C23665B373E6C4AED35727553AA64800F1E129BAEC87B8C086E629359785FD02EFCDD1FACD2A41895D94C525366D33F3A505552324C0D067F8FC9A0D3CBDEC8BF2024F250EA9E6A36F82E59575E61DF321BA4F2CD5436CD58B7AB8022BE05638F67F62F42603BCD94B3A36ACFD6B4706AB7C7E23DBE8401A4D0BAF0B2138139201EF04524B2F8F9CD276CF8C284DB02C19C25972600612A8E75843D1483C0A81FADD686AB75EE5D69A7FDE612C61073A346F932714059D79CD2562B745D919A3A35189AA3B31ADE26A8918C753968B282B11934C552213122337058C814BAB163600AB932B12F9F44F7854BE3A229A9EE5BC2E5F1574CA11BFBC0E5D1D6CBDA56DE0433B2532C3968B2E3CE0DA1293B3ED835369501CD164D2C0994A50026E2B1F1E5237F09D75408296FE842DA3C17A81661D239410858538910369DC65A627AA8EDD2D84B59716EA3D5982F057BA8ED8A65552C5B4A6B49D6389CAFC56BC2FA1D6B1B84C66BE3B28FF2A809F5C27835AC502CE86CC09E89F78C566D7BA50F9662A1D663A9A6E8518E04C348898BB39A5AA9AA3102648226C58AA1C79A61BC00ED0349F543667DA45473589F594CD1A9A2A21A064B326F8D10AD629F5E4E39D5BDB8935D8C1717E88EE2067D7A0BE218E165ED463D7F62B9D975FAFC8DDBFF023BCC74381E91DC6397DE9696689480256CBD65A699A7D72821F41250F008F889CFDC0F05B13E136C61B23ECF8A192CA68A429A7FCEEF5F5AE482E6942C2EF0720DD7AC7F215F25A637AA92CCCB9B5B9CDF00029048EED3E651B00AB17AD1AA6E9DDD8AD5DB674F440D53A7E5BFB028156225AC9C9A81374A4B73380C4A4FFBCE7EF30CC99B0FCE10C3AB8FD225787A7D2D6119D4D55C22E225284418302FB791B18EF8DE10FEF97EF14A390EB8CFAF0F2FCCD2D6DC963818AAA7E69A9A77C0756DCD37E61A5B17BD7595AD573B078136F787977A61843577283B1D5E2314C47CE1315AC224ECA3DE5953E8D8CEA8ADB18AEA4A6A8F7BEACA794382B2FCF941A220DFF68D8602C94D7E6F142874E8AA6F1B09AAD32FB596D6BD795D59077340ADB37119DE28E66A66C181E062C415ADFC36BB372AFAAD6CC7014571B85FD7A23AF0DF7EDA9ADBB78ECA9EEF6BFB14EFBC49EF02CDB7AA4265D66D59C5C81995F75485FC4CBBE6C1C6CE290FD7379E7BD47EB5F7E262BE852D795BA4445BB9356F6DC1A7F976B89BE92EEC8F3311DB2AEA1443CF0BA1309C708189FB57300F108B6125700B305A40421FA23F219ED96727A7672DBAFC06D47587103F3864FE3A7E0689F70412918432809E5E287D1582F5EBB128E7FB25EB8E16A76A4BD511AB4DF9B683144A39B58334B6F61183A2B91156F6F49302C46B4BE78F067A8247F815C1A0D488BF1418A4AE9CDB769FE31F9E7C3B5AF991726B47D32EA1CEEE12064743381D2DE04D3EE9C8B11E95E2B81FE28CE6E67728C5723027672FA4C5E322DE981315B3DBF47D7006D537C20309698300A638ADD83AC9EB47261C1E5209DB37BEF651C08CF17530F5AB2771F090009633E08611178F0E62AA1B2039C6142779A383AC758C566CDF044A88E2885C76D0D445A8CC8ECF66B6FF183110644BC70B12DF412AE77BA98C65E8551ACB8F6B95C6E42C209DB11C995A8BB98CDEAC9CD5D44DDB34636DEA6DCB998C9DDC4E236AA7DEB23CBBFBE47F2AD961FD889E7AD6E831103CEB191609537DA88A5AD6E3B1503987E362D7A1D822597378301A75537169B61536A678C5C366CADABF3C62F33541CB4A0527B160E835E6C852E6062FA262AE6E795488B44E506E21053E9B402F128A16C0A3ECB50709497F979B9364AEC247E8DFE0FB158D57947519868F41E3448F4FF93AFB29E5B4E9F3F43E4E7FD93A4617989B887501DEE38F2B14F8A5DFD792A31E850ABE96C8CFA9792E293FAF5EBE949AEE226CA8280F5FB9047A80611C3065E41EBBE019AA7DEB8E613362D34B0496090849AEA36ACFBE32F8F9E1FAFDFF0D840336B44B0000, N'6.0.0-20911')
INSERT [dbo].[Accounts] ([UserName], [HoTen], [Email], [DienThoai], [DiaChi], [Admin]) VALUES (N'abc', N'abc', N'abc@yahoo.com', NULL, N'abc 123', 0)
INSERT [dbo].[Accounts] ([UserName], [HoTen], [Email], [DienThoai], [DiaChi], [Admin]) VALUES (N'asd', N'asd', N'asd', NULL, N'sasfsd', 0)
INSERT [dbo].[Accounts] ([UserName], [HoTen], [Email], [DienThoai], [DiaChi], [Admin]) VALUES (N'hoangthienkiem', N'Hoàng Thiên Kiếm', N'abc@yahoo.com', N'01223334444    ', N'abc 123', 1)
INSERT [dbo].[Accounts] ([UserName], [HoTen], [Email], [DienThoai], [DiaChi], [Admin]) VALUES (N'nkay', N'Nkay', N'nkay@gmail.com', N'01223334444    ', N'123 hukhk', 0)
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'24430318-1c2c-40ed-9831-1d6a1845d9d3', N'Manager')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'e03efe9d-a371-4e34-a50a-dd77f18f24d2', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f8f763d2-1210-42c3-84bb-3fa5f6843638', N'Admin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6af27812-486c-40e9-adce-dc7f1ac0a228', N'f8f763d2-1210-42c3-84bb-3fa5f6843638')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e0b1cccb-7ba6-4aa3-903b-24deafcf3e99', N'f8f763d2-1210-42c3-84bb-3fa5f6843638')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'6af27812-486c-40e9-adce-dc7f1ac0a228', N'nkay', N'AMPLm1Dvjht/ch+RE/snXy04U9jgDFBzEYU5OCibIURAPWGIomGwBCNAvmR8xk6V8A==', N'5dad189c-8268-49f8-9e3c-37bf2f4a477a', N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'e0b1cccb-7ba6-4aa3-903b-24deafcf3e99', N'asd', N'AGRATYo5tQqH42xHWHwLervm6DkblcObc9N3ilJtPKF+hZf7G0qkPiMQixLsOtHvUg==', N'64fc2a0d-d244-401e-a4e4-c935d99de876', N'ApplicationUser')
INSERT [dbo].[ChungLoai] ([MaCL], [TenCL]) VALUES (1, N'Điện thoại')
INSERT [dbo].[ChungLoai] ([MaCL], [TenCL]) VALUES (2, N'Máy tính bảng')
INSERT [dbo].[ChungLoai] ([MaCL], [TenCL]) VALUES (3, N'Phụ kiện')
INSERT [dbo].[ChungLoai] ([MaCL], [TenCL]) VALUES (4, N'Máy tính xách tay')
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([IDCmt], [UserCmt], [NoiDung], [MaSP]) VALUES (3, N'hoangthienkiem', N'hello', N'sony01')
INSERT [dbo].[Comment] ([IDCmt], [UserCmt], [NoiDung], [MaSP]) VALUES (4, N'hoangthienkiem', N'hello boy', N'htc02')
INSERT [dbo].[Comment] ([IDCmt], [UserCmt], [NoiDung], [MaSP]) VALUES (7, N'asd', N'ok baby', N'htc02')
INSERT [dbo].[Comment] ([IDCmt], [UserCmt], [NoiDung], [MaSP]) VALUES (8, N'hoangthienkiem', N'sản phẩm good', N'htc02')
SET IDENTITY_INSERT [dbo].[Comment] OFF
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaCL]) VALUES (N'asus', N'Asus', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaCL]) VALUES (N'bphone', N'BPhone', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaCL]) VALUES (N'htc', N'HTC', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaCL]) VALUES (N'iphone', N'Iphone', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaCL]) VALUES (N'nokia', N'Nokia - Microsoft', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaCL]) VALUES (N'oppo', N'Oppo', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaCL]) VALUES (N'samsung', N'Samsung', 1)
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [MaCL]) VALUES (N'sony', N'Sony', 1)
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'asus01', N'Asus Zenfone 2 2.3Ghz', N'7490000', N'Màn hình:	IPS+ LCD, 16 triệu màu, 5.5", 1080 x 1920 pixels CPU:	Intel Atom Z3580, 4 nhân, 2.3 GHz RAM	4GB Hệ điều hành:	Android 5.0 (Lollipop) Camera chính:	13 MP, Quay phim FullHD 1080p@30fps Camera phụ:	5 MP Bộ nhớ trong:	64 GB Thẻ nhớ ngoài:	64 GB Dung lượng pin:	3000 mAh', N'asus', N'A01-I01-T.jpg', N'Android', 17, CAST(N'2015-06-16 23:23:47.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'asus02', N'Asus Zenfone 6', N'5490000', N'Màn hình:	HD, 6.0", 720 x 1280 pixels CPU:	Intel Atom Z2560, 2 nhân, 1.6 GHz RAM	2 GB Hệ điều hành:	Android 4.3 (Jelly Bean) Camera chính:	13 MP, Quay phim FullHD 1080p@30fps Camera phụ:	2.0 MP Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	64 GB Dung lượng pin:	3300 mAh', N'asus', N'A01-I01-T.png', N'Android', 3, CAST(N'2015-06-16 23:25:46.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'bphone01', N'Bphone - 16GB', N'10990000', N'Màn hình:	IPS-LCD, 5.0", 1080 x 1920 pixels CPU:	Snapdragon 801, 4 nhân, 2.5 GHz RAM	3GB Hệ điều hành:	BOS (Android 5.0) Camera chính:	13 MP, Quay phim FullHD 1080p@60fps Camera phụ:	5 MP Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	Không Dung lượng pin:	3000 mAh', N'bphone', N'A01-I02-T.jpg', N'Android', 6, CAST(N'2015-06-15 22:51:25.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'bphone02', N'Bphone - 64GB', N'13990000', N'Màn hình:	IPS-LCD, 5.0", 1080 x 1920 pixels CPU:	Snapdragon 801, 4 nhân, 2.5 GHz RAM	3GB Hệ điều hành:	BOS (Android 5.0) Camera chính:	13 MP, Quay phim FullHD 1080p@60fps Camera phụ:	5 MP Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	Không Dung lượng pin:	3000 mAh', N'bphone', N'A01-I03-T.jpg', N'Android', 4, CAST(N'2015-06-15 22:54:29.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'bphone03', N'Bphone-128GB Mạ vàng', N'22290000', N'Màn hình:	IPS-LCD, 5.0", 1080 x 1920 pixels CPU:	Snapdragon 801, 4 nhân, 2.5 GHz RAM	3GB Hệ điều hành:	BOS (Android 5.0) Camera chính:	13 MP, Quay phim FullHD 1080p@60fps Camera phụ:	5 MP Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	Không Dung lượng pin:	3000 mAh', N'bphone', N'A02-I01.jpg', N'Android', 15, CAST(N'2015-06-16 22:59:07.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'htc01', N'HTC One M9', N'16990000', N'Màn hình:	Full HD, 5.0", 1080 x 1920 pixels CPU:	Snapdragon 810, 8 nhân, 4 nhân 1.5 GHz Cortex-A53 & 4 nhân 2 GHz Cortex-A57 RAM	3GB Hệ điều hành:	Android 5.0 (Lollipop) Camera chính:	20.7 MP, Quay phim 4K 2160p@30fps Camera phụ:	4 Ultra pixel Bộ nhớ trong:	32 GB Thẻ nhớ ngoài:	2 TB Dung lượng pin:	2840 mAh', N'htc', N'A02-I01-T.png', N'Android', 10, CAST(N'2015-06-16 23:27:03.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'htc02', N'HTC Desire Eye', N'9990000', N'<p>M&agrave;n h&igrave;nh: Full HD, 5.2&quot;, 1080 x 1920 pixels CPU: Qualcomm Snapdragon 801, 4 nh&acirc;n, 2.26 GHz RAM 2 GB Hệ điều h&agrave;nh: Android 4.4 (KitKat) Camera ch&iacute;nh: 13 MP, Quay phim FullHD 1080p@30fps Camera phụ: 13 MP Bộ nhớ trong: 16 GB Thẻ nhớ ngo&agrave;i: 128 GB Dung lượng pin: 2400 mAh</p>
', N'htc', N'H02-I01.png', N'Android', 17, CAST(N'2017-04-25 19:28:28.337' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'iphone01', N'Iphone 6 Plus 16GB', N'19590000', N'Iphone 6 Plus 16GB', N'iphone', N'A02-I02.jpg', N'IOS', 1, CAST(N'2015-06-15 21:45:58.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'iphone02', N'iPhone 6 Plus 64GB', N'22190000', N'Màn hình:	Retina HD, 5.5", 1080 x 1920 pixels
CPU:	Apple A8, 2 nhân, 1.4 GHz
RAM	1 GB
Hệ điều hành:	iOS 8.0
Camera chính:	8.0 MP, Quay phim FullHD 1080p@60fps
Camera phụ:	1.2 MP
Bộ nhớ trong:	64 GB
Thẻ nhớ ngoài:	Không
Dung lượng pin:	2915 mAh', N'iphone', N'A02-I02-T.png', N'IOS', 10, CAST(N'2015-06-15 22:50:06.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'iphone03', N'iPhone 5S 16GB', N'12990000', N'Màn hình:	DVGA, 4.0", 640 x 1136 pixels
CPU:	Apple A7, 2 nhân, 1.3 GHz
RAM	1 GB
Hệ điều hành:	iOS 8.0
Camera chính:	8.0 MP, Quay phim FullHD 1080p@30fps
Camera phụ:	1.2 MP
Bộ nhớ trong:	16 GB
Thẻ nhớ ngoài:	Không
Dung lượng pin:	1560 mAh', N'iphone', N'A03-I03.jpg', N'IOS', 10, CAST(N'2015-06-15 22:50:06.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'nokia01', N'Nokia Lumia 930', N'10990000', N'Màn hình:	Full HD, 5.0", 1080 x 1920 pixels
CPU:	Qualcomm Snapdragon 800, 4 nhân, 2.2 GHz
RAM	2 GB
Hệ điều hành:	Windows Phone 8.1
Camera chính:	20 MP, Quay phim FullHD 1080p@30fps
Camera phụ:	1.2 MP
Bộ nhớ trong:	32 GB
Thẻ nhớ ngoài:	Không
Dung lượng pin:	2420 mAh', N'nokia', N'B01-I01.jpg', N'WindowsPhone', 1, CAST(N'2015-06-15 22:50:06.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'nokia02', N'Nokia Lumia 830', N'7990000', N'Màn hình:	HD, 5.0", 720 x 1280 pixels
CPU:	Qualcomm Snapdragon 400, 4 nhân, Quad-core 1.2 GHz
RAM	1 GB
Hệ điều hành:	Windows Phone 8.1
Camera chính:	10 MP, Quay phim FullHD 1080p@30fps
Camera phụ:	1.0 MP
Bộ nhớ trong:	16 GB
Thẻ nhớ ngoài:	128 GB
Dung lượng pin:	2200 mAh', N'nokia', N'B01-I02.jpg', N'WindowsPhone', 1, CAST(N'2015-06-15 22:50:06.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'oppo01', N'OPPO R5', N'10000000', N'Màn hình:	Full HD, 5.2", 1080 x 1920 pixels CPU:	Snapdragon 615, 8 nhân, 1.5 GHz RAM	2 GB Hệ điều hành:	Android 4.4 (KitKat) Camera chính:	13 MP, Quay phim FullHD 1080p@60fps Camera phụ:	5 MP Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	Không Dung lượng pin:	2000 mAh', N'oppo', N'B02-I01.jpg', N'Android', 20, CAST(N'2015-06-16 23:01:50.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'oppo02', N'OPPO Find 7a', N'8990000', N'Màn hình:	Full HD, 5.5", 1080 x 1920 pixels CPU:	Qualcomm Snapdragon 801, 4 nhân, 2.3 GHz RAM	2 GB Hệ điều hành:	Android 4.3 (Jelly Bean) Camera chính:	13 MP, Quay phim 4K 2160p@30fps Camera phụ:	5 MP Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	128 GB Dung lượng pin:	2800 mAh', N'oppo', N'B02-I02.png', N'Android', 15, CAST(N'2015-06-16 23:03:27.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'oppo03', N'OPPO N1 Mini', N'8490000', N'Màn hình:	HD, 5.0", 720 x 1280 pixels CPU:	Qualcomm Snapdragon 400, 4 nhân, 1.6 GHz RAM	2 GB Hệ điều hành:	Android 4.3 (Jelly Bean) Camera chính:	13 MP, Quay phim FullHD 1080p@30fps Camera phụ:	13 MP Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	Không Dung lượng pin:	2140mAh', N'oppo', N'B03-I01.png', N'Android', 25, CAST(N'2015-06-16 23:04:28.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'oppo04', N'OPPO R1', N'6990000', N'Màn hình:	HD, 5.0", 720 x 1280 pixels CPU:	Qualcomm Snapdragon 400, 4 nhân, 1.6 GHz RAM	1 GB Hệ điều hành:	Android 4.3 (Jelly Bean) Camera chính:	13 MP, Quay phim HD 720p@30fps Camera phụ:	5 MP Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	Không Dung lượng pin:	2410 mAh', N'oppo', N'IP01-I02.png', N'Android', 22, CAST(N'2015-06-16 23:05:45.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'samsung01', N'Samsung Galaxy S6 32GB', N'16590000', N'Màn hình:	Quad HD, 5.1", 1440 x 2560 pixels CPU:	Exynos 7420, 8 nhân, 4x1.5GHz Cortex-A53 & 4x2.1 GHz Cortex-A57 RAM	3GB Hệ điều hành:	Android 5.0 (Lollipop) Camera chính:	16 MP, Quay phim 4K 2160p@30fps Camera phụ:	5 MP Bộ nhớ trong:	32 GB Thẻ nhớ ngoài:	Không Dung lượng pin:	2550mAh', N'samsung', N'IP02-I01.jpg', N'Android', 3, CAST(N'2015-06-15 22:40:16.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'samsung02', N'Samsung Galaxy S6 Edge 64GB', N'20990000', N'Màn hình:	Quad HD, 5.1", 1440 x 2560 pixels CPU:	Exynos 7420, 8 nhân, 4x1.5GHz Cortex-A53 & 4x2.1 GHz Cortex-A57 RAM	3GB Hệ điều hành:	Android 5.0 (Lollipop) Camera chính:	16 MP, Quay phim 4K 2160p@30fps Camera phụ:	5 MP Bộ nhớ trong:	64 GB Thẻ nhớ ngoài:	Không Dung lượng pin:	2600 mAh', N'samsung', N'IP03-I01.jpg', N'Android', 5, CAST(N'2015-06-15 22:40:53.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'samsung03', N'Samsung Galaxy S6 Edge 32GB', N'19990000', N'Màn hình:	Quad HD, 5.1", 1440 x 2560 pixels CPU:	Exynos 7420, 8 nhân, 4x1.5GHz Cortex-A53 & 4x2.1 GHz Cortex-A57 RAM	3GB Hệ điều hành:	Android 5.0 (Lollipop) Camera chính:	16 MP, Quay phim 4K 2160p@30fps Camera phụ:	5 MP Bộ nhớ trong:	32 GB Thẻ nhớ ngoài:	Không Dung lượng pin:	2600 mAh', N'samsung', N'IP03-I02.jpg', N'Android', 10, CAST(N'2015-06-15 22:41:46.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'sony01', N'Xperia Z3', N'19590000', N'Xperia Z3', N'sony', N'S01-I01.jpg', N'Android', 1, CAST(N'2015-06-15 21:46:37.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'sony02', N'Sony Xperia Z3 Plus', N'19590000', N'Màn hình:	Full HD, 5.2", 1080 x 1920 pixels CPU:	Snapdragon 810, 8 nhân, Quad-core 1.5 GHz Cortex-A53 & Quad-core 2 GHz Cortex-A57 RAM	3GB Hệ điều hành:	Android 5.0 (Lollipop) Camera chính:	20.7 MP, Quay phim 4K 2160p@30fps Camera phụ:	5 MP Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	128 GB Dung lượng pin:	2930mAh', N'sony', N'S01-I02.jpg', N'Android', 1, CAST(N'2015-06-15 22:34:31.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'sony03', N'Sony Xperia Z2', N'10990000', N'Màn hình:	Full HD, 5.2", 1080 x 1920 pixels CPU:	Qualcomm MSM8974AB, 4 nhân, 2.3 GHz RAM	3GB Hệ điều hành:	Android 4.4 (KitKat) Camera chính:	20.7 MP, Quay phim 4K 2160p@30fps Camera phụ:	2.2 MP Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	64 GB Dung lượng pin:	3200 mAh', N'sony', N'S02-I01.jpg', N'Android', 1, CAST(N'2015-06-15 22:37:30.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'sony04', N'Sony Xperia Z1', N'8990000', N'Màn hình:	Full HD, 5.0", 1080 x 1920 pixels CPU:	Qualcomm MSM8974, 4 nhân, 2.2 GHz RAM	2 GB Hệ điều hành:	Android 4.2.2 (Jelly Bean) Camera chính:	20.7 MP, Quay phim FullHD 1080p@30fps Camera phụ:	2.0 MP Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	64 GB Dung lượng pin:	3000 mAh', N'sony', N'S02-I02.jpg', N'Android', 2, CAST(N'2015-06-15 22:38:26.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'sony05', N'Sony Xperia M2', N'5990000', N'Màn hình:	qHD, 4.8", 540 x 960 pixels CPU:	Qualcomm Snapdragon 400, 4 nhân, 1.2 GHz RAM	1 GB Hệ điều hành:	Android 4.4 (KitKat) Camera chính:	8.0 MP, Quay phim FullHD 1080p@30fps Camera phụ:	1.1 MP Bộ nhớ trong:	8 GB Thẻ nhớ ngoài:	32 GB Dung lượng pin:	2300 mAh', N'sony', N'S03-I01.jpg', N'Android', 10, CAST(N'2015-06-15 22:46:38.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'sony06', N'Sony Xperia M4 Aqua Dual', N'6490000', N'Màn hình:	HD, 5.0", 720 x 1280 pixels CPU:	Snapdragon 615, 8 nhân, Quad-core 1.5GHz + Quad-core 1.0GHz RAM	2 GB Hệ điều hành:	Android 5.0 (Lollipop) Camera chính:	13 MP, Quay phim FullHD 1080p@30fps Camera phụ:	5 MP Bộ nhớ trong:	8 GB Thẻ nhớ ngoài:	128 GB Dung lượng pin:	2400 mAh', N'sony', N'S03-I02.png', N'Android', 2, CAST(N'2015-06-15 22:50:06.000' AS DateTime))
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'sony07', N'Sony Xperia Z3 Compact', N'11990000', N'Màn hình:	HD, 4.6", 720 x 1280 pixels
CPU:	Qualcomm Snapdragon 801, 4 nhân, 2.5 GHz
RAM	2 GB
Hệ điều hành:	Android 4.4 (KitKat)
Camera chính:	20.7 MP, Quay phim 4K 2160p@30fps
Camera phụ:	2.2 MP
Bộ nhớ trong:	16 GB
Thẻ nhớ ngoài:	64 GB
Dung lượng pin:	2600 mAh', N'sony', N'S04-I01.jpg', N'Android', 9, NULL)
INSERT [dbo].[Product] ([MaSP], [TenSP], [Gia], [MoTa], [LoaiSP], [Hinh], [HeDieuHanh], [LuotXem], [NgayDangSP]) VALUES (N'sony08', N'Sony Xperia C4 Dual', N'7190000', N'Màn hình:	Full HD, 5.5", 1080 x 1920 pixels CPU:	MTK 6752, 8 nhân, 1.7 GHz RAM	2 GB Hệ điều hành:	Android 5.0 (Lollipop) SIM:	2 SIM 2 sóng Camera:	13 MP, Quay phim FullHD 1080p@30fps Bộ nhớ trong:	16 GB Thẻ nhớ ngoài:	128 GB Dung lượng pin:	2600 mAh', N'sony', N'S04-I02.jpg', N'Android', 7, CAST(N'2015-06-16 22:59:19.000' AS DateTime))
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User_Id]    Script Date: 4/25/2017 7:34:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[AspNetUserClaims]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 4/25/2017 7:34:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 4/25/2017 7:34:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 4/25/2017 7:34:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ChiTietDH]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDH_DonDatHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonDatHang] ([MaDH])
GO
ALTER TABLE [dbo].[ChiTietDH] CHECK CONSTRAINT [FK_ChiTietDH_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDH]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDH_Product] FOREIGN KEY([MaSP])
REFERENCES [dbo].[Product] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDH] CHECK CONSTRAINT [FK_ChiTietDH_Product]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([MaSP])
REFERENCES [dbo].[Product] ([MaSP])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserCmt])
REFERENCES [dbo].[Accounts] ([UserName])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Loai]  WITH CHECK ADD  CONSTRAINT [FK_Loai_ChungLoai] FOREIGN KEY([MaCL])
REFERENCES [dbo].[ChungLoai] ([MaCL])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Loai] CHECK CONSTRAINT [FK_Loai_ChungLoai]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product] FOREIGN KEY([LoaiSP])
REFERENCES [dbo].[Loai] ([MaLoai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product]
GO
USE [master]
GO
ALTER DATABASE [DAn_Web2] SET  READ_WRITE 
GO
