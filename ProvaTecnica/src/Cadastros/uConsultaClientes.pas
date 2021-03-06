unit uConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloCad, Data.DB, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, uClsCliente, uDatamodulo;

type
  TfrmConsultaClientes = class(TfrmModeloCad)
    TB_ConsultaID: TIntegerField;
    TB_ConsultaCpfCnpj: TStringField;
    TB_ConsultaNome: TStringField;
    TB_ConsultaCEP: TStringField;
    TB_ConsultaLogradouro: TStringField;
    TB_ConsultaNumero: TStringField;
    TB_ConsultaComplemento: TStringField;
    TB_ConsultaBairro: TStringField;
    TB_ConsultaCidade: TStringField;
    TB_ConsultaIbge_cidade: TStringField;
    TB_ConsultaSigla_uf: TStringField;
    TB_ConsultaIbge_uf: TStringField;
    procedure btn_SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btn_IncluirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_TodosClick(Sender: TObject);
    procedure btn_FiltrarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
  private
    { Private declarations }
    Clientes: TClientes;
    procedure LeTodosRegistros;
  public
    { Public declarations }
  end;

var
  frmConsultaClientes: TfrmConsultaClientes;

implementation

{$R *.dfm}

uses uCadClientes;

procedure TfrmConsultaClientes.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadClientes,frmCadClientes);
  frmCadClientes.TB_Cadastro.CreateDataSet;
  frmCadClientes.LStatus := '[Alterando]';
  frmCadClientes.ShowModal;
end;

procedure TfrmConsultaClientes.btn_ConsultarClick(Sender: TObject);
var
  LID: Integer;
begin
  inherited;
  if TB_Consulta.RecordCount = 0 then
  begin
    Application.MessageBox('N?o h? dados para Consultar.!','Aviso',mb_Ok+mb_IconExclamation);
    exit;
  end
  else
  begin
    Application.CreateForm(TfrmCadClientes,frmCadClientes);
    frmCadClientes.TB_Cadastro.CreateDataSet;
    frmCadClientes.LStatus :='[Consultando]';
    LID := TB_ConsultaID.AsInteger;
    frmCadClientes.pn_Client_Cad.Visible    := True;
    frmCadClientes.pn_Client_Filtro.Visible := False;
    TB_Consulta.First;
    while not TB_Consulta.Eof do
    begin
      frmCadClientes.TB_Cadastro.Insert;
      frmCadClientes.TB_CadastroID.AsInteger         := TB_ConsultaID.AsInteger;
      frmCadClientes.TB_CadastroCpfCnpj.AsString     := TB_ConsultaCpfCnpj.AsString;
      frmCadClientes.TB_CadastroNome.AsString        := TB_ConsultaNome.AsString;
      frmCadClientes.TB_CadastroCEP.AsString         := TB_ConsultaCEP.AsString;
      frmCadClientes.TB_CadastroLogradouro.AsString  := TB_ConsultaLogradouro.AsString;
      frmCadClientes.TB_CadastroNumero.AsString      := TB_ConsultaNumero.AsString;
      frmCadClientes.TB_CadastroComplemento.AsString := TB_ConsultaComplemento.AsString;
      frmCadClientes.TB_CadastroBairro.AsString      := TB_ConsultaBairro.AsString;
      frmCadClientes.TB_CadastroCidade.AsString      := TB_ConsultaCidade.AsString;
      frmCadClientes.TB_CadastroSigla_uf.AsString    := TB_ConsultaSigla_uf.AsString;
      frmCadClientes.TB_CadastroIbge_cidade.AsString := TB_ConsultaIbge_cidade.AsString;
      frmCadClientes.TB_CadastroIbge_uf.AsString     := TB_ConsultaIbge_uf.AsString;
      frmCadClientes.TB_Cadastro.Post;
      TB_Consulta.Next;
    end;
    frmCadClientes.TB_Cadastro.Locate('ID',LID,[]);
    TB_Consulta.Locate('ID',LID,[]);
    frmCadClientes.ShowModal;
  end;
end;

procedure TfrmConsultaClientes.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if TB_Consulta.RecordCount = 0 then
  begin
    Application.MessageBox('N?o h? dados para ser excluido.!','Aviso',mb_Ok+mb_IconExclamation);
    exit;
  end
  else
  begin
    if Application.messageBox('Deseja Realmente Apagar Esse Cliente?',
      'Confirma??o',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
    begin
      Clientes:=TClientes.create;
      Clientes.SetID(TB_ConsultaID.AsInteger);
      Clientes.ExcluiDados;
      Clientes.Free;
      LeTodosRegistros;
    end;
  end;
end;

procedure TfrmConsultaClientes.btn_FiltrarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadClientes,frmCadClientes);
  frmCadClientes.TB_Cadastro.CreateDataSet;
  frmCadClientes.LStatus := '[Filtrando]';
  frmCadClientes.ShowModal;
end;

procedure TfrmConsultaClientes.btn_IncluirClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadClientes,frmCadClientes);
  frmCadClientes.TB_Cadastro.CreateDataSet;
  frmCadClientes.LStatus := '[Incluindo]';
  frmCadClientes.ShowModal;
end;

procedure TfrmConsultaClientes.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConsultaClientes.btn_TodosClick(Sender: TObject);
begin
  inherited;
  LeTodosRegistros;
end;

procedure TfrmConsultaClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TB_Consulta.Close;
  Action := cafree;
end;

procedure TfrmConsultaClientes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if CanClose then
    frmConsultaClientes := NIL;
end;

procedure TfrmConsultaClientes.FormShow(Sender: TObject);
begin
  inherited;
  TB_Consulta.CreateDataSet;
end;

procedure TfrmConsultaClientes.LeTodosRegistros;
begin
  Clientes:=TClientes.create;
  Clientes.ConsultaClientesGeral('TB_Clientes');
  Clientes.Free;

  TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsPesquisa.DataSet.eof  do
  begin
    TB_Consulta.Insert;
    TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_ConsultaCpfCnpj.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('CpfCnpj').AsString;
    TB_ConsultaNome.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Nome').AsString;
    TB_ConsultaCEP.AsString           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cep').AsString;
    TB_ConsultaLogradouro.AsString    :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Logradouro').AsString;
    TB_ConsultaNumero.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Numero').AsString;
    TB_ConsultaComplemento.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Complemento').AsString;
    TB_ConsultaBairro.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Bairro').AsString;
    TB_ConsultaCidade.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cidade').AsString;
    TB_ConsultaSigla_uf.AsString      :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_cidade').AsString;
    TB_ConsultaIbge_cidade.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Sigla_uf').AsString;
    TB_ConsultaIbge_uf.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_uf').AsString;
    TB_Consulta.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.
