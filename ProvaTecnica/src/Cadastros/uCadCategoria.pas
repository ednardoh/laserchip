unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloTelaCad, Data.DB,
  Datasnap.DBClient, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, REST.Types, REST.Response.Adapter, REST.Client, REST.Json,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtDlgs, Vcl.ComCtrls, uClsCategoriaPLS;

type
  TfrmCadCategoria = class(TfrmModeloTelaCad)
    Label2: TLabel;
    EDT_Nome: TDBEdit;
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
    TB_CadastroID: TIntegerField;
    TB_CadastroDescricao: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SairClick(Sender: TObject);
    procedure EDT_NomeEnter(Sender: TObject);
    procedure EDT_NomeExit(Sender: TObject);
    procedure btn_CadOkClick(Sender: TObject);
    procedure Btn_RetornarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject); //busca Cep
  private
    { Private declarations }
    Objeto,
    Objt: TJsonObject;
    ParRows,
    PRows: TJsonPair;
    OCategoria: TCategoria;
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
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

uses uDatamodulo, uConsultaCategoria;

procedure TfrmCadCategoria.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  OCategoria:=TCategoria.create;
  if edtNome.Text = '' then
    Showmessage('Campo pesquisa não pode ser vazio.')
  else
    begin
        LNomeTabela   := 'TB_CategoriaPLS';
        LNomepesquisa := 'Descricao';
        OCategoria.PesquisaTabela(LNomeTabela, LNomepesquisa, Trim(edtNome.Text));
        MostraRegistrosFiltro;
    end;
  OCategoria.Free;
end;

procedure TfrmCadCategoria.btn_CadOkClick(Sender: TObject);
begin
  inherited;
  if TB_Cadastro.State in [dsEdit, dsInsert] then
  begin
    TB_Cadastro.Post;
    GravaCliente;
    Application.MessageBox('Dados Gravados com sucesso.!','Aviso',mb_Ok+mb_IconExclamation);
    LeRegistros;
    TB_Cadastro.EmptyDataSet;
    Close;
  end;

  if LStatus = '[Filtrando]' then
  begin
    if frmDatamodulo.dsPesquisa.DataSet <> NIL then
    begin
      pn_Client_Cad.Visible    := True;
      pn_Client_Filtro.Visible := False;
      frmConsultaCategoria.TB_Consulta.EmptyDataSet;
      frmDatamodulo.dsPesquisa.DataSet.First;
      while not frmDatamodulo.dsPesquisa.DataSet.eof do
      begin
        frmConsultaCategoria.TB_Consulta.Insert;
        frmConsultaCategoria.TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
        frmConsultaCategoria.TB_ConsultaDescricao.AsString     :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Descricao').AsString;
        frmConsultaCategoria.TB_Consulta.Post;
        frmDatamodulo.dsPesquisa.DataSet.Next;
      end;
    end;
  end;

  if LStatus = '[Filtrando]' then
  begin
    TB_Cadastro.EmptyDataSet;
    Close;
  end;

  if LStatus = '[Consultando]' then
  begin
    TB_Cadastro.EmptyDataSet;
    Close;
  end;

end;

procedure TfrmCadCategoria.Btn_RetornarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadCategoria.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCadCategoria.EDT_NomeEnter(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clYellow;
end;

procedure TfrmCadCategoria.EDT_NomeExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clWindow;
end;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TB_Cadastro.close;
  Action := cafree;
end;

procedure TfrmCadCategoria.FormShow(Sender: TObject);
begin
  inherited;

  Caption := 'Cadastro de Categoria PLS '+LStatus;

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
         TB_CadastroID.AsInteger           := frmConsultaCategoria.TB_ConsultaID.AsInteger;
         TB_CadastroDescricao.AsString     := frmConsultaCategoria.TB_ConsultaDescricao.AsString;
         TB_Cadastro.Post;
       end
  else if LStatus = '[Filtrando]' then
       begin
         pn_Client_Cad.Visible    := False;
         pn_Client_Filtro.Visible := True;
       end;
end;

procedure TfrmCadCategoria.GravaCliente;
begin
  OCategoria:=TCategoria.create;
  if LStatus ='[Incluindo]' then
  begin
    OCategoria.SetID(0);
    OCategoria.SetDescricao(TB_CadastroDescricao.AsString);
    OCategoria.GravaDados;
  end
  else
    if LStatus ='[Alterando]' then
    begin
      OCategoria.SetID(TB_CadastroID.AsInteger);
      OCategoria.SetDescricao(TB_CadastroDescricao.AsString);
      OCategoria.ALteraDados;
    end;
  OCategoria.Free;
  LStatus :='';
end;

procedure TfrmCadCategoria.LeRegistros;
begin
  OCategoria:=TCategoria.create;
  OCategoria.ConsultaClientesGeral('TB_CategoriaPLS');
  OCategoria.Free;

  frmConsultaCategoria.TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsClientes.DataSet.First;
  while not frmDatamodulo.dsClientes.DataSet.eof  do
  begin
    frmConsultaCategoria.TB_Consulta.Insert;
    frmConsultaCategoria.TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsClientes.DataSet.FieldByName('ID').AsInteger;
    frmConsultaCategoria.TB_ConsultaDescricao.AsString     :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Descricao').AsString;
    frmConsultaCategoria.TB_Consulta.Post;
    frmDatamodulo.dsClientes.DataSet.next;
  end;
end;

procedure TfrmCadCategoria.MostraRegistrosFiltro;
begin
  TB_Cadastro.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsPesquisa.DataSet.eof  do
  begin
    TB_Cadastro.Insert;
    TB_CadastroID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_CadastroDescricao.AsString     :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Descricao').AsString;
    TB_Cadastro.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.
