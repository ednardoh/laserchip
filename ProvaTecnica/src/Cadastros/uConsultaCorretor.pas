unit uConsultaCorretor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloCad, Data.DB, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, uClsOperadoras, uDatamodulo, Vcl.StdCtrls, uClsCorretor;

type
  TfrmConsultaCorretor = class(TfrmModeloCad)
    TB_ConsultaID: TIntegerField;
    TB_ConsultaCPF: TStringField;
    TB_ConsultaNome: TStringField;
    TB_ConsultaDT_Nascimento: TStringField;
    TB_ConsultaCelular: TStringField;
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
    OCorretor: TCorretor;
    procedure LeTodosRegistros;
  public
    { Public declarations }
  end;

var
  frmConsultaCorretor: TfrmConsultaCorretor;

implementation

{$R *.dfm}

uses uCadOperadoras, uCadCorretor;

procedure TfrmConsultaCorretor.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadCorretor,frmCadCorretor);
  frmCadCorretor.TB_Cadastro.CreateDataSet;
  frmCadCorretor.LStatus := '[Alterando]';
  frmCadCorretor.ShowModal;
end;

procedure TfrmConsultaCorretor.btn_ConsultarClick(Sender: TObject);
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
    Application.CreateForm(TfrmCadCorretor,frmCadCorretor);
    frmCadCorretor.TB_Cadastro.CreateDataSet;
    frmCadCorretor.LStatus :='[Consultando]';
    LID := TB_ConsultaID.AsInteger;
    frmCadCorretor.pn_Client_Cad.Visible    := True;
    frmCadCorretor.pn_Client_Filtro.Visible := False;
    TB_Consulta.First;
    while not TB_Consulta.Eof do
    begin
      frmCadCorretor.TB_Cadastro.Insert;
      frmCadCorretor.TB_CadastroID.AsInteger         := TB_ConsultaID.AsInteger;
      frmCadCorretor.TB_CadastroNome.AsString        := TB_ConsultaNome.AsString;
      frmCadCorretor.TB_CadastroCPF.AsString         := TB_ConsultaCPF.AsString;
      frmCadCorretor.TB_CadastroCelular.AsString     := TB_ConsultaCelular.AsString;
      frmCadCorretor.TB_Cadastro.Post;
      TB_Consulta.Next;
    end;
    frmCadCorretor.TB_Cadastro.Locate('ID',LID,[]);
    TB_Consulta.Locate('ID',LID,[]);
    frmCadCorretor.ShowModal;
  end;
end;

procedure TfrmConsultaCorretor.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if TB_Consulta.RecordCount = 0 then
  begin
    Application.MessageBox('N?o h? dados para ser excluido.!','Aviso',mb_Ok+mb_IconExclamation);
    exit;
  end
  else
  begin
    if Application.messageBox('Deseja Realmente Apagar Esse Corretor?',
      'Confirma??o',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
    begin
      OCorretor:=TCorretor.create;
      OCorretor.SetID(TB_ConsultaID.AsInteger);
      OCorretor.ExcluiDados;
      OCorretor.Free;
      LeTodosRegistros;
    end;
  end;
end;

procedure TfrmConsultaCorretor.btn_FiltrarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadCorretor,frmCadCorretor);
  frmCadCorretor.TB_Cadastro.CreateDataSet;
  frmCadCorretor.LStatus := '[Filtrando]';
  frmCadCorretor.ShowModal;
end;

procedure TfrmConsultaCorretor.btn_IncluirClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadCorretor,frmCadCorretor);
  frmCadCorretor.TB_Cadastro.CreateDataSet;
  frmCadCorretor.LStatus := '[Incluindo]';
  frmCadCorretor.ShowModal;
end;

procedure TfrmConsultaCorretor.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConsultaCorretor.btn_TodosClick(Sender: TObject);
begin
  inherited;
  LeTodosRegistros;
end;

procedure TfrmConsultaCorretor.DBG_CadCellClick(Column: TColumn);
begin
  inherited;;
end;

procedure TfrmConsultaCorretor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TB_Consulta.Close;
  Action := cafree;
end;

procedure TfrmConsultaCorretor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if CanClose then
    frmConsultaCorretor := NIL;
end;

procedure TfrmConsultaCorretor.FormShow(Sender: TObject);
begin
  inherited;
  TB_Consulta.CreateDataSet;
end;

procedure TfrmConsultaCorretor.LeTodosRegistros;
begin
  OCorretor:=TCorretor.create;
  OCorretor.ConsultaClientesGeral('TB_Corretor');
  OCorretor.Free;

  TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsPesquisa.DataSet.eof  do
  begin
    TB_Consulta.Insert;
    TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_ConsultaNome.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Nome').AsString;
    TB_Consultacpf.AsString           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('cpf').AsString;
    TB_ConsultaDT_Nascimento.AsString :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('DT_Nascimento').AsString;
    TB_ConsultaCelular.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Celular').AsString;
    TB_Consulta.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.
