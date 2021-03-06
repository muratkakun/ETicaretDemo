USE [ETicaretDemo]
GO
/****** Object:  Table [dbo].[Kampanya]    Script Date: 19.05.2017 16:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kampanya](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[KBaslik] [nvarchar](50) NULL,
	[KAciklama] [nvarchar](200) NULL,
	[KResimYolu] [ntext] NULL,
	[RefUrun] [int] NULL,
 CONSTRAINT [PK_Manset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 19.05.2017 16:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](50) NOT NULL,
	[UstKategori] [int] NOT NULL CONSTRAINT [DF_Kategori_UstKategori]  DEFAULT ((0)),
	[isActive] [bit] NOT NULL CONSTRAINT [DF_Kategori_isActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 19.05.2017 16:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](11) NOT NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MusteriAdres]    Script Date: 19.05.2017 16:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusteriAdres](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Adres] [nvarchar](100) NOT NULL,
	[AdresTanim] [nvarchar](50) NOT NULL,
	[RefMusteri] [int] NOT NULL,
 CONSTRAINT [PK_MusteriAdres] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resimler]    Script Date: 19.05.2017 16:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resimler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ResimYolu] [ntext] NOT NULL,
	[RefProduct] [int] NOT NULL,
 CONSTRAINT [PK_Resimler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sepet]    Script Date: 19.05.2017 16:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sepet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RefMusteri] [int] NOT NULL,
	[SepetId] [nvarchar](50) NOT NULL,
	[Adet] [int] NOT NULL,
	[KayitTarihi] [datetime] NOT NULL CONSTRAINT [DF_Sepet_KayitTarihi]  DEFAULT (getdate()),
	[RefUrun] [int] NOT NULL,
 CONSTRAINT [PK_Sepet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Siparis]    Script Date: 19.05.2017 16:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AliciAdi] [nvarchar](50) NOT NULL,
	[AliciSoyadi] [nvarchar](50) NOT NULL,
	[RefAdres] [int] NOT NULL,
	[AliciTelefon] [nvarchar](11) NOT NULL,
	[ToplamFiyat] [decimal](18, 0) NOT NULL,
	[KayitTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_Siparis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiparisDetay]    Script Date: 19.05.2017 16:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDetay](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RefSiparis] [int] NOT NULL,
	[RefUrun] [int] NOT NULL,
	[Adet] [int] NOT NULL,
	[BirimFiyat] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_SiparisDetay] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 19.05.2017 16:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](200) NULL,
	[ResimYolu] [ntext] NULL,
	[Fiyat] [decimal](18, 0) NOT NULL,
	[Kategori] [int] NULL,
	[Puanlama] [int] NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Kampanya] ON 

INSERT [dbo].[Kampanya] ([id], [KBaslik], [KAciklama], [KResimYolu], [RefUrun]) VALUES (1, N'Herkes laptop sahibi olacak!!', N'Bu urun kaçmaz hemen sipariş verin %50 indirimli alın', N'Content/images/k1.png', 1)
INSERT [dbo].[Kampanya] ([id], [KBaslik], [KAciklama], [KResimYolu], [RefUrun]) VALUES (2, N'Herkes laptop sahibi olacak!!', N'Bu urun kaçmaz hemen sipariş verin %50 indirimli alın', N'Content/images/k2.png', 2)
INSERT [dbo].[Kampanya] ([id], [KBaslik], [KAciklama], [KResimYolu], [RefUrun]) VALUES (3, N'Herkes laptop sahibi olacak!!', N'Bu urun kaçmaz hemen sipariş verin %50 indirimli alın', N'Content/images/k3.png', 3)
INSERT [dbo].[Kampanya] ([id], [KBaslik], [KAciklama], [KResimYolu], [RefUrun]) VALUES (4, N'Herkes laptop sahibi olacak!!', N'Bu urun kaçmaz hemen sipariş verin %50 indirimli alın', N'Content/images/k4.png', 4)
INSERT [dbo].[Kampanya] ([id], [KBaslik], [KAciklama], [KResimYolu], [RefUrun]) VALUES (5, N'Herkes laptop sahibi olacak!!', N'Bu urun kaçmaz hemen sipariş verin %50 indirimli alın', N'Content/images/k5.png', 5)
INSERT [dbo].[Kampanya] ([id], [KBaslik], [KAciklama], [KResimYolu], [RefUrun]) VALUES (6, N'Herkes laptop sahibi olacak!!', N'Bu urun kaçmaz hemen sipariş verin %50 indirimli alın', N'Content/images/k6.png', NULL)
INSERT [dbo].[Kampanya] ([id], [KBaslik], [KAciklama], [KResimYolu], [RefUrun]) VALUES (7, N'Herkes laptop sahibi olacak!!', N'Bu urun kaçmaz hemen sipariş verin %50 indirimli alın', N'Content/images/k3.png', NULL)
INSERT [dbo].[Kampanya] ([id], [KBaslik], [KAciklama], [KResimYolu], [RefUrun]) VALUES (8, N'Herkes laptop sahibi olacak!!', N'Bu urun kaçmaz hemen sipariş verin %50 indirimli alın', N'Content/images/k7.png', NULL)
INSERT [dbo].[Kampanya] ([id], [KBaslik], [KAciklama], [KResimYolu], [RefUrun]) VALUES (9, N'Herkes laptop sahibi olacak!!', N'Bu urun kaçmaz hemen sipariş verin %50 indirimli alın', N'Content/images/k5.png', NULL)
SET IDENTITY_INSERT [dbo].[Kampanya] OFF
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (1, N'Dizüstü', 0, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (2, N'Masaüstü', 0, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (3, N'Yazıcılar', 0, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (4, N'Malzemeler', 0, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (5, N'Onarım', 0, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (6, N'Laptop', 1, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (7, N'Masaüstü', 2, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (8, N'All in one', 2, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (9, N'Yazıcı', 3, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (10, N'Kartuş ve toner', 3, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (11, N'MOUSE ÜRÜNLERİ', 4, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (12, N'EKRANLAR', 4, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (13, N'KLAVYELER', 4, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (14, N'DEPOLAMA', 4, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (15, N'Mouse', 11, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (16, N'Mouse Pad', 11, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (17, N'Harici Ekran', 12, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (18, N'Laptop Ekranları', 12, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (19, N'Asus', 6, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (20, N'Toshiba', 6, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (21, N'Sony', 6, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (22, N'Lenovo', 6, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (23, N'Masaüstü Klavyeleri', 13, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (24, N'Diziüstü Klavyeleri', 13, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (25, N'Harici Hardisk', 14, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (26, N'SSD Disk', 14, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (27, N'USB Bellek', 14, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (28, N'Oyun yükleme', 5, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (29, N'Format', 5, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (30, N'Anakart Tamiri', 5, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (31, N'HP', 7, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (32, N'Toplama Bilgisayar', 7, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (33, N'BENQ', 7, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (34, N'APPLE', 8, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (35, N'İmaj Yükleme', 5, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (36, N'Güç Ve Enerji', 4, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (37, N'Adaptör', 36, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (38, N'Güç Kaynağı', 36, 1)
INSERT [dbo].[Kategori] ([id], [Baslik], [UstKategori], [isActive]) VALUES (39, N'UPS', 36, 1)
SET IDENTITY_INSERT [dbo].[Kategori] OFF
SET IDENTITY_INSERT [dbo].[Musteri] ON 

INSERT [dbo].[Musteri] ([id], [KullaniciAdi], [Sifre], [Email], [Ad], [Soyad], [Telefon]) VALUES (1, N'm', N'1', N'muratkakun@gmail.com', N'm', N'mm', N'5426753342')
INSERT [dbo].[Musteri] ([id], [KullaniciAdi], [Sifre], [Email], [Ad], [Soyad], [Telefon]) VALUES (2, N't', N'1', N'muratkakun@gmail.com', N'Tuba', N'Kakun', N'5426753342')
INSERT [dbo].[Musteri] ([id], [KullaniciAdi], [Sifre], [Email], [Ad], [Soyad], [Telefon]) VALUES (3, N'a', N'a', N'muratkakun@gmail.com', N'1212', N'1212', N'12')
SET IDENTITY_INSERT [dbo].[Musteri] OFF
SET IDENTITY_INSERT [dbo].[Resimler] ON 

INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (2, N'/Content/images/9.jpg', 1)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (3, N'/Content/images/10.jpg', 1)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (4, N'/Content/images/11.jpg', 1)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (5, N'/Content/images/12.jpg', 2)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (6, N'/Content/images/13.jpg', 2)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (7, N'/Content/images/14.jpg', 2)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (8, N'/Content/images/15.jpg', 3)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (9, N'/Content/images/16.jpg', 3)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (10, N'/Content/images/17.jpg', 3)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (11, N'/Content/images/18.jpg', 4)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (12, N'/Content/images/9.jpg', 4)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (13, N'/Content/images/9.jpg', 4)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (14, N'/Content/images/9.jpg', 5)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (15, N'/Content/images/9.jpg', 5)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (16, N'/Content/images/9.jpg', 5)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (17, N'/Content/images/9.jpg', 6)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (18, N'/Content/images/9.jpg', 6)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (19, N'/Content/images/9.jpg', 6)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (1002, N'/Content/images/9.jpg', 7)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (1003, N'/Content/images/9.jpg', 7)
INSERT [dbo].[Resimler] ([id], [ResimYolu], [RefProduct]) VALUES (1004, N'/Content/images/9.jpg', 7)
SET IDENTITY_INSERT [dbo].[Resimler] OFF
SET IDENTITY_INSERT [dbo].[Sepet] ON 

INSERT [dbo].[Sepet] ([id], [RefMusteri], [SepetId], [Adet], [KayitTarihi], [RefUrun]) VALUES (2, 1, N'1952116f-6d2f-4c1c-8571-045ea9a0c9d0', 1, CAST(N'2017-05-19 03:17:55.910' AS DateTime), 2)
INSERT [dbo].[Sepet] ([id], [RefMusteri], [SepetId], [Adet], [KayitTarihi], [RefUrun]) VALUES (3, 1, N'4dde7886-b0f7-48d4-be8c-70bd0035dfec', 1, CAST(N'2017-05-19 03:20:50.317' AS DateTime), 6)
INSERT [dbo].[Sepet] ([id], [RefMusteri], [SepetId], [Adet], [KayitTarihi], [RefUrun]) VALUES (4, 1, N'd3e6304f-de50-4ab0-9f37-584236a892bf', 1, CAST(N'2017-05-19 03:53:41.737' AS DateTime), 3)
INSERT [dbo].[Sepet] ([id], [RefMusteri], [SepetId], [Adet], [KayitTarihi], [RefUrun]) VALUES (6, 1, N'56e4c95f-a206-404f-a8f2-df774f7561a2', 3, CAST(N'2017-05-19 03:54:41.083' AS DateTime), 6)
INSERT [dbo].[Sepet] ([id], [RefMusteri], [SepetId], [Adet], [KayitTarihi], [RefUrun]) VALUES (7, 1, N'56e4c95f-a206-404f-a8f2-df774f7561a2', 1, CAST(N'2017-05-19 03:54:47.763' AS DateTime), 3)
INSERT [dbo].[Sepet] ([id], [RefMusteri], [SepetId], [Adet], [KayitTarihi], [RefUrun]) VALUES (8, 1, N'56e4c95f-a206-404f-a8f2-df774f7561a2', 3, CAST(N'2017-05-19 03:54:54.667' AS DateTime), 2)
INSERT [dbo].[Sepet] ([id], [RefMusteri], [SepetId], [Adet], [KayitTarihi], [RefUrun]) VALUES (13, 1, N'b11e10f4-c241-48b7-8c76-ee905469f5e8', 1, CAST(N'2017-05-19 04:28:00.257' AS DateTime), 2)
INSERT [dbo].[Sepet] ([id], [RefMusteri], [SepetId], [Adet], [KayitTarihi], [RefUrun]) VALUES (15, 1, N'00bca624-cd82-4c66-b1b0-01008c9dac22', 1, CAST(N'2017-05-19 05:08:20.457' AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[Sepet] OFF
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([id], [Baslik], [Aciklama], [ResimYolu], [Fiyat], [Kategori], [Puanlama]) VALUES (1, N'Acer Laptop', N'Sıfır Laptop', N'/Content/images/8.jpg', CAST(1000 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Urunler] ([id], [Baslik], [Aciklama], [ResimYolu], [Fiyat], [Kategori], [Puanlama]) VALUES (2, N'Toshiba Laptop', N'2.el ama sorunsuz çalışıyor', N'/Content/images/2.jpg', CAST(1500 AS Decimal(18, 0)), 1, 5)
INSERT [dbo].[Urunler] ([id], [Baslik], [Aciklama], [ResimYolu], [Fiyat], [Kategori], [Puanlama]) VALUES (3, N'Asus Laptop', N'2.el ama sorunsuz çalışıyor', N'/Content/images/3.jpg', CAST(1500 AS Decimal(18, 0)), 1, 4)
INSERT [dbo].[Urunler] ([id], [Baslik], [Aciklama], [ResimYolu], [Fiyat], [Kategori], [Puanlama]) VALUES (4, N'Asus Laptop', N'2.el ama sorunsuz çalışıyor', N'/Content/images/4.jpg', CAST(1500 AS Decimal(18, 0)), 1, 3)
INSERT [dbo].[Urunler] ([id], [Baslik], [Aciklama], [ResimYolu], [Fiyat], [Kategori], [Puanlama]) VALUES (5, N'Asus Laptop', N'2.el ama sorunsuz çalışıyor', N'/Content/images/5.jpg', CAST(1500 AS Decimal(18, 0)), 1, 2)
INSERT [dbo].[Urunler] ([id], [Baslik], [Aciklama], [ResimYolu], [Fiyat], [Kategori], [Puanlama]) VALUES (6, N'Asus Laptop', N'2.el ama sorunsuz çalışıyor', N'/Content/images/6.jpg', CAST(1500 AS Decimal(18, 0)), 1, 4)
INSERT [dbo].[Urunler] ([id], [Baslik], [Aciklama], [ResimYolu], [Fiyat], [Kategori], [Puanlama]) VALUES (7, N'Deneme Test 5 Yıldızlı', N'Senin için ilk deneme', N'/Content/images/3.jpg', CAST(5000 AS Decimal(18, 0)), 1, 5)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
ALTER TABLE [dbo].[Siparis] ADD  CONSTRAINT [DF_Siparis_KayitTarihi]  DEFAULT (getdate()) FOR [KayitTarihi]
GO
ALTER TABLE [dbo].[Kampanya]  WITH CHECK ADD  CONSTRAINT [FK_Kampanya_Urunler] FOREIGN KEY([RefUrun])
REFERENCES [dbo].[Urunler] ([id])
GO
ALTER TABLE [dbo].[Kampanya] CHECK CONSTRAINT [FK_Kampanya_Urunler]
GO
ALTER TABLE [dbo].[MusteriAdres]  WITH CHECK ADD  CONSTRAINT [FK_MusteriAdres_Musteri] FOREIGN KEY([RefMusteri])
REFERENCES [dbo].[Musteri] ([id])
GO
ALTER TABLE [dbo].[MusteriAdres] CHECK CONSTRAINT [FK_MusteriAdres_Musteri]
GO
ALTER TABLE [dbo].[Resimler]  WITH CHECK ADD  CONSTRAINT [FK_Resimler_Urunler] FOREIGN KEY([RefProduct])
REFERENCES [dbo].[Urunler] ([id])
GO
ALTER TABLE [dbo].[Resimler] CHECK CONSTRAINT [FK_Resimler_Urunler]
GO
ALTER TABLE [dbo].[Sepet]  WITH CHECK ADD  CONSTRAINT [FK_Sepet_Musteri] FOREIGN KEY([RefMusteri])
REFERENCES [dbo].[Musteri] ([id])
GO
ALTER TABLE [dbo].[Sepet] CHECK CONSTRAINT [FK_Sepet_Musteri]
GO
ALTER TABLE [dbo].[Sepet]  WITH CHECK ADD  CONSTRAINT [FK_Sepet_Urunler] FOREIGN KEY([RefUrun])
REFERENCES [dbo].[Urunler] ([id])
GO
ALTER TABLE [dbo].[Sepet] CHECK CONSTRAINT [FK_Sepet_Urunler]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_MusteriAdres] FOREIGN KEY([RefAdres])
REFERENCES [dbo].[MusteriAdres] ([id])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_MusteriAdres]
GO
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetay_Siparis] FOREIGN KEY([RefSiparis])
REFERENCES [dbo].[Siparis] ([id])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_SiparisDetay_Siparis]
GO
ALTER TABLE [dbo].[SiparisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetay_Urunler] FOREIGN KEY([RefUrun])
REFERENCES [dbo].[Urunler] ([id])
GO
ALTER TABLE [dbo].[SiparisDetay] CHECK CONSTRAINT [FK_SiparisDetay_Urunler]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Kategori1] FOREIGN KEY([Kategori])
REFERENCES [dbo].[Kategori] ([id])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Kategori1]
GO
