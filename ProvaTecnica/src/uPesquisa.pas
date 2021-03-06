unit uPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, FMTBcd, SqlExpr,
  Provider, DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.Intf, uClsCorretor, uClsCliente, uClsOperadoras, uClsCategoriaPLS,
  uClsProdutosPLS;

type
  TFrmPesquisa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtNome: TEdit;
    btnPesquisar: TButton;
    btnSelecionar: TButton;
    btnCancelar: TButton;
    dbgPesquisa: TDBGrid;
    dsPesquisa: TDataSource;
    rdg_Ordenar: TRadioGroup;
    Label2: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rdg_OrdenarClick(Sender: TObject);
  private
    { Private declarations }
    oCorretor : TCorretor;
    oClientes : TClientes;
    oOperadora: TOperadoras;
    oProdutos : TProdutos;
   // PedidoVenda    : TPedidovenda;
   // PedidoProdutos : TProdutosPedido;
    procedure buscaRegistro;
  public
    { Public declarations }
    LNomeTabela,
    LCodigo,
    LNomeCampoPesquisaLIke : String;
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

Uses uPrincipal, uDatamodulo;

procedure TFrmPesquisa.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmPesquisa.btnSelecionarClick(Sender: TObject);
begin
  frmDatamodulo.LValCodigo := dbgPesquisa.Columns.Grid.Fields[0].AsString;
  frmDatamodulo.LValNome   := dbgPesquisa.Columns.Grid.Fields[1].AsString;
  close;
end;

procedure TFrmPesquisa.buscaRegistro;
begin
  if LNomeTabela = 'TB_Corretor' then
  begin
    oCorretor := TCorretor.Create;
    if rdg_Ordenar.ItemIndex = 0 then
      LCodigo := 'ID'
    else
      LCodigo := 'NOME';
    oCorretor.PesquisaTabela(LNomeTabela, LNomeCampoPesquisaLIke, '%%');
  end
  else
    if LNomeTabela = 'TB_Clientes' then
    begin
      oClientes := TClientes.Create;
      if rdg_Ordenar.ItemIndex = 0 then
        LCodigo := 'ID'
      else
        LCodigo := 'Nome';
      oClientes.PesquisaTabela(LNomeTabela, LNomeCampoPesquisaLIke, '%%');
    end
  else
    if LNomeTabela = 'TB_Operadoras' then
    begin
      oOperadora:= TOperadoras.Create;
      if rdg_Ordenar.ItemIndex = 0 then
        LCodigo := 'ID'
      else
        LCodigo := 'RazaoSocial';
      oOperadora.PesquisaTabela(LNomeTabela, LNomeCampoPesquisaLIke, '%%');
    end
  else
    if LNomeTabela = 'TB_ProdutoPLS' then
    begin
      oProdutos := TProdutos.Create;
      if rdg_Ordenar.ItemIndex = 0 then
        LCodigo := 'ID'
      else
        LCodigo := 'DescricaoProd';
      oProdutos.PesquisaTabela(LNomeTabela, LNomeCampoPesquisaLIke, '%%');
    end;
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
begin
  buscaRegistro;
end;

procedure TFrmPesquisa.rdg_OrdenarClick(Sender: TObject);
begin
  buscaRegistro;
end;

procedure TFrmPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if LNomeTabela = 'TB_Corretor' then
      oCorretor.Free
  else
    if LNomeTabela = 'TB_Clientes' then
      oClientes.Free
  else
    if LNomeTabela = 'TB_Operadoras' then
      oOperadora.Free
  else
    if LNomeTabela = 'TB_ProdutoPLS' then
      oProdutos.Free;

  Action := cafree;

end;

procedure TFrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f3 then btnPesquisarClick(Self);
  if key = vk_f5 then btnSelecionarClick(Self);
  if key = vk_escape then btnCancelarClick(Self);
end;

procedure TFrmPesquisa.dbgPesquisaDblClick(Sender: TObject);
begin
  btnSelecionarClick(Self);
end;

procedure TFrmPesquisa.btnPesquisarClick(Sender: TObject);
begin
  if edtNome.Text = '' then
    Showmessage('Campo pesquisa n?o pode ser vazio.')
  else
    begin
      if LNomeTabela = 'TB_Corretor' then
        oCorretor.PesquisaTabela(LNomeTabela, LNomeCampoPesquisaLIke, Trim(edtNome.Text))
      else
        if LNomeTabela = 'TB_Clientes' then
          oClientes.PesquisaTabela(LNomeTabela, LNomeCampoPesquisaLIke, Trim(edtNome.Text))
      else
        if LNomeTabela = 'TB_Operadoras' then
          oOperadora.PesquisaTabela(LNomeTabela, LNomeCampoPesquisaLIke, Trim(edtNome.Text))
      else
        if LNomeTabela = 'TB_ProdutoPLS' then
          oProdutos.PesquisaTabela(LNomeTabela, LNomeCampoPesquisaLIke, Trim(edtNome.Text));
    end;
end;

procedure TFrmPesquisa.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      dbgPesquisa.SetFocus;
    end;
end;

procedure TFrmPesquisa.dbgPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then btnSelecionarClick(Self);
end;

end.
