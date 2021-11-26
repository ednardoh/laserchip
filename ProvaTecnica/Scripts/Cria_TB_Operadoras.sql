USE [DBVendas]
GO

/****** Object:  Table [dbo].[TB_Operadoras]    Script Date: 22/11/2021 21:34:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_Operadoras](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Cnpj] [varchar](20) NULL,
	[RazaoSocial] [varchar](100) NULL,
	[Cep] [varchar](15) NULL,
	[Logradouro] [varchar](100) NULL,
	[Numero] [varchar](10) NULL,
	[Complemento] [varchar](100) NULL,
	[Bairro] [varchar](60) NULL,
	[Cidade] [varchar](60) NULL,
	[Ibge_cidade] [varchar](15) NULL,
	[Sigla_uf] [varchar](2) NULL,
	[Ibge_uf] [varchar](15) NULL,
	[Logo] [text] NULL,
 CONSTRAINT [PK_TB_Operadoras] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


