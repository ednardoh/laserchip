inherited frmConsultaTabPreco: TfrmConsultaTabPreco
  Caption = 'Consulta de Tabela de Pre'#231'o'
  ClientHeight = 484
  ClientWidth = 1159
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  ExplicitWidth = 1175
  ExplicitHeight = 523
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_Client_Cad: TPanel
    Width = 991
    Height = 484
    ExplicitWidth = 991
    ExplicitHeight = 484
    inherited DBG_Cad: TDBGrid
      Width = 991
      Height = 484
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      OnCellClick = DBG_CadCellClick
    end
  end
  inherited pn_Left_Cad: TPanel
    Left = 991
    Height = 484
    ExplicitLeft = 991
    ExplicitHeight = 484
    inherited btn_Filtrar: TSpeedButton
      Left = 8
      Top = 9
      OnClick = btn_FiltrarClick
      ExplicitLeft = 8
      ExplicitTop = 9
    end
    inherited btn_Todos: TSpeedButton
      Left = 8
      Top = 71
      OnClick = btn_TodosClick
      ExplicitLeft = 8
      ExplicitTop = 71
    end
    inherited btn_Incluir: TSpeedButton
      Left = 8
      Top = 134
      OnClick = btn_IncluirClick
      ExplicitLeft = 8
      ExplicitTop = 134
    end
    inherited btn_Alterar: TSpeedButton
      Left = 8
      Top = 198
      OnClick = btn_AlterarClick
      ExplicitLeft = 8
      ExplicitTop = 198
    end
    inherited btn_Excluir: TSpeedButton
      Left = 8
      Top = 261
      OnClick = btn_ExcluirClick
      ExplicitLeft = 8
      ExplicitTop = 261
    end
    inherited btn_Consultar: TSpeedButton
      Left = 8
      Top = 322
      OnClick = btn_ConsultarClick
      ExplicitLeft = 8
      ExplicitTop = 322
    end
    inherited btn_Sair: TSpeedButton
      Left = 8
      Top = 431
      OnClick = btn_SairClick
      ExplicitLeft = 8
      ExplicitTop = 431
    end
  end
  inherited TB_Consulta: TClientDataSet
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'PercDesconto'
        DataType = ftCurrency
      end
      item
        Name = 'PrecoProduto'
        DataType = ftCurrency
      end>
    StoreDefs = True
    object TB_ConsultaID: TIntegerField
      DisplayWidth = 8
      FieldName = 'ID'
      Visible = False
    end
    object TB_ConsultaID_Produto: TIntegerField
      DisplayLabel = 'ID. Produto'
      DisplayWidth = 12
      FieldName = 'ID_Produto'
    end
    object TB_ConsultaDescrProduto: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      DisplayWidth = 106
      FieldKind = fkLookup
      FieldName = 'DescrProduto'
      LookupDataSet = frmDatamodulo.TB_Prduto
      LookupKeyFields = 'ID'
      LookupResultField = 'DescricaoProd'
      KeyFields = 'ID_Produto'
      Size = 100
      Lookup = True
    end
    object TB_ConsultaPercDesconto: TCurrencyField
      DisplayLabel = 'Perc. Produto %'
      DisplayWidth = 14
      FieldName = 'PercDesconto'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object TB_ConsultaPrecoProduto: TCurrencyField
      DisplayLabel = 'Pre'#231'o Produto R$'
      DisplayWidth = 15
      FieldName = 'PrecoProduto'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
end
