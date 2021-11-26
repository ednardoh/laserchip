USE [DBVendas]
GO

/****** Object:  Table [dbo].[TB_Corretor]    Script Date: 23/11/2021 01:45:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_Corretor](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](60) NULL,
	[CPF] [varchar](15) NULL,
	[DT_Nascimento] [date] NULL,
	[Celular] [varchar](15) NULL,
 CONSTRAINT [PK_TB_Corretor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

