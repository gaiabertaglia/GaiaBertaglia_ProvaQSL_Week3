USE [master]
GO
/****** Object:  Database [NegozioDischi]    Script Date: 18/03/2022 14:52:39 ******/
CREATE DATABASE [NegozioDischi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NegozioDischi', FILENAME = N'C:\Users\gaiab\NegozioDischi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NegozioDischi_log', FILENAME = N'C:\Users\gaiab\NegozioDischi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NegozioDischi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NegozioDischi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ARITHABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NegozioDischi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NegozioDischi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NegozioDischi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NegozioDischi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NegozioDischi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NegozioDischi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET  MULTI_USER 
GO
ALTER DATABASE [NegozioDischi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NegozioDischi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NegozioDischi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NegozioDischi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NegozioDischi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NegozioDischi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NegozioDischi] SET QUERY_STORE = OFF
GO
USE [NegozioDischi]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 18/03/2022 14:52:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[IdAlbum] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [varchar](50) NOT NULL,
	[AnnoUscita] [int] NOT NULL,
	[CasaDiscografica] [varchar](40) NOT NULL,
	[Genere] [varchar](40) NOT NULL,
	[SupportoDistribuzione] [varchar](30) NULL,
	[IdBand] [int] NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[IdAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumBrano]    Script Date: 18/03/2022 14:52:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumBrano](
	[IdAlbum] [int] NOT NULL,
	[IdBrano] [int] NOT NULL,
 CONSTRAINT [PK_ALBUMBRANO] PRIMARY KEY CLUSTERED 
(
	[IdAlbum] ASC,
	[IdBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 18/03/2022 14:52:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[IdBand] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](30) NOT NULL,
	[NumeroComponenti] [int] NOT NULL,
 CONSTRAINT [PK_Band] PRIMARY KEY CLUSTERED 
(
	[IdBand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 18/03/2022 14:52:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[IdBrano] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [varchar](70) NOT NULL,
	[Durata] [int] NOT NULL,
 CONSTRAINT [PK_Brano] PRIMARY KEY CLUSTERED 
(
	[IdBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (1, N'Hanno ucciso l''Uomo Ragno', 1992, N'Fri Records', N'Pop', N'CD', 1)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (2, N'Grazie Mille', 1999, N'S4', N'Pop', N'CD', 1)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (3, N'Il Ballo della Vita', 2018, N'Sony Music', N'Rock', N'Streaming', 2)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (4, N'Teatro d''Ira', 2021, N'Sony Music', N'Rock', N'Streaming', 2)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (5, N'Love', 2018, N'Carosello Records', N'Pop', N'CD', 3)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (6, N'Fuoricampo', 2014, N'Foolica Records', N'Pop', N'CD', 3)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (7, N'Grande Amore', 2020, N'Sony Music', N'Classico', N'CD', 6)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (8, N'Get a Grip', 2020, N'Sony Music', N'Rock', N'Vinile', 5)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (9, N'Get Your Wings', 1974, N'Columbia', N'Rock', N'Vinile', 8)
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (1, 8)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (1, 11)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (2, 9)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (2, 10)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (2, 12)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (3, 1)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (3, 2)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (3, 3)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (4, 4)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (5, 5)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (5, 6)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (5, 7)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (5, 13)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (7, 7)
INSERT [dbo].[AlbumBrano] ([IdAlbum], [IdBrano]) VALUES (8, 7)
GO
SET IDENTITY_INSERT [dbo].[Band] ON 

INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (1, N'883', 5)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (2, N'Maneskin', 4)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (3, N'The Giornalisti', 3)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (4, N'Pooh', 7)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (5, N'Slipknot', 4)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (6, N'Il Volo', 3)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (7, N'Kiss', 4)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (8, N'Aerosmith', 5)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (9, N'Moschettierin', 3)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (10, N'Modern', 7)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (11, N'Mi sento modern', 2)
SET IDENTITY_INSERT [dbo].[Band] OFF
GO
SET IDENTITY_INSERT [dbo].[Brano] ON 

INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (1, N'Niente da dire', 190)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (2, N'Torna a casa', 154)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (3, N'Morirò da re', 172)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (4, N'Marlena', 182)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (5, N'Zero Stare Sereno', 208)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (6, N'Controllo', 193)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (7, N'Imagine', 184)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (8, N'Come mai', 170)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (9, N'La dura legge del gol', 154)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (10, N'Rotta per casa di Dio', 172)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (11, N'Gli anni', 182)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (12, N'Tieni il tempo', 208)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (13, N'Riccione', 125)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (14, N'Sunflowers', 187)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (15, N'Waterloo', 138)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (16, N'Vacation', 129)
SET IDENTITY_INSERT [dbo].[Brano] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UNQ_Album]    Script Date: 18/03/2022 14:52:39 ******/
ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [UNQ_Album] UNIQUE NONCLUSTERED 
(
	[Titolo] ASC,
	[AnnoUscita] ASC,
	[CasaDiscografica] ASC,
	[Genere] ASC,
	[SupportoDistribuzione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_BandAlbum] FOREIGN KEY([IdBand])
REFERENCES [dbo].[Band] ([IdBand])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_BandAlbum]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_Album] FOREIGN KEY([IdAlbum])
REFERENCES [dbo].[Album] ([IdAlbum])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_Album]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_Brano] FOREIGN KEY([IdBrano])
REFERENCES [dbo].[Brano] ([IdBrano])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_Brano]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [CHK_Genere] CHECK  (([Genere]='Classico' OR [Genere]='Jazz' OR [Genere]='Pop' OR [Genere]='Rock' OR [Genere]='Metal'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [CHK_Genere]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [CHK_Supporto] CHECK  (([SupportoDistribuzione]='CD' OR [SupportoDistribuzione]='Vinile' OR [SupportoDistribuzione]='Streaming'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [CHK_Supporto]
GO
USE [master]
GO
ALTER DATABASE [NegozioDischi] SET  READ_WRITE 
GO
