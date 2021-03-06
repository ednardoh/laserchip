inherited frmCadCorretor: TfrmCadCorretor
  Caption = 'Clientes'
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
    object Label1: TLabel
      Left = 16
      Top = 50
      Width = 19
      Height = 13
      Caption = 'CPF'
      FocusControl = EDT_CpfCnpj
    end
    object Label2: TLabel
      Left = 217
      Top = 50
      Width = 86
      Height = 13
      Caption = 'Nome de Corretor'
      FocusControl = EDT_Nome
    end
    object Label3: TLabel
      Left = 16
      Top = 91
      Width = 96
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object Label4: TLabel
      Left = 216
      Top = 92
      Width = 33
      Height = 13
      Caption = 'Celular'
      FocusControl = EDT_Logradouro
    end
    object EDT_CpfCnpj: TDBEdit
      Left = 16
      Top = 66
      Width = 193
      Height = 21
      DataField = 'CPF'
      DataSource = ds_Cadastro
      TabOrder = 0
      OnEnter = EDT_CpfCnpjEnter
      OnExit = EDT_CpfCnpjExit
    end
    object EDT_Nome: TDBEdit
      Left = 217
      Top = 66
      Width = 499
      Height = 21
      DataField = 'Nome'
      DataSource = ds_Cadastro
      TabOrder = 1
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object EDT_Logradouro: TDBEdit
      Left = 216
      Top = 108
      Width = 500
      Height = 21
      DataField = 'Celular'
      DataSource = ds_Cadastro
      TabOrder = 2
      OnEnter = EDT_NomeEnter
      OnExit = EDT_NomeExit
    end
    object DTP_Nascimento: TDateTimePicker
      Left = 16
      Top = 107
      Width = 194
      Height = 22
      Date = 44523.000000000000000000
      Time = 0.111712650461413400
      TabOrder = 3
      OnEnter = DTP_NascimentoEnter
      OnExit = DTP_NascimentoExit
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
        Name = 'Nome'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DT_Nascimento'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Celular'
        DataType = ftString
        Size = 100
      end>
    StoreDefs = True
    Left = 640
    Top = 8
    object TB_CadastroID: TIntegerField
      DisplayWidth = 8
      FieldName = 'ID'
      Visible = False
    end
    object TB_CadastroNome: TStringField
      DisplayLabel = 'Nome do Corretor'
      DisplayWidth = 60
      FieldName = 'Nome'
      Size = 60
    end
    object TB_CadastroCPF: TStringField
      DisplayWidth = 20
      FieldName = 'CPF'
    end
    object TB_CadastroDT_Nascimento: TStringField
      DisplayLabel = 'DT Nascimento'
      DisplayWidth = 15
      FieldName = 'DT_Nascimento'
      Size = 15
    end
    object TB_CadastroCelular: TStringField
      DisplayWidth = 100
      FieldName = 'Celular'
      Size = 100
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
