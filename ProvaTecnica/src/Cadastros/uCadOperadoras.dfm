inherited frmCadOperadoras: TfrmCadOperadoras
  Caption = 'Clientes'
  ClientHeight = 285
  ClientWidth = 900
  Visible = False
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 916
  ExplicitHeight = 324
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_Client_Cad: TPanel
    Width = 726
    Height = 285
    ExplicitWidth = 726
    ExplicitHeight = 285
    object Label1: TLabel
      Left = 16
      Top = 34
      Width = 25
      Height = 13
      Caption = 'CNPJ'
      FocusControl = EDT_CpfCnpj
    end
    object Label2: TLabel
      Left = 217
      Top = 34
      Width = 86
      Height = 13
      Caption = 'Nome de Fantasia'
      FocusControl = EDT_Nome
    end
    object Label3: TLabel
      Left = 16
      Top = 75
      Width = 19
      Height = 13
      Caption = 'CEP'
      FocusControl = EDT_CEP
    end
    object Label4: TLabel
      Left = 216
      Top = 76
      Width = 55
      Height = 13
      Caption = 'Logradouro'
      FocusControl = EDT_Logradouro
    end
    object Label5: TLabel
      Left = 16
      Top = 116
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
      FocusControl = EDT_Numero
    end
    object Label6: TLabel
      Left = 103
      Top = 116
      Width = 65
      Height = 13
      Caption = 'Complemento'
      FocusControl = EDT_Complemento
    end
    object Label7: TLabel
      Left = 16
      Top = 157
      Width = 28
      Height = 13
      Caption = 'Bairro'
      FocusControl = EDT_Bairro
    end
    object Label8: TLabel
      Left = 370
      Top = 157
      Width = 33
      Height = 13
      Caption = 'Cidade'
      FocusControl = EDT_Cidade
    end
    object Label9: TLabel
      Left = 16
      Top = 199
      Width = 13
      Height = 13
      Caption = 'UF'
      FocusControl = EDT_Sigla_uf
    end
    object Label10: TLabel
      Left = 54
      Top = 199
      Width = 59
      Height = 13
      Caption = 'Ibge_cidade'
      FocusControl = EDT_Ibge_cidade
    end
    object Label11: TLabel
      Left = 370
      Top = 200
      Width = 38
      Height = 13
      Caption = 'Ibge_uf'
      FocusControl = EDT_Ibge_uf
    end
    object Label13: TLabel
      Left = 16
      Top = 240
      Width = 23
      Height = 13
      Caption = 'Logo'
      FocusControl = EDT_Logo
    end
    object EDT_CpfCnpj: TDBEdit
      Left = 16
      Top = 50
      Width = 193
      Height = 21
      DataField = 'Cnpj'
      DataSource = ds_Cadastro
      TabOrder = 0
      OnEnter = EDT_CpfCnpjEnter
      OnExit = EDT_CpfCnpjExit
    end
    object EDT_Nome: TDBEdit
      Left = 217
      Top = 50
      Width = 499
      Height = 21
      DataField = 'RazaoSocial'
      DataSource = ds_Cadastro
      TabOrder = 1
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object EDT_CEP: TDBEdit
      Left = 16
      Top = 91
      Width = 193
      Height = 21
      DataField = 'CEP'
      DataSource = ds_Cadastro
      TabOrder = 2
      OnEnter = EDT_CEPEnter
      OnExit = EDT_CEPExit
    end
    object EDT_Logradouro: TDBEdit
      Left = 216
      Top = 92
      Width = 500
      Height = 21
      DataField = 'Logradouro'
      DataSource = ds_Cadastro
      TabOrder = 3
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object EDT_Numero: TDBEdit
      Left = 16
      Top = 132
      Width = 81
      Height = 21
      DataField = 'Numero'
      DataSource = ds_Cadastro
      TabOrder = 4
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object EDT_Complemento: TDBEdit
      Left = 103
      Top = 132
      Width = 613
      Height = 21
      DataField = 'Complemento'
      DataSource = ds_Cadastro
      TabOrder = 5
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object EDT_Bairro: TDBEdit
      Left = 16
      Top = 173
      Width = 346
      Height = 21
      DataField = 'Bairro'
      DataSource = ds_Cadastro
      TabOrder = 6
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object EDT_Cidade: TDBEdit
      Left = 370
      Top = 173
      Width = 346
      Height = 21
      DataField = 'Cidade'
      DataSource = ds_Cadastro
      TabOrder = 7
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object EDT_Sigla_uf: TDBEdit
      Left = 16
      Top = 215
      Width = 32
      Height = 21
      DataField = 'Sigla_uf'
      DataSource = ds_Cadastro
      TabOrder = 8
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object EDT_Ibge_cidade: TDBEdit
      Left = 54
      Top = 215
      Width = 308
      Height = 21
      DataField = 'Ibge_cidade'
      DataSource = ds_Cadastro
      TabOrder = 9
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object EDT_Ibge_uf: TDBEdit
      Left = 370
      Top = 215
      Width = 346
      Height = 21
      DataField = 'Ibge_uf'
      DataSource = ds_Cadastro
      TabOrder = 10
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object EDT_Logo: TDBEdit
      Left = 16
      Top = 256
      Width = 665
      Height = 21
      DataField = 'Logo'
      DataSource = ds_Cadastro
      TabOrder = 11
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object btn_Logo: TBitBtn
      Left = 687
      Top = 254
      Width = 29
      Height = 25
      Caption = '...'
      TabOrder = 12
      OnClick = btn_LogoClick
    end
  end
  inherited pn_Left_Cad: TPanel
    Left = 726
    Height = 285
    ExplicitLeft = 726
    ExplicitHeight = 285
    inherited Btn_Retornar: TSpeedButton
      OnClick = Btn_RetornarClick
    end
    inherited btn_CadOk: TSpeedButton
      Top = 118
      OnClick = btn_CadOkClick
      ExplicitTop = 118
    end
    inherited btn_Sair: TSpeedButton
      Top = 204
      OnClick = btn_SairClick
      ExplicitTop = 204
    end
    inherited Dbn_Cad: TDBNavigator
      Hints.Strings = ()
    end
  end
  object pn_Client_Filtro: TPanel [2]
    Left = 0
    Top = 0
    Width = 726
    Height = 285
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    Visible = False
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
          '&Nome')
        TabOrder = 2
      end
    end
    object DBG_Cad: TDBGrid
      Left = 0
      Top = 64
      Width = 726
      Height = 221
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
        Name = 'Cnpj'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RazaoSocial'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Logradouro'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Numero'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Complemento'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Sigla_uf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Ibge_cidade'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Ibge_uf'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Logo'
        DataType = ftString
        Size = 500
      end>
    StoreDefs = True
    Left = 640
    Top = 8
    object TB_CadastroID: TIntegerField
      DisplayWidth = 8
      FieldName = 'ID'
      Visible = False
    end
    object TB_CadastroCnpj: TStringField
      DisplayLabel = 'CNPJ'
      DisplayWidth = 20
      FieldName = 'Cnpj'
    end
    object TB_CadastroRazaoSocial: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 60
      FieldName = 'RazaoSocial'
      Size = 60
    end
    object TB_CadastroCEP: TStringField
      DisplayWidth = 15
      FieldName = 'CEP'
      Size = 15
    end
    object TB_CadastroLogradouro: TStringField
      DisplayWidth = 100
      FieldName = 'Logradouro'
      Size = 100
    end
    object TB_CadastroNumero: TStringField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 10
      FieldName = 'Numero'
      Size = 10
    end
    object TB_CadastroComplemento: TStringField
      DisplayWidth = 100
      FieldName = 'Complemento'
      Size = 100
    end
    object TB_CadastroBairro: TStringField
      DisplayWidth = 60
      FieldName = 'Bairro'
      Size = 60
    end
    object TB_CadastroCidade: TStringField
      DisplayWidth = 60
      FieldName = 'Cidade'
      Size = 60
    end
    object TB_CadastroSigla_uf: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 6
      FieldName = 'Sigla_uf'
      Size = 2
    end
    object TB_CadastroIbge_cidade: TStringField
      DisplayWidth = 15
      FieldName = 'Ibge_cidade'
      Size = 15
    end
    object TB_CadastroIbge_uf: TStringField
      DisplayWidth = 15
      FieldName = 'Ibge_uf'
      Size = 15
    end
    object TB_CadastroLogo: TStringField
      FieldName = 'Logo'
      Size = 500
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
  object Opd_Logo: TOpenPictureDialog
    Left = 616
    Top = 288
  end
end
