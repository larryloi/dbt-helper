

USE [inventory]
GO

/****** Object:  Table [INV].[orders_demo00]    Script Date: 2024/10/2 上午 03:58:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [INV].[orders_demo00](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [nvarchar](36) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[qty] [int] NOT NULL,
	[net_price] [int] NOT NULL,
	[issued_at] [datetime] NOT NULL,
	[completed_at] [datetime] NULL,
	[spec] [nvarchar](4000) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_orders_demo00] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

