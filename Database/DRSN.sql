USE [master]
GO
/****** Object:  Database [DRSN]    Script Date: 7/29/2020 11:43:42 AM ******/
CREATE DATABASE [DRSN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DRSN', FILENAME = N'C:\Users\Shilps Honey\DRSN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DRSN_log', FILENAME = N'C:\Users\Shilps Honey\DRSN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DRSN] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DRSN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DRSN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DRSN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DRSN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DRSN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DRSN] SET ARITHABORT OFF 
GO
ALTER DATABASE [DRSN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DRSN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DRSN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DRSN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DRSN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DRSN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DRSN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DRSN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DRSN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DRSN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DRSN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DRSN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DRSN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DRSN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DRSN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DRSN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DRSN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DRSN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DRSN] SET  MULTI_USER 
GO
ALTER DATABASE [DRSN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DRSN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DRSN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DRSN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DRSN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DRSN] SET QUERY_STORE = OFF
GO
USE [DRSN]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DRSN]
GO
/****** Object:  User [userid]    Script Date: 7/29/2020 11:43:43 AM ******/
CREATE USER [userid] FOR LOGIN [userid] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [userid]
GO
/****** Object:  Table [dbo].[acknowledge]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acknowledge](
	[requestid] [varchar](50) NULL,
	[ackid] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[amount] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[activity]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity](
	[accountid] [varchar](50) NULL,
	[activityname] [varchar](50) NULL,
	[timestamp] [datetime] NULL,
	[activityid] [varchar](50) NULL,
	[description] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blockdataset]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blockdataset](
	[Block] [int] NULL,
	[Timestamp] [datetime] NULL,
	[Previoushash] [varchar](50) NULL,
	[Hash] [varchar](50) NULL,
	[Data] [varchar](50) NULL,
	[Nonce] [int] NULL,
	[Sender] [varchar](50) NULL,
	[Receiver] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[Isvalid] [varchar](50) NULL,
	[Difficulty] [varchar](50) NULL,
	[hashe] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[accountid] [varchar](50) NULL,
	[disastername] [varchar](50) NULL,
	[impacts] [varchar](50) NULL,
	[participants] [varchar](50) NULL,
	[rescue] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profile]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profile](
	[organization] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[fullname] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[postalcode] [varchar](50) NULL,
	[aboutme] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[accountid] [varchar](50) NULL,
	[requestid] [varchar](50) NULL,
	[service] [varchar](50) NULL,
	[acknowledger] [varchar](50) NULL,
	[requestdescription] [varchar](50) NULL,
	[contactnumber] [varchar](50) NULL,
	[emailid] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userdetails]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userdetails](
	[accountid] [varchar](50) NOT NULL,
	[fullname] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[mobile] [varchar](50) NOT NULL,
	[emailstatus] [varchar](50) NOT NULL,
	[mobilestatus] [varchar](50) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[publicaddress] [varchar](50) NOT NULL,
	[privateaddress] [varchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[acknowledge] ([requestid], [ackid], [status], [amount]) VALUES (N'vfg123', N'acvbnm', N'Complete', N'100')
INSERT [dbo].[acknowledge] ([requestid], [ackid], [status], [amount]) VALUES (N'm5lv2w', N'acvbnm', N'Complete', N'369')
INSERT [dbo].[acknowledge] ([requestid], [ackid], [status], [amount]) VALUES (N'scjro9', N'acvbnm', N'Complete', N'213')
INSERT [dbo].[acknowledge] ([requestid], [ackid], [status], [amount]) VALUES (N'07tnki', N'acvbnm', N'Complete', N'75.91')
INSERT [dbo].[acknowledge] ([requestid], [ackid], [status], [amount]) VALUES (N'wvl19b', N'acvbnm', N'Complete', N'528')
INSERT [dbo].[acknowledge] ([requestid], [ackid], [status], [amount]) VALUES (N's0pinh', N'acvbnm', N'Complete', N'475')
INSERT [dbo].[acknowledge] ([requestid], [ackid], [status], [amount]) VALUES (N'xqftlw', N'acvbnm', N'assigned', N'0')
INSERT [dbo].[acknowledge] ([requestid], [ackid], [status], [amount]) VALUES (N'y7c79c', N'acvbnm', N'assigned', N'0')
INSERT [dbo].[acknowledge] ([requestid], [ackid], [status], [amount]) VALUES (N'vjuq28', N'acvbnm', N'assigned', N'0')
INSERT [dbo].[acknowledge] ([requestid], [ackid], [status], [amount]) VALUES (N'h6aypi', N'acvbnm', N'Complete', N'456')
INSERT [dbo].[acknowledge] ([requestid], [ackid], [status], [amount]) VALUES (N'hs3onf', N'7c7868d4-f225-4279-8171-57d68348bb74', N'assigned', N'0')
GO
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'Request Accepted', CAST(N'2020-07-27T11:52:56.353' AS DateTime), N'8AFC89', N'You have been assigneda task')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'Request Completed', CAST(N'2020-07-27T11:54:09.313' AS DateTime), N'017533', N'You have marked a request as complete')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'Request Accepted', CAST(N'2020-07-27T11:54:23.393' AS DateTime), N'D0BC34', N'You have been assigned a task')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'News', CAST(N'2020-07-28T12:14:08.587' AS DateTime), N'FBA377', N'You have updated a news')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'News', CAST(N'2020-07-28T12:19:55.560' AS DateTime), N'CB3F5D', N'You have updated a news')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'News', CAST(N'2020-07-28T12:22:17.830' AS DateTime), N'1DC150', N'You have updated a news')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'News', CAST(N'2020-07-28T12:25:12.603' AS DateTime), N'EE5DFA', N'You have updated a news')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'News', CAST(N'2020-07-28T12:28:13.040' AS DateTime), N'A552C5', N'You have updated a news')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'Request Accepted', CAST(N'2020-07-28T12:32:13.927' AS DateTime), N'251344', N'You have been assigned a task')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'Service Request', CAST(N'2020-07-28T12:36:27.530' AS DateTime), N'E2ACDA', N'You have requested for a service')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'Service Request', CAST(N'2020-07-28T12:36:49.430' AS DateTime), N'6F6DD3', N'You have requested for a service')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'Service Request', CAST(N'2020-07-28T12:37:05.997' AS DateTime), N'B8825D', N'You have requested for a service')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'Request Completed', CAST(N'2020-07-28T12:41:45.880' AS DateTime), N'BD8863', N'You have marked a request as complete')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'7c7868d4-f225-4279-8171-57d68348bb74', N'Request Accepted', CAST(N'2020-07-29T11:18:03.770' AS DateTime), N'6BFA2E', N'You have been assigned a task')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'News', CAST(N'2020-07-27T11:34:48.667' AS DateTime), N'C11827', N'You have updated a news')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'Service Request', CAST(N'2020-07-27T11:36:37.987' AS DateTime), N'42BD0D', N'You have requested for a service')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'Request Accepted', CAST(N'2020-07-27T11:38:34.220' AS DateTime), N'E36D96', N'You have been assigneda task')
INSERT [dbo].[activity] ([accountid], [activityname], [timestamp], [activityid], [description]) VALUES (N'acvbnm', N'Request Completed', CAST(N'2020-07-27T11:40:10.717' AS DateTime), N'F951C8', N'You have marked a request as complete')
GO
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (1, CAST(N'2020-07-20T16:25:24.270' AS DateTime), N'000015ce78cc1176f321c5730ff0e8ff80344421b8fa5d3519', N'MIsBfHNY4TTvbSigUwYKli+afNxN3SD5a+XBLTAQB4s=', N'My second block', 2366, N'Shilpa', N'Shilp', N'00:00:00.1961958', N'True', N'2', N'MIsBfHNY4TTvbSigUwYKli+afNxN3SD5a+XBLTAQB4s=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (2, CAST(N'2020-07-20T16:26:04.863' AS DateTime), N'MIsBfHNY4TTvbSigUwYKli+afNxN3SD5a+XBLTAQB4s=', N'GBcxqGtEwLZmFZvZNXYLN3nHPXoihNeNycE79NVtd6Y=', N'My third block', 3232, N'Shilpa', N'Shilp', N'00:00:00.2026161', N'True', N'2', N'GBcxqGtEwLZmFZvZNXYLN3nHPXoihNeNycE79NVtd6Y=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (0, CAST(N'2020-09-07T08:50:06.000' AS DateTime), N'', N'000015ce78cc1176f321c5730ff0e8ff80344421b8fa5d3519', N'My first block', 48292, N'', N'Shilpa', N'00:00:00.5333800', N'True', N'2', N'000015ce78cc1176f321c5730ff0e8ff80344421b8fa5d3519')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (3, CAST(N'2020-07-20T16:28:32.590' AS DateTime), N'GBcxqGtEwLZmFZvZNXYLN3nHPXoihNeNycE79NVtd6Y=', N'OqnAxsxQuGRGiyuVIpoWVsaLmZrUHpYmyvVLzQVQzuw=', N'My fourth block', 2258, N'Ben', N'Gwen', N'00:00:00.2001401', N'True', N'2', N'OqnAxsxQuGRGiyuVIpoWVsaLmZrUHpYmyvVLzQVQzuw=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (5, CAST(N'2020-07-25T12:16:13.673' AS DateTime), N'lq3wbaGniX3jDxz6y9O86UpSuxOrux1G7s6+8kk8eVk=', N'Sl5SnkrpStilhsGpwrIy0/y8kJg8oowloYYDsNW3gII=', N'My sixth block', 2870, N'Barry', N'Oliver', N'00:00:00.5695667', N'True', N'2', N'Sl5SnkrpStilhsGpwrIy0/y8kJg8oowloYYDsNW3gII=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (6, CAST(N'2020-07-28T12:14:08.683' AS DateTime), N'Sl5SnkrpStilhsGpwrIy0/y8kJg8oowloYYDsNW3gII=', N'dYkCtiRN7SvcaQVpw1uk70hNFuVz9wpb55TpC7nr2rg=', N'acvbnm00200checkinh blockchain00200data may not be', 1826, N'Barry', N'Oliver', N'00:00:00.6066471', N'True', N'2', N'dYkCtiRN7SvcaQVpw1uk70hNFuVz9wpb55TpC7nr2rg=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (7, CAST(N'2020-07-28T12:19:55.590' AS DateTime), N'dYkCtiRN7SvcaQVpw1uk70hNFuVz9wpb55TpC7nr2rg=', N'We54WvUI1bQn1z9x7j4sU+KOeRc7SpTbGa9Wiweqo2Q=', N'acvbnm00200blockchain check00200may break00200DRSN', 1904, N'Barry', N'Oliver', N'00:00:11.6472039', N'True', N'2', N'We54WvUI1bQn1z9x7j4sU+KOeRc7SpTbGa9Wiweqo2Q=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (8, CAST(N'2020-07-28T12:28:13.043' AS DateTime), N'We54WvUI1bQn1z9x7j4sU+KOeRc7SpTbGa9Wiweqo2Q=', N'vsYJ43f+EC7XkweFZ2jiL5LSVrstfXLxl/iTqYenRLI=', N'acvbnm00200Activity break00200sh@gmail.com00200708', 2601, N'Null', N'Null', N'00:00:00.1280887', N'True', N'2', N'vsYJ43f+EC7XkweFZ2jiL5LSVrstfXLxl/iTqYenRLI=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (9, CAST(N'2020-07-28T12:32:13.930' AS DateTime), N'vsYJ43f+EC7XkweFZ2jiL5LSVrstfXLxl/iTqYenRLI=', N'I0l4UNP8GHM8XMSETSzRwjceeglgr5M7zL2QpCZgPCA=', N'acvbnm00200h6aypiAccepting a request', 9340, N'Null', N'Null', N'00:00:00.1661917', N'True', N'2', N'I0l4UNP8GHM8XMSETSzRwjceeglgr5M7zL2QpCZgPCA=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (10, CAST(N'2020-07-28T12:36:27.533' AS DateTime), N'I0l4UNP8GHM8XMSETSzRwjceeglgr5M7zL2QpCZgPCA=', N'fqzfX71k9gupaSzDqmG7rwXgdQtYIOM+KcssIkOXjHg=', N'acvbnm00200Food Provider00200Testblock100200708800', 3878, N'Null', N'Null', N'00:00:00.2132140', N'True', N'2', N'fqzfX71k9gupaSzDqmG7rwXgdQtYIOM+KcssIkOXjHg=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (11, CAST(N'2020-07-28T12:36:49.433' AS DateTime), N'fqzfX71k9gupaSzDqmG7rwXgdQtYIOM+KcssIkOXjHg=', N'lgEBfvStK7ZzCNz6vtR+lGH972iz76/9rmg5lcDxmQ8=', N'acvbnm00200Police Station00200Testblock20020045860', 280, N'Null', N'Null', N'00:00:00.0550588', N'True', N'2', N'lgEBfvStK7ZzCNz6vtR+lGH972iz76/9rmg5lcDxmQ8=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (12, CAST(N'2020-07-28T12:37:06.020' AS DateTime), N'lgEBfvStK7ZzCNz6vtR+lGH972iz76/9rmg5lcDxmQ8=', N'F5p2QPSBZsWlszVoR9OpieEGGQM6NxOvmojzhgZQoVY=', N'acvbnm00200Ambulance00200Testblock300200708800200s', 12055, N'Null', N'Null', N'00:00:00.3212274', N'True', N'2', N'F5p2QPSBZsWlszVoR9OpieEGGQM6NxOvmojzhgZQoVY=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (13, CAST(N'2020-07-28T12:41:45.887' AS DateTime), N'F5p2QPSBZsWlszVoR9OpieEGGQM6NxOvmojzhgZQoVY=', N'iRzpUTlaHCDnkPbLbhj6WggomxBQ8X+GiRwJzXDw3v8=', N'acvbnm00200h6aypi0020045600200Completing a task as', 1608, N'Null', N'Null', N'00:00:00.0799030', N'True', N'2', N'iRzpUTlaHCDnkPbLbhj6WggomxBQ8X+GiRwJzXDw3v8=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (14, CAST(N'2020-07-29T11:18:03.860' AS DateTime), N'iRzpUTlaHCDnkPbLbhj6WggomxBQ8X+GiRwJzXDw3v8=', N'6QpXNKnrQD5jBEY69ozHf2OOv95iItxWjA3Zj806Ow0=', N'7c7868d4-f225-4279-8171-57d68348bb7400200hs3onfAcc', 13392, N'Null', N'Null', N'00:00:00.7003709', N'True', N'2', N'6QpXNKnrQD5jBEY69ozHf2OOv95iItxWjA3Zj806Ow0=')
INSERT [dbo].[blockdataset] ([Block], [Timestamp], [Previoushash], [Hash], [Data], [Nonce], [Sender], [Receiver], [Duration], [Isvalid], [Difficulty], [hashe]) VALUES (4, CAST(N'2020-07-20T16:29:33.857' AS DateTime), N'OqnAxsxQuGRGiyuVIpoWVsaLmZrUHpYmyvVLzQVQzuw=', N'lq3wbaGniX3jDxz6y9O86UpSuxOrux1G7s6+8kk8eVk=', N'My fifth block', 905, N'Barry', N'Oliver', N'00:00:00.1891361', N'True', N'2', N'lq3wbaGniX3jDxz6y9O86UpSuxOrux1G7s6+8kk8eVk=')
GO
INSERT [dbo].[news] ([accountid], [disastername], [impacts], [participants], [rescue]) VALUES (N'acbvnm', N'test', N'application may break', N'Shilpa', N'Fix it if it breaks')
INSERT [dbo].[news] ([accountid], [disastername], [impacts], [participants], [rescue]) VALUES (N'acvbnm', N'ui', N'may break', N'shilpa', N'Fix it')
INSERT [dbo].[news] ([accountid], [disastername], [impacts], [participants], [rescue]) VALUES (N'acvbnm', N'Activity break', N'database may not get updated', N'DRSN', N'Debugging')
INSERT [dbo].[news] ([accountid], [disastername], [impacts], [participants], [rescue]) VALUES (N'acvbnm', N'Earthquake', N'7.1 graph hit', N'DRSN', N'Safe House')
INSERT [dbo].[news] ([accountid], [disastername], [impacts], [participants], [rescue]) VALUES (N'acvbnm', N'checkinh blockchain', N'data may not be sent', N'DRSN', N'Debugging')
INSERT [dbo].[news] ([accountid], [disastername], [impacts], [participants], [rescue]) VALUES (N'acvbnm', N'blockchain check', N'may break', N'DRSN', N'Test2')
INSERT [dbo].[news] ([accountid], [disastername], [impacts], [participants], [rescue]) VALUES (N'acvbnm', N'food', N'data may not be sent', N'DRSN', N'Test3')
INSERT [dbo].[news] ([accountid], [disastername], [impacts], [participants], [rescue]) VALUES (N'acvbnm', N'Activity break', N'may break', N'DRSN', N'Test4')
INSERT [dbo].[news] ([accountid], [disastername], [impacts], [participants], [rescue]) VALUES (N'acvbnm', N'Activity break', N'sh@gmail.com', N'7088', N'Test5')
GO
INSERT [dbo].[profile] ([organization], [username], [email], [fullname], [gender], [address], [city], [country], [postalcode], [aboutme]) VALUES (N'Own', N'acvbnm', N'sh@gm.com', N'Shilpa', N'Female', N'Something', N'Some', N'India', N'789456', N'Developer')
GO
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acbvnm', N'vfg123', N'Food Provider', N'addresspublic', N'Test', N'852', N'sh@gm.cm')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'm5lv2w', N'Food Provider', N'addresspublic', N'Test', N'7088', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'scjro9', N'Food Provider', N'addresspublic', N'Test1', N'7088', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'07tnki', N'Police Station', N'addresspublic', N'Test2', N'4586', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'wvl19b', N'Ambulance', N'addresspublic', N'Test3', N'4586', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N's0pinh', N'Checking service activity', N'addresspublic', N'Debugging and testing', N'7088', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'xqftlw', N'Food Provider', N'addresspublic', N'Test4', N'7088', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'hs3onf', N'Police Station', N'13PWobYEF5uSk8WVP3AuPEzqZ8wUePPyrY', N'Test5', N'7088', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'vjuq28', N'Ambulance', N'addresspublic', N'Test6', N'7088', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'h6aypi', N'Hospital', N'addresspublic', N'Test7', N'7088', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'y7c79c', N'Food Provider', N'addresspublic', N'Test8', N'7088', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'9uw0i2', N'Food Provider', N'null', N'Testblock1', N'7088', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'n3ghzk', N'Police Station', N'null', N'Testblock2', N'4586', N'sh@gmail.com')
INSERT [dbo].[service] ([accountid], [requestid], [service], [acknowledger], [requestdescription], [contactnumber], [emailid]) VALUES (N'acvbnm', N'lzsqxx', N'Ambulance', N'null', N'Testblock3', N'7088', N'sh@gmail.com')
GO
INSERT [dbo].[userdetails] ([accountid], [fullname], [email], [mobile], [emailstatus], [mobilestatus], [password], [publicaddress], [privateaddress]) VALUES (N'acvbnm', N'Shilpa', N'sh@gm.com', N'1234567890', N'verified', N'verified', N'catfood', N'addresspublic', N'addressprivate')
INSERT [dbo].[userdetails] ([accountid], [fullname], [email], [mobile], [emailstatus], [mobilestatus], [password], [publicaddress], [privateaddress]) VALUES (N'33270815-aec1-47d9-833b-40e4ae7f78cb', N'Shilpa Pan', N'toshilpapan@gmail.com', N'7001380798', N'Authenticated', N'Authenticated', N'Bitcoin100$', N'1Cnin35AruDyVXGpaXDwHG7fmYiWGTUkrs', N'L3YyAygH1xkPsztyurp7Fg5PXnZtVACK76Nsy1eeRqMWm1SJcV')
INSERT [dbo].[userdetails] ([accountid], [fullname], [email], [mobile], [emailstatus], [mobilestatus], [password], [publicaddress], [privateaddress]) VALUES (N'testid', N'Shilpa', N's@g.c', N'7894561230', N'Not Authenticated', N'Not Authenticated', N'pass@c', N'pubad', N'priad')
INSERT [dbo].[userdetails] ([accountid], [fullname], [email], [mobile], [emailstatus], [mobilestatus], [password], [publicaddress], [privateaddress]) VALUES (N'localauthority', N'Authority', N'toshilpapan@gmail.com', N'7001380798', N'Not Authenticated', N'Not AUthenticated', N'auth@c', N'authpub', N'authpriv')
INSERT [dbo].[userdetails] ([accountid], [fullname], [email], [mobile], [emailstatus], [mobilestatus], [password], [publicaddress], [privateaddress]) VALUES (N'7c7868d4-f225-4279-8171-57d68348bb74', N'Oliver Queen', N'toshilpapan@gmail.com', N'7001380798', N'Authenticated', N'Authenticated', N'Catfood99#', N'13PWobYEF5uSk8WVP3AuPEzqZ8wUePPyrY', N'L4yLzjugNjvXggh5WgN2wWzXutrruQ8wgf1oXm3rstybk6Zrfd')
GO
/****** Object:  StoredProcedure [dbo].[ack]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ack]
(@accountid varchar(50),
@requestid varchar(50))
as begin update service set acknowledger = (select publicaddress from userdetails where accountid = @accountid)
where requestid = @requestid end
begin insert into acknowledge (requestid, ackid, status, amount) values
(@requestid, @accountid, 'assigned', '0') end
begin
insert into activity(accountid,activityname,timestamp,activityid,description) values
(@accountid,'Request Accepted',GETDATE(),(SELECT SUBSTRING(CONVERT(VARCHAR(255), NEWID()),0,7)),'You have been assigned a task')
end



GO
/****** Object:  StoredProcedure [dbo].[assigned]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[assigned]
(@accountid varchar(50))
as begin select requestid as 'Request Id', status as 'Status' from acknowledge where ackid =@accountid and status='assigned'
end
GO
/****** Object:  StoredProcedure [dbo].[completeprofile]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[completeprofile]
(@organization varchar(50),
@username varchar(50),
@email varchar(50),
@fullname varchar(50),
@gender varchar(50),
@address varchar(50),
@city varchar(50),
@country varchar(50),
@postalcode varchar(50),
@aboutme varchar(50))
as
begin
insert into DRSN.dbo.profile(
organization,
username,
email,
fullname,
gender,
address,
city,
country,
postalcode,
aboutme)
values
(@organization,
@username,
@email,
@fullname,
@gender,
@address,
@city,
@country,
@postalcode,
@aboutme)
end
GO
/****** Object:  StoredProcedure [dbo].[difficultyupdate]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[difficultyupdate]
( @difficulty varchar(50),
@block int
) as
begin
update blockdataset
set Difficulty = @difficulty
where @block = Block
end
GO
/****** Object:  StoredProcedure [dbo].[displayunack]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[displayunack]
as begin select
requestid as 'Request ID',
 service as 'Requested Service', requestdescription as 'Request' from service where acknowledger='null'
end
GO
/****** Object:  StoredProcedure [dbo].[durationupdate]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[durationupdate]
( @duration varchar(50)
--@block int
) as
begin
update blockdataset
set Duration = @duration
where Block = (Select max(block) from blockdataset)
end
GO
/****** Object:  StoredProcedure [dbo].[getemail]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getemail](
@accountid varchar(50),
@emailb varchar(50) output,
@name varchar(50) output)
as begin
select @name = fullname,
@emailb = email from userdetails where accountid = @accountid
end
GO
/****** Object:  StoredProcedure [dbo].[insertblock]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertblock]
(  
   @Block INTEGER,  
   @Timestamp DATETIME,  
   @Previoushash VARCHAR(50),  
   @Hash varchar(50),  
   @Data VARCHAR(50),  
   @Nonce integer,
   @Sender varchar(50),
   @Receiver varchar(50),
   @Difficulty varchar(50),
   @Isvalid varchar(50),
   @Duration varchar(50),
   @hashe varchar(50)
)  
AS
BEGIN   
insert into blockdataset(Block,  
   Timestamp,  
   Previoushash,  
   Hash,  
   Data,  
   Nonce,
   Sender,
   Receiver,
   Difficulty,
   Isvalid,
   Duration,
   hashe) values
   (@Block,  
   @Timestamp,  
   @Previoushash,  
   @Hash,  
   @Data,  
   @Nonce,
   @Sender,
   @Receiver,
   @Difficulty,
   @Isvalid,
   @Duration,
   @hashe)  
END  


GO
/****** Object:  StoredProcedure [dbo].[isvalidprevhash]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[isvalidprevhash] (
    @prhash varchar(50) Output
	--@Block int
) AS
BEGIN
    SELECT 
        @prhash = hashe
    FROM
        blockdataset
    WHERE
        Block = (Select max(block)-1 from blockdataset)

    
END;
GO
/****** Object:  StoredProcedure [dbo].[isvalidupdate]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[isvalidupdate]
( @isvalid varchar(50),
@nonce int,
@block int
) as
begin
update blockdataset
set Isvalid = @isvalid,
Nonce = @nonce
where @block = Block
end
GO
/****** Object:  StoredProcedure [dbo].[loginuser]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[loginuser]

(

        @accountid varchar(50),

        @password varchar(50)

)

as

declare @status int

if exists(select * from userdetails where accountid=@accountid and password=@password)

       set @status=1

else

       set @status=0

select @status
GO
/****** Object:  StoredProcedure [dbo].[newsupdate]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[newsupdate]
(@accountid varchar(50),
@disastername varchar(50),
@impacts varchar(50),
@participants varchar(50),
@rescue varchar(max))
as
begin
insert into news (accountid,
disastername,
impacts,
participants,
rescue) values (@accountid,
@disastername,
@impacts,
@participants,
@rescue)
end
begin
insert into activity(accountid,activityname,timestamp,activityid,description) values
(@accountid,'News',GETDATE(),(SELECT SUBSTRING(CONVERT(VARCHAR(255), NEWID()),0,7)),'You have updated a news')
end
GO
/****** Object:  StoredProcedure [dbo].[prevblock]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prevblock] (
--@prhash varchar(50) Output
	@block int output
) AS
BEGIN
    SELECT 
        @block = Block
    FROM
        blockdataset
    WHERE
        Block = (Select max(block) from blockdataset)

    
END;
GO
/****** Object:  StoredProcedure [dbo].[prevhash]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prevhash] (
    @prhash varchar(50) Output
	--@Block int
) AS
BEGIN
    SELECT 
        @prhash = hashe
    FROM
        blockdataset
    WHERE
        Block = (Select max(block) from blockdataset)

    
END;
GO
/****** Object:  StoredProcedure [dbo].[reqcomp]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reqcomp]
(@accountid varchar(50),
@requestid varchar(50),
@amount varchar(50))
as begin update acknowledge set status='Complete', amount=@amount
where requestid = @requestid and ackid=@accountid
end
begin
insert into activity(accountid,activityname,timestamp,activityid, description) values
(@accountid,'Request Completed',GETDATE(),(SELECT SUBSTRING(CONVERT(VARCHAR(255), NEWID()),0,7)), 'You have marked a request as complete')
end

GO
/****** Object:  StoredProcedure [dbo].[requestsmade]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[requestsmade]
(@accountid varchar(50))
as begin select COUNT (*) from service where accountid=@accountid end;
GO
/****** Object:  StoredProcedure [dbo].[servicerequest]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[servicerequest]
(@accountid varchar(50),
@requestid varchar(50),
@service varchar(50),
@acknowledger varchar(50),
@requestdescription varchar(50),
@contactnumber varchar(50),
@emailid varchar(50)) as begin
insert into service (accountid, requestid, service, acknowledger, requestdescription, contactnumber, emailid) values
(@accountid, @requestid, @service, @acknowledger, @requestdescription, @contactnumber, @emailid) end
begin
insert into activity(accountid,activityname,timestamp,activityid, description) values
(@accountid,'Service Request',GETDATE(),(SELECT SUBSTRING(CONVERT(VARCHAR(255), NEWID()),0,7)), 'You have requested for a service')
end
GO
/****** Object:  StoredProcedure [dbo].[showactivity]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[showactivity]
(@accountid varchar(50)
)
as begin
select description as 'Activity story', timestamp as 'Time'  from activity where accountid=@accountid
end
GO
/****** Object:  StoredProcedure [dbo].[shownews]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[shownews](
@accountid varchar(50))
as begin select disastername as 'Disaster Name', impacts as 'Disaster pre determined impacts', participants as 'Rescue Members', 
rescue as 'Full Details', (select fullname from userdetails where accountid = @accountid) as 'Name', 
GETDATE() as 'Time Updated' 
from news
end
GO
/****** Object:  StoredProcedure [dbo].[totalreqacc]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[totalreqacc]
(@accountid varchar(50))
as 
begin select Count(*) from acknowledge where ackid = @accountid  
end
GO
/****** Object:  StoredProcedure [dbo].[totalreqcomp]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[totalreqcomp]
(@accountid varchar(50))
as 
begin select Count(*) from acknowledge where ackid = @accountid and status='Complete'  
end
GO
/****** Object:  StoredProcedure [dbo].[totalreqmade]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[totalreqmade]
(@accountid varchar(50))
as 
begin select Count(*) from service where accountid = @accountid  
end
GO
/****** Object:  StoredProcedure [dbo].[userauth]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[userauth] (
    @accountid varchar(50),
    @email varchar(50) OUTPUT,
	@mobile varchar(50) OUTPUT
) AS
BEGIN
    SELECT 
        @email= email,
        @mobile = mobile
    FROM
        userdetails
    WHERE
        accountid = @accountid;

 --   SELECT @email = email,
	--@mobile = mobile;
END;
GO
/****** Object:  StoredProcedure [dbo].[userdetail]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[userdetail] (@accountid      VARCHAR (50),
   @fullname       VARCHAR (50),
    @email         VARCHAR (50),
    @mobile         VARCHAR(50),
    @emailstatus    VARCHAR (50),
    @mobilestatus   VARCHAR (50),
    @password       VARCHAR (MAX),
    @publicaddress  VARCHAR (50),
    @privateaddress VARCHAR (50))
	--@StatementType  VARCHAR  (50))
AS  
  BEGIN  
  
            INSERT INTO DRSN.dbo.userdetails  
                        (accountid,
    fullname,
    email,
    mobile,
    emailstatus,
    mobilestatus,
    password,
    publicaddress,
    privateaddress)  
            VALUES     ( @accountid,
    @fullname,
    @email,
    @mobile,
    @emailstatus,
    @mobilestatus,
    @password,
    @publicaddress,
    @privateaddress)  
        END  

   
GO
/****** Object:  StoredProcedure [dbo].[verifyuser]    Script Date: 7/29/2020 11:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[verifyuser]

(

        @accountid varchar(50)

--@emailstatus varchar(50),
--@mobilestatus varchar(50)

)

as

declare @status int

if exists(select emailstatus from userdetails where accountid = @accountid and emailstatus= 'Not Authenticated')

       set @status=1

else

       set @status=0

select @status
GO
USE [master]
GO
ALTER DATABASE [DRSN] SET  READ_WRITE 
GO
