inherited frmConsultaClientes: TfrmConsultaClientes
  Caption = 'Consulta de Clientes'
  ClientHeight = 554
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  ExplicitHeight = 593
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_Client_Cad: TPanel
    Height = 554
    ExplicitHeight = 554
    inherited DBG_Cad: TDBGrid
      Height = 554
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    end
  end
  inherited pn_Left_Cad: TPanel
    Height = 554
    ExplicitHeight = 554
    inherited btn_Filtrar: TSpeedButton
      OnClick = btn_FiltrarClick
    end
    inherited btn_Todos: TSpeedButton
      OnClick = btn_TodosClick
    end
    inherited btn_Incluir: TSpeedButton
      OnClick = btn_IncluirClick
    end
    inherited btn_Alterar: TSpeedButton
      OnClick = btn_AlterarClick
    end
    inherited btn_Excluir: TSpeedButton
      OnClick = btn_ExcluirClick
    end
    inherited btn_Consultar: TSpeedButton
      OnClick = btn_ConsultarClick
    end
    inherited btn_Sair: TSpeedButton
      Left = 6
      Top = 487
      OnClick = btn_SairClick
      ExplicitLeft = 6
      ExplicitTop = 487
    end
  end
  inherited TB_Consulta: TClientDataSet
    object TB_ConsultaID: TIntegerField
      DisplayWidth = 8
      FieldName = 'ID'
      Visible = False
    end
    object TB_ConsultaCpfCnpj: TStringField
      DisplayLabel = 'Cpf ou CNPJ'
      DisplayWidth = 20
      FieldName = 'CpfCnpj'
    end
    object TB_ConsultaNome: TStringField
      DisplayLabel = 'Nome do Cliente'
      DisplayWidth = 60
      FieldName = 'Nome'
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
  end
end
