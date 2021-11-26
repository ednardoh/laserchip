inherited frmConsultaOperadoras: TfrmConsultaOperadoras
  Caption = 'Consulta de Operadoras'
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_Client_Cad: TPanel
    inherited DBG_Cad: TDBGrid
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      OnCellClick = DBG_CadCellClick
      OnDrawDataCell = DBG_CadDrawDataCell
      OnDrawColumnCell = DBG_CadDrawColumnCell
      OnDblClick = DBG_CadDblClick
    end
  end
  inherited pn_Left_Cad: TPanel
    inherited btn_Filtrar: TSpeedButton
      Top = 9
      OnClick = btn_FiltrarClick
      ExplicitTop = 9
    end
    inherited btn_Todos: TSpeedButton
      Top = 71
      OnClick = btn_TodosClick
      ExplicitTop = 71
    end
    inherited btn_Incluir: TSpeedButton
      Top = 134
      OnClick = btn_IncluirClick
      ExplicitTop = 134
    end
    inherited btn_Alterar: TSpeedButton
      Top = 198
      OnClick = btn_AlterarClick
      ExplicitTop = 198
    end
    inherited btn_Excluir: TSpeedButton
      Top = 261
      OnClick = btn_ExcluirClick
      ExplicitTop = 261
    end
    inherited btn_Consultar: TSpeedButton
      Top = 322
      OnClick = btn_ConsultarClick
      ExplicitTop = 322
    end
    inherited btn_Sair: TSpeedButton
      OnClick = btn_SairClick
    end
    object pn_Logo: TPanel
      Left = 8
      Top = 395
      Width = 153
      Height = 126
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 0
      object img_Logo: TImage
        Left = 2
        Top = 2
        Width = 149
        Height = 122
        Align = alClient
        Center = True
        ExplicitLeft = 16
        ExplicitTop = 16
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
    end
  end
  inherited TB_Consulta: TClientDataSet
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
    object TB_ConsultaID: TIntegerField
      DisplayWidth = 8
      FieldName = 'ID'
      Visible = False
    end
    object TB_ConsultaCnpj: TStringField
      DisplayLabel = 'CNPJ'
      DisplayWidth = 20
      FieldName = 'Cnpj'
    end
    object TB_ConsultaRazaoSocial: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 60
      FieldName = 'RazaoSocial'
      Size = 60
    end
    object TB_ConsultaCEP: TStringField
      DisplayWidth = 15
      FieldName = 'CEP'
      Size = 15
    end
    object TB_ConsultaLogradouro: TStringField
      DisplayWidth = 100
      FieldName = 'Logradouro'
      Size = 100
    end
    object TB_ConsultaNumero: TStringField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 10
      FieldName = 'Numero'
      Size = 10
    end
    object TB_ConsultaComplemento: TStringField
      DisplayWidth = 100
      FieldName = 'Complemento'
      Size = 100
    end
    object TB_ConsultaBairro: TStringField
      DisplayWidth = 60
      FieldName = 'Bairro'
      Size = 60
    end
    object TB_ConsultaCidade: TStringField
      DisplayWidth = 60
      FieldName = 'Cidade'
      Size = 60
    end
    object TB_ConsultaSigla_uf: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 6
      FieldName = 'Sigla_uf'
      Size = 2
    end
    object TB_ConsultaIbge_cidade: TStringField
      DisplayWidth = 15
      FieldName = 'Ibge_cidade'
      Size = 15
    end
    object TB_ConsultaIbge_uf: TStringField
      DisplayWidth = 15
      FieldName = 'Ibge_uf'
      Size = 15
    end
    object TB_ConsultaLogo: TStringField
      FieldName = 'Logo'
      Visible = False
      Size = 500
    end
  end
  inherited ds_Consulta: TDataSource
    OnStateChange = ds_ConsultaStateChange
  end
end
