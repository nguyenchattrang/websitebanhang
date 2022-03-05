USE [Assignment]
GO

/****** Object:  Table [dbo].[Product_Media]    Script Date: 03/05/2022 21:56:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Product_Media](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alt] [nvarchar](200) NULL,
	[link] [nvarchar](300) NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_Product_Media] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

