unit uConsultaCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloCad, Data.DB, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, uClsOperadoras, uDatamodulo, Vcl.StdCtrls, uClsCategoriaPLS;

type
  TfrmConsultaCategoria = class(TfrmModeloCad)
    TB_ConsultaID: TIntegerField;
    TB_ConsultaDescricao: TStringField;
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
    OCategoria: TCategoria;
    procedure LeTodosRegistros;
  public
    { Public declarations }
  end;

var
  frmConsultaCategoria: TfrmConsultaCategoria;

implementation

{$R *.dfm}

uses uCadCategoria;

procedure TfrmConsultaCategoria.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadCategoria,frmCadCategoria);
  frmCadCategoria.TB_Cadastro.CreateDataSet;
  frmCadCategoria.LStatus := '[Alterando]';
  frmCadCategoria.ShowModal;
end;

procedure TfrmConsultaCategoria.btn_ConsultarClick(Sender: TObject);
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
    Application.CreateForm(TfrmCadCategoria,frmCadCategoria);
    frmCadCategoria.TB_Cadastro.CreateDataSet;
    frmCadCategoria.LStatus :='[Consultando]';
    LID := TB_ConsultaID.AsInteger;
    frmCadCategoria.pn_Client_Cad.Visible    := True;
    frmCadCategoria.pn_Client_Filtro.Visible := False;
    TB_Consulta.First;
    while not TB_Consulta.Eof do
    begin
      frmCadCategoria.TB_Cadastro.Insert;
      frmCadCategoria.TB_CadastroID.AsInteger         := TB_ConsultaID.AsInteger;
      frmCadCategoria.TB_CadastroDescricao.AsString   := TB_ConsultaDescricao.AsString;
      frmCadCategoria.TB_Cadastro.Post;
      TB_Consulta.Next;
    end;
    frmCadCategoria.TB_Cadastro.Locate('ID',LID,[]);
    TB_Consulta.Locate('ID',LID,[]);
    frmCadCategoria.ShowModal;
  end;
end;

procedure TfrmConsultaCategoria.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if TB_Consulta.RecordCount = 0 then
  begin
    Application.MessageBox('N?o h? dados para ser excluido.!','Aviso',mb_Ok+mb_IconExclamation);
    exit;
  end
  else
  begin
    if Application.messageBox('Deseja Realmente Apagar Essa Categoria?',
      'Confirma??o',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
    begin
      OCategoria:=TCategoria.create;
      OCategoria.SetID(TB_ConsultaID.AsInteger);
      OCategoria.ExcluiDados;
      OCategoria.Free;
      LeTodosRegistros;
    end;
  end;
end;

procedure TfrmConsultaCategoria.btn_FiltrarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadCategoria,frmCadCategoria);
  frmCadCategoria.TB_Cadastro.CreateDataSet;
  frmCadCategoria.LStatus := '[Filtrando]';
  frmCadCategoria.ShowModal;
end;

procedure TfrmConsultaCategoria.btn_IncluirClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadCategoria,frmCadCategoria);
  frmCadCategoria.TB_Cadastro.CreateDataSet;
  frmCadCategoria.LStatus := '[Incluindo]';
  frmCadCategoria.ShowModal;
end;

procedure TfrmConsultaCategoria.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConsultaCategoria.btn_TodosClick(Sender: TObject);
begin
  inherited;
  LeTodosRegistros;
end;

procedure TfrmConsultaCategoria.DBG_CadCellClick(Column: TColumn);
begin
  inherited;;
end;

procedure TfrmConsultaCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TB_Consulta.Close;
  Action := cafree;
end;

procedure TfrmConsultaCategoria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if CanClose then
    frmConsultaCategoria := NIL;
end;

procedure TfrmConsultaCategoria.FormShow(Sender: TObject);
begin
  inherited;
  TB_Consulta.CreateDataSet;
end;

procedure TfrmConsultaCategoria.LeTodosRegistros;
begin
  OCategoria:=TCategoria.create;
  OCategoria.ConsultaClientesGeral('TB_CategoriaPLS');
  OCategoria.Free;

  TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsClientes.DataSet.eof  do
  begin
    TB_Consulta.Insert;
    TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_ConsultaDescricao.AsString     :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Descricao').AsString;
    TB_Consulta.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.


