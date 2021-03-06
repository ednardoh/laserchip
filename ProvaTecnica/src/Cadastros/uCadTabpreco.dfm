inherited frmCadTabPreco: TfrmCadTabPreco
  Caption = 'TabPreco'
  ClientHeight = 264
  ClientWidth = 900
  Visible = False
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 916
  ExplicitHeight = 303
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_Client_Cad: TPanel
    Width = 726
    Height = 264
    ExplicitWidth = 726
    ExplicitHeight = 264
    object Label2: TLabel
      Left = 33
      Top = 98
      Width = 128
      Height = 13
      Caption = 'Percentual de Desconto %'
      FocusControl = EDT_PercDesc
    end
    object Label4: TLabel
      Left = 32
      Top = 52
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object Label1: TLabel
      Left = 380
      Top = 99
      Width = 147
      Height = 13
      Caption = 'Pre'#231'o de venda do Produto R$'
      FocusControl = EDT_PrecoVendaPrd
    end
    object EDT_PercDesc: TDBEdit
      Left = 33
      Top = 114
      Width = 341
      Height = 21
      DataField = 'PercDesconto'
      DataSource = ds_Cadastro
      TabOrder = 0
      OnEnter = EDT_PercDescEnter
      OnExit = EDT_PercDescExit
      OnKeyPress = EDT_PercDescKeyPress
    end
    object DBL_DescProduto: TDBLookupComboBox
      Left = 32
      Top = 72
      Width = 673
      Height = 21
      DataField = 'ID_Produto'
      DataSource = ds_Cadastro
      KeyField = 'ID'
      ListField = 'DescricaoProd'
      ListSource = frmDatamodulo.dsProdutoPLS
      TabOrder = 1
      OnEnter = DBL_DescProdutoEnter
      OnExit = DBL_DescProdutoExit
      OnKeyPress = DBL_DescProdutoKeyPress
    end
    object EDT_PrecoVendaPrd: TDBEdit
      Left = 380
      Top = 114
      Width = 325
      Height = 21
      DataField = 'PrecoProduto'
      DataSource = ds_Cadastro
      TabOrder = 2
      OnEnter = EDT_PercDescEnter
      OnExit = EDT_PercDescExit
    end
  end
  inherited pn_Left_Cad: TPanel
    Left = 726
    Height = 264
    ExplicitLeft = 726
    ExplicitHeight = 264
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
    Height = 264
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    Visible = False
    ExplicitTop = 64
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
        Width = 59
        Height = 13
        Caption = 'ID Produto :'
      end
      object edtNome: TEdit
        Left = 80
        Top = 19
        Width = 257
        Height = 21
        TabOrder = 0
      end
      object btnPesquisar: TButton
        Left = 349
        Top = 17
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
          '&Id. Produto')
        TabOrder = 2
      end
    end
    object DBG_Cad: TDBGrid
      Left = 0
      Top = 64
      Width = 726
      Height = 200
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
    Left = 640
    Top = 8
    object TB_CadastroID: TIntegerField
      DisplayWidth = 8
      FieldName = 'ID'
      Visible = False
    end
    object TB_CadastroID_Produto: TIntegerField
      DisplayLabel = 'ID. Produto'
      DisplayWidth = 10
      FieldName = 'ID_Produto'
    end
    object TB_CadastroDescrProduto: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      DisplayWidth = 73
      FieldKind = fkLookup
      FieldName = 'DescrProduto'
      LookupDataSet = frmDatamodulo.TB_Prduto
      LookupKeyFields = 'ID'
      LookupResultField = 'DescricaoProd'
      KeyFields = 'ID_Produto'
      Size = 100
      Lookup = True
    end
    object TB_CadastroPercDesconto: TCurrencyField
      DisplayLabel = 'Perc. Desconto%'
      DisplayWidth = 14
      FieldName = 'PercDesconto'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object TB_CadastroPrecoProduto: TCurrencyField
      DisplayLabel = 'Pre'#231'o Produto R$'
      DisplayWidth = 14
      FieldName = 'PrecoProduto'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
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
