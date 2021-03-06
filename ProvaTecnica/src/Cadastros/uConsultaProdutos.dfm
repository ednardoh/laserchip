inherited frmConsultaProdutos: TfrmConsultaProdutos
  Caption = 'Consulta de Produtos PLS'
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
        Name = 'DescricaoProd'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ID_Categoria'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    object TB_ConsultaID: TIntegerField
      DisplayWidth = 8
      FieldName = 'ID'
      Visible = False
    end
    object TB_ConsultaDescricaoProd: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      DisplayWidth = 91
      FieldName = 'DescricaoProd'
      Size = 60
    end
    object TB_ConsultaID_Categoria: TStringField
      DisplayLabel = 'Categoria'
      DisplayWidth = 63
      FieldName = 'ID_Categoria'
      Visible = False
    end
    object TB_ConsultaDescricaoCategoria: TStringField
      DisplayLabel = 'Descri'#231#227'o da Categoria'
      FieldKind = fkLookup
      FieldName = 'DescricaoCategoria'
      LookupDataSet = frmDatamodulo.TB_Categoria
      LookupKeyFields = 'ID'
      LookupResultField = 'Descricao'
      KeyFields = 'ID_Categoria'
      Size = 60
      Lookup = True
    end
  end
end
