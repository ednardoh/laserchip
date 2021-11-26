USE [DBVendas]
GO

/****** Object:  Table [dbo].[TB_TabelaPreco]    Script Date: 24/11/2021 03:45:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_TabelaPreco](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Produto] [bigint] NOT NULL,
	[PercDesconto] [numeric](9, 2) NULL,
	[PrecoProduto] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TB_TabelaPreco] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_TabelaPreco]  WITH CHECK ADD  CONSTRAINT [FK_TB_TabelaPreco_TB_TabelaProduto] FOREIGN KEY([ID_Produto])
REFERENCES [dbo].[TB_ProdutoPLS] ([ID])
GO

ALTER TABLE [dbo].[TB_TabelaPreco] CHECK CONSTRAINT [FK_TB_TabelaPreco_TB_TabelaProduto]
GO


