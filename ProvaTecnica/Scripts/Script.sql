USE [master]
GO
/****** Object:  Database [DBVendas]    Script Date: 26/11/2021 03:59:59 ******/
CREATE DATABASE [DBVendas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBVendas', FILENAME = N'C:\Sistemas\Dados\DBVendas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBVendas_log', FILENAME = N'C:\Sistemas\Dados\DBVendas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBVendas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBVendas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBVendas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBVendas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBVendas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBVendas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBVendas] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBVendas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBVendas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBVendas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBVendas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBVendas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBVendas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBVendas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBVendas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBVendas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBVendas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBVendas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBVendas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBVendas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBVendas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBVendas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBVendas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBVendas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBVendas] SET RECOVERY FULL 
GO
ALTER DATABASE [DBVendas] SET  MULTI_USER 
GO
ALTER DATABASE [DBVendas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBVendas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBVendas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBVendas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBVendas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBVendas', N'ON'
GO
ALTER DATABASE [DBVendas] SET QUERY_STORE = OFF
GO
USE [DBVendas]
GO
/****** Object:  User [Vendedor]    Script Date: 26/11/2021 03:59:59 ******/
CREATE USER [Vendedor] FOR LOGIN [Vendedor] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sa]    Script Date: 26/11/2021 03:59:59 ******/
CREATE USER [sa] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Vendedor]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Vendedor]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Vendedor]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Vendedor]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [sa]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [sa]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [sa]
GO
ALTER ROLE [db_datareader] ADD MEMBER [sa]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [sa]
GO
/****** Object:  Table [dbo].[TB_CategoriaPLS]    Script Date: 26/11/2021 04:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CategoriaPLS](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](60) NULL,
 CONSTRAINT [PK_TB_CategoriaPLS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Clientes]    Script Date: 26/11/2021 04:00:00 ******/
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
/****** Object:  Table [dbo].[TB_Corretor]    Script Date: 26/11/2021 04:00:00 ******/
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
/****** Object:  Table [dbo].[TB_MovtoItens]    Script Date: 26/11/2021 04:00:00 ******/
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
/****** Object:  Table [dbo].[TB_MovtoVenda]    Script Date: 26/11/2021 04:00:00 ******/
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
/****** Object:  Table [dbo].[TB_Operadoras]    Script Date: 26/11/2021 04:00:00 ******/
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
/****** Object:  Table [dbo].[TB_ProdutoPLS]    Script Date: 26/11/2021 04:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ProdutoPLS](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DescricaoProd] [varchar](100) NULL,
	[ID_Categoria] [bigint] NOT NULL,
 CONSTRAINT [PK_TB_ProdutoPLS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TabelaPreco]    Script Date: 26/11/2021 04:00:00 ******/
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
ALTER TABLE [dbo].[TB_ProdutoPLS]  WITH CHECK ADD  CONSTRAINT [FK_TB_CategoriaPLS_TB_ProdutoPLS] FOREIGN KEY([ID_Categoria])
REFERENCES [dbo].[TB_CategoriaPLS] ([ID])
GO
ALTER TABLE [dbo].[TB_ProdutoPLS] CHECK CONSTRAINT [FK_TB_CategoriaPLS_TB_ProdutoPLS]
GO
ALTER TABLE [dbo].[TB_TabelaPreco]  WITH CHECK ADD  CONSTRAINT [FK_TB_TabelaPreco_TB_TabelaProduto] FOREIGN KEY([ID_Produto])
REFERENCES [dbo].[TB_ProdutoPLS] ([ID])
GO
ALTER TABLE [dbo].[TB_TabelaPreco] CHECK CONSTRAINT [FK_TB_TabelaPreco_TB_TabelaProduto]
GO
USE [master]
GO
ALTER DATABASE [DBVendas] SET  READ_WRITE 
GO
