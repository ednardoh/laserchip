unit uConsultaTabpreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloCad, Data.DB, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, uClsOperadoras, uDatamodulo, Vcl.StdCtrls, uClsTabelaPreco;

type
  TfrmConsultaTabPreco = class(TfrmModeloCad)
    TB_ConsultaID: TIntegerField;
    TB_ConsultaID_Produto: TIntegerField;
    TB_ConsultaPercDesconto: TCurrencyField;
    TB_ConsultaPrecoProduto: TCurrencyField;
    TB_ConsultaDescrProduto: TStringField;
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
    OTabPreco: TTabPreco;
    procedure LeTodosRegistros;
  public
    { Public declarations }
  end;

var
  frmConsultaTabPreco: TfrmConsultaTabPreco;

implementation

{$R *.dfm}

uses uCadTabpreco;

procedure TfrmConsultaTabPreco.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadTabPreco,frmCadTabPreco);
  frmCadTabPreco.TB_Cadastro.CreateDataSet;
  frmCadTabPreco.LStatus := '[Alterando]';
  frmCadTabPreco.ShowModal;
end;

procedure TfrmConsultaTabPreco.btn_ConsultarClick(Sender: TObject);
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
    Application.CreateForm(TfrmCadTabPreco,frmCadTabPreco);
    frmCadTabPreco.TB_Cadastro.CreateDataSet;
    frmCadTabPreco.LStatus :='[Consultando]';
    LID := TB_ConsultaID.AsInteger;
    frmCadTabPreco.pn_Client_Cad.Visible    := True;
    frmCadTabPreco.pn_Client_Filtro.Visible := False;
    TB_Consulta.First;
    while not TB_Consulta.Eof do
    begin
      frmCadTabPreco.TB_Cadastro.Insert;
      frmCadTabPreco.TB_CadastroID.AsInteger          := TB_ConsultaID.AsInteger;
      frmCadTabPreco.TB_CadastroID_Produto.AsInteger  := TB_ConsultaID_Produto.AsInteger;
      frmCadTabPreco.TB_CadastroPercDesconto.AsFloat  := TB_ConsultaPercDesconto.AsFloat;
      frmCadTabPreco.TB_CadastroPrecoProduto.AsFloat  := TB_ConsultaPrecoProduto.AsFloat;
      frmCadTabPreco.TB_Cadastro.Post;
      TB_Consulta.Next;
    end;
    frmCadTabPreco.TB_Cadastro.Locate('ID',LID,[]);
    TB_Consulta.Locate('ID',LID,[]);
    frmCadTabPreco.ShowModal;
  end;
end;

procedure TfrmConsultaTabPreco.btn_ExcluirClick(Sender: TObject);
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
      OTabPreco:=TTabPreco.create;
      OTabPreco.SetID(TB_ConsultaID.AsInteger);
      OTabPreco.ExcluiDados;
      OTabPreco.Free;
      LeTodosRegistros;
    end;
  end;
end;

procedure TfrmConsultaTabPreco.btn_FiltrarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadTabPreco,frmCadTabPreco);
  frmCadTabPreco.TB_Cadastro.CreateDataSet;
  frmCadTabPreco.LStatus := '[Filtrando]';
  frmCadTabPreco.ShowModal;
end;

procedure TfrmConsultaTabPreco.btn_IncluirClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadTabPreco,frmCadTabPreco);
  frmCadTabPreco.TB_Cadastro.CreateDataSet;
  frmCadTabPreco.LStatus := '[Incluindo]';
  frmCadTabPreco.ShowModal;
end;

procedure TfrmConsultaTabPreco.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConsultaTabPreco.btn_TodosClick(Sender: TObject);
begin
  inherited;
  LeTodosRegistros;
end;

procedure TfrmConsultaTabPreco.DBG_CadCellClick(Column: TColumn);
begin
  inherited;;
end;

procedure TfrmConsultaTabPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TB_Consulta.Close;
  Action := cafree;
end;

procedure TfrmConsultaTabPreco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if CanClose then
    frmConsultaTabPreco := NIL;
end;

procedure TfrmConsultaTabPreco.FormShow(Sender: TObject);
begin
  inherited;
  TB_Consulta.CreateDataSet;
  frmDatamodulo.TB_Categoria.Close;
  frmDatamodulo.TB_Categoria.Open();
end;

procedure TfrmConsultaTabPreco.LeTodosRegistros;
begin
  OTabPreco:=TTabPreco.create;
  OTabPreco.ConsultaTabprecoGeral('TB_TabelaPreco');
  OTabPreco.Free;

  TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsPesquisa.DataSet.eof  do
  begin
    TB_Consulta.Insert;
    TB_ConsultaID.AsInteger         := frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_ConsultaID_Produto.AsInteger := frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID_Produto').AsInteger;
    TB_ConsultaPercDesconto.AsFloat := frmDatamodulo.dsPesquisa.DataSet.FieldByName('PercDesconto').AsFloat;
    TB_ConsultaPrecoProduto.AsFloat := frmDatamodulo.dsPesquisa.DataSet.FieldByName('PrecoProduto').AsFloat;
    TB_Consulta.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.
