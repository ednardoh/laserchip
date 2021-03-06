unit uConsultaOperadoras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloCad, Data.DB, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, uClsOperadoras, uDatamodulo, Vcl.StdCtrls;

type
  TfrmConsultaOperadoras = class(TfrmModeloCad)
    TB_ConsultaID: TIntegerField;
    TB_ConsultaCnpj: TStringField;
    TB_ConsultaRazaoSocial: TStringField;
    TB_ConsultaCEP: TStringField;
    TB_ConsultaLogradouro: TStringField;
    TB_ConsultaNumero: TStringField;
    TB_ConsultaComplemento: TStringField;
    TB_ConsultaBairro: TStringField;
    TB_ConsultaCidade: TStringField;
    TB_ConsultaIbge_cidade: TStringField;
    TB_ConsultaSigla_uf: TStringField;
    TB_ConsultaIbge_uf: TStringField;
    TB_ConsultaLogo: TStringField;
    pn_Logo: TPanel;
    img_Logo: TImage;
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
    procedure DBG_CadDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBG_CadDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBG_CadCellClick(Column: TColumn);
    procedure DBG_CadDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ds_ConsultaStateChange(Sender: TObject);
  private
    { Private declarations }
    Operadoras: TOperadoras;
    procedure LeTodosRegistros;
    procedure LeLogo(const Valor: string);
  public
    { Public declarations }
  end;

var
  frmConsultaOperadoras: TfrmConsultaOperadoras;

implementation

{$R *.dfm}

uses uCadOperadoras;

procedure TfrmConsultaOperadoras.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadOperadoras,frmCadOperadoras);
  frmCadOperadoras.TB_Cadastro.CreateDataSet;
  frmCadOperadoras.LStatus := '[Alterando]';
  frmCadOperadoras.ShowModal;
  LeLogo(TB_ConsultaLogo.AsString);
end;

procedure TfrmConsultaOperadoras.btn_ConsultarClick(Sender: TObject);
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
    Application.CreateForm(TfrmCadOperadoras,frmCadOperadoras);
    frmCadOperadoras.TB_Cadastro.CreateDataSet;
    frmCadOperadoras.LStatus :='[Consultando]';
    LID := TB_ConsultaID.AsInteger;
    frmCadOperadoras.pn_Client_Cad.Visible    := True;
    frmCadOperadoras.pn_Client_Filtro.Visible := False;
    TB_Consulta.First;
    while not TB_Consulta.Eof do
    begin
      frmCadOperadoras.TB_Cadastro.Insert;
      frmCadOperadoras.TB_CadastroID.AsInteger         := TB_ConsultaID.AsInteger;
      frmCadOperadoras.TB_CadastroCnpj.AsString        := TB_ConsultaCnpj.AsString;
      frmCadOperadoras.TB_CadastroRazaoSocial.AsString        := TB_ConsultaRazaoSocial.AsString;
      frmCadOperadoras.TB_CadastroCEP.AsString         := TB_ConsultaCEP.AsString;
      frmCadOperadoras.TB_CadastroLogradouro.AsString  := TB_ConsultaLogradouro.AsString;
      frmCadOperadoras.TB_CadastroNumero.AsString      := TB_ConsultaNumero.AsString;
      frmCadOperadoras.TB_CadastroComplemento.AsString := TB_ConsultaComplemento.AsString;
      frmCadOperadoras.TB_CadastroBairro.AsString      := TB_ConsultaBairro.AsString;
      frmCadOperadoras.TB_CadastroCidade.AsString      := TB_ConsultaCidade.AsString;
      frmCadOperadoras.TB_CadastroSigla_uf.AsString    := TB_ConsultaSigla_uf.AsString;
      frmCadOperadoras.TB_CadastroIbge_cidade.AsString := TB_ConsultaIbge_cidade.AsString;
      frmCadOperadoras.TB_CadastroIbge_uf.AsString     := TB_ConsultaIbge_uf.AsString;
      frmCadOperadoras.TB_CadastroLogo.AsString        := TB_ConsultaLogo.AsString;
      frmCadOperadoras.TB_Cadastro.Post;
      TB_Consulta.Next;
    end;
    frmCadOperadoras.TB_Cadastro.Locate('ID',LID,[]);
    TB_Consulta.Locate('ID',LID,[]);
    LeLogo(TB_ConsultaLogo.AsString);
    frmCadOperadoras.ShowModal;
  end;
end;

procedure TfrmConsultaOperadoras.btn_ExcluirClick(Sender: TObject);
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
      Operadoras:=TOperadoras.create;
      Operadoras.SetID(TB_ConsultaID.AsInteger);
      Operadoras.ExcluiDados;
      Operadoras.Free;
      LeTodosRegistros;
      LeLogo(TB_ConsultaLogo.AsString);
    end;
  end;
end;

procedure TfrmConsultaOperadoras.btn_FiltrarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadOperadoras,frmCadOperadoras);
  frmCadOperadoras.TB_Cadastro.CreateDataSet;
  frmCadOperadoras.LStatus := '[Filtrando]';
  frmCadOperadoras.ShowModal;
  LeLogo(TB_ConsultaLogo.AsString);
end;

procedure TfrmConsultaOperadoras.btn_IncluirClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadOperadoras,frmCadOperadoras);
  frmCadOperadoras.TB_Cadastro.CreateDataSet;
  frmCadOperadoras.LStatus := '[Incluindo]';
  frmCadOperadoras.ShowModal;
  LeLogo(TB_ConsultaLogo.AsString);
end;

procedure TfrmConsultaOperadoras.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConsultaOperadoras.btn_TodosClick(Sender: TObject);
begin
  inherited;
  LeTodosRegistros;
  LeLogo(TB_ConsultaLogo.AsString);
end;

procedure TfrmConsultaOperadoras.DBG_CadCellClick(Column: TColumn);
begin
  inherited;
  LeLogo(TB_ConsultaLogo.AsString);
end;

procedure TfrmConsultaOperadoras.DBG_CadDblClick(Sender: TObject);
begin
  inherited;
  LeLogo(TB_ConsultaLogo.AsString);
end;

procedure TfrmConsultaOperadoras.DBG_CadDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  LeLogo(TB_ConsultaLogo.AsString);
end;

procedure TfrmConsultaOperadoras.DBG_CadDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  LeLogo(TB_ConsultaLogo.AsString);
end;

procedure TfrmConsultaOperadoras.ds_ConsultaStateChange(Sender: TObject);
begin
  inherited;
  LeLogo(TB_ConsultaLogo.AsString);
end;

procedure TfrmConsultaOperadoras.FormActivate(Sender: TObject);
begin
  inherited;
  LeLogo(TB_ConsultaLogo.AsString);
end;

procedure TfrmConsultaOperadoras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TB_Consulta.Close;
  Action := cafree;
end;

procedure TfrmConsultaOperadoras.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if CanClose then
    frmConsultaOperadoras := NIL;
end;

procedure TfrmConsultaOperadoras.FormShow(Sender: TObject);
begin
  inherited;
  TB_Consulta.CreateDataSet;
end;

procedure TfrmConsultaOperadoras.LeLogo(const Valor: string);
begin
  if Valor <> '' then
  begin
    img_Logo.Picture.LoadFromFile(Valor);
  end;
end;

procedure TfrmConsultaOperadoras.LeTodosRegistros;
begin
  Operadoras:=TOperadoras.create;
  Operadoras.ConsultaClientesGeral('TB_Operadoras');
  Operadoras.Free;

  TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsPesquisa.DataSet.eof  do
  begin
    TB_Consulta.Insert;
    TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_ConsultaCnpj.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cnpj').AsString;
    TB_ConsultaRazaoSocial.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('RazaoSocial').AsString;
    TB_ConsultaCEP.AsString           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cep').AsString;
    TB_ConsultaLogradouro.AsString    :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Logradouro').AsString;
    TB_ConsultaNumero.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Numero').AsString;
    TB_ConsultaComplemento.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Complemento').AsString;
    TB_ConsultaBairro.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Bairro').AsString;
    TB_ConsultaCidade.AsString        :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cidade').AsString;
    TB_ConsultaSigla_uf.AsString      :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_cidade').AsString;
    TB_ConsultaIbge_cidade.AsString   :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Sigla_uf').AsString;
    TB_ConsultaIbge_uf.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Ibge_uf').AsString;
    TB_ConsultaLogo.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Logo').AsString;
    TB_Consulta.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.
