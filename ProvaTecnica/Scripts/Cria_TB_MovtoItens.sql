USE [DBVendas]
GO

/****** Object:  Table [dbo].[TB_MovtoItens]    Script Date: 25/11/2021 01:42:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_MovtoItens](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_MovtoVenda] [bigint] NOT NULL,
	[ID_Produto] [bigint] NOT NULL,
	[ID_Tabpreco] [bigint] NOT NULL,
	[PrecoProduto] [numeric](18, 2) NULL,
	[Desconto] [numeric](18, 2) NULL,
	[Quantidade] [numeric](18, 2) NULL,
	[ValorTotal] [numeric](18, 2) NULL,
 CONSTRAINT [PK_TB_MovtoItens] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_MovtoItens]  WITH CHECK ADD  CONSTRAINT [FK_TB_MovtoItens_TB_MovtoVenda] FOREIGN KEY([ID_MovtoVenda])
REFERENCES [dbo].[TB_MovtoVenda] ([ID])
GO

ALTER TABLE [dbo].[TB_MovtoItens] CHECK CONSTRAINT [FK_TB_MovtoItens_TB_MovtoVenda]
GO

ALTER TABLE [dbo].[TB_MovtoItens]  WITH CHECK ADD  CONSTRAINT [FK_TB_MovtoItens_TB_Produtos] FOREIGN KEY([ID_Produto])
REFERENCES [dbo].[TB_ProdutoPLS] ([ID])
GO

ALTER TABLE [dbo].[TB_MovtoItens] CHECK CONSTRAINT [FK_TB_MovtoItens_TB_Produtos]
GO

ALTER TABLE [dbo].[TB_MovtoItens]  WITH CHECK ADD  CONSTRAINT [FK_TB_MovtoItens_TB_TabPreco] FOREIGN KEY([ID_Tabpreco])
REFERENCES [dbo].[TB_TabelaPreco] ([ID])
GO

ALTER TABLE [dbo].[TB_MovtoItens] CHECK CONSTRAINT [FK_TB_MovtoItens_TB_TabPreco]
GO


