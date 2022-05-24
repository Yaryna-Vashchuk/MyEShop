USE [MyEShop]
GO

/****** Object:  Table [dbo].[Carts]    Script Date: 18-May-22 23:58:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Carts](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO

ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products_ProductId]
GO

/****** Object:  Table [dbo].[Products]    Script Date: 18-May-22 23:59:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Users]    Script Date: 18-May-22 23:59:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[Role] [int] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



insert into Products values('274EAE24-33F7-45B7-A2DC-03F41AAB28F9',  'Mirtazapine',								'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPXGSDa7OuYBTXfikPC_V-FaThsIGCdfFXZd_NOj5pmy14hUDtye1HygvuLMthk9jB7Tc&usqp=CAU',  934.26);
insert into Products values('3CA8F967-53AC-4FF8-B43F-097CCD0EE5AE',  'LIDOCAINE HYDROCHLORIDE',					'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxJzJTVASPl4mLBO4RyIyzxo7dpcLoILR91-g59Fqfqx60dJ2qtKuIaSDNWo-ocyabdPU&usqp=CAU',  8608.14);
insert into Products values('3F49A36D-1F10-4054-90B8-3DE5A8355639',  'Multi Vitamin with Fluoride',				'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkf8Sqp45k32zNuuCQL5CfJnTeTGTlJsQlMQ&usqp=CAU',  2948.98);
insert into Products values('4CDC6840-4BA5-4174-9C30-6BBA04157B20',  'SALICYLIC ACID',							'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOfPMqGsgR8OALdUYTdhGgssG-STKALDE3QA&usqp=CAU', 686.61);
insert into Products values('C5107508-54B2-406D-AC29-8C0246F2A647',  'Norethindrone and Ethinyl Estradiol',		'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROuIPHlmyIEPjcf_sXwV0t7DnvZue7C1RPWrggNIpIeu2Fb4j3T_Sf_bhbnkonqFIr5kQ&usqp=CAU',  777.27);
insert into Products values('D42C47E2-B80F-4275-9929-963D75C6D23A',  'Zinc Oxide',								'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLQ0IU0O9-R-yHI-MoHCOPtlNNghyN8qOKly8Ex6QJyPEfI_ABhQxxEErIlE1ob30-05E&usqp=CAU',  4249.80);
insert into Products values('6165636D-0A19-44D5-A715-B0F99BF7C285',  'TITANIUM DIOXIDE',						'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0k0UVggx5mwXBo0WnY7cy8myUw7Ivc1brXQ&usqp=CAU',  1294.70);
insert into Products values('ADB30DEA-BFD3-4DC9-9B8C-B5911C26E860',  'psyllium husk',							'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5P1ImRrpo33gXMBqMZqAprkx0AdlDCfKU_w&usqp=CAU', 5738.91);
insert into Products values('CDEE4253-D22F-4606-B1F6-B7B91ECE9F34',  'Promethazine Hydrochloride',				'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzSVwKW3hmYcB11HRuKxz_TxQr61117oZvYw&usqp=CAU',  116.61);
insert into Products values('761C74EE-AE84-48BC-BF60-C38E60F12084',  'ACYCLOVIR',								'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSa94tuG0mHuXgdE6haCfJ_Z6tJaRnNQYLwdA&usqp=CAU',  2055.18);
insert into Products values('AC115B6F-8E91-4FC0-94D7-D8F39CFD7ACE',  'Platinum Cichorium',						'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaDeSusxCSTD2DN3iY02cgfkWmLHwHTisMP-AUc7_1AHCRKv3DTdbhKe9zla3moXZwOrE&usqp=CAU',  2683.41);
insert into Products values('5390F77F-9F94-4092-9B5B-DFBD4A5F8085',  'Cetirizine Hydrochloride',				'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn1Z385S9rblK-kbJe2LFDye29sAMawgedlJ_w-yVr0z0m5YaDxtBTElLGoNiDRgg0d8c&usqp=CAU',  1748.70);
insert into Products values('6A35A573-B109-4710-9910-E28813094E90',  'Captopril and Hydrochlorothiazide',		'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWMm03qtRLMgstypYMzmdYRC5VwDqBDqgPLw&usqp=CAU',  6254.64);
insert into Products values('6D077356-0ADD-4842-AF71-F853CB796A95',  'Amoxicillin',								'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwWZfHraKLVARnCTvif3U1N0wjAhVI5VKJ0S5ANbjkAwTsxUKENqHU3qx2CV8H8xXWa7I&usqp=CAU',  8871.79);
insert into Products values('2324EDA8-ED0B-4918-B515-FDE0C23FD206',  'Mycophenolate Mofetil',					'This is a product description. You may not want to read it, it is empty and boring, but it does exist anyways, just like you do', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsnS0LfopAaZAX3u1uThwr4Sd8kKLIubEkZyJFosxQdPSSnfWKpqIvsiJcpLQvfRmLl1g&usqp=CAU',  1769.64);

--for adding a user, register in the app. use statement 
--
--update Users set Role = 1 where Email = 'youremail'
--
--to promote your user to admin to add, edit and delete items