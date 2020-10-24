USE [SastaServicesDB]
GO
/****** Object:  Table [dbo].[STPBanner]    Script Date: 10/23/2020 5:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPBanner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BannerName] [nvarchar](50) NULL,
	[BannerDetails] [nvarchar](500) NULL,
	[IsAvailable] [bit] NOT NULL,
	[ImageFilePath1] [nvarchar](max) NOT NULL,
	[ImageFilePath2] [nvarchar](max) NOT NULL,
	[ImageFilePath3] [nvarchar](max) NOT NULL,
	[ImageFilePath4] [nvarchar](max) NULL,
	[createdDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_STPBanner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPBannerOffers]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPBannerOffers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShortDescriptionBefore] [nvarchar](500) NULL,
	[MainHeading] [nvarchar](500) NOT NULL,
	[DiscoutRate] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ShortDescriptionAfter] [nvarchar](500) NULL,
	[ImageFilePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_STPBannerOffers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPCustomerSupports]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPCustomerSupports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[RequestNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerSupports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPPrefferedTime]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPPrefferedTime](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeRange] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_STPPrefferedTime] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPProductBrand]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPProductBrand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[STPProductTypeID] [int] NOT NULL,
 CONSTRAINT [PK_STPProductBrand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPProductType]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](250) NOT NULL,
	[ProductTypeDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_STPProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPQuickCall]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPQuickCall](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[createdDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_STPQuickCall] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPServiceProductItems]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPServiceProductItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceProductName] [nvarchar](50) NOT NULL,
	[ServiceModelNo] [nvarchar](50) NOT NULL,
	[ServiceProductDescription] [nvarchar](max) NOT NULL,
	[STPProductBrandID] [int] NOT NULL,
	[IsAvailible] [bit] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
	[ImageFilePath] [nvarchar](max) NULL,
	[CostPrice] [decimal](18, 2) NOT NULL,
	[SellingPrice] [decimal](18, 2) NOT NULL,
	[FuelTypeId] [int] NOT NULL,
	[UnitTypeId] [int] NOT NULL,
 CONSTRAINT [PK_STPProductItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPServices]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPServices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](500) NOT NULL,
	[ServiceDescrption] [nvarchar](1000) NULL,
	[STPServiceTypeID] [int] NOT NULL,
	[IsAvailible] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[FuelTypeId] [int] NOT NULL,
	[UnitTypeId] [int] NOT NULL,
	[ServiceRate] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_STPServices_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPServicesFuelTypes]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPServicesFuelTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[STPServiceTypeID] [int] NOT NULL,
	[Label] [nvarchar](70) NOT NULL,
	[Options] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_STPDependent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPServicesUnitTypes]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPServicesUnitTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Options] [nchar](10) NOT NULL,
	[STPServiceTypeID] [int] NOT NULL,
 CONSTRAINT [PK_PowerUnits] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPServiceType]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPServiceType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceTypeName] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Datetime] [datetime] NULL,
	[IsAvailible] [bit] NOT NULL,
	[ImageFilePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_STPServiceType_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPStatus]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[STPStatusTypeID] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_STPStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STPStatusType]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STPStatusType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_STPStatusType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StpUser]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StpUser](
	[ID] [int] IDENTITY(0,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[EmailID] [varchar](254) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Contact] [varchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[IsEmailVerified] [bit] NOT NULL,
	[IsEmailActive] [bit] NOT NULL,
	[ActivationCode] [uniqueidentifier] NOT NULL,
	[ResetPasswordCode] [nvarchar](100) NULL,
	[STPUserTypeID] [tinyint] NOT NULL,
 CONSTRAINT [PK__StpUser__1788CCACC1940879] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StpUserType]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StpUserType](
	[ID] [tinyint] IDENTITY(0,1) NOT NULL,
	[UserType] [varchar](50) NULL,
 CONSTRAINT [PK_StpUserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRNCustomerOrders]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRNCustomerOrders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](450) NOT NULL,
	[OrderDescription] [nvarchar](450) NULL,
	[preferredDate] [date] NOT NULL,
	[preferredTimeID] [int] NOT NULL,
	[ServiceTypeId] [int] NOT NULL,
	[FuelTypeId] [int] NOT NULL,
	[UnitTypeId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[CreateOn] [datetime2](7) NULL,
 CONSTRAINT [PK_CustomerOrders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRNCustomerOrders_STPProductItems]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRNCustomerOrders_STPProductItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TRNCustomerOrderID] [int] NOT NULL,
	[STPProductItemsID] [int] NOT NULL,
 CONSTRAINT [PK_TRNCustomerOrders_STPProductItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRNCustomerOrders_STPServices]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRNCustomerOrders_STPServices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TRNCustomerOrderID] [int] NOT NULL,
	[STPServicesID] [int] NOT NULL,
 CONSTRAINT [PK_TRNCustomerOrders_STPServices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRNInvoice]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRNInvoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[STPOrdersID] [int] NOT NULL,
	[ProductItemCharges] [decimal](18, 2) NOT NULL,
	[ServiceCharges] [decimal](18, 2) NOT NULL,
	[PlatformCharges] [decimal](18, 2) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[GSTTax] [decimal](18, 2) NULL,
	[SpecialDiscount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_STPInvoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRNSubscription]    Script Date: 10/23/2020 5:14:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRNSubscription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionName] [nvarchar](50) NOT NULL,
	[SubscriptionCost] [decimal](18, 2) NOT NULL,
	[SubscriptionDetails] [nvarchar](500) NULL,
	[ImageFilePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_TRNSubscription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[STPBannerOffers] ON 

INSERT [dbo].[STPBannerOffers] ([ID], [ShortDescriptionBefore], [MainHeading], [DiscoutRate], [CreateDate], [CreatedBy], [ShortDescriptionAfter], [ImageFilePath]) VALUES (1, N'Get flat', N'THE BIG SALE', 10, NULL, NULL, N'Cashback', NULL)
INSERT [dbo].[STPBannerOffers] ([ID], [ShortDescriptionBefore], [MainHeading], [DiscoutRate], [CreateDate], [CreatedBy], [ShortDescriptionAfter], [ImageFilePath]) VALUES (2, N'advanced Wireless', N'BEST HEADPHONE', 30, NULL, NULL, N'earbuds', NULL)
INSERT [dbo].[STPBannerOffers] ([ID], [ShortDescriptionBefore], [MainHeading], [DiscoutRate], [CreateDate], [CreatedBy], [ShortDescriptionAfter], [ImageFilePath]) VALUES (3, N'Get flat', N'NEW STANDARD', 10, NULL, NULL, N' Cashback', NULL)
INSERT [dbo].[STPBannerOffers] ([ID], [ShortDescriptionBefore], [MainHeading], [DiscoutRate], [CreateDate], [CreatedBy], [ShortDescriptionAfter], [ImageFilePath]) VALUES (4, N'Get Now', N'
TODAY DISCOUNT', 40, NULL, NULL, N' Discount
', NULL)
SET IDENTITY_INSERT [dbo].[STPBannerOffers] OFF
SET IDENTITY_INSERT [dbo].[STPCustomerSupports] ON 

INSERT [dbo].[STPCustomerSupports] ([ID], [Name], [Email], [Subject], [ContactNo], [Message], [RequestNumber]) VALUES (1, N'ariba jawed', N'aribajawed163@gmail.com', N'test', N'03112233456', N'test', N'1710202013238')
INSERT [dbo].[STPCustomerSupports] ([ID], [Name], [Email], [Subject], [ContactNo], [Message], [RequestNumber]) VALUES (2, N'AAAA BBB', N'aribajawed163@gmail.com', N'test', N'03112233453', N'test', N'19102020122130')
SET IDENTITY_INSERT [dbo].[STPCustomerSupports] OFF
SET IDENTITY_INSERT [dbo].[STPPrefferedTime] ON 

INSERT [dbo].[STPPrefferedTime] ([ID], [TimeRange]) VALUES (1, N'9:00am-11:00am')
INSERT [dbo].[STPPrefferedTime] ([ID], [TimeRange]) VALUES (2, N'11:00am-1:00pm')
INSERT [dbo].[STPPrefferedTime] ([ID], [TimeRange]) VALUES (3, N'1:00pm-3:00pm')
INSERT [dbo].[STPPrefferedTime] ([ID], [TimeRange]) VALUES (4, N'3:00pm-5:00pm')
INSERT [dbo].[STPPrefferedTime] ([ID], [TimeRange]) VALUES (5, N'5:00pm-7:00pm')
INSERT [dbo].[STPPrefferedTime] ([ID], [TimeRange]) VALUES (6, N'7:00pm-8:00pm')
SET IDENTITY_INSERT [dbo].[STPPrefferedTime] OFF
SET IDENTITY_INSERT [dbo].[STPProductBrand] ON 

INSERT [dbo].[STPProductBrand] ([ID], [Name], [STPProductTypeID]) VALUES (3, N'Cummins', 1)
INSERT [dbo].[STPProductBrand] ([ID], [Name], [STPProductTypeID]) VALUES (4, N'GREAVES', 1)
INSERT [dbo].[STPProductBrand] ([ID], [Name], [STPProductTypeID]) VALUES (6, N'Haier', 2)
INSERT [dbo].[STPProductBrand] ([ID], [Name], [STPProductTypeID]) VALUES (7, N'Pel', 2)
SET IDENTITY_INSERT [dbo].[STPProductBrand] OFF
SET IDENTITY_INSERT [dbo].[STPProductType] ON 

INSERT [dbo].[STPProductType] ([ID], [ProductTypeName], [ProductTypeDescription]) VALUES (1, N'Generator', N'')
INSERT [dbo].[STPProductType] ([ID], [ProductTypeName], [ProductTypeDescription]) VALUES (2, N'Air Condition', NULL)
INSERT [dbo].[STPProductType] ([ID], [ProductTypeName], [ProductTypeDescription]) VALUES (3, N'CCTV Camera', NULL)
INSERT [dbo].[STPProductType] ([ID], [ProductTypeName], [ProductTypeDescription]) VALUES (4, N'UPS', NULL)
INSERT [dbo].[STPProductType] ([ID], [ProductTypeName], [ProductTypeDescription]) VALUES (5, N'Solar System', NULL)
SET IDENTITY_INSERT [dbo].[STPProductType] OFF
SET IDENTITY_INSERT [dbo].[STPQuickCall] ON 

INSERT [dbo].[STPQuickCall] ([ID], [Name], [Contact], [createdDateTime]) VALUES (1, N'Test', N'test', CAST(0x070000000000000000 AS DateTime2))
INSERT [dbo].[STPQuickCall] ([ID], [Name], [Contact], [createdDateTime]) VALUES (2, N'Test', N'test', CAST(0x070000000000000000 AS DateTime2))
INSERT [dbo].[STPQuickCall] ([ID], [Name], [Contact], [createdDateTime]) VALUES (3, N'Test', N'test', CAST(0x070000000000000000 AS DateTime2))
INSERT [dbo].[STPQuickCall] ([ID], [Name], [Contact], [createdDateTime]) VALUES (4, N'Test', N'0909099', CAST(0x070000000000000000 AS DateTime2))
INSERT [dbo].[STPQuickCall] ([ID], [Name], [Contact], [createdDateTime]) VALUES (1002, N'test', N'097654', CAST(0x070000000000000000 AS DateTime2))
SET IDENTITY_INSERT [dbo].[STPQuickCall] OFF
SET IDENTITY_INSERT [dbo].[STPServiceProductItems] ON 

INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (1, N'Generator Valve', N'Test123', N'smod, cu eos habeo nullam prompta. Eum an scaevola delicata. At maiorum interpretaris mea, sea nonumy deleniti in. At per inani reprehendunt, cum at iisque indoctum, cum an porro fabulas conceptam. No est prima tation, doming salutandi vim in, ea corpora dissentiunt definitionem sea.', 3, 1, CAST(0x0700000000004F410B AS DateTime2), N'../img/products/Generators/generator-valve.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 2, 20)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (2, N'Gun Set', N'Test125', N'smod, cu eos habeo nullam prompta. Eum an scaevola delicata. At maiorum interpretaris mea, sea nonumy deleniti in. At per inani reprehendunt, cum at iisque indoctum, cum an porro fabulas conceptam. No est prima tation, doming salutandi vim in, ea corpora dissentiunt definitionem sea.', 3, 1, CAST(0x0700000000004F410B AS DateTime2), N'../img/products/Generators/generator-valve.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 2, 20)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (3, N'Radiator', N'Test124', N'smod, cu eos habeo nullam prompta. Eum an scaevola delicata. At maiorum interpretaris mea, sea nonumy deleniti in. At per inani reprehendunt, cum at iisque indoctum, cum an porro fabulas conceptam. No est prima tation, doming salutandi vim in, ea corpora dissentiunt definitionem sea.', 3, 1, CAST(0x0700000000004F410B AS DateTime2), N'../img/products/Generators/generator-valve.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 2, 20)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (4, N'Generator Valve', N'Test120', N'smod, cu eos habeo nullam prompta. Eum an scaevola delicata. At maiorum interpretaris mea, sea nonumy deleniti in. At per inani reprehendunt, cum at iisque indoctum, cum an porro fabulas conceptam. No est prima tation, doming salutandi vim in, ea corpora dissentiunt definitionem sea.', 4, 1, CAST(0x0700000000004F410B AS DateTime2), N'../img/products/Generators/generator-valve.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 2, 20)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (5, N'Gun Set', N'Test1299', N'smod, cu eos habeo nullam prompta. Eum an scaevola delicata. At maiorum interpretaris mea, sea nonumy deleniti in. At per inani reprehendunt, cum at iisque indoctum, cum an porro fabulas conceptam. No est prima tation, doming salutandi vim in, ea corpora dissentiunt definitionem sea.', 4, 1, CAST(0x0700000000004F410B AS DateTime2), N'../img/products/Generators/generator-valve.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 2, 20)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (6, N'Radiator', N'Test156', N'smod, cu eos habeo nullam prompta. Eum an scaevola delicata. At maiorum interpretaris mea, sea nonumy deleniti in. At per inani reprehendunt, cum at iisque indoctum, cum an porro fabulas conceptam. No est prima tation, doming salutandi vim in, ea corpora dissentiunt definitionem sea.', 4, 1, CAST(0x0700000000004F410B AS DateTime2), N'../img/products/Generators/generator-valve.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 2, 20)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (7, N'Capacitors', N'Test145', N'smod, cu eos habeo nullam prompta. Eum an scaevola delicata. At maiorum interpretaris mea, sea nonumy deleniti in. At per inani reprehendunt, cum at iisque indoctum, cum an porro fabulas conceptam. No est prima tation, doming salutandi vim in, ea corpora dissentiunt definitionem sea.', 6, 1, CAST(0x0700000000004F410B AS DateTime2), N'../img/products/Generators/generator-valve.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 5, 25)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (8, N'Heat Condenser', N'Test134', N'smod, cu eos habeo nullam prompta. Eum an scaevola delicata. At maiorum interpretaris mea, sea nonumy deleniti in. At per inani reprehendunt, cum at iisque indoctum, cum an porro fabulas conceptam. No est prima tation, doming salutandi vim in, ea corpora dissentiunt definitionem sea.', 7, 1, CAST(0x0700000000004F410B AS DateTime2), N'../img/products/Generators/generator-valve.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 6, 24)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (9, N'Air Filters', N'Test1278', N'smod, cu eos habeo nullam prompta. Eum an scaevola delicata. At maiorum interpretaris mea, sea nonumy deleniti in. At per inani reprehendunt, cum at iisque indoctum, cum an porro fabulas conceptam. No est prima tation, doming salutandi vim in, ea corpora dissentiunt definitionem sea.', 6, 1, CAST(0x0700000000004F410B AS DateTime2), N'../img/products/Generators/generator-valve.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 5, 24)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (10, N'Radiator', N'A9890', N'lkasdfjkhsdjj', 6, 1, CAST(0x0780F970D461AA410B AS DateTime2), NULL, CAST(7000.00 AS Decimal(18, 2)), CAST(7800.00 AS Decimal(18, 2)), 6, 24)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (11, N'Heat Condenser', N'A9899', N'lkasdfjkhsdjj', 7, 1, CAST(0x072751F1E683AA410B AS DateTime2), NULL, CAST(7000.00 AS Decimal(18, 2)), CAST(7800.00 AS Decimal(18, 2)), 6, 24)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (12, N'Radiator', N'A9500', N'lkasdfjkhsdjj', 6, 1, CAST(0x07648AFB5F8DAA410B AS DateTime2), NULL, CAST(4000.00 AS Decimal(18, 2)), CAST(4550.00 AS Decimal(18, 2)), 5, 25)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (13, N'Test', N'Test', N'Test', 6, 1, CAST(0x072E9C0E118BAB410B AS DateTime2), N'D:\projects\WebAppSastiService09102020\WebAppSastiServices\img\coming-soon.png', CAST(4000.00 AS Decimal(18, 2)), CAST(7800.00 AS Decimal(18, 2)), 5, 24)
INSERT [dbo].[STPServiceProductItems] ([ID], [ServiceProductName], [ServiceModelNo], [ServiceProductDescription], [STPProductBrandID], [IsAvailible], [CreatedDateTime], [ImageFilePath], [CostPrice], [SellingPrice], [FuelTypeId], [UnitTypeId]) VALUES (14, N'Test', N'Test', N'Test', 7, 1, CAST(0x07106399BA8CAB410B AS DateTime2), NULL, CAST(7000.00 AS Decimal(18, 2)), CAST(4550.00 AS Decimal(18, 2)), 5, 24)
SET IDENTITY_INSERT [dbo].[STPServiceProductItems] OFF
SET IDENTITY_INSERT [dbo].[STPServices] ON 

INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (1, N'Generator services', N'When you have a CVA with your Cat dealer, you have more time to do what you do best – run your business. Trained dealer technicians assist you by maintaining your equipment and driving down operating costs. In the end, everyone''s goal is the same: helping you get more work done at a lower cost.', 4, 1, CAST(0x0000AC3400000000 AS DateTime), 2, 21, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (4, N'Air Condition', N'Sunpal 48V DC Solar Panel Air Conditioner Off Grid Solar Air Conditioner Manufacturer Inverter Split Wall Mounted What Is Off-Grid Solar Air Conditioner:', 5, 1, CAST(0x0000AC3400000000 AS DateTime), 5, 24, CAST(900.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (6, N'CCTV', NULL, 6, 1, CAST(0x0000AC3400000000 AS DateTime), 12, 30, CAST(1200.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (8, N'UPS', NULL, 7, 1, CAST(0x0000AC3400000000 AS DateTime), 16, 32, CAST(2500.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (9, N'Solar System', NULL, 8, 1, CAST(0x0000AC3400000000 AS DateTime), 19, 38, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (13, N'Test', N'Test', 5, 1, CAST(0x0000AC4C011E7ACF AS DateTime), 5, 26, CAST(8000.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (1011, N'Test', N'Test', 5, 1, CAST(0x0000AC4D00B701E3 AS DateTime), 5, 25, CAST(8000.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (1012, N'Test', N'Test', 5, 1, CAST(0x0000AC4D00B920AF AS DateTime), 6, 22, CAST(9000.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (1015, N'Prevailance Mainntanance', N'General Service', 5, 1, CAST(0x0000AC4D00EA2F1B AS DateTime), 5, 25, CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (1016, N'Prevailance Mainntanance', N'General Service', 5, 1, CAST(0x0000AC4D00EA43AF AS DateTime), 5, 25, CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (1017, N'Water Leakage', N'General Service', 5, 1, CAST(0x0000AC3400000000 AS DateTime), 13, 30, CAST(1200.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (1018, N'Pipe Breakage', N'General Service', 5, 1, CAST(0x0000AC3400000000 AS DateTime), 13, 30, CAST(1200.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (1019, N'Monthly Inspection', NULL, 5, 1, CAST(0x0000AC5000DEFC96 AS DateTime), 6, 23, CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (1020, N'Ac over alling', NULL, 5, 1, CAST(0x0000AC5B011424EE AS DateTime), 5, 22, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (1021, N'Ac over alling', NULL, 5, 1, CAST(0x0000AC5B0119B7C3 AS DateTime), 4, 23, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (1022, N'breakdown', NULL, 5, 1, CAST(0x0000AC5B011AE98E AS DateTime), 6, 22, CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[STPServices] ([ID], [ServiceName], [ServiceDescrption], [STPServiceTypeID], [IsAvailible], [CreatedDateTime], [FuelTypeId], [UnitTypeId], [ServiceRate]) VALUES (2020, N'Water Leakage', NULL, 5, 1, CAST(0x0000AC5C00C86499 AS DateTime), 5, 24, CAST(3000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[STPServices] OFF
SET IDENTITY_INSERT [dbo].[STPServicesFuelTypes] ON 

INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (1, 4, N'Fuel Type', N'Petrol')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (2, 4, N'Fuel Type', N'Diesal')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (3, 4, N'Fuel Type', N'Gas')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (4, 5, N'AC Type', N'Windows')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (5, 5, N'AC Type', N'Split')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (6, 5, N'AC Type', N'Inverter')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (7, 6, N'Type', N'Default')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (8, 7, N'Type', N'Default')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (9, 8, N'Type', N'Default')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (10, 6, N'CCTV Type', N'C Mount')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (11, 6, N'CCTV Type', N'PTZ Pane Tilt')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (12, 6, N'CCTV Type', N'Network')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (13, 6, N'CCTV Type', N'Wireless')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (14, 6, N'CCTV Type', N'Infrared')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (15, 7, N'Brand - Model', N'Emerson K500')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (16, 7, N'Brand - Model', N'Emerson PS4090')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (17, 7, N'Brand - Model', N'Emerson LT0900')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (18, 8, N'Solar System Type', N'Grid Connect Solar')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (19, 8, N'Solar System Type', N'Grid Tie Solar')
INSERT [dbo].[STPServicesFuelTypes] ([ID], [STPServiceTypeID], [Label], [Options]) VALUES (20, 8, N'Solar System Type', N'Grid Feed Solar')
SET IDENTITY_INSERT [dbo].[STPServicesFuelTypes] OFF
SET IDENTITY_INSERT [dbo].[STPServicesUnitTypes] ON 

INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (1, N'1 KVA     ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (2, N'2 KVA     ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (3, N'3 KVA     ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (4, N'4 KVA     ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (5, N'5 KVA     ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (6, N'6 KVA     ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (7, N'7 KVA     ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (8, N'8 KVA     ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (9, N'9 KVA     ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (10, N'10 KVA    ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (11, N'20 KVA    ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (12, N'30 KVA    ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (13, N'50 KVA    ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (14, N'60 KVA    ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (15, N'80 KVA    ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (16, N'100 KVA   ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (17, N'150 KVA   ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (18, N'200 KVA   ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (19, N'250 KVA   ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (20, N'500 KVA   ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (21, N'1000 KVA  ', 4)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (22, N'1 Tons    ', 5)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (23, N'2 Tons    ', 5)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (24, N'3 Tons    ', 5)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (25, N'4 Tons    ', 5)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (26, N'5 Tons    ', 5)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (27, N'4 Port    ', 6)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (28, N'8 Port    ', 6)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (29, N'16 Port   ', 6)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (30, N'32 Port   ', 6)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (31, N'100 AMP   ', 7)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (32, N'200 AMP   ', 7)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (33, N'300 AMP   ', 7)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (34, N'400 AMP   ', 7)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (35, N'20 MW     ', 8)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (36, N'75 MW     ', 8)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (37, N'200 MW    ', 8)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (38, N'250 MW    ', 8)
INSERT [dbo].[STPServicesUnitTypes] ([ID], [Options], [STPServiceTypeID]) VALUES (39, N'500 MW    ', 8)
SET IDENTITY_INSERT [dbo].[STPServicesUnitTypes] OFF
SET IDENTITY_INSERT [dbo].[STPServiceType] ON 

INSERT [dbo].[STPServiceType] ([ID], [ServiceTypeName], [Description], [Datetime], [IsAvailible], [ImageFilePath]) VALUES (4, N'Generator', N'offers a choice of Annual Maintenance Contracts with definite response time and service quality. we provide Generator Repairing Services such as Diesel, & petrol Generator Repair Services.', CAST(0x0000AC3400000000 AS DateTime), 1, N'../img/services/powergen.jpg')
INSERT [dbo].[STPServiceType] ([ID], [ServiceTypeName], [Description], [Datetime], [IsAvailible], [ImageFilePath]) VALUES (5, N'Air Condition', N'We offers hassle free on call AC Repairing, Installation, Gas Filling and AC Maintenance Services', CAST(0x0000AC3400000000 AS DateTime), 1, N'../img/services/AC.jpg')
INSERT [dbo].[STPServiceType] ([ID], [ServiceTypeName], [Description], [Datetime], [IsAvailible], [ImageFilePath]) VALUES (6, N'CCTV Camera', N'With our track record of 100% success, we have never failed in delivering excellent CCTV Repair and maintenance service', CAST(0x0000AC3400000000 AS DateTime), 1, N'../img/services/AC.jpg')
INSERT [dbo].[STPServiceType] ([ID], [ServiceTypeName], [Description], [Datetime], [IsAvailible], [ImageFilePath]) VALUES (7, N'UPS', N'We provides the best professional UPS install and repair service for load shedding, UPS rewiring.', CAST(0x0000AC3400000000 AS DateTime), 1, N'../img/services/ups.png')
INSERT [dbo].[STPServiceType] ([ID], [ServiceTypeName], [Description], [Datetime], [IsAvailible], [ImageFilePath]) VALUES (8, N'Solar System', N'We take great pride in providing the best solar panel cleaning services for residential areas as well as commercial ones, we also do so much', CAST(0x0000AC3400000000 AS DateTime), 1, N'../img/services/SolarSystem.jpg')
SET IDENTITY_INSERT [dbo].[STPServiceType] OFF
SET IDENTITY_INSERT [dbo].[STPStatus] ON 

INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (1, 1, N'Cancelled')
INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (2, 1, N'Pending')
INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (3, 1, N'In Progress')
INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (5, 1, N'Availed')
INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (6, 1, N'Not Availed')
INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (7, 2, N'Active')
INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (8, 2, N'Not Active')
INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (9, 3, N'Active')
INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (10, 3, N'Not Active')
INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (11, 4, N'Active')
INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (12, 4, N'Not Active')
INSERT [dbo].[STPStatus] ([ID], [STPStatusTypeID], [Description]) VALUES (13, 1, N'Finished')
SET IDENTITY_INSERT [dbo].[STPStatus] OFF
SET IDENTITY_INSERT [dbo].[STPStatusType] ON 

INSERT [dbo].[STPStatusType] ([ID], [Description]) VALUES (1, N'Orders')
INSERT [dbo].[STPStatusType] ([ID], [Description]) VALUES (2, N'Services')
INSERT [dbo].[STPStatusType] ([ID], [Description]) VALUES (3, N'Products')
INSERT [dbo].[STPStatusType] ([ID], [Description]) VALUES (4, N'Vendors')
INSERT [dbo].[STPStatusType] ([ID], [Description]) VALUES (5, N'Suplliers')
SET IDENTITY_INSERT [dbo].[STPStatusType] OFF
SET IDENTITY_INSERT [dbo].[StpUser] ON 

INSERT [dbo].[StpUser] ([ID], [UserName], [EmailID], [Password], [Contact], [Address], [CreatedDate], [IsEmailVerified], [IsEmailActive], [ActivationCode], [ResetPasswordCode], [STPUserTypeID]) VALUES (0, N'Jawad Zaidi', N'sjrzaidi@hotmail.com', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'00923452456799', NULL, CAST(0x0000AC030155DED4 AS DateTime), 0, 0, N'ca9aac8a-21ae-40c2-b12b-c316881e0f0a', NULL, 0)
INSERT [dbo].[StpUser] ([ID], [UserName], [EmailID], [Password], [Contact], [Address], [CreatedDate], [IsEmailVerified], [IsEmailActive], [ActivationCode], [ResetPasswordCode], [STPUserTypeID]) VALUES (1001, N'Faiza', N'faiza923@gmail.com', N'B50E1B9B2AAEA5014EE2D67D74FF39FDF60342653A1F4207D2C0BC1B1E458E60', N'00923119988089', N'Karachi', CAST(0x0000AC5A00B25978 AS DateTime), 0, 0, N'd21c8d33-ab9a-4dd8-8e4b-d06526273746', NULL, 0)
INSERT [dbo].[StpUser] ([ID], [UserName], [EmailID], [Password], [Contact], [Address], [CreatedDate], [IsEmailVerified], [IsEmailActive], [ActivationCode], [ResetPasswordCode], [STPUserTypeID]) VALUES (1003, N'Areeba', N'aribajawed163@gmail.com', N'A98AC8CC65F1625E97047EB6E5D54911584A19F5D360A217002085BA6E9633E9', N'00923119988089', N'Karachi', CAST(0x0000AC5A00E9CCC0 AS DateTime), 0, 0, N'7ecb0041-a4f5-4dfe-82a1-8b5b5ef14a01', NULL, 0)
SET IDENTITY_INSERT [dbo].[StpUser] OFF
SET IDENTITY_INSERT [dbo].[StpUserType] ON 

INSERT [dbo].[StpUserType] ([ID], [UserType]) VALUES (0, N'Admin')
INSERT [dbo].[StpUserType] ([ID], [UserType]) VALUES (1, N'User')
INSERT [dbo].[StpUserType] ([ID], [UserType]) VALUES (2, N'Client')
INSERT [dbo].[StpUserType] ([ID], [UserType]) VALUES (3, N'Vendor')
SET IDENTITY_INSERT [dbo].[StpUserType] OFF
SET IDENTITY_INSERT [dbo].[TRNCustomerOrders] ON 

INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (3, N'Areeba', N'test@gmail.com', N'03119988089', N'test', N'test', CAST(0xB6410B00 AS Date), 4, 6, 13, 30, 6, CAST(0x07000000000089410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (5, N'gaba', N'test@gmail.com', N'067898765', N'test', N'test', CAST(0x69410B00 AS Date), 6, 6, 13, 30, 5, CAST(0x07000000000089410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (6, N'Areeba', N'test@gmail.com', N'03119988089', N'test', N'test', CAST(0x89410B00 AS Date), 2, 7, 16, 32, 5, CAST(0x07000000000089410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (7, N'Areeba', N'test@gmail.com', N'90909090909', N'test', N'test', CAST(0x86410B00 AS Date), 4, 5, 4, 24, 5, CAST(0x07000000000089410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (10, N'Aqsa', N'test@gmail.com', N'03119988089', N'karachi', N'test', CAST(0xA8410B00 AS Date), 4, 7, 16, 34, 6, CAST(0x07C6776A679BA4410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (12, N'Laiba', N'test@gmail.com', N'03998809809', N'Karachi', N'inspection', CAST(0xC6410B00 AS Date), 1, 6, 12, 28, 6, CAST(0x071AE67EC4A8A6410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (13, N'Laiba', N'test@gmail.com', N'03998809809', N'Karachi', N'inspection', CAST(0xB7410B00 AS Date), 3, 6, 13, 29, 6, CAST(0x0787071F2FA9A6410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (14, N'hasan', N'test@gmail.com', N'03998809809', N'Karachi', N'pipe leakage', CAST(0xB0410B00 AS Date), 2, 5, 5, 24, 13, CAST(0x075898AFD6A9A6410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (15, N'hasan', N'test@gmail.com', N'03998809809', N'Karachi', N'maintenance', CAST(0xAE410B00 AS Date), 6, 6, 12, 28, 6, CAST(0x072271DD21AAA6410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (16, N'Laiba', N'test@gmail.com', N'03998809809', N'Karachi', N'pipe leakage', CAST(0xB7410B00 AS Date), 3, 6, 11, 29, 6, CAST(0x073FF9F108B3A6410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (17, N'Laiba', N'test@gmail.com', N'03998809809', N'Karachi', N'pipe leakage', CAST(0xB6410B00 AS Date), 5, 7, 15, 33, 6, CAST(0x0765FBA4C9B3A6410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (18, N'Aslam', N'test@gmail.com', N'03119988089', N'KArachi', N'need ac service', CAST(0xA9410B00 AS Date), 3, 5, 6, 24, 5, CAST(0x07486BA27362AA410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (1018, N'Aslam', N'test@gmail.com', N'03119988089', N'KArachi', N'need camera repair service', CAST(0xAB410B00 AS Date), 3, 6, 12, 29, 6, CAST(0x0782EDD0D187AE410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (2018, N'Kamal Khan', N'test@gmail.com', N'03119988089', N'Hyderabad', N'need inspection service', CAST(0x1F420B00 AS Date), 2, 4, 2, 5, 6, CAST(0x07B5E0FD7854AF410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (2019, N'Uzair', N'test@gmail.com', N'03112299008', N'Larkana', N'need ac maintainance service', CAST(0xB9410B00 AS Date), 4, 5, 5, 24, 13, CAST(0x0772D10A506CAF410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (2020, N'laiq', N'test@gmail.com', N'03119988089', N'KArachi', N'need ac service', CAST(0xB7410B00 AS Date), 6, 5, 6, 24, 6, CAST(0x074223AFAC6CAF410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (3018, N'Aqsa', N'test@gmail.com', N'02909012398', N'karachi', N'need inspection service', CAST(0xBE410B00 AS Date), 6, 4, 2, 19, 6, CAST(0x072A81C70786B0410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (3019, N'Rehman', N'test@gmail.com', N'02909012398', N'test', N'test', CAST(0xB8410B00 AS Date), 3, 8, 20, 36, 6, CAST(0x07FF14DF5086B0410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (3020, N'Aqsa', N'test@gmail.com', N'03119988089', N'Karachi', N'test', CAST(0xB9410B00 AS Date), 4, 4, 3, 12, 6, CAST(0x076344718886B0410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (3021, N'test', N'test@gmail.com', N'03119988089', N'test', N'test', CAST(0xBF410B00 AS Date), 4, 7, 15, 32, 6, CAST(0x079129506587B0410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (3022, N'Aqsa', N'test@gmail.com', N'03119988089', N'test', N'test', CAST(0xAF410B00 AS Date), 4, 5, 6, 24, 6, CAST(0x07145A8CCE87B0410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (3023, N'Aslam', N'test@gmail.com', N'03119988089', N'Karachi', N'need camera repair service', CAST(0xB7410B00 AS Date), 5, 6, 12, 29, 6, CAST(0x07378EE27688B0410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (4018, N'Kamal Khan', N'test@gmail.com', N'03119988089', N'test', N'test', CAST(0xB7410B00 AS Date), 5, 6, 12, 29, 6, CAST(0x07D4CA684352B1410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (4019, N'Kamal Khan', N'test@gmail.com', N'03122222987', N'karachi', N'Need service', CAST(0xAF410B00 AS Date), 3, 4, 2, 12, 6, CAST(0x07B420E9F276B1410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (5018, N'Fazal', N'test@gmail.com', N'03122222987', N'karachi', N'test', CAST(0xBD410B00 AS Date), 2, 6, 12, 29, 6, CAST(0x0726E0D8E05BB4410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (5019, N'Usman', N'test@gmail.com', N'02909012398', N'karachi', N'test', CAST(0xA1410B00 AS Date), 3, 7, 17, 34, 6, CAST(0x0773DC9E0E5CB4410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (5020, N'Rehman', N'test@gmail.com', N'03122222987', N'Karachi', N'test', CAST(0xA8410B00 AS Date), 4, 4, 3, 16, 6, CAST(0x072BCB54785CB4410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (5021, N'Kamal Khan', N'test@gmail.com', N'02909012398', N'karachi', N'test', CAST(0xAB410B00 AS Date), 5, 6, 13, 28, 6, CAST(0x0782B556EC5CB4410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (5022, N'Jamal', N'test@gmail.com', N'03119988089', N'karachi', N'need inspection service', CAST(0xB6410B00 AS Date), 3, 4, 2, 16, 6, CAST(0x07B674014D62B4410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (5023, N'Kamal Khan', N'test@gmail.com', N'02909012398', N'karachi', N'need inspection service', CAST(0xA8410B00 AS Date), 4, 7, 15, 31, 6, CAST(0x0775F42A8C64B4410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (6018, N'Akber', N'test@gmail.com', N'03321987563', N'dch;cuhscdsuih', N's;iuchiuchcuh', CAST(0xBE410B00 AS Date), 3, 5, 5, 22, 5, CAST(0x07A14B25F78CB6410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (7018, N'test', N'test@gmail.com', N'02909012398', N'Karachi', N'test', CAST(0xA2410B00 AS Date), 4, 6, 11, 29, 6, CAST(0x07F35FA57659B7410B AS DateTime2))
INSERT [dbo].[TRNCustomerOrders] ([OrderId], [CustomerName], [Email], [Contact], [Address], [OrderDescription], [preferredDate], [preferredTimeID], [ServiceTypeId], [FuelTypeId], [UnitTypeId], [OrderStatusId], [CreateOn]) VALUES (7019, N'Rehman', N'aribajawed163@gmail.com', N'03119988089', N'karachi', N'test', CAST(0xC0410B00 AS Date), 3, 6, 11, 28, 6, CAST(0x07F725C42C75B8410B AS DateTime2))
SET IDENTITY_INSERT [dbo].[TRNCustomerOrders] OFF
SET IDENTITY_INSERT [dbo].[TRNCustomerOrders_STPProductItems] ON 

INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (3, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (4, 14, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (5, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (6, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (7, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (8, 14, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (9, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (10, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (11, 14, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (12, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (13, 14, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (14, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (15, 14, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1002, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1003, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1004, 2019, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1005, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1006, 2019, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1007, 2019, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1008, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1009, 2019, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1010, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1011, 2019, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1012, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1013, 2019, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1014, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1015, 2019, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1016, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1017, 2019, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1018, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1019, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1020, 2019, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1021, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1022, 2019, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1023, 18, 11)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1024, 18, 8)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1025, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1026, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1027, 14, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1028, 14, 0)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1029, 14, 0)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1030, 14, 0)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1031, 14, 0)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1032, 14, 0)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1033, 14, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1034, 14, 0)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1035, 14, 0)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1036, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1037, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1038, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1039, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1040, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1041, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1042, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1043, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1044, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1045, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1046, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1047, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1048, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1049, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1050, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1051, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1052, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1053, 14, 0)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1054, 14, 0)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1055, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1056, 14, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1057, 14, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1058, 14, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1059, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (1060, 2019, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2021, 2019, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2022, 2019, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2023, 2019, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2024, 2019, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2025, 14, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2026, 2019, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2027, 14, 14)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2028, 2019, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2029, 14, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2030, 18, 10)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2031, 2019, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2032, 2019, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2033, 2019, 13)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2034, 2019, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2035, 14, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2036, 14, 9)
INSERT [dbo].[TRNCustomerOrders_STPProductItems] ([ID], [TRNCustomerOrderID], [STPProductItemsID]) VALUES (2037, 14, 9)
SET IDENTITY_INSERT [dbo].[TRNCustomerOrders_STPProductItems] OFF
SET IDENTITY_INSERT [dbo].[TRNCustomerOrders_STPServices] ON 

INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (3, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (4, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (5, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (6, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (7, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (8, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (9, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (10, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (11, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (12, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (13, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (14, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (15, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (16, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (17, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (18, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (19, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (20, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (21, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (22, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (23, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (24, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (25, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (26, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (27, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (28, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (29, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (30, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (31, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (32, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (33, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (34, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (35, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (36, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (37, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (38, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (39, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (40, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (41, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (42, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (43, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (44, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (45, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (46, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (47, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (48, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (49, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (50, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (51, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (52, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (53, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (54, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (55, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (56, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (57, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (58, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (59, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (60, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (61, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (62, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1002, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1003, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1004, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1005, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1006, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1007, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1008, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1009, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1010, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1011, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1012, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1013, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1014, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1015, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1016, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1017, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1018, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1019, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1020, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1021, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1022, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1023, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1024, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1025, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1026, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1027, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1028, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1029, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1030, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1031, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1032, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1033, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1034, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1035, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1036, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1037, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1038, 14, 2020)
GO
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1039, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1040, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (1041, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2002, 2019, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2003, 2019, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2004, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2005, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2006, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2007, 5, 1018)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2008, 6, 8)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2009, 6, 8)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2010, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2011, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2012, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2013, 5, 1017)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2014, 2019, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2015, 6018, 1020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2016, 2019, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2017, 2019, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2018, 6018, 1020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2019, 14, 4)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2020, 14, 2020)
INSERT [dbo].[TRNCustomerOrders_STPServices] ([ID], [TRNCustomerOrderID], [STPServicesID]) VALUES (2021, 14, 4)
SET IDENTITY_INSERT [dbo].[TRNCustomerOrders_STPServices] OFF
SET IDENTITY_INSERT [dbo].[TRNInvoice] ON 

INSERT [dbo].[TRNInvoice] ([ID], [STPOrdersID], [ProductItemCharges], [ServiceCharges], [PlatformCharges], [TotalAmount], [GSTTax], [SpecialDiscount]) VALUES (1013, 14, CAST(250.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), CAST(1168.00 AS Decimal(18, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TRNInvoice] OFF
ALTER TABLE [dbo].[StpUser] ADD  CONSTRAINT [DF__StpUser__Created__1273C1CD]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[StpUser] ADD  CONSTRAINT [DF_StpUser_UserTypeID]  DEFAULT ((1)) FOR [STPUserTypeID]
GO
ALTER TABLE [dbo].[STPProductBrand]  WITH CHECK ADD  CONSTRAINT [FK_STPProductBrand_STPProductType] FOREIGN KEY([STPProductTypeID])
REFERENCES [dbo].[STPProductType] ([ID])
GO
ALTER TABLE [dbo].[STPProductBrand] CHECK CONSTRAINT [FK_STPProductBrand_STPProductType]
GO
ALTER TABLE [dbo].[STPServiceProductItems]  WITH CHECK ADD  CONSTRAINT [FK_STPProductItems_STPProductBrand] FOREIGN KEY([STPProductBrandID])
REFERENCES [dbo].[STPProductBrand] ([ID])
GO
ALTER TABLE [dbo].[STPServiceProductItems] CHECK CONSTRAINT [FK_STPProductItems_STPProductBrand]
GO
ALTER TABLE [dbo].[STPServiceProductItems]  WITH CHECK ADD  CONSTRAINT [FK_STPProductItems_STPServicesFuelTypes] FOREIGN KEY([FuelTypeId])
REFERENCES [dbo].[STPServicesFuelTypes] ([ID])
GO
ALTER TABLE [dbo].[STPServiceProductItems] CHECK CONSTRAINT [FK_STPProductItems_STPServicesFuelTypes]
GO
ALTER TABLE [dbo].[STPServiceProductItems]  WITH CHECK ADD  CONSTRAINT [FK_STPProductItems_STPServicesUnitTypes] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[STPServicesUnitTypes] ([ID])
GO
ALTER TABLE [dbo].[STPServiceProductItems] CHECK CONSTRAINT [FK_STPProductItems_STPServicesUnitTypes]
GO
ALTER TABLE [dbo].[STPServices]  WITH CHECK ADD  CONSTRAINT [FK_STPServices_STPServicesFuelTypes] FOREIGN KEY([FuelTypeId])
REFERENCES [dbo].[STPServicesFuelTypes] ([ID])
GO
ALTER TABLE [dbo].[STPServices] CHECK CONSTRAINT [FK_STPServices_STPServicesFuelTypes]
GO
ALTER TABLE [dbo].[STPServices]  WITH CHECK ADD  CONSTRAINT [FK_STPServices_STPServicesUnitTypes] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[STPServicesUnitTypes] ([ID])
GO
ALTER TABLE [dbo].[STPServices] CHECK CONSTRAINT [FK_STPServices_STPServicesUnitTypes]
GO
ALTER TABLE [dbo].[STPServices]  WITH CHECK ADD  CONSTRAINT [FK_STPServices_STPServiceType] FOREIGN KEY([STPServiceTypeID])
REFERENCES [dbo].[STPServiceType] ([ID])
GO
ALTER TABLE [dbo].[STPServices] CHECK CONSTRAINT [FK_STPServices_STPServiceType]
GO
ALTER TABLE [dbo].[STPServicesFuelTypes]  WITH CHECK ADD  CONSTRAINT [FK_STPDependent_STPServiceType] FOREIGN KEY([STPServiceTypeID])
REFERENCES [dbo].[STPServiceType] ([ID])
GO
ALTER TABLE [dbo].[STPServicesFuelTypes] CHECK CONSTRAINT [FK_STPDependent_STPServiceType]
GO
ALTER TABLE [dbo].[STPServicesFuelTypes]  WITH CHECK ADD  CONSTRAINT [FK_STPServicesFuelTypes_STPServiceType] FOREIGN KEY([STPServiceTypeID])
REFERENCES [dbo].[STPServiceType] ([ID])
GO
ALTER TABLE [dbo].[STPServicesFuelTypes] CHECK CONSTRAINT [FK_STPServicesFuelTypes_STPServiceType]
GO
ALTER TABLE [dbo].[STPServicesUnitTypes]  WITH CHECK ADD  CONSTRAINT [FK_STPServicesUnitTypes_STPServiceType] FOREIGN KEY([STPServiceTypeID])
REFERENCES [dbo].[STPServiceType] ([ID])
GO
ALTER TABLE [dbo].[STPServicesUnitTypes] CHECK CONSTRAINT [FK_STPServicesUnitTypes_STPServiceType]
GO
ALTER TABLE [dbo].[STPStatus]  WITH CHECK ADD  CONSTRAINT [FK_STPStatus_STPStatusType] FOREIGN KEY([STPStatusTypeID])
REFERENCES [dbo].[STPStatusType] ([ID])
GO
ALTER TABLE [dbo].[STPStatus] CHECK CONSTRAINT [FK_STPStatus_STPStatusType]
GO
ALTER TABLE [dbo].[StpUser]  WITH CHECK ADD  CONSTRAINT [FK_StpUser_StpUserType] FOREIGN KEY([STPUserTypeID])
REFERENCES [dbo].[StpUserType] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StpUser] CHECK CONSTRAINT [FK_StpUser_StpUserType]
GO
ALTER TABLE [dbo].[TRNCustomerOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrders_STPPrefferedTime] FOREIGN KEY([preferredTimeID])
REFERENCES [dbo].[STPPrefferedTime] ([ID])
GO
ALTER TABLE [dbo].[TRNCustomerOrders] CHECK CONSTRAINT [FK_CustomerOrders_STPPrefferedTime]
GO
ALTER TABLE [dbo].[TRNCustomerOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrders_STPServicesFuelTypes] FOREIGN KEY([FuelTypeId])
REFERENCES [dbo].[STPServicesFuelTypes] ([ID])
GO
ALTER TABLE [dbo].[TRNCustomerOrders] CHECK CONSTRAINT [FK_CustomerOrders_STPServicesFuelTypes]
GO
ALTER TABLE [dbo].[TRNCustomerOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrders_STPServicesUnitTypes] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[STPServicesUnitTypes] ([ID])
GO
ALTER TABLE [dbo].[TRNCustomerOrders] CHECK CONSTRAINT [FK_CustomerOrders_STPServicesUnitTypes]
GO
ALTER TABLE [dbo].[TRNCustomerOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrders_STPServiceType] FOREIGN KEY([ServiceTypeId])
REFERENCES [dbo].[STPServiceType] ([ID])
GO
ALTER TABLE [dbo].[TRNCustomerOrders] CHECK CONSTRAINT [FK_CustomerOrders_STPServiceType]
GO
ALTER TABLE [dbo].[TRNCustomerOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrders_STPStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[STPStatus] ([ID])
GO
ALTER TABLE [dbo].[TRNCustomerOrders] CHECK CONSTRAINT [FK_CustomerOrders_STPStatus]
GO
ALTER TABLE [dbo].[TRNInvoice]  WITH CHECK ADD  CONSTRAINT [FK_TRNInvoice_TRNCustomerOrders] FOREIGN KEY([STPOrdersID])
REFERENCES [dbo].[TRNCustomerOrders] ([OrderId])
GO
ALTER TABLE [dbo].[TRNInvoice] CHECK CONSTRAINT [FK_TRNInvoice_TRNCustomerOrders]
GO
