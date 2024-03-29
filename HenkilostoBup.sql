USE [master]
GO
/****** Object:  Database [Henkilosto]    Script Date: 26/03/2024 10.19.33 ******/
CREATE DATABASE [Henkilosto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Henkilosto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Henkilosto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Henkilosto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Henkilosto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Henkilosto] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Henkilosto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Henkilosto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Henkilosto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Henkilosto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Henkilosto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Henkilosto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Henkilosto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Henkilosto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Henkilosto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Henkilosto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Henkilosto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Henkilosto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Henkilosto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Henkilosto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Henkilosto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Henkilosto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Henkilosto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Henkilosto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Henkilosto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Henkilosto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Henkilosto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Henkilosto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Henkilosto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Henkilosto] SET RECOVERY FULL 
GO
ALTER DATABASE [Henkilosto] SET  MULTI_USER 
GO
ALTER DATABASE [Henkilosto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Henkilosto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Henkilosto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Henkilosto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Henkilosto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Henkilosto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Henkilosto] SET QUERY_STORE = ON
GO
ALTER DATABASE [Henkilosto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Henkilosto]
GO
/****** Object:  Table [dbo].[Tyontekija]    Script Date: 26/03/2024 10.19.34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tyontekija](
	[TyontekijaID] [int] IDENTITY(1000,1) NOT NULL,
	[Etunimi] [nvarchar](50) NOT NULL,
	[Sukunimi] [nvarchar](50) NOT NULL,
	[Hetu] [nchar](11) NULL,
	[Katuosoite] [nvarchar](50) NULL,
	[Postinumero] [nvarchar](50) NULL,
	[Postitoimipaikka] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tyontekija] PRIMARY KEY CLUSTERED 
(
	[TyontekijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Liittyma]    Script Date: 26/03/2024 10.19.34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Liittyma](
	[Puhelinnumero] [nvarchar](50) NOT NULL,
	[LiittymatyyppiID] [int] NOT NULL,
	[TyontekijaID] [int] NOT NULL,
 CONSTRAINT [PK_Liittyma] PRIMARY KEY CLUSTERED 
(
	[Puhelinnumero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Liittymatyyppi]    Script Date: 26/03/2024 10.19.34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Liittymatyyppi](
	[LiittymatyyppiID] [int] IDENTITY(1,1) NOT NULL,
	[Liittymatyyppiteksti] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Liittymatyyppi] PRIMARY KEY CLUSTERED 
(
	[LiittymatyyppiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[puhelinluettelo]    Script Date: 26/03/2024 10.19.34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[puhelinluettelo]
AS
SELECT        dbo.Tyontekija.Sukunimi, dbo.Tyontekija.Etunimi, dbo.Liittyma.Puhelinnumero, dbo.Liittymatyyppi.LiittymatyyppiID
FROM            dbo.Liittyma INNER JOIN
                         dbo.Liittymatyyppi ON dbo.Liittyma.LiittymatyyppiID = dbo.Liittymatyyppi.LiittymatyyppiID INNER JOIN
                         dbo.Tyontekija ON dbo.Liittyma.TyontekijaID = dbo.Tyontekija.TyontekijaID
GO
/****** Object:  Table [dbo].[Tyosuhde]    Script Date: 26/03/2024 10.19.34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tyosuhde](
	[RekrytointiID] [int] IDENTITY(1,1) NOT NULL,
	[TyontekijaID] [int] NOT NULL,
	[Tehtava] [nvarchar](50) NOT NULL,
	[Alkoi] [date] NOT NULL,
	[Paattyi] [date] NULL,
 CONSTRAINT [PK_Tyosuhde] PRIMARY KEY CLUSTERED 
(
	[RekrytointiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Liittyma] ([Puhelinnumero], [LiittymatyyppiID], [TyontekijaID]) VALUES (N'0400742301', 2, 1003)
INSERT [dbo].[Liittyma] ([Puhelinnumero], [LiittymatyyppiID], [TyontekijaID]) VALUES (N'0447057420', 1, 1000)
INSERT [dbo].[Liittyma] ([Puhelinnumero], [LiittymatyyppiID], [TyontekijaID]) VALUES (N'0447057421', 1, 1001)
INSERT [dbo].[Liittyma] ([Puhelinnumero], [LiittymatyyppiID], [TyontekijaID]) VALUES (N'0447057425', 1, 1003)
GO
SET IDENTITY_INSERT [dbo].[Liittymatyyppi] ON 

INSERT [dbo].[Liittymatyyppi] ([LiittymatyyppiID], [Liittymatyyppiteksti]) VALUES (1, N'Työpuhelin')
INSERT [dbo].[Liittymatyyppi] ([LiittymatyyppiID], [Liittymatyyppiteksti]) VALUES (2, N'Kotipuhelin')
INSERT [dbo].[Liittymatyyppi] ([LiittymatyyppiID], [Liittymatyyppiteksti]) VALUES (3, N'Dataliittymä')
SET IDENTITY_INSERT [dbo].[Liittymatyyppi] OFF
GO
SET IDENTITY_INSERT [dbo].[Tyontekija] ON 

INSERT [dbo].[Tyontekija] ([TyontekijaID], [Etunimi], [Sukunimi], [Hetu], [Katuosoite], [Postinumero], [Postitoimipaikka]) VALUES (1000, N'Tuomas', N'Suutari', N'150380-199X', N'Juhaninkuja 1', N'21200', N'Raisio')
INSERT [dbo].[Tyontekija] ([TyontekijaID], [Etunimi], [Sukunimi], [Hetu], [Katuosoite], [Postinumero], [Postitoimipaikka]) VALUES (1001, N'Mikko', N'Viljanen', N'190665-357B', N'Eeronkuja 3', N'21200', N'Raisio')
INSERT [dbo].[Tyontekija] ([TyontekijaID], [Etunimi], [Sukunimi], [Hetu], [Katuosoite], [Postinumero], [Postitoimipaikka]) VALUES (1002, N'Jussi', N'Kuosa', N'230271-165H', N'Purokatu 1  ', N'21200', N'Raisio')
INSERT [dbo].[Tyontekija] ([TyontekijaID], [Etunimi], [Sukunimi], [Hetu], [Katuosoite], [Postinumero], [Postitoimipaikka]) VALUES (1003, N'Mika', N'Vainio', N'130728-478N', N'Eeronkuja 4', N'21200', N'Raisio')
INSERT [dbo].[Tyontekija] ([TyontekijaID], [Etunimi], [Sukunimi], [Hetu], [Katuosoite], [Postinumero], [Postitoimipaikka]) VALUES (1004, N'Viljami', N'Vapaakansalainen', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tyontekija] OFF
GO
SET IDENTITY_INSERT [dbo].[Tyosuhde] ON 

INSERT [dbo].[Tyosuhde] ([RekrytointiID], [TyontekijaID], [Tehtava], [Alkoi], [Paattyi]) VALUES (1, 1003, N'Kouluttaja', CAST(N'1994-11-01' AS Date), CAST(N'2016-12-31' AS Date))
INSERT [dbo].[Tyosuhde] ([RekrytointiID], [TyontekijaID], [Tehtava], [Alkoi], [Paattyi]) VALUES (2, 1003, N'Opettaja', CAST(N'2017-01-01' AS Date), NULL)
INSERT [dbo].[Tyosuhde] ([RekrytointiID], [TyontekijaID], [Tehtava], [Alkoi], [Paattyi]) VALUES (3, 1000, N'Opettaja', CAST(N'2022-01-01' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Tyosuhde] OFF
GO
ALTER TABLE [dbo].[Liittyma]  WITH CHECK ADD  CONSTRAINT [FK_Liittyma_Liittymatyyppi] FOREIGN KEY([LiittymatyyppiID])
REFERENCES [dbo].[Liittymatyyppi] ([LiittymatyyppiID])
GO
ALTER TABLE [dbo].[Liittyma] CHECK CONSTRAINT [FK_Liittyma_Liittymatyyppi]
GO
ALTER TABLE [dbo].[Liittyma]  WITH CHECK ADD  CONSTRAINT [FK_Liittyma_Tyontekija] FOREIGN KEY([TyontekijaID])
REFERENCES [dbo].[Tyontekija] ([TyontekijaID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Liittyma] CHECK CONSTRAINT [FK_Liittyma_Tyontekija]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Liittyma"
            Begin Extent = 
               Top = 160
               Left = 412
               Bottom = 273
               Right = 588
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Liittymatyyppi"
            Begin Extent = 
               Top = 17
               Left = 20
               Bottom = 113
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tyontekija"
            Begin Extent = 
               Top = 161
               Left = 19
               Bottom = 291
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'puhelinluettelo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'puhelinluettelo'
GO
USE [master]
GO
ALTER DATABASE [Henkilosto] SET  READ_WRITE 
GO
