inherited frmCadProdutos: TfrmCadProdutos
  Caption = 'Produtos'
  ClientHeight = 267
  ClientWidth = 900
  Visible = False
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 916
  ExplicitHeight = 306
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_Client_Cad: TPanel
    Width = 726
    Height = 267
    ExplicitWidth = 726
    ExplicitHeight = 267
    object Label2: TLabel
      Left = 33
      Top = 50
      Width = 122
      Height = 13
      Caption = 'Descri'#231#227'o do Produto PLS'
      FocusControl = EDT_Nome
    end
    object Label4: TLabel
      Left = 32
      Top = 92
      Width = 47
      Height = 13
      Caption = 'Categoria'
    end
    object EDT_Nome: TDBEdit
      Left = 33
      Top = 66
      Width = 672
      Height = 21
      DataField = 'DescricaoProd'
      DataSource = ds_Cadastro
      TabOrder = 0
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object DBL_Categoria: TDBLookupComboBox
      Left = 32
      Top = 112
      Width = 673
      Height = 21
      DataField = 'ID_Categoria'
      DataSource = ds_Cadastro
      KeyField = 'ID'
      ListField = 'Descricao'
      ListSource = frmDatamodulo.dsCategoria
      TabOrder = 1
      OnEnter = DBL_CategoriaEnter
      OnExit = DBL_CategoriaExit
    end
  end
  inherited pn_Left_Cad: TPanel
    Left = 726
    Height = 267
    ExplicitLeft = 726
    ExplicitHeight = 267
    inherited Btn_Retornar: TSpeedButton
      OnClick = Btn_RetornarClick
    end
    inherited btn_CadOk: TSpeedButton
      Top = 118
      OnClick = btn_CadOkClick
      ExplicitTop = 118
    end
    inherited btn_Sair: TSpeedButton
      Top = 198
      OnClick = btn_SairClick
      ExplicitTop = 198
    end
    inherited Dbn_Cad: TDBNavigator
      Hints.Strings = ()
    end
  end
  object pn_Client_Filtro: TPanel [2]
    Left = 0
    Top = 0
    Width = 726
    Height = 267
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    Visible = False
    ExplicitTop = 152
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 726
      Height = 64
      Align = alTop
      TabOrder = 0
      object Label12: TLabel
        Left = 16
        Top = 24
        Width = 34
        Height = 13
        Caption = 'Nome :'
      end
      object edtNome: TEdit
        Left = 56
        Top = 19
        Width = 257
        Height = 21
        TabOrder = 0
      end
      object btnPesquisar: TButton
        Left = 325
        Top = 16
        Width = 108
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 1
        OnClick = btnPesquisarClick
      end
      object rdg_Ordenar: TRadioGroup
        Left = 472
        Top = 0
        Width = 139
        Height = 59
        Caption = 'Ordenar Por :'
        ItemIndex = 0
        Items.Strings = (
          '&C'#243'digo'
          '&Descri'#231#227'o')
        TabOrder = 2
      end
    end
    object DBG_Cad: TDBGrid
      Left = 0
      Top = 64
      Width = 726
      Height = 203
      Align = alClient
      DataSource = ds_Cadastro
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  inherited ds_Cadastro: TDataSource
    Left = 672
    Top = 8
  end
  inherited TB_Cadastro: TClientDataSet
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
    Left = 640
    Top = 8
    object TB_CadastroID: TIntegerField
      DisplayWidth = 8
      FieldName = 'ID'
      Visible = False
    end
    object TB_CadastroDescricaoProd: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      DisplayWidth = 60
      FieldName = 'DescricaoProd'
      Size = 60
    end
    object TB_CadastroID_Categoria: TStringField
      DisplayLabel = 'Categoria'
      DisplayWidth = 20
      FieldName = 'ID_Categoria'
      Visible = False
    end
    object TB_CadastroDescricaoCategoria: TStringField
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
  object RESTClient1: TRESTClient
    Params = <>
    Left = 144
    Top = 298
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 110
    Top = 298
  end
  object RESTResponse1: TRESTResponse
    Left = 72
    Top = 298
  end
  object RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter
    FieldDefs = <>
    Response = RESTResponse1
    Left = 30
    Top = 299
  end
end
