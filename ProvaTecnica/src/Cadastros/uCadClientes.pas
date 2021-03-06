unit uCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloTelaCad, Data.DB,
  Datasnap.DBClient, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, REST.Types, REST.Response.Adapter, REST.Client, REST.Json,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, uClsCliente,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadClientes = class(TfrmModeloTelaCad)
    TB_CadastroID: TIntegerField;
    TB_CadastroCpfCnpj: TStringField;
    TB_CadastroNome: TStringField;
    TB_CadastroCEP: TStringField;
    TB_CadastroLogradouro: TStringField;
    TB_CadastroNumero: TStringField;
    TB_CadastroComplemento: TStringField;
    TB_CadastroBairro: TStringField;
    TB_CadastroCidade: TStringField;
    TB_CadastroSigla_uf: TStringField;
    TB_CadastroIbge_cidade: TStringField;
    TB_CadastroIbge_uf: TStringField;
    Label1: TLabel;
    EDT_CpfCnpj: TDBEdit;
    Label2: TLabel;
    EDT_Nome: TDBEdit;
    Label3: TLabel;
    EDT_CEP: TDBEdit;
    Label4: TLabel;
    EDT_Logradouro: TDBEdit;
    Label5: TLabel;
    EDT_Numero: TDBEdit;
    Label6: TLabel;
    EDT_Complemento: TDBEdit;
    Label7: TLabel;
    EDT_Bairro: TDBEdit;
    Label8: TLabel;
    EDT_Cidade: TDBEdit;
    Label9: TLabel;
    EDT_Sigla_uf: TDBEdit;
    Label10: TLabel;
    EDT_Ibge_cidade: TDBEdit;
    Label11: TLabel;
    EDT_Ibge_uf: TDBEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    pn_Client_Filtro: TPanel;
    Panel1: TPanel;
    Label12: TLabel;
    edtNome: TEdit;
    btnPesquisar: TButton;
    rdg_Ordenar: TRadioGroup;
    DBG_Cad: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SairClick(Sender: TObject);
    procedure EDT_CpfCnpjEnter(Sender: TObject);
    procedure EDT_CpfCnpjExit(Sender: TObject);
    procedure EDT_NomeEnter(Sender: TObject);
    procedure EDT_NomeExit(Sender: TObject);
    procedure BuscaCep(strURL, strAText: string);
    procedure EDT_CEPEnter(Sender: TObject);
    procedure EDT_CEPExit(Sender: TObject);
    procedure btn_CadOkClick(Sender: TObject);
    procedure Btn_RetornarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject); //busca Cep
  private
    { Private declarations }
    Objeto,
    Objt: TJsonObject;
    ParRows,
    PRows: TJsonPair;
    Clientes: TClientes;
    procedure GravaCliente;
    procedure LeRegistros;
    procedure MostraRegistrosFiltro;
  public
    { Public declarations }
    LStatus: string; //Incluindo, Alterando, Excluindo e Consultando
    LNomeTabela,
    LCodigo,
    LNomepesquisa : String;
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

{$R *.dfm}

uses uDatamodulo, uConsultaClientes;

procedure TfrmCadClientes.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Clientes:=TClientes.create;
  if edtNome.Text = '' then
    Showmessage('Campo pesquisa n?o pode ser vazio.')
  else
    begin
        LNomeTabela   := 'TB_Clientes';
        LNomepesquisa := 'Nome';
        Clientes.PesquisaTabela(LNomeTabela, LNomepesquisa, Trim(edtNome.Text));
        MostraRegistrosFiltro;
    end;
  Clientes.Free;
end;

procedure TfrmCadClientes.btn_CadOkClick(Sender: TObject);
begin
  inherited;
  if TB_Cadastro.State in [dsEdit, dsInsert] then
  begin
    TB_Cadastro.Post;
    GravaCliente;
    Application.MessageBox('Dados Gravados com sucesso.!','Aviso',mb_Ok+mb_IconExclamation);
    LeRegistros;
  end;
  if LStatus = '[Filtrando]' then
  begin
    if frmDatamodulo.dsPesquisa.DataSet <> NIL then
    begin
      pn_Client_Cad.Visible    := True;
      pn_Client_Filtro.Visible := False;
      frmConsultaClientes.TB_Consulta.EmptyDataSet;
      frmDatamodulo.dsPesquisa.DataSet.First;
      while not frmDatamodulo.dsPesquisa.DataSet.eof do
      begin
        frmConsultaClientes.TB_Consulta.Insert;
        frmConsultaClientes.TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
        frmConsultaClientes.TB_ConsultaCpfCnpj.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('CpfCnpj').AsString;
        frmConsultaClientes.TB_ConsultaNome.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Nome').AsString;
        frmConsultaClientes.TB_ConsultaCEP.AsString           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cep').AsString;
        frmConsultaClientes.TB_ConsultaLogradouro.AsString    :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Logradouro').AsString;
        frmConsultaClientes.TB_ConsultaNumero.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Numero').AsString;
        frmConsultaClientes.TB_ConsultaComplemento.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Complemento').AsString;
        frmConsultaClientes.TB_ConsultaBairro.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Bairro').AsString;
        frmConsultaClientes.TB_ConsultaCidade.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cidade').AsString;
        frmConsultaClientes.TB_ConsultaSigla_uf.AsString      :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_cidade').AsString;
        frmConsultaClientes.TB_ConsultaIbge_cidade.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Sigla_uf').AsString;
        frmConsultaClientes.TB_ConsultaIbge_uf.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_uf').AsString;
        frmConsultaClientes.TB_Consulta.Post;
        frmDatamodulo.dsPesquisa.DataSet.Next;
      end;
    end;
  end;
  TB_Cadastro.EmptyDataSet;
  Close;
end;

procedure TfrmCadClientes.Btn_RetornarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadClientes.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCadClientes.BuscaCep(strURL, strAText: string);
begin
  try
    if TB_Cadastro.State in [dsEdit, dsInsert] then
    begin
      RESTClient1.BaseURL := strURL + strAText;
      RESTRequest1.Method := rmGET;
      RESTRequest1.Execute;

      Objeto  := RESTResponse1.JSONValue as TJSONObject;

      //Bairro
      ParRows := Objeto.Get('bairro');
      TB_CadastroBairro.AsString :=StringReplace(ParRows.JsonValue.ToString, '"', '', [rfReplaceAll, rfIgnoreCase]);

      //Cidade
      ParRows := Objeto.Get('cidade');
      TB_CadastroCidade.AsString :=StringReplace(ParRows.JsonValue.ToString, '"', '', [rfReplaceAll, rfIgnoreCase]);

      //Logradouro
      ParRows := Objeto.Get('logradouro');
      TB_CadastroLogradouro.AsString :=StringReplace(ParRows.JsonValue.ToString, '"', '', [rfReplaceAll, rfIgnoreCase]);

      //Ibge estado
      ParRows := Objeto.Get('estado_info');
      Objt    := Objeto.Get('estado_info').JsonValue as TJSONObject;
      PRows   := Objt.Get('codigo_ibge');
      TB_CadastroIbge_uf.AsString :=StringReplace(PRows.JsonValue.ToString, '"', '', [rfReplaceAll, rfIgnoreCase]);

      //CEP
      ParRows := Objeto.Get('cep');
      TB_CadastroCEP.AsString :=StringReplace(ParRows.JsonValue.ToString, '"', '', [rfReplaceAll, rfIgnoreCase]);

      //Ibge Cidade
      ParRows := Objeto.Get('cidade_info');
      Objt    := Objeto.Get('cidade_info').JsonValue as TJSONObject;
      PRows   := Objt.Get('codigo_ibge');
      TB_CadastroIbge_cidade.AsString :=StringReplace(PRows.JsonValue.ToString, '"', '', [rfReplaceAll, rfIgnoreCase]);

      //Estado
      ParRows := Objeto.Get('estado');
      TB_CadastroSigla_uf.AsString :=StringReplace(ParRows.JsonValue.ToString, '"', '', [rfReplaceAll, rfIgnoreCase]);

      EDT_Numero.SetFocus;
    end;
  except
  end;
end;

procedure TfrmCadClientes.EDT_CEPEnter(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clYellow;
end;

procedure TfrmCadClientes.EDT_CEPExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clWindow;
  BuscaCep('https://api.postmon.com.br/v1/cep/',TB_CadastroCEP.AsString);
end;

procedure TfrmCadClientes.EDT_CpfCnpjEnter(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clYellow;
end;

procedure TfrmCadClientes.EDT_CpfCnpjExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clWindow;
  if TB_Cadastro.State in [dsEdit, dsInsert] then
  begin
    if Length(TB_CadastroCpfCnpj.AsString) = 11 then
    begin
      if not frmDatamodulo.ChecaCpf(frmDatamodulo.CharEspeciais(TB_CadastroCpfCnpj.AsString)) then
      begin
        Application.MessageBox('CPF N?o ? v?lido!','Aviso',mb_Ok+mb_IconExclamation);
      end;
    end
    else if Length(TB_CadastroCpfCnpj.AsString) = 14 then
    begin
      if not frmDatamodulo.ChecaCnpj(frmDatamodulo.CharEspeciais(TB_CadastroCpfCnpj.AsString)) then
      begin
        Application.MessageBox('CNPJ N?o ? v?lido!','Aviso',mb_Ok+mb_IconExclamation);
      end;
    end
    else
    begin
      Application.MessageBox('CPF ou CNPJ N?o ? v?lido!','Aviso',mb_Ok+mb_IconExclamation);
    end;
  end;
end;

procedure TfrmCadClientes.EDT_NomeEnter(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clYellow;
end;

procedure TfrmCadClientes.EDT_NomeExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clWindow;
end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TB_Cadastro.close;
  Action := cafree;
end;

procedure TfrmCadClientes.FormShow(Sender: TObject);
begin
  inherited;
  Caption := 'Cadastro de Clientes '+LStatus;

  if LStatus = '[Incluindo]' then
  begin
    pn_Client_Cad.Visible    := True;
    pn_Client_Filtro.Visible := False;
    TB_Cadastro.Insert;
  end
  else if LStatus = '[Alterando]' then
       begin
         pn_Client_Cad.Visible    := True;
         pn_Client_Filtro.Visible := False;
         TB_Cadastro.Insert;
         TB_CadastroID.AsInteger         := frmConsultaClientes.TB_ConsultaID.AsInteger;
         TB_CadastroCpfCnpj.AsString     := frmConsultaClientes.TB_ConsultaCpfCnpj.AsString;
         TB_CadastroNome.AsString        := frmConsultaClientes.TB_ConsultaNome.AsString;
         TB_CadastroCEP.AsString         := frmConsultaClientes.TB_ConsultaCEP.AsString;
         TB_CadastroLogradouro.AsString  := frmConsultaClientes.TB_ConsultaLogradouro.AsString;
         TB_CadastroNumero.AsString      := frmConsultaClientes.TB_ConsultaNumero.AsString;
         TB_CadastroComplemento.AsString := frmConsultaClientes.TB_ConsultaComplemento.AsString;
         TB_CadastroBairro.AsString      := frmConsultaClientes.TB_ConsultaBairro.AsString;
         TB_CadastroCidade.AsString      := frmConsultaClientes.TB_ConsultaCidade.AsString;
         TB_CadastroSigla_uf.AsString    := frmConsultaClientes.TB_ConsultaSigla_uf.AsString;
         TB_CadastroIbge_cidade.AsString := frmConsultaClientes.TB_ConsultaIbge_cidade.AsString;
         TB_CadastroIbge_uf.AsString     := frmConsultaClientes.TB_ConsultaIbge_uf.AsString;
         TB_Cadastro.Post;
       end
  else if LStatus = '[Filtrando]' then
       begin
         pn_Client_Cad.Visible    := False;
         pn_Client_Filtro.Visible := True;
       end;
end;

procedure TfrmCadClientes.GravaCliente;
begin
  Clientes:=TClientes.create;
  if LStatus ='[Incluindo]' then
  begin
    Clientes.SetID(0);
    Clientes.SetCpfCnpj(TB_CadastroCpfCnpj.AsString);
    Clientes.SetNome(TB_CadastroNome.AsString);
    Clientes.SetCep(TB_CadastroCEP.AsString);
    Clientes.SetLogradouro(TB_CadastroLogradouro.AsString);
    Clientes.SetNumero(TB_CadastroNumero.AsString);
    Clientes.SetComplemento(TB_CadastroComplemento.AsString);
    Clientes.SetBairro(TB_CadastroBairro.AsString);
    Clientes.SetCidade(TB_CadastroCidade.AsString);
    Clientes.SetIbge_cidade(TB_CadastroIbge_cidade.AsString);
    Clientes.SetSigla_uf(TB_CadastroSigla_uf.AsString);
    Clientes.SetIbge_uf(TB_CadastroIbge_uf.AsString);
    Clientes.GravaDados;
  end
  else
    if LStatus ='[Alterando]' then
    begin
      Clientes.SetID(TB_CadastroID.AsInteger);
      Clientes.SetCpfCnpj(TB_CadastroCpfCnpj.AsString);
      Clientes.SetNome(TB_CadastroNome.AsString);
      Clientes.SetCep(TB_CadastroCEP.AsString);
      Clientes.SetLogradouro(TB_CadastroLogradouro.AsString);
      Clientes.SetNumero(TB_CadastroNumero.AsString);
      Clientes.SetComplemento(TB_CadastroComplemento.AsString);
      Clientes.SetBairro(TB_CadastroBairro.AsString);
      Clientes.SetCidade(TB_CadastroCidade.AsString);
      Clientes.SetIbge_cidade(TB_CadastroIbge_cidade.AsString);
      Clientes.SetSigla_uf(TB_CadastroSigla_uf.AsString);
      Clientes.SetIbge_uf(TB_CadastroIbge_uf.AsString);
      Clientes.ALteraDados;
    end;
  Clientes.Free;
  LStatus :='';
end;

procedure TfrmCadClientes.LeRegistros;
begin
  Clientes:=TClientes.create;
  Clientes.ConsultaClientesGeral('TB_Clientes');
  Clientes.Free;

  frmConsultaClientes.TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsClientes.DataSet.First;
  while not frmDatamodulo.dsClientes.DataSet.eof  do
  begin
    frmConsultaClientes.TB_Consulta.Insert;
    frmConsultaClientes.TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsClientes.DataSet.FieldByName('ID').AsInteger;
    frmConsultaClientes.TB_ConsultaCpfCnpj.AsString       :=  frmDatamodulo.dsClientes.DataSet.FieldByName('CpfCnpj').AsString;
    frmConsultaClientes.TB_ConsultaNome.AsString          :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Nome').AsString;
    frmConsultaClientes.TB_ConsultaCEP.AsString           :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Cep').AsString;
    frmConsultaClientes.TB_ConsultaLogradouro.AsString    :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Logradouro').AsString;
    frmConsultaClientes.TB_ConsultaNumero.AsString        :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Numero').AsString;
    frmConsultaClientes.TB_ConsultaComplemento.AsString   :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Complemento').AsString;
    frmConsultaClientes.TB_ConsultaBairro.AsString        :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Bairro').AsString;
    frmConsultaClientes.TB_ConsultaCidade.AsString        :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Cidade').AsString;
    frmConsultaClientes.TB_ConsultaSigla_uf.AsString      :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Ibge_cidade').AsString;
    frmConsultaClientes.TB_ConsultaIbge_cidade.AsString   :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Sigla_uf').AsString;
    frmConsultaClientes.TB_ConsultaIbge_uf.AsString       :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Ibge_uf').AsString;
    frmConsultaClientes.TB_Consulta.Post;
    frmDatamodulo.dsClientes.DataSet.next;
  end;
end;

procedure TfrmCadClientes.MostraRegistrosFiltro;
begin
  TB_Cadastro.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsPesquisa.DataSet.eof  do
  begin
    TB_Cadastro.Insert;
    TB_CadastroID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_CadastroCpfCnpj.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('CpfCnpj').AsString;
    TB_CadastroNome.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Nome').AsString;
    TB_CadastroCEP.AsString           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cep').AsString;
    TB_CadastroLogradouro.AsString    :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Logradouro').AsString;
    TB_CadastroNumero.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Numero').AsString;
    TB_CadastroComplemento.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Complemento').AsString;
    TB_CadastroBairro.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Bairro').AsString;
    TB_CadastroCidade.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cidade').AsString;
    TB_CadastroSigla_uf.AsString      :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_cidade').AsString;
    TB_CadastroIbge_cidade.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Sigla_uf').AsString;
    TB_CadastroIbge_uf.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_uf').AsString;
    TB_Cadastro.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.
