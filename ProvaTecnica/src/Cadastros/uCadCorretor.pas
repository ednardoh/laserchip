unit uCadCorretor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModeloTelaCad, Data.DB,
  Datasnap.DBClient, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, REST.Types, REST.Response.Adapter, REST.Client, REST.Json,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtDlgs, Vcl.ComCtrls, uClsCorretor;

type
  TfrmCadCorretor = class(TfrmModeloTelaCad)
    Label1: TLabel;
    EDT_CpfCnpj: TDBEdit;
    Label2: TLabel;
    EDT_Nome: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    EDT_Logradouro: TDBEdit;
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
    TB_CadastroNome: TStringField;
    TB_CadastroCPF: TStringField;
    TB_CadastroDT_Nascimento: TStringField;
    TB_CadastroCelular: TStringField;
    DTP_Nascimento: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SairClick(Sender: TObject);
    procedure EDT_CpfCnpjEnter(Sender: TObject);
    procedure EDT_CpfCnpjExit(Sender: TObject);
    procedure EDT_NomeEnter(Sender: TObject);
    procedure EDT_NomeExit(Sender: TObject);
    procedure btn_CadOkClick(Sender: TObject);
    procedure Btn_RetornarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DTP_NascimentoEnter(Sender: TObject);
    procedure DTP_NascimentoExit(Sender: TObject); //busca Cep
  private
    { Private declarations }
    Objeto,
    Objt: TJsonObject;
    ParRows,
    PRows: TJsonPair;
    OCorretor: TCorretor;
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
  frmCadCorretor: TfrmCadCorretor;

implementation

{$R *.dfm}

uses uDatamodulo, uConsultaCorretor;

procedure TfrmCadCorretor.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  OCorretor:=TCorretor.create;
  if edtNome.Text = '' then
    Showmessage('Campo pesquisa não pode ser vazio.')
  else
    begin
        LNomeTabela   := 'TB_Corretor';
        LNomepesquisa := 'Nome';
        OCorretor.PesquisaTabela(LNomeTabela, LNomepesquisa, Trim(edtNome.Text));
        MostraRegistrosFiltro;
    end;
  OCorretor.Free;
end;

procedure TfrmCadCorretor.btn_CadOkClick(Sender: TObject);
begin
  inherited;
  if TB_Cadastro.State in [dsEdit, dsInsert] then
  begin
    if TB_CadastroCPF.AsString = '' then
    begin
      Application.MessageBox('CPF não pode ser Vazio.!','Aviso',mb_Ok+mb_IconExclamation);
      EDT_CpfCnpj.SetFocus;
      exit;
    end
    else
    begin
      TB_Cadastro.Post;
      GravaCliente;
      Application.MessageBox('Dados Gravados com sucesso.!','Aviso',mb_Ok+mb_IconExclamation);
      LeRegistros;
    end;
    TB_Cadastro.EmptyDataSet;
    Close;
  end;

  if LStatus = '[Filtrando]' then
  begin
    if frmDatamodulo.dsPesquisa.DataSet <> NIL then
    begin
      pn_Client_Cad.Visible    := True;
      pn_Client_Filtro.Visible := False;
      frmConsultaCorretor.TB_Consulta.EmptyDataSet;
      frmDatamodulo.dsPesquisa.DataSet.First;
      while not frmDatamodulo.dsPesquisa.DataSet.eof do
      begin
        frmConsultaCorretor.TB_Consulta.Insert;
        frmConsultaCorretor.TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
        frmConsultaCorretor.TB_Consultacpf.AsString           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('CPF').AsString;
        frmConsultaCorretor.TB_ConsultaNome.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Nome').AsString;
        frmConsultaCorretor.TB_ConsultaDT_Nascimento.AsString :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('DT_Nascimento').AsString;
        frmConsultaCorretor.TB_ConsultaCelular.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Celular').AsString;
        frmConsultaCorretor.TB_Consulta.Post;
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

procedure TfrmCadCorretor.Btn_RetornarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadCorretor.btn_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCadCorretor.DTP_NascimentoEnter(Sender: TObject);
begin
  inherited;
  TDateTimePicker(Sender).Color := clYellow;
end;

procedure TfrmCadCorretor.DTP_NascimentoExit(Sender: TObject);
begin
  inherited;
  TDateTimePicker(Sender).Color := clWindow;
  if TB_Cadastro.State in [dsInsert, dsEdit] then
    TB_CadastroDT_Nascimento.AsString := FormatDateTime('dd/mm/yyyy',DTP_Nascimento.Date);
end;

procedure TfrmCadCorretor.EDT_CpfCnpjEnter(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clYellow;
end;

procedure TfrmCadCorretor.EDT_CpfCnpjExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clWindow;
  if TB_Cadastro.State in [dsEdit, dsInsert] then
  begin
    if Length(TB_CadastroCpf.AsString) = 11 then
    begin
      if not frmDatamodulo.ChecaCpf(frmDatamodulo.CharEspeciais(TB_CadastroCpf.AsString)) then
      begin
        Application.MessageBox('CPF Não é válido!','Aviso',mb_Ok+mb_IconExclamation);
      end;
    end
    else
    begin
      Application.MessageBox('CPF Não é válido!','Aviso',mb_Ok+mb_IconExclamation);
    end;
  end;
end;

procedure TfrmCadCorretor.EDT_NomeEnter(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clYellow;
end;

procedure TfrmCadCorretor.EDT_NomeExit(Sender: TObject);
begin
  inherited;
  TDBEdit(Sender).Color := clWindow;
end;

procedure TfrmCadCorretor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TB_Cadastro.close;
  Action := cafree;
end;

procedure TfrmCadCorretor.FormShow(Sender: TObject);
begin
  inherited;

  Caption := 'Cadastro de Corretor '+LStatus;

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
         TB_CadastroID.AsInteger           := frmConsultaCorretor.TB_ConsultaID.AsInteger;
         TB_CadastroCPF.AsString           := frmConsultaCorretor.TB_ConsultaCPF.AsString;
         TB_CadastroNome.AsString          := frmConsultaCorretor.TB_ConsultaNome.AsString;
         TB_CadastroDT_Nascimento.AsString := frmConsultaCorretor.TB_ConsultaDT_Nascimento.AsString;
         DTP_Nascimento.Date               := frmConsultaCorretor.TB_ConsultaDT_Nascimento.AsDateTime;
         TB_CadastroCelular.AsString       := frmConsultaCorretor.TB_ConsultaCelular.AsString;
         TB_Cadastro.Post;
       end
  else if LStatus = '[Filtrando]' then
       begin
         pn_Client_Cad.Visible    := False;
         pn_Client_Filtro.Visible := True;
       end;
end;

procedure TfrmCadCorretor.GravaCliente;
begin
  OCorretor:=TCorretor.create;
  if LStatus ='[Incluindo]' then
  begin
    OCorretor.SetID(0);
    OCorretor.SetNome(TB_CadastroNome.AsString);
    OCorretor.SetCpf(TB_Cadastrocpf.AsString);
    OCorretor.SetDTNascimento(TB_CadastroDT_Nascimento.AsString);
    OCorretor.SetCelular(TB_CadastroCelular.AsString);
    OCorretor.GravaDados;
  end
  else
    if LStatus ='[Alterando]' then
    begin
      OCorretor.SetID(TB_CadastroID.AsInteger);
      OCorretor.SetNome(TB_CadastroNome.AsString);
      OCorretor.SetCpf(TB_CadastroCpf.AsString);
      OCorretor.SetDTNascimento(TB_CadastroDT_Nascimento.AsString);
      OCorretor.SetCelular(TB_CadastroCelular.AsString);
      OCorretor.ALteraDados;
    end;
  OCorretor.Free;
  LStatus :='';
end;

procedure TfrmCadCorretor.LeRegistros;
begin
  OCorretor:=TCorretor.create;
  OCorretor.ConsultaClientesGeral('TB_Corretor');
  OCorretor.Free;

  frmConsultaCorretor.TB_Consulta.EmptyDataSet;

  frmDatamodulo.dsClientes.DataSet.First;
  while not frmDatamodulo.dsClientes.DataSet.eof  do
  begin
    frmConsultaCorretor.TB_Consulta.Insert;
    frmConsultaCorretor.TB_ConsultaID.AsInteger           :=  frmDatamodulo.dsClientes.DataSet.FieldByName('ID').AsInteger;
    frmConsultaCorretor.TB_ConsultaNome.AsString          :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Nome').AsString;
    frmConsultaCorretor.TB_ConsultaCpf.AsString           :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Cpf').AsString;
    frmConsultaCorretor.TB_ConsultaDT_Nascimento.AsString :=  frmDatamodulo.dsClientes.DataSet.FieldByName('DT_Nascimento').AsString;
    frmConsultaCorretor.TB_ConsultaCelular.AsString       :=  frmDatamodulo.dsClientes.DataSet.FieldByName('Celular').AsString;
    frmConsultaCorretor.TB_Consulta.Post;
    frmDatamodulo.dsClientes.DataSet.next;
  end;
end;

procedure TfrmCadCorretor.MostraRegistrosFiltro;
begin
  TB_Cadastro.EmptyDataSet;

  frmDatamodulo.dsPesquisa.DataSet.First;
  while not frmDatamodulo.dsPesquisa.DataSet.eof  do
  begin
    TB_Cadastro.Insert;
    TB_CadastroID.AsInteger           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger;
    TB_CadastroNome.AsString          :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Nome').AsString;
    TB_CadastroCpf.AsString           :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Cpf').AsString;
    TB_CadastroDT_Nascimento.AsString :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('DT_Nascimento').AsString;
    TB_CadastroCelular.AsString       :=  frmDatamodulo.dsPesquisa.DataSet.FieldByName('Celular').AsString;
    TB_Cadastro.Post;
    frmDatamodulo.dsPesquisa.DataSet.next;
  end;
end;

end.
