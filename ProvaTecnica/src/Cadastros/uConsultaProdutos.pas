unit uConsultaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloCad, Data.DB, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, uClsOperadoras, uDatamodulo, Vcl.StdCtrls, uClsProdutosPLS;

type
  TfrmConsultaProdutos = class(TfrmModeloCad)
    TB_ConsultaID: TIntegerField;
    TB_ConsultaDescricaoProd: TStringField;
    TB_ConsultaID_Categoria: TStringField;
    TB_ConsultaDescricaoCategoria: TStringField;
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
    procedure DBG_CadCellClick(Column: TColumn);
  private
    { Private declarations }
    OProdutos: TProdutos;
    procedure LeTodosRegistros;
  public
    { Public declarations }
  end;

var
  frmConsultaProdutos: TfrmConsultaProdutos;

implementation

{$R *.dfm}

uses uCadProdutos;

procedure TfrmConsultaProdutos.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadProdutos,frmCadProdutos);
  frmCadProdutos.TB_Cadastro.CreateDataSet;
  frmCadProdutos.LStatus := '[Alterando]';
  frmCadProdutos.ShowModal;
end;

procedure TfrmConsultaProdutos.btn_ConsultarClick(Sender: TObject);
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
    Application.CreateForm(TfrmCadProdutos,frmCadProdutos);
    frmCadProdutos.TB_Cadastro.CreateDataSet;
    frmCadProdutos.LStatus :='[Consultando]';
    LID := TB_ConsultaID.AsInteger;
    frmCadProdutos.pn_Client_Cad.Visible    := True;
    frmCadProdutos.pn_Client_Filtro.Visible := False;
    TB_Consulta.First;
    while not TB_Consulta.Eof do
    begin
      frmCadProdutos.TB_Cadastro.Insert;
      frmCadProdutos.TB_CadastroID.AsInteger           := TB_ConsultaID.AsInteger;
      frmCadProdutos.TB_CadastroDescricaoProd.AsString := TB_ConsultaDescricaoProd.AsString;
      frmCadProdutos.TB_CadastroID_Categoria.AsString  := TB_ConsultaID_Categoria.AsString;
      frmCadProdutos.TB_Cadastro.Post;
      TB_Consulta.Next;
    end;
    frmCadProdutos.TB_Cadastro.Locate('ID',LID,[]);
    TB_Consulta.Locate('ID',LID,[]);
    frmCadProdutos.ShowModal;
  end;
end;

procedure TfrmConsultaProdutos.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if TB_Consulta.RecordCount = 0 then
  begin
    Application.MessageBox('N?o h? dados para ser excluido.!','Aviso',mb_Ok+mb_IconExclamation);
    exit;
  end
  else
  begin
    if Application.messageBox('Deseja Realmente Apagar Esse Produto?',
      'Confirma??o',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
    begin
      OProdutos:=TProdutos.create;
      OProdutos.SetID(TB_ConsultaID.AsInteger);
      OProdutos.ExcluiDados;
      OProdutos.Free;
      LeTodosRegistros;
    end;
  end;
end;

procedure TfrmConsultaProdutos.btn_FiltrarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadProdutos,frmCadProdutos);
  frmCadProdutos.TB_Cadastro.CreateDataSet;
  frmCadProdutos.LStatus := '[Filtrando]';
  frmCadProdutos.ShowModal;
end;

procedure TfrmConsultaProdutos.btn_IncluirClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadProdutos,frmCadProdutos);
  frmCadProdutos.TB_Cadastro.CreateDataSet;
  frmCadProdutos.LStatus := '[Incluindo]';
  frmCadProdutos.ShowModal;
end;

procedure TfrmConsultaProdutos.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConsultaProdutos.btn_TodosClick(Sender: TObject);
begin
  inherited;
  LeTodosRegistros;
end;

procedure TfrmConsultaProdutos.DBG_CadCellClick(Column: TColumn);
begin
  inherited;;
end;

procedure TfrmConsultaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TB_Consulta.Close;
  Action := cafree;
end;

procedure TfrmConsultaProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if CanClose then
    frmConsultaProdutos := NIL;
end;

procedure TfrmConsultaProdutos.FormShow(Sender: TObject);
begin
  inherited;
  TB_Consulta.CreateDataSet;
  frmDatamodulo.TB_Categoria.Close;
  frmDatamodulo.TB_Categoria.Open();
end;

procedure TfrmConsultaProdutos.LeTodosRegistros;
begin
  OProdutos:=TProdutos.create;
  OProdutos.ConsultaClientesGeral('TB_ProdutoPLS');
  OProdutos.Free;

  TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsPesquisa.DataSet.eof  do
  begin
    TB_Consulta.Insert;
    TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_ConsultaDescricaoProd.AsString :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('DescricaoProd').AsString;
    TB_ConsultaID_Categoria.AsInteger :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID_Categoria').AsInteger;
    TB_Consulta.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.
