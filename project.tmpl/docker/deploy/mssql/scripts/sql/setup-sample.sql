

USE [DWD]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [DW_ETL].[suppliers](
	[id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[type] [varchar](255) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK__supplier__3213E83F7D0FB0F6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


INSERT [DW_ETL].[suppliers] (id, name, [type], created_at, updated_at) VALUES 
('1', 'Booktopia', 'book', '2024-06-18 00:22:25.867', '2024-06-18 00:22:25.867'),
('2', 'Readers World', 'book', '2024-06-18 00:22:25.880', '2024-06-18 00:22:25.880'),
('3', 'Novel Ideas', 'book', '2024-06-18 00:22:25.883', '2024-06-18 00:22:25.883'),
('4', 'Page Turners', 'book', '2024-06-18 00:22:25.887', '2024-06-18 00:22:25.887'),
('5', 'Literary Finds', 'book', '2024-06-18 00:22:25.887', '2024-06-18 00:22:25.887'),
('6', 'Tales & Covers', 'book', '2024-06-18 00:22:25.890', '2024-06-18 00:22:25.890'),
('7', 'Fiction House', 'book', '2024-06-18 00:22:25.890', '2024-06-18 00:22:25.890'),
('8', 'The Reading Room', 'book', '2024-06-18 00:22:25.893', '2024-06-18 00:22:25.893'),
('9', 'Book Haven', 'book', '2024-06-18 00:22:25.893', '2024-06-18 00:22:25.893'),
('10', 'Epic Reads', 'book', '2024-06-18 00:22:25.897', '2024-06-18 00:22:25.897'),
('11', 'Storyline Supply', 'book', '2024-06-18 00:22:25.900', '2024-06-18 00:22:25.900'),
('12', 'Prologue Profiles', 'book', '2024-06-18 00:22:25.900', '2024-06-18 00:22:25.900'),
('13', 'Auto Alliance', 'vehicle', '2024-06-18 00:22:41.003', '2024-06-18 00:22:41.003'),
('14', 'Motor Masters', 'vehicle', '2024-06-18 00:22:41.003', '2024-06-18 00:22:41.003'),
('15', 'Wheel Deals', 'vehicle', '2024-06-18 00:22:41.007', '2024-06-18 00:22:41.007'),
('16', 'Drive Dynamics', 'vehicle', '2024-06-18 00:22:41.010', '2024-06-18 00:22:41.010'),
('17', 'Car Connections', 'vehicle', '2024-06-18 00:22:41.010', '2024-06-18 00:22:41.010'),
('18', 'Speedy Suppliers', 'vehicle', '2024-06-18 00:22:41.013', '2024-06-18 00:22:41.013'),
('19', 'Ride Retailers', 'vehicle', '2024-06-18 00:22:41.013', '2024-06-18 00:22:41.013'),
('20', 'Vehicular Vendors', 'vehicle', '2024-06-18 00:22:41.017', '2024-06-18 00:22:41.017');



CREATE TABLE [DW_ETL].[orders_demo00](
	[id] [bigint] NOT NULL,
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


-- SET IDENTITY_INSERT DWD.DW_ETL.orders_demo00 ON;
  
INSERT INTO DWD.DW_ETL.orders_demo00 (id, order_id, supplier_id, item_id, status, qty, net_price, issued_at, completed_at, spec, created_at, updated_at)
  VALUES 
('1164014', '359a5cc6-e9c8-4e5b-9682-6f79f9b691b4', '13', '54', 'delivered', '1400', '2600', '2024-10-02 03:47:02.860', '2024-10-02 03:47:02.860', '{"type": "vehicle", "spec": {"Year": 2012, "Make": "Volkswagen", "Model": "Eos", "Category": "Convertible"}}', '2024-10-02 03:47:02.860', '2024-10-02 15:32:32.610'),
('1164015', '6a673fac-af7e-483c-ad60-05b1df7a8527', '14', '41', 'delivered', '100', '1980', '2024-10-02 03:47:09.877', '2024-10-02 03:47:09.877', '{"type": "vehicle", "spec": {"Year": 2019, "Make": "Toyota", "Model": "Tundra CrewMax", "Category": "Pickup"}}', '2024-10-02 03:47:09.877', '2024-10-02 09:11:02.070'),
('1164016', 'b9519cf9-97e6-4889-9f52-c01a16a37cc1', '9', '20', 'completed', '100', '3200', '2024-10-02 03:47:16.903', '2024-10-02 03:47:16.903', '{"type": "music", "spec": {"genre": "Tex-Mex", "subgenres": ["Chicano", "Classic", "Conjunto", "Conjunto Progressive", "New Mex", "Tex-Mex"]}}', '2024-10-02 03:47:16.903', '2024-10-02 04:16:34.867')
;