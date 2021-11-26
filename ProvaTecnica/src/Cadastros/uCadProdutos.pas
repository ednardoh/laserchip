unit uCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloTelaCad, Data.DB,
  Datasnap.DBClient, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, REST.Types, REST.Response.Adapter, REST.Client, REST.Json,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtDlgs, Vcl.ComCtrls, uClsProdutosPLS,
  uClsCategoriaPLS;

type
  TfrmCadProdutos = class(TfrmModeloTelaCad)
    Label2: TLabel;
    EDT_Nome: TDBEdit;
    Label4: TLabel;
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
    TB_CadastroDescricaoProd: TStringField;
    TB_CadastroID_Categoria: TStringField;
    DBL_Categoria: TDBLookupComboBox;
    TB_CadastroDescricaoCategoria: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SairClick(Sender: TObject);
    procedure EDT_NomeEnter(Sender: TObject);
    procedure EDT_NomeExit(Sender: TObject);
    procedure btn_CadOkClick(Sender: TObject);
    procedure Btn_RetornarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBL_CategoriaEnter(Sender: TObject);
    procedure DBL_CategoriaExit(Sender: TObject); //busca Cep
  private
    { Private declarations }
    Objeto,
    Objt: TJsonObject;
    ParRows,
    PRows: TJsonPair;
    OProdutos: TProdutos;
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
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

uses uDatamodulo, uConsultaCategoria, uConsultaProdutos;

procedure TfrmCadProdutos.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  OProdutos:=TProdutos.create;
  if edtNome.Text = '' then
    Showmessage('Campo pesquisa não pode ser vazio.')
  else
    begin
        LNomeTabela   := 'TB_ProdutoPLS';
        LNomepesquisa := 'DescricaoProd';
        OProdutos.PesquisaTabela(LNomeTabela, LNomepesquisa, Trim(edtNome.Text));
        MostraRegistrosFiltro;
    end;
  OProdutos.Free;
end;

procedure TfrmCadProdutos.btn_CadOkClick(Sender: TObject);
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
      frmConsultaProdutos.TB_Consulta.EmptyDataSet;
      frmDatamodulo.dsPesquisa.DataSet.First;
      while not frmDatamodulo.dsPesquisa.DataSet.eof do
      begin
        frmConsultaProdutos.TB_Consulta.Insert;
        frmConsultaProdutos.TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
        frmConsultaProdutos.TB_ConsultaDescricaoProd.AsString :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('DescricaoProd').AsString;
        frmConsultaProdutos.TB_ConsultaID_Categoria.AsInteger :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID_Categoria').AsInteger;
        frmConsultaProdutos.TB_Consulta.Post;
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

procedure TfrmCadProdutos.Btn_RetornarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadProdutos.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCadProdutos.DBL_CategoriaEnter(Sender: TObject);
begin
  inherited;
  TDBLookupComboBox(Sender).Color := clYellow;
end;

procedure TfrmCadProdutos.DBL_CategoriaExit(Sender: TObject);
begin
  inherited;
  TDBLookupComboBox(Sender).Color := clWindow;
  if TB_Cadastro.State in [dsEdit, dsInsert] then
    TB_CadastroID_Categoria.AsInteger  := DBL_Categoria.KeyValue;
end;

procedure TfrmCadProdutos.EDT_NomeEnter(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clYellow;
end;

procedure TfrmCadProdutos.EDT_NomeExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clWindow;
end;

procedure TfrmCadProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TB_Cadastro.close;
  Action := cafree;
end;

procedure TfrmCadProdutos.FormShow(Sender: TObject);
begin
  inherited;
  frmDatamodulo.TB_Categoria.Close;
  frmDatamodulo.TB_Categoria.Open();
  OCategoria := TCategoria.Create;
  OCategoria.ConsultaClientesGeral('TB_CategoriaPLS');
  OCategoria.free;

  Caption := 'Cadastro de Produtos '+LStatus;

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
         TB_CadastroID.AsInteger           := frmConsultaProdutos.TB_ConsultaID.AsInteger;
         TB_CadastroDescricaoProd.AsString := frmConsultaProdutos.TB_ConsultaDescricaoProd.AsString;
         TB_CadastroID_Categoria.AsInteger  := frmConsultaProdutos.TB_ConsultaID_Categoria.AsInteger;
         TB_Cadastro.Post;
       end
  else if LStatus = '[Filtrando]' then
       begin
         pn_Client_Cad.Visible    := False;
         pn_Client_Filtro.Visible := True;
       end;
end;

procedure TfrmCadProdutos.GravaCliente;
begin
  OProdutos:=TProdutos.create;
  if LStatus ='[Incluindo]' then
  begin
    OProdutos.SetID(0);
    OProdutos.SetDescricao(TB_CadastroDescricaoProd.AsString);
    OProdutos.SetIDCategoria(TB_CadastroID_Categoria.AsInteger);
    OProdutos.GravaDados;
  end
  else
    if LStatus ='[Alterando]' then
    begin
      OProdutos.SetID(TB_CadastroID.AsInteger);
      OProdutos.SetDescricao(TB_CadastroDescricaoProd.AsString);
      OProdutos.SetIDCategoria(TB_CadastroID_Categoria.AsInteger);
      OProdutos.ALteraDados;
    end;
  OProdutos.Free;
  LStatus :='';
end;

procedure TfrmCadProdutos.LeRegistros;
begin
  OProdutos:=TProdutos.create;
  OProdutos.ConsultaClientesGeral('TB_ProdutoPLS');
  OProdutos.Free;

  frmConsultaProdutos.TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsClientes.DataSet.First;
  while not frmDatamodulo.dsClientes.DataSet.eof  do
  begin
    frmConsultaProdutos.TB_Consulta.Insert;
    frmConsultaProdutos.TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsClientes.DataSet.FieldByName('ID').AsInteger;
    frmConsultaProdutos.TB_ConsultaDescricaoProd.AsString :=  frmDatamodulo.dsClientes.DataSet.FieldByName('DescricaoProd').AsString;
    frmConsultaProdutos.TB_ConsultaID_Categoria.AsInteger :=  frmDatamodulo.dsClientes.DataSet.FieldByName('ID_Categoria').AsInteger;
    frmConsultaProdutos.TB_Consulta.Post;
    frmDatamodulo.dsClientes.DataSet.next;
  end;
end;

procedure TfrmCadProdutos.MostraRegistrosFiltro;
begin
  TB_Cadastro.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsPesquisa.DataSet.eof  do
  begin
    TB_Cadastro.Insert;
    TB_CadastroID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_CadastroDescricaoProd.AsString :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('DescricaoProd').AsString;
    TB_CadastroID_Categoria.AsInteger :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID_Categoria').AsInteger;
    TB_Cadastro.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.
