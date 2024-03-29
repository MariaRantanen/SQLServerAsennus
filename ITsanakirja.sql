USE [master]
GO
/****** Object:  Database [ITsanasto]    Script Date: 05/03/2024 14.25.49 ******/
CREATE DATABASE [ITsanasto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ITsanasto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ITsanasto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ITsanasto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ITsanasto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ITsanasto] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITsanasto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITsanasto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITsanasto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITsanasto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITsanasto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITsanasto] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITsanasto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITsanasto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITsanasto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITsanasto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITsanasto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITsanasto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITsanasto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITsanasto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITsanasto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITsanasto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ITsanasto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITsanasto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITsanasto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITsanasto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITsanasto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITsanasto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITsanasto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITsanasto] SET RECOVERY FULL 
GO
ALTER DATABASE [ITsanasto] SET  MULTI_USER 
GO
ALTER DATABASE [ITsanasto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITsanasto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITsanasto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITsanasto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ITsanasto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ITsanasto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ITsanasto] SET QUERY_STORE = ON
GO
ALTER DATABASE [ITsanasto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ITsanasto]
GO
/****** Object:  Table [dbo].[Sanakirja]    Script Date: 05/03/2024 14.25.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sanakirja](
	[Englanti] [nvarchar](50) NOT NULL,
	[Suomi] [nvarchar](50) NOT NULL,
	[Määritelmä] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'data type', N'tietotyyppi', N'Määrittelee muuttujan tarvitseman tilan keskusmuistissa')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'variable', N'muuttuja', N'Ohjelmointikielissä keskusmuistiin tilapäisesti tallennettava tieto')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'simple datatype', N'yksinkertainen tietotyyppi', N'Muuttujaan voi tallentaa vain yhden tiedon kerrallaan')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'structured data type', N'rakenteellinen tietotyyppi', N'Muuttujaan voi tallentaa useita eri arvoja')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'string', N'merkkijono', N'Yksinkertainen tietotyyppi kirjainmerkeistä koostuvan tiedon tallentamiseen')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'char', N'merkki', N'Yksittäinen kirjoitusmerkki')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'boolean', N'totuusarvo', N'Boolen algebran tosi (true) tai epätosi (false) Pythonissa kirjoitetaan isolla alkukirjaimella, c#:ssa pienellä')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'decimal', N'desimaaliluku', N'Tietotyyppi, jolla esitetään desimaalilukuja. Määritellään kuinka paljon varsinaisia numeroita ja desimaaleja halutaan näyttää')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'float', N'liukuluku', N'Tietotyyppi desimaalilukujen esittämiseen ilman määritystä desimaalien määrästä')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'double', N'Kaksoistarkkuuden liukuluku', N'Tietotyyppi suurten tai erittäin tarkkojen desimaalilukujen esittämiseen')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'array', N'vektori', N'Rakenteellinen tietotyyppi useiden eri arvojen tallentamiseen samaan muuttujaan')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'list', N'lista', N'Rakenteellinen tietotyyppi useiden eri arvojen tallentamiseen samaan muuttujaan')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'tuple', N'monikko', N'Rakenteellinen tietotyyppi tietojen esittämiseen avain-arvo-pareina')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'dictionary', N'sanakirja', N'Rakenteellinen tietotyyppi tietojen esittämiseen avain-arvo-pareina')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'stack', N'pino', N'Rakenteellinen tietotyyppi useamman arvon tallentamiseksi muuttujaan. Viimeksi lisätty luetaan muuttujasta ensimmäisenä')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'queue', N'jono', N'Rakenteellinen tietotyyppi useamman arvon tallentamiseksi muuttujaan. Viimeksi lisätty luetaan muuttujasta viimeisenä')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'table(programming)', N'taulukko', N'Moniulotteinen vektori, jossa on rivi- ja sarakeindeksi')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'table (databases)', N'taulu (....)', N'Tietojen perustallennusyksikkö relaatiotietokannoissa')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'hash table', N'hajautustaulu', N'Rakenteellinen tietotyyppi tiivistettyyn tallennukseen')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'heap', N'keko', N'Erityiset säännöt täyttävä puumainen rakenteellinen tietotyyppi')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'class', N'luokka', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'object', N'olio', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'method', N'metodi', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'inheritance', N'periytyminen', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'parent', N'äiti', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'child', N'tytär', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'superclass', N'yliluokka', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'subclass', N'aliluokka', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'base class', N'yliluokka', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'function', N'funktio', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'block', N'lohko', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'structure', N'rakenne', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'data structure', N'tietorakenne', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'structural programming', N'rakenteellinen ohjelmointi', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'key', N'avain', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'value', N'arvo', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'loop', N'silmukka', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'choise', N'valinta', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'name space', N'nimiavaruus', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'scope', N'näkyvyysalue', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'schema', N'nimiavaruus, skeema', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'field', N'kenttä', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'property', N'ominaisuus', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'argument', N'argumentti', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'parameter ', N'parametri', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'bug', N'bugi', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'debugging', N'virheenkorjaus (debuggaus)', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'unit testing', N'yksikkötestaus', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'integration testing', N'integraatio testaus', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'system testing', N'järjestelmätestaus', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'branch', N'kehityshaara', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'stage', N'valmistella', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'commit', N'vahvistus', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'origin', N'alkuperäisrepositorio', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'push', N'tallentaa muutokset', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'pull', N'ladataa muutokset', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'fetch', N'hakea muutokset', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'stash', N'muutosten kätkeminen', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'merge', N'yhdistäminen', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'merge conflict', N'yhdistämisvirhe', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'bracket', N'kaarisulku', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'curly bracket', N'aaltosulku', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'square bracket', N'hakasulku', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'single quote', N'puolilainausmerkki', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'double quote', N'lainausmerkki', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'vector (math)', N'vektori (matematiikka)', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'scalar (math)', N'skaalari (matematiikka)', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'instance', N'esiintymä', N'Luokasta johdettu objekti tai ohjelmiston asennus, esim.  SQL Server instance')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'invariant', N'muuttumaton', N'Arvoa ei voi muuttaa')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'iterator', N'iteraattori', N'Rakenteellinen tietotyyppi, jota voidaan käydä alkioittain läpi')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'constant', N'vakio', N'Muuttuja, jonka arvo ei ole muutettavissa, toiminta riippuu käytetystä ohjelmointikielestä')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'open source', N'avoin lähdekoodi', NULL)
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'container', N'kontti', N'Koodin tallennusyksikkö, jonka tarkka määritelmä riippuu kehitysympäristöstä')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'cache', N'välimuisti', N'Dataa säilytetään väliaikaisesti sen todellisen sijainnin ulkopuolella')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'clien', N'asiakas', N'Palvelua tai palvelinta hyödyntävä ohjelma tai tietokone')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'server', N'palvelin', N'Asiakkaille palveluita tarjoava ohjelmisto tai tietokone')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'clipboard', N'leikepöytä', N'Sovelluksesta kopioitujen tietojen säilytyspaikka käyttöjärjestelmässä tai sovelluksessa')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'directory', N'hakemisto', N'Käyttöjärjestelmän viittaus taltioon, jossa voi olla useita tiedostoja tai toisia hakemistoja')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'folder', N'kansio', N'Käyttöliittymissä käytetty termi hakemistosta')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'bin', N'kansio', N'Apllen käyttämä termi hakemistosta')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'machine learning', N'koneoppiminen', N'Teköälyn osa-alue, jossa tietokone oppii datan perusteella ratkomaan onhelmia')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'microservice', N'mikropalvelu', N'Arkkitehtuuri, jossa sovellus rakennetaan pienten yksinkertaisten palveluiden varaan, joita hyödynnetään API-kutsujen avulla')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'prompt', N'kehote', N'Konsolipohjaisissa sovelluksissa oleva kehote syöttää tietoja. Voi kertoa myös käyttöoikeustason tms. lisätietoja.')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'proxy', N'välikäsi', N'Välityspalvelimista tai -sovelluksesta käytettävä nimitys')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'shell', N'kuori', N'Monimerkityksellinen termi, voi tarkoittaa esim. käyttöjärjestelmän komentojen ajojärjestelmää')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'operator', N'operaattori', N'Merkki, jolla tehdään sijoituksia, laskentaa tai vertailua')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'assignment operator', N'sijoitusoperaattori', N'Merkki, jolla annetaan muuttujalle tai vakiolle arvo')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'comparison operator', N'vertailuoperaattorit', N'Merkit joilla vertaillaan suuruutta')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'arithmetic operator', N'matemaattiset operaattorit', N'Merkit joilla suoritetaan laskutoimituksia')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'boolean operators', N'totuusarvo-operaattorit', N'Boolen algebran operaatiot, yleensä JA ja TAI')
INSERT [dbo].[Sanakirja] ([Englanti], [Suomi], [Määritelmä]) VALUES (N'bitwise operators', N'totuusarvo-operaattori biteittäin', N'Boolen algebran operaatiot yleensä JA ja TAI')
GO
USE [master]
GO
ALTER DATABASE [ITsanasto] SET  READ_WRITE 
GO
