USE [master]
GO
/****** Object:  Database [CMA]    Script Date: 5/18/2019 11:14:11 PM ******/
CREATE DATABASE [CMA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CMA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CMA.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CMA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CMA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CMA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CMA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CMA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CMA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CMA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CMA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CMA] SET ARITHABORT OFF 
GO
ALTER DATABASE [CMA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CMA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CMA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CMA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CMA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CMA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CMA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CMA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CMA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CMA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CMA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CMA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CMA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CMA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CMA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CMA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CMA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CMA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CMA] SET  MULTI_USER 
GO
ALTER DATABASE [CMA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CMA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CMA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CMA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CMA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CMA]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/18/2019 11:14:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](20) NULL,
	[Description] [varchar](150) NULL,
	[UserId] [int] NULL,
	[EntryDate] [date] NULL,
	[UpdateDate] [date] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactInformation]    Script Date: 5/18/2019 11:14:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactInformation](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](30) NULL,
	[Mobile] [varchar](15) NULL,
	[Address] [varchar](150) NULL,
	[ProfilePicture] [varchar](100) NULL,
	[EntryDate] [date] NULL,
	[UpdateDate] [date] NULL,
 CONSTRAINT [PK_ContactInformation] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/18/2019 11:14:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](30) NULL,
	[Mobile] [varchar](15) NULL,
	[Address] [varchar](150) NULL,
	[Pssword] [varchar](50) NULL,
	[EntryDate] [date] NULL,
	[UpdateDate] [date] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (1, N'Family', N'We are family -', 1, CAST(N'2019-05-17' AS Date), NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (2, N'Friend', N'Friends', 1, CAST(N'2019-05-18' AS Date), NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (3, N'Colleague', N'Office', 1, CAST(N'2019-05-18' AS Date), NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (4, N'Family', N'Family member', 2, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (5, N'Ced', N'Knowlton', 2, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (6, N'Osbourne', N'Philippault', 1, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (7, N'Portia', N'McKeaney', 1, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (8, N'Latashia', N'Galvin', 2, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (9, N'Wade', N'Clarridge', 2, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (10, N'Carol-jean', N'Dooney', 2, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (11, N'Townsend', N'Beggin', 1, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (12, N'Luther', N'Griffen', 1, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (13, N'Rebecca', N'Gaukrodge', 1, NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [Title], [Description], [UserId], [EntryDate], [UpdateDate]) VALUES (14, N'Martainn', N'Skade', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[ContactInformation] ON 

INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (2, 1, N'Baba', N'xyz@gmail.com', N'987776666', NULL, NULL, CAST(N'2019-05-18' AS Date), NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (4, 3, N'Father', N'xyz@gmail.com', N'01818249150', NULL, NULL, CAST(N'2019-05-18' AS Date), NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (5, 1, N'Father', N'xyz@gmail.com', N'01818249155', N'Mirpur', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (22, 1, N'Shaina Moye', N'smoyeg@globo.com', N'+7 764 673 7514', N'8 Coleman Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (34, 2, N'Alidia Spuffard', N'aspuffards@csmonitor.com', N'+1 632 891 2112', N'379 Monica Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (50, 2, N'Sascha Goodrich', N'sgoodrich18@yahoo.co.jp', N'+7 849 842 0052', N'6598 Sachtjen Parkway', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (55, 1, N'Danyelle Lindenman', N'dlindenman1d@arstechnica.com', N'+7 884 902 7937', N'06704 Larry Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (58, 2, N'Sondra Jacombs', N'sjacombs1g@archive.org', N'+7 465 814 1266', N'5 Knutson Point', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (60, 4, N'Sheridan Foote', N'sfoote1i@g.co', N'+1 561 426 9053', N'12 Dennis Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (68, 3, N'Cristal Goggan', N'cgoggan1q@mysql.com', N'+7 739 619 5981', N'64473 Sunbrook Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (106, 4, N'Erroll Simioli', N'esimioli0@tinypic.com', N'281-899-9941', N'0969 Union Parkway', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (107, 4, N'Alli Gleadle', N'agleadle1@ask.com', N'814-664-0817', N'30 Sauthoff Junction', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (108, 8, N'Allix Sacker', N'asacker2@cyberchimps.com', N'797-565-7097', N'26 Northport Lane', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (109, 2, N'Samuel Sweetnam', N'ssweetnam3@dagondesign.com', N'194-378-0836', N'9 Towne Circle', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (110, 4, N'Dwayne Trimbey', N'dtrimbey4@google.nl', N'311-223-4209', N'70201 Sommers Hill', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (111, 11, N'Hamel Scupham', N'hscupham5@aboutads.info', N'801-347-2967', N'08422 Bunker Hill Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (112, 13, N'Bartholomew McGivena', N'bmcgivena6@mapy.cz', N'865-667-7863', N'81478 Fulton Junction', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (113, 8, N'Malorie Cathie', N'mcathie7@naver.com', N'692-492-1217', N'499 Dwight Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (114, 13, N'Carrol Sandom', N'csandom8@globo.com', N'564-935-1805', N'06894 Pankratz Court', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (115, 13, N'Rickey Slimming', N'rslimming9@rambler.ru', N'790-266-3725', N'8266 Brentwood Center', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (116, 11, N'Blondy Dilland', N'bdillanda@parallels.com', N'571-478-3956', N'4911 Schurz Point', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (117, 14, N'Tanny Hourihane', N'thourihaneb@nymag.com', N'756-785-3116', N'0573 Mockingbird Hill', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (118, 13, N'Fionnula Firle', N'ffirlec@blogs.com', N'945-350-0012', N'93605 Bashford Center', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (119, 6, N'Zollie Eringey', N'zeringeyd@lulu.com', N'817-888-8546', N'99450 Onsgard Crossing', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (120, 10, N'Jennee Everleigh', N'jeverleighe@jalbum.net', N'238-301-7502', N'678 Bowman Drive', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (121, 12, N'Chrysa Corneliussen', N'ccorneliussenf@chron.com', N'328-963-2068', N'6036 Helena Pass', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (122, 9, N'Ariela McFetrich', N'amcfetrichg@skyrock.com', N'396-325-6290', N'943 Kings Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (123, 3, N'Vinnie Jecock', N'vjecockh@bizjournals.com', N'731-942-6990', N'90093 Schiller Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (124, 11, N'Selia Eymer', N'seymeri@g.co', N'887-505-8185', N'2 Algoma Alley', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (125, 14, N'Ambrosio Scruton', N'ascrutonj@yandex.ru', N'803-580-2375', N'1 Schmedeman Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (126, 1, N'Greta Tellwright', N'gtellwrightk@uol.com.br', N'724-322-0947', N'79 Algoma Alley', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (127, 5, N'Helyn Gurg', N'hgurgl@utexas.edu', N'851-855-1364', N'90116 School Pass', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (128, 13, N'Cam Cawdell', N'ccawdellm@cmu.edu', N'299-205-6042', N'501 John Wall Park', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (129, 10, N'Quinlan Korneev', N'qkorneevn@wired.com', N'221-502-9730', N'9483 Sage Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (130, 4, N'Lauren Fulford', N'lfulfordo@networksolutions.com', N'668-742-1569', N'5 Talisman Court', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (131, 1, N'Andrej Kenan', N'akenanp@twitpic.com', N'890-899-1057', N'46287 Banding Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (133, 1, N'Siouxie Ianni', N'siannir@godaddy.com', N'713-343-8574', N'071 Homewood Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (134, 7, N'Fina Schirak', N'fschiraks@imageshack.us', N'999-836-4261', N'9469 Melby Pass', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (135, 9, N'Gerri Geraldo', N'ggeraldot@theglobeandmail.com', N'129-433-9028', N'99 Shelley Point', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (136, 6, N'Paxon Hands', N'phandsu@timesonline.co.uk', N'758-289-6835', N'174 Dahle Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (137, 7, N'Naoma Richings', N'nrichingsv@vimeo.com', N'103-757-7087', N'0 Declaration Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (138, 10, N'Lowell Patters', N'lpattersw@sbwire.com', N'694-696-1116', N'59 Autumn Leaf Park', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (139, 8, N'Cecily Bairstow', N'cbairstowx@upenn.edu', N'642-858-8601', N'37 Arrowood Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (140, 4, N'Lonny Farrear', N'lfarreary@delicious.com', N'429-837-1036', N'59355 Aberg Street', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (141, 7, N'Averyl Hymus', N'ahymusz@google.cn', N'155-938-7253', N'2 Sullivan Court', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (142, 9, N'Yolane Stiebler', N'ystiebler10@google.nl', N'816-336-6673', N'34658 Onsgard Point', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (143, 3, N'Leola Lazer', N'llazer11@xinhuanet.com', N'886-416-6465', N'315 Kipling Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (144, 14, N'Perry Birkwood', N'pbirkwood12@live.com', N'373-627-4911', N'3899 Golden Leaf Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (145, 10, N'Caryl Jobey', N'cjobey13@sun.com', N'588-944-3980', N'368 Debs Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (146, 13, N'Nellie Dufaire', N'ndufaire14@cbslocal.com', N'943-933-2826', N'711 Birchwood Parkway', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (147, 4, N'Roze Turbill', N'rturbill15@addtoany.com', N'976-586-8737', N'390 Knutson Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (148, 11, N'Beckie Hindrich', N'bhindrich16@amazonaws.com', N'207-583-2403', N'9947 Hooker Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (149, 4, N'Truman Carnilian', N'tcarnilian17@shinystat.com', N'919-864-8551', N'904 Surrey Crossing', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (150, 2, N'Cindelyn Kirrage', N'ckirrage18@oaic.gov.au', N'687-735-0814', N'9674 Nova Drive', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (151, 11, N'Opalina Phillcock', N'ophillcock19@mapquest.com', N'413-527-1063', N'1086 Kinsman Lane', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (153, 4, N'Mozelle Baike', N'mbaike1b@thetimes.co.uk', N'716-504-2082', N'9 Green Ridge Hill', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (154, 9, N'Cornie Zamorano', N'czamorano1c@dedecms.com', N'822-862-0244', N'60259 Tomscot Junction', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (155, 3, N'Rosco Pordall', N'rpordall1d@1688.com', N'999-183-7383', N'18 Harper Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (156, 5, N'Nat Rootham', N'nrootham1e@list-manage.com', N'383-378-5924', N'1177 Maywood Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (158, 3, N'Sybyl Bellwood', N'sbellwood1g@tiny.cc', N'523-450-7762', N'8506 Vidon Park', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (159, 3, N'Cale Renfield', N'crenfield1h@multiply.com', N'148-221-7207', N'516 Summerview Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (160, 10, N'Delmor Ouldcott', N'douldcott1i@admin.ch', N'905-772-8121', N'9385 Pearson Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (161, 13, N'Rafa Horsley', N'rhorsley1j@diigo.com', N'514-825-9103', N'79 Division Trail', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (162, 13, N'Boony Di Giorgio', N'bdi1k@yandex.ru', N'931-256-8116', N'1185 Forest Plaza', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (163, 14, N'Garnet Punton', N'gpunton1l@drupal.org', N'127-178-0223', N'0 Waywood Center', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (164, 9, N'Cristy Lamburn', N'clamburn1m@mashable.com', N'457-688-5821', N'4 Packers Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (165, 7, N'Anthia Jonathon', N'ajonathon1n@domainmarket.com', N'425-100-3080', N'6225 Garrison Center', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (166, 4, N'Marlon Crooks', N'mcrooks1o@businessweek.com', N'907-419-6201', N'4 Evergreen Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (167, 10, N'Genvieve Nordass', N'gnordass1p@census.gov', N'983-130-1653', N'6 Loeprich Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (168, 10, N'Rosemaria Rushmer', N'rrushmer1q@businessweek.com', N'763-711-8468', N'828 Valley Edge Circle', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (169, 14, N'Hermia Sabberton', N'hsabberton1r@nbcnews.com', N'436-876-7475', N'0677 Morning Trail', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (170, 6, N'Moshe Emer', N'memer1s@theguardian.com', N'699-925-1946', N'2 Hoffman Parkway', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (171, 14, N'Kristi Giacomuzzo', N'kgiacomuzzo1t@baidu.com', N'853-702-0066', N'34660 Parkside Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (172, 9, N'Dulcine Hallows', N'dhallows1u@ucla.edu', N'685-698-8243', N'3963 Heffernan Park', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (173, 13, N'Annalee Milne', N'amilne1v@sciencedaily.com', N'561-219-2804', N'44366 Pierstorff Center', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (174, 5, N'Amelina Hennington', N'ahennington1w@forbes.com', N'748-157-6220', N'38 Hayes Crossing', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (175, 1, N'Clayborne Flade', N'cflade1x@dropbox.com', N'244-524-3193', N'75 Glacier Hill Circle', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (176, 7, N'Borden Featenby', N'bfeatenby1y@stumbleupon.com', N'618-492-6540', N'1 Moland Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (177, 7, N'Berri Droogan', N'bdroogan1z@goo.ne.jp', N'365-574-1733', N'63 Monica Court', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (178, 3, N'Pedro Orgel', N'porgel20@people.com.cn', N'814-636-8267', N'9 Lukken Alley', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (179, 10, N'Clarissa Ferrick', N'cferrick21@prnewswire.com', N'361-839-2979', N'756 Hazelcrest Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (180, 3, N'Marlena Easey', N'measey22@unc.edu', N'574-660-5204', N'39 Burning Wood Court', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (181, 11, N'Jorgan Harrison', N'jharrison23@diigo.com', N'417-426-2435', N'19 Bartillon Drive', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (182, 13, N'Ethelbert Balchin', N'ebalchin24@ed.gov', N'501-101-8662', N'9 Truax Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (183, 12, N'Far Clarkson', N'fclarkson25@ed.gov', N'914-307-5061', N'48 Texas Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (184, 6, N'Tallou Shand', N'tshand26@dion.ne.jp', N'544-637-0794', N'429 Carey Hill', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (185, 3, N'Nert Boij', N'nboij27@examiner.com', N'964-886-2490', N'46930 Maryland Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (186, 11, N'Donielle Sabater', N'dsabater28@prlog.org', N'474-439-2607', N'403 Annamark Street', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (187, 2, N'Teddy Olpin', N'tolpin29@networksolutions.com', N'626-411-7465', N'0065 Steensland Circle', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (188, 1, N'Carolee Shilleto', N'cshilleto2a@canalblog.com', N'122-955-5381', N'312 Morrow Center', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (189, 6, N'Berty Nolder', N'bnolder2b@umich.edu', N'158-902-8837', N'277 Schurz Plaza', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (190, 10, N'Ravi Stoffler', N'rstoffler2c@nytimes.com', N'953-365-5763', N'848 Calypso Circle', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (191, 4, N'Deck Razzell', N'drazzell2d@bing.com', N'377-576-3701', N'24964 Esch Center', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (192, 7, N'Effie Cossell', N'ecossell2e@latimes.com', N'345-593-0704', N'28 Mariners Cove Street', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (193, 5, N'Cleve Baitson', N'cbaitson2f@facebook.com', N'897-607-1018', N'1164 Grover Point', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (194, 10, N'Veronica Thurnham', N'vthurnham2g@elegantthemes.com', N'516-631-5820', N'323 Welch Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (195, 5, N'Matthaeus Easton', N'measton2h@cyberchimps.com', N'838-281-9173', N'1690 Northfield Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (196, 12, N'Chandler Reddick', N'creddick2i@kickstarter.com', N'856-146-1008', N'042 Carey Drive', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (197, 5, N'Dean Platt', N'dplatt2j@taobao.com', N'715-148-5630', N'750 Anderson Way', NULL, NULL, NULL)
GO
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (198, 2, N'Jacquelin Ziemsen', N'jziemsen2k@mayoclinic.com', N'314-798-3148', N'470 Mockingbird Plaza', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (199, 11, N'Friederike Bartle', N'fbartle2l@goo.gl', N'360-178-0689', N'8740 Judy Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (200, 5, N'Lexy Myall', N'lmyall2m@wiley.com', N'128-768-6355', N'3404 Vera Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (201, 10, N'Creighton Tomaino', N'ctomaino2n@geocities.jp', N'342-320-4075', N'93754 School Drive', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (202, 13, N'Hubey Keward', N'hkeward2o@marketwatch.com', N'279-353-8088', N'63 Bunker Hill Park', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (203, 3, N'Joleen Walework', N'jwalework2p@zimbio.com', N'341-115-7848', N'0431 Fuller Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (204, 14, N'Dixie Reicharz', N'dreicharz2q@amazon.co.uk', N'868-133-2735', N'792 Weeping Birch Circle', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (205, 3, N'Hillard Seegar', N'hseegar2r@dedecms.com', N'374-818-8633', N'1951 Sundown Center', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (206, 5, N'Bengt Caukill', N'bcaukill0@columbia.edu', N'787-631-8654', N'78447 Westport Plaza', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (207, 5, N'Marys Chesterfield', N'mchesterfield1@gmpg.org', N'174-479-1953', N'376 Heath Junction', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (208, 4, N'Boycey Geraldi', N'bgeraldi2@sohu.com', N'781-898-3315', N'6 Barnett Park', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (209, 4, N'Jenelle Croan', N'jcroan3@timesonline.co.uk', N'886-582-3237', N'79 Scott Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (210, 4, N'Theda Zanetti', N'tzanetti4@home.pl', N'840-367-6837', N'66 Mallory Alley', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (211, 11, N'Artair Kirkbride', N'akirkbride5@samsung.com', N'121-215-6086', N'03 Roxbury Pass', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (212, 3, N'Shaina Rabidge', N'srabidge6@mediafire.com', N'760-614-2821', N'06586 Shopko Crossing', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (213, 12, N'Ozzy Garvey', N'ogarvey7@themeforest.net', N'950-931-2490', N'29 Independence Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (214, 4, N'Mayer Bigby', N'mbigby8@umn.edu', N'946-860-1999', N'81 Dryden Parkway', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (215, 3, N'Ardelle Bewlay', N'abewlay9@indiatimes.com', N'535-967-4406', N'16643 Northland Point', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (216, 14, N'Samantha Thornham', N'sthornhama@huffingtonpost.com', N'970-137-0327', N'13343 Thierer Street', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (217, 10, N'Angelico Plewright', N'aplewrightb@ebay.co.uk', N'874-237-9147', N'57022 Boyd Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (218, 14, N'Crystie Goldring', N'cgoldringc@about.me', N'942-215-5778', N'8724 Eastlawn Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (219, 6, N'Beltran Barns', N'bbarnsd@sourceforge.net', N'647-509-5179', N'9 Riverside Center', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (220, 6, N'Juana Chadburn', N'jchadburne@europa.eu', N'616-135-3357', N'3 Briar Crest Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (221, 12, N'Ailey Bissett', N'abissettf@about.com', N'163-550-3023', N'4027 La Follette Court', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (222, 10, N'Claudie Kunisch', N'ckunischg@thetimes.co.uk', N'841-489-7298', N'40 Heath Court', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (223, 5, N'Tadeas Pelling', N'tpellingh@cbc.ca', N'745-566-6630', N'2 Oriole Plaza', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (224, 6, N'Ambrosius Hulle', N'ahullei@blogtalkradio.com', N'157-539-2927', N'3964 Texas Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (225, 2, N'Red Worge', N'rworgej@feedburner.com', N'153-982-7258', N'69330 Maywood Lane', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (226, 1, N'Lefty Mc Ilwrick', N'lmck@phpbb.com', N'560-120-5886', N'832 Westridge Hill', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (227, 2, N'Ulises Meekings', N'umeekingsl@scribd.com', N'423-307-7683', N'485 Service Crossing', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (228, 1, N'Kipper Kingcote', N'kkingcotem@un.org', N'215-390-6950', N'955 Center Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (229, 8, N'Amber Mirrlees', N'amirrleesn@discovery.com', N'676-145-9190', N'6 Mccormick Park', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (230, 8, N'Orly Ower', N'oowero@samsung.com', N'450-361-8788', N'946 Scott Court', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (231, 12, N'Coleen Tigwell', N'ctigwellp@ibm.com', N'105-177-6585', N'5312 Randy Alley', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (232, 6, N'Berky Skune', N'bskuneq@moonfruit.com', N'786-206-3875', N'312 Farmco Park', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (233, 1, N'Kerstin Van den Velden', N'kvanr@home.pl', N'614-484-5981', N'4 Talisman Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (234, 3, N'Michal Hurnell', N'mhurnells@apple.com', N'116-616-7571', N'166 Grayhawk Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (235, 8, N'Margi Wilce', N'mwilcet@dyndns.org', N'274-671-4689', N'464 Katie Trail', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (236, 9, N'Xenia Oldland', N'xoldlandu@e-recht24.de', N'917-150-3704', N'4 Hoard Circle', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (237, 13, N'Bruno Urey', N'bureyv@bravesites.com', N'150-967-7428', N'6 Schurz Lane', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (238, 2, N'Stepha Stading', N'sstadingw@vimeo.com', N'490-849-2001', N'46 Mosinee Lane', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (239, 6, N'Gawen Loges', N'glogesx@wunderground.com', N'659-320-3880', N'50391 Fordem Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (240, 2, N'Cherish Chard', N'cchardy@adobe.com', N'719-902-4304', N'92 Evergreen Drive', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (241, 4, N'Sylas Pimme', N'spimmez@yelp.com', N'243-405-0950', N'60 Sutteridge Pass', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (242, 7, N'Emmi Benois', N'ebenois10@yahoo.com', N'505-152-8679', N'703 Division Street', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (243, 1, N'Cordie Longhurst', N'clonghurst11@techcrunch.com', N'850-444-6606', N'1 Carioca Alley', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (244, 2, N'Brandtr Woolsey', N'bwoolsey12@sfgate.com', N'550-257-6799', N'140 Bunting Drive', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (245, 7, N'Ryan Radenhurst', N'rradenhurst13@ustream.tv', N'543-450-6273', N'9489 Haas Circle', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (246, 2, N'Daisie Chastelain', N'dchastelain14@bigcartel.com', N'371-121-1275', N'03316 Sage Hill', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (247, 9, N'Barde Konmann', N'bkonmann15@ustream.tv', N'832-362-2117', N'37 Delladonna Point', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (248, 7, N'Kippy Portlock', N'kportlock16@wikimedia.org', N'484-995-4749', N'1970 Hallows Lane', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (249, 10, N'Willie Oddboy', N'woddboy17@com.com', N'117-108-2765', N'8839 Erie Circle', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (250, 3, N'Kore Vasentsov', N'kvasentsov18@foxnews.com', N'192-696-7460', N'5 Dapin Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (251, 1, N'Christy Anchor', N'canchor19@washington.edu', N'773-677-6341', N'838 Pine View Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (252, 9, N'Kym Mildenhall', N'kmildenhall1a@netvibes.com', N'229-135-5679', N'5 Kropf Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (253, 9, N'Paxton Hatchell', N'phatchell1b@ustream.tv', N'360-976-9173', N'86145 Schurz Pass', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (254, 7, N'Cirstoforo Attle', N'cattle1c@nps.gov', N'753-484-4067', N'7 Darwin Street', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (255, 2, N'Alyce Batham', N'abatham1d@nydailynews.com', N'941-809-9637', N'5975 Kensington Alley', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (256, 11, N'Harlene Chesterton', N'hchesterton1e@over-blog.com', N'939-424-1779', N'870 Corscot Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (257, 10, N'Dotti Skedge', N'dskedge1f@irs.gov', N'985-527-0984', N'3 Eagle Crest Junction', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (258, 5, N'Dulcea Doughton', N'ddoughton1g@godaddy.com', N'898-520-9348', N'117 Dawn Junction', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (259, 8, N'Shandie Olivie', N'solivie1h@accuweather.com', N'708-513-5868', N'2753 Huxley Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (260, 13, N'Falito Cordy', N'fcordy1i@bing.com', N'883-867-9341', N'01339 North Hill', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (261, 13, N'Rora Syred', N'rsyred1j@xrea.com', N'323-993-3511', N'373 Melvin Center', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (262, 2, N'Solomon Kirvin', N'skirvin1k@squarespace.com', N'893-599-9977', N'53652 Amoth Street', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (263, 9, N'Milli Millthorpe', N'mmillthorpe1l@360.cn', N'645-938-3264', N'0455 Spohn Center', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (264, 6, N'Odey MacTrusty', N'omactrusty1m@smugmug.com', N'397-981-5116', N'66 Riverside Street', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (265, 1, N'Jodi Guillart', N'jguillart1n@cdbaby.com', N'541-382-3176', N'4847 Ridgeway Point', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (266, 11, N'Wye Connar', N'wconnar1o@gravatar.com', N'486-800-4857', N'74102 Annamark Crossing', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (267, 13, N'Peg Acreman', N'pacreman1p@elegantthemes.com', N'763-993-6372', N'24348 Amoth Parkway', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (268, 1, N'Gabbie Bottle', N'gbottle1q@ezinearticles.com', N'143-215-9976', N'65 Blue Bill Park Court', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (269, 12, N'Margette Stickland', N'mstickland1r@desdev.cn', N'624-971-8675', N'36099 Steensland Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (270, 2, N'Abagael Mitchener', N'amitchener1s@rambler.ru', N'357-840-8410', N'9 Spenser Lane', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (271, 14, N'Dewitt Reece', N'dreece1t@sogou.com', N'455-612-2504', N'4655 Tony Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (272, 2, N'Nessa Threlfall', N'nthrelfall1u@macromedia.com', N'589-114-1982', N'9215 Mccormick Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (273, 7, N'Henrie Chivers', N'hchivers1v@ow.ly', N'814-219-3884', N'794 Rieder Junction', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (274, 7, N'Holli MacKowle', N'hmackowle1w@netscape.com', N'147-408-9204', N'6276 Summerview Street', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (275, 5, N'Othilia Bollum', N'obollum1x@meetup.com', N'371-993-0172', N'4 Hazelcrest Park', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (276, 4, N'Fabio Clooney', N'fclooney1y@arizona.edu', N'189-904-7914', N'221 Sage Plaza', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (277, 5, N'Cordi Twigger', N'ctwigger1z@symantec.com', N'232-193-2986', N'5 Esker Point', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (278, 12, N'Berkie Castard', N'bcastard20@examiner.com', N'649-944-5143', N'702 New Castle Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (279, 5, N'Gaynor Dreger', N'gdreger21@weibo.com', N'912-626-3164', N'8 Browning Road', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (280, 7, N'Justino Gay', N'jgay22@xing.com', N'870-576-6473', N'869 Kinsman Circle', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (281, 6, N'Donnell Gurling', N'dgurling23@surveymonkey.com', N'515-806-2892', N'053 American Ash Crossing', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (282, 14, N'Helaina Wasielewski', N'hwasielewski24@is.gd', N'898-281-5762', N'11 Elgar Hill', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (283, 9, N'Linus Moscon', N'lmoscon25@latimes.com', N'783-567-8853', N'0544 Mitchell Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (284, 7, N'Torr Merrigan', N'tmerrigan26@mayoclinic.com', N'569-345-0622', N'4 Oakridge Park', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (285, 11, N'Chris Lampe', N'clampe27@stanford.edu', N'986-269-3623', N'0 Hooker Avenue', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (286, 13, N'Morty Fillingham', N'mfillingham28@macromedia.com', N'508-805-3920', N'15 West Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (287, 9, N'Haslett Burchess', N'hburchess29@sakura.ne.jp', N'282-822-4540', N'1 6th Way', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (288, 11, N'Meredithe Radwell', N'mradwell2a@imgur.com', N'492-828-9756', N'484 Butterfield Point', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (289, 5, N'Myrna Fontin', N'mfontin2b@nymag.com', N'129-582-6492', N'19802 West Pass', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (290, 9, N'Christoph Lynett', N'clynett2c@linkedin.com', N'698-620-3508', N'92614 International Crossing', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (291, 13, N'Coraline Wyldbore', N'cwyldbore2d@joomla.org', N'598-797-9933', N'5 Hermina Lane', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (292, 11, N'Jayne Nellis', N'jnellis2e@whitehouse.gov', N'139-988-1834', N'89 Jay Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (293, 3, N'Amy Grece', N'agrece2f@cnn.com', N'215-740-9599', N'48706 Farragut Court', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (294, 8, N'Hedwiga Gerholz', N'hgerholz2g@nba.com', N'285-122-3507', N'556 Di Loreto Hill', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (295, 11, N'Jorey Mendoza', N'jmendoza2h@barnesandnoble.com', N'187-656-2769', N'21 Elmside Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (296, 9, N'Loni Buglar', N'lbuglar2i@jimdo.com', N'145-344-1263', N'3037 Porter Park', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (297, 13, N'Gabie Smeeton', N'gsmeeton2j@cam.ac.uk', N'534-535-2373', N'86 Swallow Lane', NULL, NULL, NULL)
GO
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (298, 14, N'Enrico Whartonby', N'ewhartonby2k@nsw.gov.au', N'981-622-3782', N'857 Service Junction', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (299, 8, N'Maxie Cowdrey', N'mcowdrey2l@moonfruit.com', N'990-544-8486', N'22 Lerdahl Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (300, 2, N'Vaughn Braunter', N'vbraunter2m@ihg.com', N'867-829-5949', N'934 Harbort Junction', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (301, 2, N'Hastings Christley', N'hchristley2n@addtoany.com', N'265-246-4067', N'1 Merchant Place', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (302, 5, N'Rabi Manicom', N'rmanicom2o@sohu.com', N'888-335-3061', N'4438 Alpine Terrace', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (303, 10, N'Jania Etoile', N'jetoile2p@businesswire.com', N'107-637-2883', N'7835 Straubel Court', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (304, 6, N'Hallsy Blackader', N'hblackader2q@naver.com', N'764-429-8272', N'13734 Mariners Cove Drive', NULL, NULL, NULL)
INSERT [dbo].[ContactInformation] ([ContactId], [CategoryId], [Name], [Email], [Mobile], [Address], [ProfilePicture], [EntryDate], [UpdateDate]) VALUES (305, 12, N'Gina McMichael', N'gmcmichael2r@geocities.com', N'749-605-2705', N'213 Eastlawn Park', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ContactInformation] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Name], [Email], [Mobile], [Address], [Pssword], [EntryDate], [UpdateDate]) VALUES (1, N'Kamrul', N'kamrul.huda@gmail.com', N'01818249158', N'Mirpur - 10', N'1234', NULL, NULL)
INSERT [dbo].[User] ([UserId], [Name], [Email], [Mobile], [Address], [Pssword], [EntryDate], [UpdateDate]) VALUES (2, N'Qudrat', N'qudrat@gmail.com', N'01844050838', N'Dhanmondi', N'1234', NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_User]
GO
ALTER TABLE [dbo].[ContactInformation]  WITH CHECK ADD  CONSTRAINT [FK_ContactInformation_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[ContactInformation] CHECK CONSTRAINT [FK_ContactInformation_Category]
GO
USE [master]
GO
ALTER DATABASE [CMA] SET  READ_WRITE 
GO
