USE [DBVendas]
GO

/****** Object:  Table [dbo].[TB_Clientes]    Script Date: 21/11/2021 17:51:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_Clientes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CpfCnpj] [varchar](20) NULL,
	[Nome] [varchar](100) NULL,
	[Cep] [varchar](15) NULL,
	[Logradouro] [varchar](100) NULL,
	[Numero] [varchar](10) NULL,
	[Complemento] [varchar](100) NULL,
	[Bairro] [varchar](60) NULL,
	[Cidade] [varchar](60) NULL,
	[Ibge_cidade] [varchar](15) NULL,
	[Sigla_uf] [varchar](2) NULL,
	[Ibge_uf] [varchar](15) NULL,
 CONSTRAINT [PK_TB_Clientes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


