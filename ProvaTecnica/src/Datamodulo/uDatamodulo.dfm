object frmDatamodulo: TfrmDatamodulo
  OldCreateOrder = False
  Height = 301
  Width = 409
  object dsPesquisa: TDataSource
    Left = 184
    Top = 24
  end
  object dsClientes: TDataSource
    Left = 274
    Top = 24
  end
  object dsCategoria: TDataSource
    Left = 266
    Top = 156
  end
  object DBConect: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Database=DBVendas'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 16
    Top = 24
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 192
    Top = 88
  end
  object QryAux: TFDQuery
    Connection = DBConect
    Left = 64
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 328
    Top = 88
  end
  object TB_Categoria: TFDQuery
    Connection = DBConect
    SQL.Strings = (
      'SELECT * FROM TB_CATEGORIAPLS')
    Left = 328
    Top = 152
  end
  object TB_Prduto: TFDQuery
    Connection = DBConect
    SQL.Strings = (
      'SELECT * FROM TB_ProdutoPLS')
    Left = 328
    Top = 216
  end
  object dsProdutoPLS: TDataSource
    DataSet = TB_Prduto
    Left = 266
    Top = 220
  end
end
