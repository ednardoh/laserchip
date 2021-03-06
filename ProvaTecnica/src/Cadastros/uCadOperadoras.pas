unit uCadOperadoras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloTelaCad, Data.DB,
  Datasnap.DBClient, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, REST.Types, REST.Response.Adapter, REST.Client, REST.Json,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, uClsOperadoras,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtDlgs;

type
  TfrmCadOperadoras = class(TfrmModeloTelaCad)
    TB_CadastroID: TIntegerField;
    TB_CadastroCnpj: TStringField;
    TB_CadastroRazaoSocial: TStringField;
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
    TB_CadastroLogo: TStringField;
    Label13: TLabel;
    EDT_Logo: TDBEdit;
    btn_Logo: TBitBtn;
    Opd_Logo: TOpenPictureDialog;
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
    procedure btnPesquisarClick(Sender: TObject);
    procedure btn_LogoClick(Sender: TObject); //busca Cep
  private
    { Private declarations }
    Objeto,
    Objt: TJsonObject;
    ParRows,
    PRows: TJsonPair;
    Operadoras: TOperadoras;
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
  frmCadOperadoras: TfrmCadOperadoras;

implementation

{$R *.dfm}

uses uDatamodulo, uConsultaOperadoras;

procedure TfrmCadOperadoras.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Operadoras:=TOperadoras.create;
  if edtNome.Text = '' then
    Showmessage('Campo pesquisa n?o pode ser vazio.')
  else
    begin
        LNomeTabela   := 'TB_Operadoras';
        LNomepesquisa := 'RazaoSocial';
        Operadoras.PesquisaTabela(LNomeTabela, LNomepesquisa, Trim(edtNome.Text));
        MostraRegistrosFiltro;
    end;
  Operadoras.Free;
end;

procedure TfrmCadOperadoras.btn_CadOkClick(Sender: TObject);
begin
  inherited;
  try
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
      frmConsultaOperadoras.TB_Consulta.EmptyDataSet;
      frmDatamodulo.dsPesquisa.DataSet.First;
      while not frmDatamodulo.dsPesquisa.DataSet.eof do
      begin
        frmConsultaOperadoras.TB_Consulta.Insert;
        frmConsultaOperadoras.TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
        frmConsultaOperadoras.TB_ConsultaCnpj.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cnpj').AsString;
        frmConsultaOperadoras.TB_ConsultaRazaoSocial.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('RazaoSocial').AsString;
        frmConsultaOperadoras.TB_ConsultaCEP.AsString           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cep').AsString;
        frmConsultaOperadoras.TB_ConsultaLogradouro.AsString    :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Logradouro').AsString;
        frmConsultaOperadoras.TB_ConsultaNumero.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Numero').AsString;
        frmConsultaOperadoras.TB_ConsultaComplemento.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Complemento').AsString;
        frmConsultaOperadoras.TB_ConsultaBairro.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Bairro').AsString;
        frmConsultaOperadoras.TB_ConsultaCidade.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cidade').AsString;
        frmConsultaOperadoras.TB_ConsultaSigla_uf.AsString      :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_cidade').AsString;
        frmConsultaOperadoras.TB_ConsultaIbge_cidade.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Sigla_uf').AsString;
        frmConsultaOperadoras.TB_ConsultaIbge_uf.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_uf').AsString;
        frmConsultaOperadoras.TB_ConsultaLogo.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Logo').AsString;
        frmConsultaOperadoras.TB_Consulta.Post;
        frmDatamodulo.dsPesquisa.DataSet.Next;
      end;
    end;
  end;
  finally
    TB_Cadastro.EmptyDataSet;
    Close;
  end;
end;

procedure TfrmCadOperadoras.btn_LogoClick(Sender: TObject);
begin
  inherited;
  if Opd_Logo.Execute() then
  begin
    if TB_Cadastro.State in [dsEdit, dsInsert] then
      TB_CadastroLogo.AsString := Opd_Logo.FileName;
  end;
end;

procedure TfrmCadOperadoras.Btn_RetornarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadOperadoras.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCadOperadoras.BuscaCep(strURL, strAText: string);
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

procedure TfrmCadOperadoras.EDT_CEPEnter(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clYellow;
end;

procedure TfrmCadOperadoras.EDT_CEPExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clWindow;
  BuscaCep('https://api.postmon.com.br/v1/cep/',TB_CadastroCEP.AsString);
end;

procedure TfrmCadOperadoras.EDT_CpfCnpjEnter(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clYellow;
end;

procedure TfrmCadOperadoras.EDT_CpfCnpjExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clWindow;
  if TB_Cadastro.State in [dsEdit, dsInsert] then
  begin
    if Length(TB_CadastroCnpj.AsString) = 14 then
    begin
      if not frmDatamodulo.ChecaCnpj(frmDatamodulo.CharEspeciais(TB_CadastroCnpj.AsString)) then
      begin
        Application.MessageBox('CNPJ N?o ? v?lido!','Aviso',mb_Ok+mb_IconExclamation);
      end;
    end
    else
    begin
      Application.MessageBox('CNPJ N?o ? v?lido!','Aviso',mb_Ok+mb_IconExclamation);
    end;
  end;
end;

procedure TfrmCadOperadoras.EDT_NomeEnter(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clYellow;
end;

procedure TfrmCadOperadoras.EDT_NomeExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clWindow;
end;

procedure TfrmCadOperadoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TB_Cadastro.close;
  Action := cafree;
end;

procedure TfrmCadOperadoras.FormShow(Sender: TObject);
begin
  inherited;
  Opd_Logo.InitialDir := ExtractFilePath(Application.ExeName);

  Caption := 'Cadastro de Operadoras '+LStatus;

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
         TB_CadastroID.AsInteger         := frmConsultaOperadoras.TB_ConsultaID.AsInteger;
         TB_CadastroCnpj.AsString        := frmConsultaOperadoras.TB_ConsultaCnpj.AsString;
         TB_CadastroRazaoSocial.AsString := frmConsultaOperadoras.TB_ConsultaRazaoSocial.AsString;
         TB_CadastroCEP.AsString         := frmConsultaOperadoras.TB_ConsultaCEP.AsString;
         TB_CadastroLogradouro.AsString  := frmConsultaOperadoras.TB_ConsultaLogradouro.AsString;
         TB_CadastroNumero.AsString      := frmConsultaOperadoras.TB_ConsultaNumero.AsString;
         TB_CadastroComplemento.AsString := frmConsultaOperadoras.TB_ConsultaComplemento.AsString;
         TB_CadastroBairro.AsString      := frmConsultaOperadoras.TB_ConsultaBairro.AsString;
         TB_CadastroCidade.AsString      := frmConsultaOperadoras.TB_ConsultaCidade.AsString;
         TB_CadastroSigla_uf.AsString    := frmConsultaOperadoras.TB_ConsultaSigla_uf.AsString;
         TB_CadastroIbge_cidade.AsString := frmConsultaOperadoras.TB_ConsultaIbge_cidade.AsString;
         TB_CadastroIbge_uf.AsString     := frmConsultaOperadoras.TB_ConsultaIbge_uf.AsString;
         TB_CadastroLogo.AsString        := frmConsultaOperadoras.TB_ConsultaLogo.AsString;
         TB_Cadastro.Post;
       end
  else if LStatus = '[Filtrando]' then
       begin
         pn_Client_Cad.Visible    := False;
         pn_Client_Filtro.Visible := True;
       end;
end;

procedure TfrmCadOperadoras.GravaCliente;
begin
  Operadoras:=TOperadoras.create;
  if LStatus ='[Incluindo]' then
  begin
    Operadoras.SetID(0);
    Operadoras.SetCnpj(TB_CadastroCnpj.AsString);
    Operadoras.SetNome(TB_CadastroRazaoSocial.AsString);
    Operadoras.SetCep(TB_CadastroCEP.AsString);
    Operadoras.SetLogradouro(TB_CadastroLogradouro.AsString);
    Operadoras.SetNumero(TB_CadastroNumero.AsString);
    Operadoras.SetComplemento(TB_CadastroComplemento.AsString);
    Operadoras.SetBairro(TB_CadastroBairro.AsString);
    Operadoras.SetCidade(TB_CadastroCidade.AsString);
    Operadoras.SetIbge_cidade(TB_CadastroIbge_cidade.AsString);
    Operadoras.SetSigla_uf(TB_CadastroSigla_uf.AsString);
    Operadoras.SetIbge_uf(TB_CadastroIbge_uf.AsString);
    Operadoras.SetLogo(TB_CadastroLogo.AsString);
    Operadoras.GravaDados;
  end
  else
    if LStatus ='[Alterando]' then
    begin
      Operadoras.SetID(TB_CadastroID.AsInteger);
      Operadoras.SetCnpj(TB_CadastroCnpj.AsString);
      Operadoras.SetNome(TB_CadastroRazaoSocial.AsString);
      Operadoras.SetCep(TB_CadastroCEP.AsString);
      Operadoras.SetLogradouro(TB_CadastroLogradouro.AsString);
      Operadoras.SetNumero(TB_CadastroNumero.AsString);
      Operadoras.SetComplemento(TB_CadastroComplemento.AsString);
      Operadoras.SetBairro(TB_CadastroBairro.AsString);
      Operadoras.SetCidade(TB_CadastroCidade.AsString);
      Operadoras.SetIbge_cidade(TB_CadastroIbge_cidade.AsString);
      Operadoras.SetSigla_uf(TB_CadastroSigla_uf.AsString);
      Operadoras.SetIbge_uf(TB_CadastroIbge_uf.AsString);
      Operadoras.SetLogo(TB_CadastroLogo.AsString);
      Operadoras.ALteraDados;
    end;
  Operadoras.Free;
  LStatus :='';
end;

procedure TfrmCadOperadoras.LeRegistros;
begin
  Operadoras:=TOperadoras.create;
  Operadoras.ConsultaClientesGeral('TB_Operadoras');
  Operadoras.Free;

  frmConsultaOperadoras.TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsClientes.DataSet.First;
  while not frmDatamodulo.dsClientes.DataSet.eof  do
  begin
    frmConsultaOperadoras.TB_Consulta.Insert;
    frmConsultaOperadoras.TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsClientes.DataSet.FieldByName('ID').AsInteger;
    frmConsultaOperadoras.TB_ConsultaCnpj.AsString          :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Cnpj').AsString;
    frmConsultaOperadoras.TB_ConsultaRazaoSocial.AsString   :=  frmDatamodulo.dsClientes.DataSet.FieldByName('RazaoSocial').AsString;
    frmConsultaOperadoras.TB_ConsultaCEP.AsString           :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Cep').AsString;
    frmConsultaOperadoras.TB_ConsultaLogradouro.AsString    :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Logradouro').AsString;
    frmConsultaOperadoras.TB_ConsultaNumero.AsString        :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Numero').AsString;
    frmConsultaOperadoras.TB_ConsultaComplemento.AsString   :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Complemento').AsString;
    frmConsultaOperadoras.TB_ConsultaBairro.AsString        :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Bairro').AsString;
    frmConsultaOperadoras.TB_ConsultaCidade.AsString        :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Cidade').AsString;
    frmConsultaOperadoras.TB_ConsultaSigla_uf.AsString      :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Ibge_cidade').AsString;
    frmConsultaOperadoras.TB_ConsultaIbge_cidade.AsString   :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Sigla_uf').AsString;
    frmConsultaOperadoras.TB_ConsultaIbge_uf.AsString       :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Ibge_uf').AsString;
    frmConsultaOperadoras.TB_ConsultaLogo.AsString          :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Logo').AsString;
    frmConsultaOperadoras.TB_Consulta.Post;
    frmDatamodulo.dsClientes.DataSet.next;
  end;
end;

procedure TfrmCadOperadoras.MostraRegistrosFiltro;
begin
  TB_Cadastro.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsPesquisa.DataSet.eof  do
  begin
    TB_Cadastro.Insert;
    TB_CadastroID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_CadastroCnpj.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cnpj').AsString;
    TB_CadastroRazaoSocial.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('RazaoSocial').AsString;
    TB_CadastroCEP.AsString           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cep').AsString;
    TB_CadastroLogradouro.AsString    :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Logradouro').AsString;
    TB_CadastroNumero.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Numero').AsString;
    TB_CadastroComplemento.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Complemento').AsString;
    TB_CadastroBairro.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Bairro').AsString;
    TB_CadastroCidade.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cidade').AsString;
    TB_CadastroSigla_uf.AsString      :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_cidade').AsString;
    TB_CadastroIbge_cidade.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Sigla_uf').AsString;
    TB_CadastroIbge_uf.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_uf').AsString;
    TB_CadastroLogo.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Logo').AsString;
    TB_Cadastro.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.
