USE [Prasant]
GO
/****** Object:  Table [dbo].[Product_Master]    Script Date: 13-05-2023 12.50.28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Master](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[Catagory_Id] [int] NULL,
	[Catagory] [varchar](50) NULL,
 CONSTRAINT [PK_Product_Master] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Catagory]    Script Date: 13-05-2023 12.50.28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Catagory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Catagory_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_Catagory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product_Master] ON 

INSERT [dbo].[Product_Master] ([ProductId], [ProductName], [Catagory_Id], [Catagory]) VALUES (16, N'mobile', 1, N'1')
INSERT [dbo].[Product_Master] ([ProductId], [ProductName], [Catagory_Id], [Catagory]) VALUES (17, N'sim', 2, N'2')
SET IDENTITY_INSERT [dbo].[Product_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Catagory] ON 

INSERT [dbo].[Tbl_Catagory] ([id], [Catagory_Name]) VALUES (1, N'rawmatarial')
INSERT [dbo].[Tbl_Catagory] ([id], [Catagory_Name]) VALUES (2, N'digital')
SET IDENTITY_INSERT [dbo].[Tbl_Catagory] OFF
GO
ALTER TABLE [dbo].[Product_Master]  WITH CHECK ADD  CONSTRAINT [FK_Product_Master_Tbl_Catagory] FOREIGN KEY([Catagory_Id])
REFERENCES [dbo].[Tbl_Catagory] ([id])
GO
ALTER TABLE [dbo].[Product_Master] CHECK CONSTRAINT [FK_Product_Master_Tbl_Catagory]
GO
