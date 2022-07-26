USE [master]
GO
/****** Object:  Database [VeriTabaniMagazaProje]    Script Date: 21.07.2022 17:45:36 ******/
CREATE DATABASE [VeriTabaniMagazaProje]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VeriTabaniMagazaProje', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQL12\MSSQL\DATA\VeriTabaniMagazaProje.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VeriTabaniMagazaProje_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQL12\MSSQL\DATA\VeriTabaniMagazaProje_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VeriTabaniMagazaProje].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET ARITHABORT OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET  MULTI_USER 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [VeriTabaniMagazaProje]
GO
/****** Object:  Table [dbo].[Bedenler]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bedenler](
	[beden_id] [int] IDENTITY(1,1) NOT NULL,
	[beden_ad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bedenler] PRIMARY KEY CLUSTERED 
(
	[beden_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fatura]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fatura](
	[fatura_id] [int] NOT NULL,
	[musteri_id] [varchar](50) NOT NULL,
	[odeme_tipi] [int] NULL,
	[personel_id] [int] NULL,
	[tarih] [date] NULL,
 CONSTRAINT [PK_Fatura] PRIMARY KEY CLUSTERED 
(
	[fatura_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaturaUrunler]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaturaUrunler](
	[fatura_urun_id] [int] IDENTITY(1,1) NOT NULL,
	[urun_beden_renk_id] [varchar](50) NOT NULL,
	[fatura_id] [int] NOT NULL,
 CONSTRAINT [PK_FaturaUrunler] PRIMARY KEY CLUSTERED 
(
	[fatura_urun_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[musteri_id] [varchar](50) NOT NULL,
	[musteri_ad] [varchar](50) NOT NULL,
	[musteri_soyad] [varchar](50) NOT NULL,
	[musteri_telefon] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[musteri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OdemeTipi]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OdemeTipi](
	[tip_id] [int] IDENTITY(1,1) NOT NULL,
	[tip_ad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OdemeTipi] PRIMARY KEY CLUSTERED 
(
	[tip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelGiris]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelGiris](
	[giris_id] [int] IDENTITY(1,1) NOT NULL,
	[personel_id] [int] NOT NULL,
	[personel_kullanici] [varchar](50) NOT NULL,
	[personel_sifre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PersonelGiris] PRIMARY KEY CLUSTERED 
(
	[giris_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelGrup]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelGrup](
	[grup_id] [int] NOT NULL,
	[grup_ad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PersonelGrup] PRIMARY KEY CLUSTERED 
(
	[grup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personeller]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personeller](
	[personel_id] [int] IDENTITY(1,1) NOT NULL,
	[personel_ad] [varchar](50) NOT NULL,
	[personel_soyad] [varchar](50) NOT NULL,
	[personel_telefon] [varchar](50) NOT NULL,
	[personel_grup_id] [int] NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[personel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Renkler]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renkler](
	[renk_id] [int] IDENTITY(1,1) NOT NULL,
	[renk_ad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Renkler] PRIMARY KEY CLUSTERED 
(
	[renk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunBedenRenk]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunBedenRenk](
	[urun_beden_renk_id] [varchar](50) NOT NULL,
	[urun_id] [int] NOT NULL,
	[beden_id] [int] NOT NULL,
	[renk_id] [int] NOT NULL,
	[urun_fiyat] [float] NOT NULL,
	[urun_stok] [int] NOT NULL,
 CONSTRAINT [PK_UrunBedenRenk] PRIMARY KEY CLUSTERED 
(
	[urun_beden_renk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[urun_id] [int] IDENTITY(1,1) NOT NULL,
	[urun_ad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[urun_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bedenler] ON 

INSERT [dbo].[Bedenler] ([beden_id], [beden_ad]) VALUES (1, N'S')
INSERT [dbo].[Bedenler] ([beden_id], [beden_ad]) VALUES (2, N'M')
INSERT [dbo].[Bedenler] ([beden_id], [beden_ad]) VALUES (3, N'L')
INSERT [dbo].[Bedenler] ([beden_id], [beden_ad]) VALUES (4, N'XL')
INSERT [dbo].[Bedenler] ([beden_id], [beden_ad]) VALUES (5, N'XXL')
SET IDENTITY_INSERT [dbo].[Bedenler] OFF
GO
INSERT [dbo].[Fatura] ([fatura_id], [musteri_id], [odeme_tipi], [personel_id], [tarih]) VALUES (2, N'12345678910', 2, 1, CAST(N'2022-06-08' AS Date))
INSERT [dbo].[Fatura] ([fatura_id], [musteri_id], [odeme_tipi], [personel_id], [tarih]) VALUES (4, N'01234567899', 2, 1, CAST(N'2022-06-14' AS Date))
GO
SET IDENTITY_INSERT [dbo].[FaturaUrunler] ON 

INSERT [dbo].[FaturaUrunler] ([fatura_urun_id], [urun_beden_renk_id], [fatura_id]) VALUES (7, N'0000000002', 2)
INSERT [dbo].[FaturaUrunler] ([fatura_urun_id], [urun_beden_renk_id], [fatura_id]) VALUES (13, N'0000000001', 4)
INSERT [dbo].[FaturaUrunler] ([fatura_urun_id], [urun_beden_renk_id], [fatura_id]) VALUES (14, N'0000000007', 4)
INSERT [dbo].[FaturaUrunler] ([fatura_urun_id], [urun_beden_renk_id], [fatura_id]) VALUES (15, N'0000000010', 4)
INSERT [dbo].[FaturaUrunler] ([fatura_urun_id], [urun_beden_renk_id], [fatura_id]) VALUES (16, N'0000000014', 4)
INSERT [dbo].[FaturaUrunler] ([fatura_urun_id], [urun_beden_renk_id], [fatura_id]) VALUES (17, N'0000000014', 4)
SET IDENTITY_INSERT [dbo].[FaturaUrunler] OFF
GO
INSERT [dbo].[Musteriler] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_telefon]) VALUES (N'01234567899', N'Ademcan', N'İyik', N'05418539418')
INSERT [dbo].[Musteriler] ([musteri_id], [musteri_ad], [musteri_soyad], [musteri_telefon]) VALUES (N'12345678910', N'Cristiano', N'Ronaldo', N'05417434516')
GO
SET IDENTITY_INSERT [dbo].[OdemeTipi] ON 

INSERT [dbo].[OdemeTipi] ([tip_id], [tip_ad]) VALUES (1, N'Nakit')
INSERT [dbo].[OdemeTipi] ([tip_id], [tip_ad]) VALUES (2, N'Kredi Kartı')
INSERT [dbo].[OdemeTipi] ([tip_id], [tip_ad]) VALUES (3, N'Ticket')
SET IDENTITY_INSERT [dbo].[OdemeTipi] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonelGiris] ON 

INSERT [dbo].[PersonelGiris] ([giris_id], [personel_id], [personel_kullanici], [personel_sifre]) VALUES (1, 1, N'ozrhmz', N'asdasd123a')
SET IDENTITY_INSERT [dbo].[PersonelGiris] OFF
GO
INSERT [dbo].[PersonelGrup] ([grup_id], [grup_ad]) VALUES (1, N'Yönetici')
GO
SET IDENTITY_INSERT [dbo].[Personeller] ON 

INSERT [dbo].[Personeller] ([personel_id], [personel_ad], [personel_soyad], [personel_telefon], [personel_grup_id]) VALUES (1, N'Hamza', N'Özer', N'05415415411', 1)
INSERT [dbo].[Personeller] ([personel_id], [personel_ad], [personel_soyad], [personel_telefon], [personel_grup_id]) VALUES (2, N'Ademcan', N'İyik', N'05415415412', 1)
SET IDENTITY_INSERT [dbo].[Personeller] OFF
GO
SET IDENTITY_INSERT [dbo].[Renkler] ON 

INSERT [dbo].[Renkler] ([renk_id], [renk_ad]) VALUES (1, N'Beyaz')
INSERT [dbo].[Renkler] ([renk_id], [renk_ad]) VALUES (2, N'Siyah')
INSERT [dbo].[Renkler] ([renk_id], [renk_ad]) VALUES (3, N'Mavi')
SET IDENTITY_INSERT [dbo].[Renkler] OFF
GO
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000001', 1, 1, 1, 99.9, 103)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000002', 1, 2, 1, 99.9, 25)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000003', 1, 3, 1, 99.9, 30)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000004', 1, 4, 1, 99.9, 29)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000005', 1, 5, 1, 99.9, 30)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000006', 2, 1, 1, 89.9, 25)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000007', 2, 2, 1, 89.9, 24)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000008', 2, 3, 1, 89.9, 25)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000009', 2, 4, 1, 89.9, 25)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000010', 2, 5, 1, 89.9, 24)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000011', 3, 1, 1, 79.9, 28)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000012', 3, 2, 1, 79.9, 30)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000013', 3, 3, 1, 79.9, 30)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000014', 3, 4, 1, 79.9, 27)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000015', 3, 5, 1, 79.9, 30)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000100', 17, 1, 2, 199.9, 30)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'0000000101', 17, 2, 2, 199.9, 30)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'1111111111', 18, 1, 1, 99.9, 50)
INSERT [dbo].[UrunBedenRenk] ([urun_beden_renk_id], [urun_id], [beden_id], [renk_id], [urun_fiyat], [urun_stok]) VALUES (N'2222222222', 19, 1, 1, 999.9, 10)
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([urun_id], [urun_ad]) VALUES (1, N'Ön ve Arka Baskılı F1 T-Shirt')
INSERT [dbo].[Urunler] ([urun_id], [urun_ad]) VALUES (2, N'Ön Baskılı F1 T-Shirt')
INSERT [dbo].[Urunler] ([urun_id], [urun_ad]) VALUES (3, N'Oversize Beyaz T-Shirt')
INSERT [dbo].[Urunler] ([urun_id], [urun_ad]) VALUES (16, N'Düz Beyaz Şort')
INSERT [dbo].[Urunler] ([urun_id], [urun_ad]) VALUES (17, N'Düz Siyah Şort')
INSERT [dbo].[Urunler] ([urun_id], [urun_ad]) VALUES (18, N'Yok')
INSERT [dbo].[Urunler] ([urun_id], [urun_ad]) VALUES (19, N'Ön Baskılı Şort')
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_Musteriler] FOREIGN KEY([musteri_id])
REFERENCES [dbo].[Musteriler] ([musteri_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [FK_Fatura_Musteriler]
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_OdemeTipi] FOREIGN KEY([odeme_tipi])
REFERENCES [dbo].[OdemeTipi] ([tip_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [FK_Fatura_OdemeTipi]
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_Personeller] FOREIGN KEY([personel_id])
REFERENCES [dbo].[Personeller] ([personel_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [FK_Fatura_Personeller]
GO
ALTER TABLE [dbo].[FaturaUrunler]  WITH CHECK ADD  CONSTRAINT [FK_FaturaUrunler_Fatura] FOREIGN KEY([fatura_id])
REFERENCES [dbo].[Fatura] ([fatura_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FaturaUrunler] CHECK CONSTRAINT [FK_FaturaUrunler_Fatura]
GO
ALTER TABLE [dbo].[FaturaUrunler]  WITH CHECK ADD  CONSTRAINT [FK_FaturaUrunler_UrunBedenRenk] FOREIGN KEY([urun_beden_renk_id])
REFERENCES [dbo].[UrunBedenRenk] ([urun_beden_renk_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FaturaUrunler] CHECK CONSTRAINT [FK_FaturaUrunler_UrunBedenRenk]
GO
ALTER TABLE [dbo].[PersonelGiris]  WITH CHECK ADD  CONSTRAINT [FK_PersonelGiris_Personeller] FOREIGN KEY([personel_id])
REFERENCES [dbo].[Personeller] ([personel_id])
GO
ALTER TABLE [dbo].[PersonelGiris] CHECK CONSTRAINT [FK_PersonelGiris_Personeller]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_PersonelGrup] FOREIGN KEY([personel_grup_id])
REFERENCES [dbo].[PersonelGrup] ([grup_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_PersonelGrup]
GO
ALTER TABLE [dbo].[UrunBedenRenk]  WITH CHECK ADD  CONSTRAINT [FK_UrunBedenRenk_Bedenler] FOREIGN KEY([beden_id])
REFERENCES [dbo].[Bedenler] ([beden_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UrunBedenRenk] CHECK CONSTRAINT [FK_UrunBedenRenk_Bedenler]
GO
ALTER TABLE [dbo].[UrunBedenRenk]  WITH CHECK ADD  CONSTRAINT [FK_UrunBedenRenk_Renkler] FOREIGN KEY([renk_id])
REFERENCES [dbo].[Renkler] ([renk_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UrunBedenRenk] CHECK CONSTRAINT [FK_UrunBedenRenk_Renkler]
GO
ALTER TABLE [dbo].[UrunBedenRenk]  WITH CHECK ADD  CONSTRAINT [FK_UrunBedenRenk_Urunler] FOREIGN KEY([urun_id])
REFERENCES [dbo].[Urunler] ([urun_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UrunBedenRenk] CHECK CONSTRAINT [FK_UrunBedenRenk_Urunler]
GO
/****** Object:  StoredProcedure [dbo].[beginTranUrunStokGuncelle]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[beginTranUrunStokGuncelle]
@urun_beden_renk_id int,
@urun_stok int
as
begin
begin transaction
begin try
update UrunBedenRenk set urun_stok=urun_stok+@urun_stok where urun_beden_renk_id=@urun_beden_renk_id
commit
end try
begin catch
rollback
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[CiroTakip]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[CiroTakip]
@baslangic_tarih date,
@bitis_tarih date
as
Begin
select @baslangic_tarih As 'Başlangıç Tarihi' ,@bitis_tarih as 'Bitiş Tarihi' ,sum(ubr.urun_fiyat) As 'Toplam Ciro' from UrunBedenRenk ubr
inner join FaturaUrunler fu on
fu.urun_beden_renk_id=ubr.urun_beden_renk_id
inner join Fatura f on
f.fatura_id=fu.fatura_id
where f.tarih>=@baslangic_tarih and f.tarih<=@bitis_tarih
End
GO
/****** Object:  StoredProcedure [dbo].[FaturadaUrunleriListele]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[FaturadaUrunleriListele]
@fatura_id int
As
Begin
Begin Tran
Begin try
select ubr.urun_beden_renk_id as 'Barkod',u.urun_ad as'Ürün Adı',b.beden_ad as 'Beden',r.renk_ad as 'Renk',ubr.urun_fiyat as 'Fiyat'  from FaturaUrunler f
inner join UrunBedenRenk ubr on
ubr.urun_beden_renk_id=f.urun_beden_renk_id
inner join Urunler u on 
u.urun_id=ubr.urun_id
inner join Bedenler b on
b.beden_id=ubr.beden_id
inner join Renkler r on
r.renk_id=ubr.renk_id
where fatura_id=@fatura_id
commit
End try
Begin Catch
Rollback
End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[FaturaGoster]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[FaturaGoster]
@fatura_id int
As
Begin
Begin Tran
Begin try
select musteri_ad,musteri_soyad, tip_ad ,personel_ad,tarih,SUM(urun_fiyat) as 'Toplam Tutar' from Fatura f
inner join Musteriler m on
m.musteri_id = f.musteri_id
inner join OdemeTipi ot on
ot.tip_id=f.odeme_tipi
inner join Personeller p on
p.personel_id=f.personel_id
inner join FaturaUrunler fu on
fu.fatura_id=f.fatura_id
inner join UrunBedenRenk ubr on
ubr.urun_beden_renk_id=fu.urun_beden_renk_id
where f.fatura_id=@fatura_id
Group by m.musteri_ad,m.musteri_soyad,tip_ad,personel_ad,tarih
commit
End try
Begin Catch
Rollback
End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[FaturaOlustur]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[FaturaOlustur]
@musteri_id Varchar(50),
@musteri_ad Varchar(50),
@musteri_soyad Varchar(50),
@musteri_telefon Varchar(50),
@fatura_id int,
@odeme_tipi int,
@personel_id int,
@tarih date
As
Begin
Begin Tran
Begin try
insert into Musteriler Values (@musteri_id,@musteri_ad,@musteri_soyad,@musteri_telefon)
insert into Fatura Values (@fatura_id,@musteri_id,@odeme_tipi,@personel_id,@tarih)
commit
End try
Begin Catch
Rollback
End Catch
End

GO
/****** Object:  StoredProcedure [dbo].[FaturaToplamTutar]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[FaturaToplamTutar]
@fatura_id int
as
begin
select f.fatura_id,m.musteri_ad,m.musteri_soyad, sum(ubr.urun_fiyat) As Toplam_Tutar from Fatura f
inner join FaturaUrunler fu on
fu.fatura_id=f.fatura_id
inner join UrunBedenRenk ubr on
ubr.urun_beden_renk_id=fu.urun_beden_renk_id
inner join Musteriler m on
m.musteri_id=f.musteri_id
where f.fatura_id=@fatura_id
Group By f.fatura_id,m.musteri_ad,m.musteri_soyad
end
GO
/****** Object:  StoredProcedure [dbo].[FaturaUrunlerEkle]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[FaturaUrunlerEkle]
@urun_beden_renk_id Varchar(50),
@fatura_id int
As
Begin
Begin Tran
Begin try
insert into FaturaUrunler values (@urun_beden_renk_id,@fatura_id)
update UrunBedenRenk set urun_stok=urun_stok-1 where urun_beden_renk_id=@urun_beden_renk_id
commit
End try
Begin Catch
Rollback
End Catch
End
GO
/****** Object:  StoredProcedure [dbo].[PersonelEkle]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[PersonelEkle]
@personel_ad Varchar(50),
@personel_soyad Varchar(50),
@personel_telefon Varchar (50),
@personel_personel_grup_id int
as
begin
insert into Personeller Values (@personel_ad,@personel_soyad,@personel_telefon,@personel_personel_grup_id)
end
GO
/****** Object:  StoredProcedure [dbo].[PersonelGirisKontrol]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PersonelGirisKontrol]
@personel_kullanici Varchar(50),
@personel_sifre Varchar(50)
as
begin
select p.giris_id from PersonelGiris p where p.personel_kullanici=@personel_kullanici and p.personel_sifre=@personel_sifre
end
GO
/****** Object:  StoredProcedure [dbo].[UrunDetayEkle]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UrunDetayEkle]
@urun_beden_renk_id varchar(50),
@urun_id int,
@beden_id int,
@renk_id int,
@urun_fiyat float,
@urun_stok int
as
Begin
insert into UrunBedenRenk Values (@urun_beden_renk_id,@urun_id,@beden_id,@renk_id,@urun_fiyat,@urun_stok)
End
GO
/****** Object:  StoredProcedure [dbo].[UrunEkle]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UrunEkle]
@urun_ad Varchar(50)
as
Begin
insert into Urunler Values (@urun_ad)
End
GO
/****** Object:  StoredProcedure [dbo].[UrunStokSorgu]    Script Date: 21.07.2022 17:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UrunStokSorgu]
@urun_beden_renk_id varchar(50) 
as
Begin
select u.urun_ad as 'Ürün Ad',b.beden_ad as 'Beden',r.renk_ad as 'Renk',ubr.urun_stok as 'Stok' from UrunBedenRenk ubr
inner join Urunler u on u.urun_id=ubr.urun_id
inner join Bedenler b on b.beden_id=ubr.beden_id
inner join Renkler r on r.renk_id=ubr.renk_id
where ubr.urun_id=@urun_beden_renk_id
End
GO
USE [master]
GO
ALTER DATABASE [VeriTabaniMagazaProje] SET  READ_WRITE 
GO
