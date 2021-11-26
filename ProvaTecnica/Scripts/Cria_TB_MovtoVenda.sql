USE [DBVendas]
GO

/****** Object:  Table [dbo].[TB_MovtoVenda]    Script Date: 25/11/2021 01:23:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_MovtoVenda](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Corretor] [bigint] NOT NULL,
	[ID_Cliente] [bigint] NOT NULL,
	[ID_Operadora] [bigint] NOT NULL,
	[NumOrcamento] [bigint] NULL,
	[DataEmissao] [date] NULL,
	[DataValidade] [date] NULL,
 CONSTRAINT [PK_TB_MovtoVenda] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_MovtoVenda]  WITH CHECK ADD  CONSTRAINT [FK_TB_MovtoVenda_TB_Cliente] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[TB_Clientes] ([ID])
GO

ALTER TABLE [dbo].[TB_MovtoVenda] CHECK CONSTRAINT [FK_TB_MovtoVenda_TB_Cliente]
GO

ALTER TABLE [dbo].[TB_MovtoVenda]  WITH CHECK ADD  CONSTRAINT [FK_TB_MovtoVenda_TB_Corretor] FOREIGN KEY([ID_Corretor])
REFERENCES [dbo].[TB_Corretor] ([ID])
GO

ALTER TABLE [dbo].[TB_MovtoVenda] CHECK CONSTRAINT [FK_TB_MovtoVenda_TB_Corretor]
GO

ALTER TABLE [dbo].[TB_MovtoVenda]  WITH CHECK ADD  CONSTRAINT [FK_TB_MovtoVenda_TB_Operadora] FOREIGN KEY([ID_Operadora])
REFERENCES [dbo].[TB_Operadoras] ([ID])
GO

ALTER TABLE [dbo].[TB_MovtoVenda] CHECK CONSTRAINT [FK_TB_MovtoVenda_TB_Operadora]
GO


