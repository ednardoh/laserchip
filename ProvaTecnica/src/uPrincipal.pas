unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, frxClass,
  frxExportBaseDialog, frxExportPDF, frxDBSet, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    pn_Logo: TPanel;
    img_Logo: TImage;
    MainMPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Operadoras1: TMenuItem;
    Corretores1: TMenuItem;
    Produtos1: TMenuItem;
    abeladePreo1: TMenuItem;
    Categorias1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    EncerraroSistema1: TMenuItem;
    VendasdePlanodeSaude1: TMenuItem;
    VendasdePlanodeSaude2: TMenuItem;
    Relatrios1: TMenuItem;
    Clientes2: TMenuItem;
    Corretores2: TMenuItem;
    Produtos2: TMenuItem;
    VendasporProdutos1: TMenuItem;
    N3: TMenuItem;
    QryClientes: TFDQuery;
    frxReportCLI: TfrxReport;
    frxDBDatasetCli: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    QryClientesID: TLargeintField;
    QryClientesCpfCnpj: TStringField;
    QryClientesNome: TStringField;
    QryClientesCep: TStringField;
    QryClientesLogradouro: TStringField;
    QryClientesNumero: TStringField;
    QryClientesComplemento: TStringField;
    QryClientesBairro: TStringField;
    QryClientesCidade: TStringField;
    QryClientesIbge_cidade: TStringField;
    QryClientesSigla_uf: TStringField;
    QryClientesIbge_uf: TStringField;
    QryCorretores: TFDQuery;
    frxPDFExport2: TfrxPDFExport;
    frxReportCorretores: TfrxReport;
    frxDBDatasetCorretores: TfrxDBDataset;
    QryCorretoresID: TLargeintField;
    QryCorretoresNome: TStringField;
    QryCorretoresCPF: TStringField;
    QryCorretoresDT_Nascimento: TDateField;
    QryCorretoresCelular: TStringField;
    QryProdutos: TFDQuery;
    QryProdutosID: TLargeintField;
    QryProdutosDescricaoProd: TStringField;
    QryProdutosID_Categoria: TLargeintField;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxPDFExport3: TfrxPDFExport;
    frxDBDatasetPrd: TfrxDBDataset;
    frxReportProdutos: TfrxReport;
    QryCategoria: TFDQuery;
    QryProdutosDescrCategoria: TStringField;
    QryOperadoras: TFDQuery;
    QryOperadorasID: TLargeintField;
    QryOperadorasCnpj: TStringField;
    QryOperadorasRazaoSocial: TStringField;
    QryOperadorasCep: TStringField;
    QryOperadorasLogradouro: TStringField;
    QryOperadorasNumero: TStringField;
    QryOperadorasComplemento: TStringField;
    QryOperadorasBairro: TStringField;
    QryOperadorasCidade: TStringField;
    QryOperadorasIbge_cidade: TStringField;
    QryOperadorasSigla_uf: TStringField;
    QryOperadorasIbge_uf: TStringField;
    QryOperadorasLogo: TMemoField;
    frxDBDatasetOperadoras: TfrxDBDataset;
    frxReportOperadoras: TfrxReport;
    procedure FormResize(Sender: TObject);
    procedure EncerraroSistema1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Operadoras1Click(Sender: TObject);
    procedure Corretores1Click(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure abeladePreo1Click(Sender: TObject);
    procedure VendasdePlanodeSaude2Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Corretores2Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure VendasporProdutos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UConexaoBDpas, uDatamodulo, UConecta, uConsultaClientes,
  uConsultaOperadoras, uConsultaCorretor, uConsultaCategoria, uConsultaProdutos,
  uConsultaTabpreco, UPedidoDeVenda;

procedure TfrmPrincipal.abeladePreo1Click(Sender: TObject);
begin
  if frmConsultaTabPreco = NIL then
  begin
     Application.CreateForm(TfrmConsultaTabPreco,frmConsultaTabPreco);
     frmConsultaTabPreco.Show;
  end
  else
  begin
    frmConsultaTabPreco.WindowState:= wsMaximized;
    frmConsultaTabPreco.Show;
  end;
end;

procedure TfrmPrincipal.Categorias1Click(Sender: TObject);
begin
  if frmConsultaCategoria = NIL then
  begin
     Application.CreateForm(TfrmConsultaCategoria,frmConsultaCategoria);
     frmConsultaCategoria.Show;
  end
  else
  begin
    frmConsultaCategoria.WindowState:= wsMaximized;
    frmConsultaCategoria.Show;
  end;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  if frmConsultaClientes = NIL then
  begin
     Application.CreateForm(TfrmConsultaClientes,frmConsultaClientes);
     frmConsultaClientes.Show;
  end
  else
  begin
    frmConsultaClientes.WindowState:= wsMaximized;
    frmConsultaClientes.Show;
  end;
end;

procedure TfrmPrincipal.Clientes2Click(Sender: TObject);
begin
  QryClientes.Close;
  QryClientes.Open();
  frxReportCLI.LoadFromFile(ExtractFilePath(Application.ExeName)+'Clientes.fr3');
  frxReportCLI.ShowReport();
end;

procedure TfrmPrincipal.Corretores1Click(Sender: TObject);
begin
  if frmConsultaCorretor = NIL then
  begin
     Application.CreateForm(TfrmConsultaCorretor,frmConsultaCorretor);
     frmConsultaCorretor.Show;
  end
  else
  begin
    frmConsultaCorretor.WindowState:= wsMaximized;
    frmConsultaCorretor.Show;
  end;
end;

procedure TfrmPrincipal.Corretores2Click(Sender: TObject);
begin
  QryCorretores.Close;
  QryCorretores.Open();
  frxReportCorretores.LoadFromFile(ExtractFilePath(Application.ExeName)+'Corretores.fr3');
  frxReportCorretores.ShowReport();
end;

procedure TfrmPrincipal.EncerraroSistema1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja realmente encerrar o sistema agora?',
    'Confirma??o', mb_YesNo+mb_IconInformation+mb_DefButton2) = mrYes then
    Application.Terminate
  else
    Action := canone;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  conexaoClass := TConexao.Create(ExtractFilePath(Application.ExeName) + 'ConfigDB.ini', 'Conexao');
  if not conexaoClass.ConectouBanco then
  begin
    frmConectaDB :=TfrmConectaDB.Create(Self);
    frmConectaDB.ShowModal;
  end
  else
  begin
    conexaoClass.LeINI;
    conexaoClass.Conectar(frmDatamodulo.DBConect);
  end;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
  img_Logo.Refresh;
  pn_Logo.Refresh;
end;

procedure TfrmPrincipal.Operadoras1Click(Sender: TObject);
begin
  if frmConsultaOperadoras = NIL then
  begin
     Application.CreateForm(TfrmConsultaOperadoras,frmConsultaOperadoras);
     frmConsultaOperadoras.Show;
  end
  else
  begin
    frmConsultaOperadoras.WindowState:= wsMaximized;
    frmConsultaOperadoras.Show;
  end;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
  if frmConsultaProdutos = NIL then
  begin
     Application.CreateForm(TfrmConsultaProdutos,frmConsultaProdutos);
     frmConsultaProdutos.Show;
  end
  else
  begin
    frmConsultaProdutos.WindowState:= wsMaximized;
    frmConsultaProdutos.Show;
  end;
end;

procedure TfrmPrincipal.Produtos2Click(Sender: TObject);
begin
  QryCategoria.Close;
  QryCategoria.Open();
  QryProdutos.Close;
  QryProdutos.Open();
  frxReportProdutos.LoadFromFile(ExtractFilePath(Application.ExeName)+'ProdutosPLS.fr3');
  frxReportProdutos.ShowReport();
end;

procedure TfrmPrincipal.VendasdePlanodeSaude2Click(Sender: TObject);
begin
 if frmMov_PEDVendas = NIL then
  begin
     Application.CreateForm(TfrmMov_PEDVendas,frmMov_PEDVendas);
     frmMov_PEDVendas.ShowModal;
  end
  else
  begin
    frmMov_PEDVendas.WindowState:= wsMaximized;
    frmMov_PEDVendas.ShowModal;
  end;
end;

procedure TfrmPrincipal.VendasporProdutos1Click(Sender: TObject);
begin
  QryOperadoras.Close;
  QryOperadoras.Open();
  frxReportOperadoras.LoadFromFile(ExtractFilePath(Application.ExeName)+'Operadoras.fr3');
  frxReportOperadoras.ShowReport();
end;

end.
