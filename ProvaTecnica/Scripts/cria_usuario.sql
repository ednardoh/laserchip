USE [master]
GO
CREATE LOGIN [Vendedor] WITH PASSWORD=N'sql2019', DEFAULT_DATABASE=[DBVendas], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
use [DBVendas];
GO
use [master];
GO
USE [DBVendas]
GO
CREATE USER [Vendedor] FOR LOGIN [Vendedor]
GO
USE [DBVendas]
GO
ALTER USER [Vendedor] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [DBVendas]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Vendedor]
GO
USE [DBVendas]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Vendedor]
GO
USE [DBVendas]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Vendedor]
GO
USE [DBVendas]
GO
ALTER ROLE [db_owner] ADD MEMBER [Vendedor]
GO
