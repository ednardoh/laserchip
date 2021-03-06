unit uCadTabpreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloTelaCad, Data.DB,
  Datasnap.DBClient, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, REST.Types, REST.Response.Adapter, REST.Client, REST.Json,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtDlgs, Vcl.ComCtrls, uClsTabelaPreco,
  uClsCategoriaPLS;

type
  TfrmCadTabPreco = class(TfrmModeloTelaCad)
    Label2: TLabel;
    EDT_PercDesc: TDBEdit;
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
    DBL_DescProduto: TDBLookupComboBox;
    TB_CadastroID_Produto: TIntegerField;
    TB_CadastroPercDesconto: TCurrencyField;
    TB_CadastroPrecoProduto: TCurrencyField;
    EDT_PrecoVendaPrd: TDBEdit;
    Label1: TLabel;
    TB_CadastroDescrProduto: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SairClick(Sender: TObject);
    procedure EDT_PercDescEnter(Sender: TObject);
    procedure EDT_PercDescExit(Sender: TObject);
    procedure btn_CadOkClick(Sender: TObject);
    procedure Btn_RetornarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBL_DescProdutoEnter(Sender: TObject);
    procedure DBL_DescProdutoExit(Sender: TObject);
    procedure DBL_DescProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EDT_PercDescKeyPress(Sender: TObject; var Key: Char); //busca Cep
  private
    { Private declarations }
    Objeto,
    Objt: TJsonObject;
    ParRows,
    PRows: TJsonPair;
    OTabPreco: TTabPreco;
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
  frmCadTabPreco: TfrmCadTabPreco;

implementation

{$R *.dfm}

uses uDatamodulo, uConsultaCategoria, uConsultaProdutos, uConsultaTabpreco;

procedure TfrmCadTabPreco.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  OTabPreco:=TTabPreco.create;
  if edtNome.Text = '' then
    Showmessage('Campo pesquisa n?o pode ser vazio.')
  else
    begin
        LNomeTabela   := 'TB_TabelaPreco';
        LNomepesquisa := 'ID_Produto';
        OTabPreco.PesquisaTabela(LNomeTabela, LNomepesquisa, Trim(edtNome.Text));
        MostraRegistrosFiltro;
    end;
  OTabPreco.Free;
end;

procedure TfrmCadTabPreco.btn_CadOkClick(Sender: TObject);
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
      frmConsultaTabPreco.TB_Consulta.EmptyDataSet;
      frmDatamodulo.dsPesquisa.DataSet.First;
      while not frmDatamodulo.dsPesquisa.DataSet.eof do
      begin
        frmConsultaTabPreco.TB_Consulta.Insert;
        frmConsultaTabPreco.TB_ConsultaID.AsInteger         :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
        frmConsultaTabPreco.TB_ConsultaID_Produto.AsInteger :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID_Produto').AsInteger;
        frmConsultaTabPreco.TB_ConsultaPercDesconto.AsFloat :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('PercDesconto').AsFloat;
        frmConsultaTabPreco.TB_ConsultaPrecoProduto.AsFloat :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('PrecoProduto').AsFloat;
        frmConsultaTabPreco.TB_Consulta.Post;
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

procedure TfrmCadTabPreco.Btn_RetornarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadTabPreco.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCadTabPreco.DBL_DescProdutoEnter(Sender: TObject);
begin
  inherited;
  TDBLookupComboBox(Sender).Color := clYellow;
end;

procedure TfrmCadTabPreco.DBL_DescProdutoExit(Sender: TObject);
begin
  inherited;
  TDBLookupComboBox(Sender).Color := clWindow;
end;

procedure TfrmCadTabPreco.DBL_DescProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then EDT_PercDesc.SetFocus;

end;

procedure TfrmCadTabPreco.EDT_PercDescEnter(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clYellow;
end;

procedure TfrmCadTabPreco.EDT_PercDescExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clWindow;
end;

procedure TfrmCadTabPreco.EDT_PercDescKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key=#13 then EDT_PrecoVendaPrd.SetFocus;
end;

procedure TfrmCadTabPreco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TB_Cadastro.close;
  Action := cafree;
end;

procedure TfrmCadTabPreco.FormShow(Sender: TObject);
begin
  inherited;
  frmDatamodulo.TB_Categoria.Close;
  frmDatamodulo.TB_Categoria.Open();
  OTabPreco := TTabPreco.Create;
  OTabPreco.ConsultaTabprecoGeral('TB_TabelaPreco');
  OTabPreco.free;

  Caption := 'Cadastro de Tabela de Pre?os '+LStatus;

  if LStatus = '[Incluindo]' then
  begin
    pn_Client_Cad.Visible    := True;
    pn_Client_Filtro.Visible := False;
    DBL_DescProduto.SetFocus;
    TB_Cadastro.Insert;
  end
  else if LStatus = '[Alterando]' then
       begin
         pn_Client_Cad.Visible    := True;
         pn_Client_Filtro.Visible := False;
         TB_Cadastro.Insert;
         TB_CadastroID.AsInteger            := frmConsultaTabPreco.TB_ConsultaID.AsInteger;
         TB_CadastroID_Produto.AsInteger    := frmConsultaTabPreco.TB_ConsultaID_Produto.AsInteger;
         TB_CadastroPercDesconto.AsFloat    := frmConsultaTabPreco.TB_ConsultaPercDesconto.AsFloat;
         TB_CadastroPrecoProduto.AsFloat    := frmConsultaTabPreco.TB_ConsultaPrecoProduto.AsFloat;
         TB_Cadastro.Post;
       end
  else if LStatus = '[Filtrando]' then
       begin
         pn_Client_Cad.Visible    := False;
         pn_Client_Filtro.Visible := True;
       end;
end;

procedure TfrmCadTabPreco.GravaCliente;
begin
  OTabPreco:=TTabPreco.create;
  if LStatus ='[Incluindo]' then
  begin
    OTabPreco.SetID(0);
    OTabPreco.SetIDProduto(TB_CadastroID_Produto.AsInteger);
    OTabPreco.SetPercDesconto(TB_CadastroPercDesconto.AsFloat);
    OTabPreco.SetPrecoProduto(TB_CadastroPrecoProduto.AsFloat);
    OTabPreco.GravaDados;
  end
  else
    if LStatus ='[Alterando]' then
    begin
      OTabPreco.SetID(TB_CadastroID.AsInteger);
      OTabPreco.SetIDProduto(TB_CadastroID_Produto.AsInteger);
      OTabPreco.SetPercDesconto(TB_CadastroPercDesconto.AsFloat);
      OTabPreco.SetPrecoProduto(TB_CadastroPrecoProduto.AsFloat);
      OTabPreco.ALteraDados;
    end;
  OTabPreco.Free;
  LStatus :='';
end;

procedure TfrmCadTabPreco.LeRegistros;
begin
  OTabPreco:=TTabPreco.create;
  OTabPreco.ConsultaTabprecoGeral('TB_TabelaPreco');
  OTabPreco.Free;

  frmConsultaTabpreco.TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsClientes.DataSet.First;
  while not frmDatamodulo.dsClientes.DataSet.eof  do
  begin
    frmConsultaTabpreco.TB_Consulta.Insert;
    frmConsultaTabpreco.TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsClientes.DataSet.FieldByName('ID').AsInteger;
    frmConsultaTabpreco.TB_ConsultaID_Produto.AsInteger   :=  frmDatamodulo.dsClientes.DataSet.FieldByName('ID_Produto').AsInteger;
    frmConsultaTabpreco.TB_ConsultaPercDesconto.AsFloat   :=  frmDatamodulo.dsClientes.DataSet.FieldByName('PercDesconto').AsFloat;
    frmConsultaTabPreco.TB_ConsultaPrecoProduto.AsFloat   :=  frmDatamodulo.dsClientes.DataSet.FieldByName('PrecoProduto').AsFloat;
    frmConsultaTabpreco.TB_Consulta.Post;
    frmDatamodulo.dsClientes.DataSet.next;
  end;
end;

procedure TfrmCadTabPreco.MostraRegistrosFiltro;
begin
  TB_Cadastro.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsPesquisa.DataSet.eof  do
  begin
    TB_Cadastro.Insert;
    TB_CadastroID.AsInteger         :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_CadastroID_Produto.AsInteger :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID_Produto').AsInteger;
    TB_CadastroPercDesconto.AsFloat :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('PercDesconto').AsFloat;
    TB_CadastroPrecoProduto.AsFloat :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('PrecoProduto').AsFloat;
    TB_Cadastro.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.
