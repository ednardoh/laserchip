object FrmPesquisa: TFrmPesquisa
  Left = 467
  Top = 285
  BorderStyle = bsSingle
  Caption = 'Pesquisa'
  ClientHeight = 354
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 906
    Height = 81
    Align = alTop
    Color = 12303225
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 11
      Width = 387
      Height = 26
      Caption = 
        'Digite um valor a ser pesquisado, ou tecle  <Enter> para selecio' +
        'nar a informa'#231#227'o desejada.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object edtNome: TEdit
      Left = 24
      Top = 42
      Width = 297
      Height = 21
      TabOrder = 0
      OnKeyPress = edtNomeKeyPress
    end
    object btnPesquisar: TButton
      Left = 333
      Top = 39
      Width = 116
      Height = 25
      Caption = 'Pesquisar - F3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object rdg_Ordenar: TRadioGroup
      Left = 480
      Top = 8
      Width = 137
      Height = 59
      Caption = 'Ordenar Por :'
      ItemIndex = 0
      Items.Strings = (
        '&C'#243'digo'
        '&Descri'#231#227'o')
      TabOrder = 2
      OnClick = rdg_OrdenarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 313
    Width = 906
    Height = 41
    Align = alBottom
    Color = 12303225
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 370
    object btnSelecionar: TButton
      Left = 601
      Top = 6
      Width = 137
      Height = 25
      Caption = 'Selecionar - F5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSelecionarClick
    end
    object btnCancelar: TButton
      Left = 744
      Top = 6
      Width = 145
      Height = 25
      Caption = 'Cancelar <ESC>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object dbgPesquisa: TDBGrid
    Left = 0
    Top = 81
    Width = 906
    Height = 232
    Align = alClient
    DataSource = frmDatamodulo.dsPesquisa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgPesquisaDblClick
    OnKeyPress = dbgPesquisaKeyPress
  end
  object dsPesquisa: TDataSource
    Left = 352
    Top = 104
  end
end
