/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [db_rest]    Script Date: 1/1/2022 8:27:40 PM ******/
CREATE DATABASE [db_rest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_rest', FILENAME = N'D:\Projects\rrrrr\Restaurant\sql 2008 DB\db_rest.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_rest_log', FILENAME = N'D:\Projects\rrrrr\Restaurant\sql 2008 DB\db_rest_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_rest] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_rest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_rest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_rest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_rest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_rest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_rest] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_rest] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_rest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_rest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_rest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_rest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_rest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_rest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_rest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_rest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_rest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_rest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_rest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_rest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_rest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_rest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_rest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_rest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_rest] SET RECOVERY FULL 
GO
ALTER DATABASE [db_rest] SET  MULTI_USER 
GO
ALTER DATABASE [db_rest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_rest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_rest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_rest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [db_rest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_rest] SET QUERY_STORE = OFF
GO
USE [db_rest]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [db_rest]
GO
/****** Object:  Table [dbo].[tbl_city]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_city](
	[city_id] [smallint] IDENTITY(1,1) NOT NULL,
	[province_id] [smallint] NULL,
	[city_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_city] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_foods]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_foods](
	[food_id] [int] IDENTITY(1,1) NOT NULL,
	[food_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_foods] PRIMARY KEY CLUSTERED 
(
	[food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_content]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_content](
	[order_content_id] [int] IDENTITY(1,1) NOT NULL,
	[order_title_id] [int] NULL,
	[rest_food_id] [int] NULL,
	[food_name] [nvarchar](100) NULL,
	[food_price] [int] NULL,
	[food_count] [smallint] NULL,
 CONSTRAINT [PK_tbl_order_content] PRIMARY KEY CLUSTERED 
(
	[order_content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_state]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_state](
	[state_id] [smallint] IDENTITY(1,1) NOT NULL,
	[state_desc] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_state] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_title]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_title](
	[order_title_id] [int] IDENTITY(1,1) NOT NULL,
	[rest_id] [int] NULL,
	[user_phone] [nvarchar](20) NULL,
	[user_address] [nvarchar](1000) NULL,
	[order_date] [date] NULL,
	[order_time] [time](7) NULL,
	[order_state] [smallint] NULL,
 CONSTRAINT [PK_tbl_order_title] PRIMARY KEY CLUSTERED 
(
	[order_title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_province]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_province](
	[province_id] [smallint] IDENTITY(1,1) NOT NULL,
	[province_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tt] PRIMARY KEY CLUSTERED 
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_rest]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_rest](
	[rest_id] [int] IDENTITY(1,1) NOT NULL,
	[rest_name] [nvarchar](100) NULL,
	[rest_address] [nvarchar](1000) NULL,
	[rest_desc] [nvarchar](4000) NULL,
	[city_id] [smallint] NULL,
 CONSTRAINT [PK_tbl_rest] PRIMARY KEY CLUSTERED 
(
	[rest_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_rest_phone_book]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_rest_phone_book](
	[phone_id] [int] IDENTITY(1,1) NOT NULL,
	[rest_id] [int] NULL,
	[phone_number] [nvarchar](20) NULL,
	[user_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_phone_book] PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_rests_foods]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_rests_foods](
	[rest_food_id] [int] IDENTITY(1,1) NOT NULL,
	[rest_id] [int] NULL,
	[food_name_id] [int] NULL,
	[food_price] [int] NULL,
	[food_count] [smallint] NULL,
	[max_order] [smallint] NULL,
	[check_count] [bit] NULL,
	[food_desc] [nvarchar](4000) NULL,
 CONSTRAINT [PK_tbl_rests_foods] PRIMARY KEY CLUSTERED 
(
	[rest_food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_city]  WITH CHECK ADD  CONSTRAINT [FK_tbl_city_tbl_province] FOREIGN KEY([province_id])
REFERENCES [dbo].[tbl_province] ([province_id])
ON UPDATE SET NULL
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_city] CHECK CONSTRAINT [FK_tbl_city_tbl_province]
GO
ALTER TABLE [dbo].[tbl_order_content]  WITH CHECK ADD  CONSTRAINT [order_title_id_to_tblOrder_title] FOREIGN KEY([order_title_id])
REFERENCES [dbo].[tbl_order_title] ([order_title_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_order_content] CHECK CONSTRAINT [order_title_id_to_tblOrder_title]
GO
ALTER TABLE [dbo].[tbl_order_title]  WITH CHECK ADD  CONSTRAINT [order_state_to_tbl_staate] FOREIGN KEY([order_state])
REFERENCES [dbo].[tbl_order_state] ([state_id])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tbl_order_title] CHECK CONSTRAINT [order_state_to_tbl_staate]
GO
ALTER TABLE [dbo].[tbl_rest]  WITH CHECK ADD  CONSTRAINT [FK_city_id to tbl_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[tbl_city] ([city_id])
ON UPDATE SET NULL
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_rest] CHECK CONSTRAINT [FK_city_id to tbl_city]
GO
ALTER TABLE [dbo].[tbl_rest_phone_book]  WITH CHECK ADD  CONSTRAINT [FK_tbl_rest_phone_book_tbl_rest] FOREIGN KEY([rest_id])
REFERENCES [dbo].[tbl_rest] ([rest_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_rest_phone_book] CHECK CONSTRAINT [FK_tbl_rest_phone_book_tbl_rest]
GO
ALTER TABLE [dbo].[tbl_rests_foods]  WITH CHECK ADD  CONSTRAINT [rest_id-to-tbl_rest] FOREIGN KEY([rest_id])
REFERENCES [dbo].[tbl_rest] ([rest_id])
ON UPDATE SET NULL
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_rests_foods] CHECK CONSTRAINT [rest_id-to-tbl_rest]
GO
/****** Object:  StoredProcedure [dbo].[add_new_order_content]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[add_new_order_content]
	@order_title_id int,
	@rest_food_id int,
	@food_count smallint
AS
BEGIN
	declare @food_name nvarchar(100), @food_price int
	
	select @food_name=b.food_name, @food_price=a.food_price from tbl_rests_foods a
	inner join tbl_foods b
	on a.food_name_id=b.food_id
	where a.rest_food_id=@rest_food_id
	
	insert into tbl_order_content
	values(@order_title_id,@rest_food_id,@food_name,@food_price,@food_count)
	
END
GO
/****** Object:  StoredProcedure [dbo].[insert_new_order_title]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_new_order_title]
	@rest_id int,
	@phone nvarchar(20),
	@address nvarchar(1000),
	@date date,
	@time time(7)
AS
BEGIN
	
	insert into tbl_order_title  
	output inserted.order_title_id 
	values(@rest_id,@phone,@address,@date,@time,1)
	
END
GO
/****** Object:  StoredProcedure [dbo].[p]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p]
	
AS
BEGIN
	select * from tbl_city
END
GO
/****** Object:  StoredProcedure [dbo].[proc_extract_rest_from_city_list]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_extract_rest_from_city_list]
	@city_list nvarchar(300)
AS
BEGIN
	
	select  b.rest_id from dbo.tbl_city as a
	inner join tbl_rest b
	on a.city_id=b.city_id
	where  @city_list     like    '%,'+ CONVERT(nvarchar(50),a.city_id )+ ',%'  
		
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_food_ids_counts]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_get_food_ids_counts]
	@food_ids nvarchar(1000)
AS
BEGIN
	
	SELECT a.rest_food_id,a.food_count,a.max_order ,a.check_count FROM  dbo.tbl_rests_foods a
		where      @food_ids     like    '%,'+ CONVERT(nvarchar(50),a.rest_food_id)+ ',%' 
					
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_user_address_from_phone]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_get_user_address_from_phone]
	@phone nvarchar(50)
AS
BEGIN

		select top(15) t.user_address from tbl_order_title t
		where  t.user_phone = @phone 
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_is_true_food_list_to_rest]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_is_true_food_list_to_rest]
	@rest int,
	@food_ids nvarchar(1000)
AS
BEGIN
	
	
	SELECT COUNT(*) FROM  dbo.tbl_rests_foods a
		where      @food_ids     like    '%,'+ CONVERT(nvarchar(50),a.rest_food_id)+ ',%' 
					and a.rest_id=@rest



END
GO
/****** Object:  StoredProcedure [dbo].[proc_search_city]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_search_city]
	@a nvarchar(50)
AS
BEGIN

	select top(15) t.city_id, t.city_full_name from (
		select  a.city_id, b.province_name +' - '+a.city_name as 'city_full_name' from (
			--select * from dbo.tbl_city as k where k.city_name like @a
			--union
			--select * from dbo.tbl_city as k where k.city_name like @a+'%'
			--union
			select * from dbo.tbl_city as k where k.city_name like '%'+@a+'%' 
		) a
		inner join dbo.tbl_province b
		on a.province_id=b.province_id
	
	
		union
		
	
		select  b.city_id, a.province_name +' - '+b.city_name as 'city_full_name' from (
			--select * from dbo.tbl_province as k where k.province_name like @a
			--union
			--select * from dbo.tbl_province as k where k.province_name like @a+'%'
			--union
			select * from dbo.tbl_province as k where k.province_name like '%'+@a+'%' 
		) a
		inner join dbo.tbl_city b
		on a.province_id=b.province_id
	) t 
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_search_foods_all]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_search_foods_all]
	@q nvarchar(50)
AS
BEGIN

		select top(15) a.food_id,a.food_name from (
			--select * from dbo.tbl_foods as r where r.food_name like @q 
			--union
			--select  * from dbo.tbl_foods as r where r.food_name like @q+'%'
			--union
			select  * from dbo.tbl_foods as r where r.food_name like '%'+@q+'%' 
		) a 
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_search_foods_all_count_or_inde]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_search_foods_all_count_or_inde]
	@food_ids nvarchar(50),
	@index int
AS
BEGIN
		
		if (@index=0)
			begin
				SELECT COUNT(*)  FROM  dbo.tbl_rests_foods a
				INNER JOIN  dbo.tbl_foods b
				ON a.food_name_id = b.food_id
					where     @food_ids    like    '%,'+ CONVERT(nvarchar(50),b.food_id) +',%'
			end 
		else
			begin
			
				select * from
				(
					SELECT ROW_NUMBER() OVER (ORDER BY a.rest_id) AS RowNumber,*  FROM  dbo.tbl_rests_foods a
					INNER JOIN  dbo.tbl_foods b
					ON a.food_name_id = b.food_id
						where     @food_ids    like    '%,'+ CONVERT(nvarchar(50),b.food_id) +',%'
				) t where t.RowNumber=@index

			end
	
	
END




			
			
GO
/****** Object:  StoredProcedure [dbo].[proc_search_foods_sensitiv]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_search_foods_sensitiv]
	@q nvarchar(50),
	@rest_list nvarchar(50)
AS
BEGIN
	
	SELECT distinct top(15) b.food_id,b.food_name  FROM  dbo.tbl_rests_foods a
	INNER JOIN  dbo.tbl_foods b
	ON a.food_name_id = b.food_id
		where     b.food_name like '%'+@q+'%' 
		         and     @rest_list     like    '%,'+ CONVERT(nvarchar(50),a.rest_id )+ ',%' 


	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_search_foods_sensitiv_all]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_search_foods_sensitiv_all]
	@q nvarchar(50),
	@rest_list nvarchar(50)
AS
BEGIN
	
	
	select  distinct top(15) * from (
		select '1' as 'mojud',  a.food_id,a.food_name from (
			--select * from dbo.tbl_foods as r where r.food_name like @q 
			--union
			--select  * from dbo.tbl_foods as r where r.food_name like @q+'%'
			--union
			select  * from dbo.tbl_rests_foods as r 
			INNER JOIN  dbo.tbl_foods rr
			ON r.food_name_id = rr.food_id
				where rr.food_name like '%'+@q+'%' 
		) a 
		where  @rest_list     like    '%,'+ CONVERT(nvarchar(50),a.rest_id )+ ',%' 

		union
		
		select '0' as 'mojud', b.food_name_id,bb.food_name  from dbo.tbl_rests_foods as b 
		INNER JOIN  dbo.tbl_foods bb
		ON b.food_name_id = bb.food_id
			where bb.food_name like '%'+@q+'%' 
			and bb.food_id not in (
				select  food_id from dbo.tbl_rests_foods as r 
				INNER JOIN  dbo.tbl_foods rr
				ON r.food_name_id = rr.food_id
				where rr.food_name like '%'+@q+'%' and @rest_list     like    '%,'+ CONVERT(nvarchar(50),r.rest_id )+ ',%' 
			)
	) t


END
GO
/****** Object:  StoredProcedure [dbo].[proc_search_foods_sensitiv_count_or_index]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_search_foods_sensitiv_count_or_index]
	@food_ids nvarchar(50),
	@rest_list nvarchar(50),
	@index int

AS
BEGIN
	
	if (@index=0)
		begin
			SELECT COUNT(*)  FROM  dbo.tbl_rests_foods a
				INNER JOIN  dbo.tbl_foods b
				ON a.food_name_id = b.food_id
					where     @food_ids    like    '%,'+ CONVERT(nvarchar(50),b.food_id) +',%'
						and    @rest_list     like    '%,'+ CONVERT(nvarchar(50),a.rest_id )+ ',%' 
		end
	else
		begin
			select * from
			(
				SELECT ROW_NUMBER() OVER (ORDER BY a.rest_id) AS RowNumber,*  FROM  dbo.tbl_rests_foods a
				INNER JOIN  dbo.tbl_foods b
				ON a.food_name_id = b.food_id
					where     @food_ids    like    '%,'+ CONVERT(nvarchar(50),b.food_id) +',%'
						and    @rest_list     like    '%,'+ CONVERT(nvarchar(50),a.rest_id )+ ',%' 
			) t where t.RowNumber=@index
		end
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_search_rest_not_sensitiv]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_search_rest_not_sensitiv]
	@q nvarchar(50)
AS
BEGIN
	select  a.rest_id,a.rest_name from (
		--select * from dbo.tbl_rest as r where r.rest_name like @q 
		--union
		--select  * from dbo.tbl_rest as r where r.rest_name like @q+'%'
		--union
		select  * from dbo.tbl_rest as r where r.rest_name like '%'+@q+'%' 
	) a 
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_search_rest_sensitive]    Script Date: 1/1/2022 8:27:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_search_rest_sensitive]
	@q nvarchar(50),
	@city_list nvarchar(300)
AS
BEGIN
	
		select top(15) a.rest_id,a.rest_name from (
			--select * from dbo.tbl_rest as r where r.rest_name like @q 
			--union
			--select  * from dbo.tbl_rest as r where r.rest_name like @q+'%'
			--union
			select  * from dbo.tbl_rest as r where r.rest_name like '%'+@q+'%' 
		) a 
		where  @city_list     like    '%,'+ CONVERT(nvarchar(50),a.city_id )+ ',%' 


END
GO
USE [master]
GO
ALTER DATABASE [db_rest] SET  READ_WRITE 
GO
