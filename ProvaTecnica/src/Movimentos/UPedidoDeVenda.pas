unit UPedidoDeVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Buttons, Datasnap.DBClient, uClsTabelaPreco,
  Vcl.Samples.Spin, frxClass, frxDBSet, frxExportBaseDialog, frxExportPDF;

type
  TfrmMov_PEDVendas = class(TForm)
    Panel1: TPanel;
    pn_Top: TPanel;
    pn_Botton: TPanel;
    pn_Grid: TPanel;
    Panel7: TPanel;
    Shape1: TShape;
    pn_left: TPanel;
    GRD_Produtos: TDBGrid;
    lblMessagem: TLabel;
    edt_CodigoProd: TEdit;
    Edt_Qtde: TEdit;
    Edt_PrecProd: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label6: TLabel;
    ds_PedVenda: TDataSource;
    Panel4: TPanel;
    Panel5: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    EDT_Numpedido: TEdit;
    EDT_DTEMISSAO: TDateTimePicker;
    EDT_CodCliente: TEdit;
    EDT_NomeCliente: TEdit;
    Label1: TLabel;
    QryPedproduto: TClientDataSet;
    QryPedprodutoCodProduto: TStringField;
    QryPedprodutoDescrProduto: TStringField;
    QryPedprodutoQuantidade: TFloatField;
    QryPedprodutoValor_Unitario: TFloatField;
    QryPedprodutoValor_Total: TFloatField;
    Label5: TLabel;
    EDT_ValorTotal: TEdit;
    EDT_DescrProduto: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    BTN_Inserir: TSpeedButton;
    Panel12: TPanel;
    Label7: TLabel;
    EdtTotVenda: TEdit;
    ds_Pedido: TDataSource;
    Label11: TLabel;
    EDT_CodCorretor: TEdit;
    Label12: TLabel;
    EDT_NomeCorretor: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    EDT_CodOperadora: TEdit;
    EDT_NomeOperadora: TEdit;
    ckb_Aplicadesconto: TCheckBox;
    SPE_diasValidade: TSpinEdit;
    Label10: TLabel;
    frxDBDatasetOrc: TfrxDBDataset;
    QryOrcamento: TFDQuery;
    QryOrcamentoid: TLargeintField;
    QryOrcamentoID_Corretor: TLargeintField;
    QryOrcamentoNomeCorretor: TStringField;
    QryOrcamentoCpfCnpj: TStringField;
    QryOrcamentoNomeCliente: TStringField;
    QryOrcamentoCnpj: TStringField;
    QryOrcamentoRazaoSocOperadora: TStringField;
    QryOrcamentoNumOrcamento: TLargeintField;
    QryOrcamentoDataEmissao: TStringField;
    QryOrcamentoDataValidade: TStringField;
    QryOrcamentoID_Produto: TLargeintField;
    QryOrcamentoDescricaoProd: TStringField;
    QryOrcamentoID_Categoria: TLargeintField;
    QryOrcamentoDescrCategoria: TStringField;
    QryOrcamentoQuantidade: TFMTBCDField;
    QryOrcamentoPrecoProduto: TFMTBCDField;
    QryOrcamentoDesconto: TFMTBCDField;
    QryOrcamentoValorTotal: TFMTBCDField;
    ds_Orcamento: TDataSource;
    frxPDFExport1: TfrxPDFExport;
    frxReportOrc: TfrxReport;
    BTN_Imprimir: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edt_CodigoProdKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_QtdeKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_PrecProdKeyPress(Sender: TObject; var Key: Char);
    procedure EDT_DTEMISSAOEnter(Sender: TObject);
    procedure EDT_DTEMISSAOExit(Sender: TObject);
    procedure EDT_DTEMISSAOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDT_CodClienteEnter(Sender: TObject);
    procedure EDT_CodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_CodigoProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edt_QtdeExit(Sender: TObject);
    procedure BTN_InserirClick(Sender: TObject);
    procedure EDT_CodClienteExit(Sender: TObject);
    procedure edt_CodigoProdExit(Sender: TObject);
    procedure Edt_QtdeChange(Sender: TObject);
    procedure QryPedprodutoAfterPost(DataSet: TDataSet);
    procedure GRD_ProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryPedprodutoAfterDelete(DataSet: TDataSet);
    procedure Edt_PrecProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDT_CodCorretorKeyPress(Sender: TObject; var Key: Char);
    procedure EDT_CodCorretorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDT_CodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EDT_CodOperadoraKeyPress(Sender: TObject; var Key: Char);
    procedure EDT_CodOperadoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDT_CodCorretorExit(Sender: TObject);
    procedure EDT_CodOperadoraExit(Sender: TObject);
    procedure BTN_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
    sCodCupom : String;
    iTemPrd   : Integer;
    vlTotalVenda : Double;
    strStatusPDV : String;
    statusGravaPed: string;
    procedure MenssagemPDV(pMenssagem: string);
    procedure AbrePedidoVenda;
    procedure ConsultaClientes;
    procedure ConsultaClientesPeloCodigo(const Value: string);
    procedure ConsultaCorretor;
    procedure ConsultaCorretorPeloCodigo(const Value: string);
    procedure ConsultaProdutos;
    procedure ConsultaOperadora;
    procedure ConsultaOperadoraPeloCodigo(const Value: string);
    procedure CalculaValor;
    Procedure Memo_Print(Conteudo:TStrings);
    procedure Limpacampo;
    procedure PesquisaCliente;
    procedure PesquisaProduto;
    procedure CancelaPedido;
    function SomaValorTotal : Real;
    function PadC(S: String; I: Integer): String;
    function Espaco(Tamanho: Integer): string;
    function FormataMonetario(sValor: string): string;
  public
    { Public declarations }
  end;

var
  frmMov_PEDVendas: TfrmMov_PEDVendas;

implementation

Uses uPrincipal, uPesquisa, Printers, uClsCliente, uClsProdutosPLS,
     uClsMovimentoVenda, uClsMovimentoVendaItens, uDatamodulo, uClsCorretor,
     uClsOperadoras;

{$R *.dfm}

procedure TfrmMov_PEDVendas.AbrePedidoVenda;
begin
  if statusGravaPed <> 'dsInsert' then
  begin
    EDT_CodCliente.Clear;
    EDT_NomeCliente.Clear;
    EdtTotVenda.Text   :='0,00';
    EDT_Numpedido.Text := '000000';
    EDT_DTEMISSAO.Date := Now();
    sCodCupom          :='';
    iTemPrd            :=0;
    statusGravaPed     := 'dsInsert';
    vlTotalVenda       :=0;
    BTN_Inserir.Caption := 'Inserir Produto';
    MenssagemPDV('OR?AMENTO EM MOVIMENTA??O');
    EDT_DTEMISSAO.SetFocus;
    strStatusPDV :='EM PROCESSO DE MOVIMENTACAO';
    QryPedproduto.Close;
    QryPedproduto.CreateDataSet;
  end
  else
  begin
    Application.MessageBox(pchar('Pedido j? est? em modo de Inser??o.: '), 'Aten??o', MB_ICONEXCLAMATION + MB_OK);
    exit;
  end;
end;

procedure TfrmMov_PEDVendas.BTN_ImprimirClick(Sender: TObject);
begin
  QryOrcamento.close;
  QryOrcamento.ParamByName('ID').AsInteger := StrToInt(EDT_Numpedido.Text);
  QryOrcamento.Open();
  frxReportOrc.LoadFromFile(ExtractFilePath(Application.ExeName)+'Orcamento.fr3');
  frxReportOrc.ShowReport();
end;

procedure TfrmMov_PEDVendas.BTN_InserirClick(Sender: TObject);
begin
  try
    if statusGravaPed = 'dsInsert' then
    begin
      QryPedproduto.Insert;
      QryPedprodutoCodProduto.AsString     := edt_CodigoProd.Text;
      QryPedprodutoDescrProduto.AsString   := EDT_DescrProduto.Text;
      QryPedprodutoQuantidade.AsString     := Edt_Qtde.Text;
      QryPedprodutoValor_Unitario.AsString := Edt_PrecProd.Text;
      QryPedprodutoValor_Total.AsString    := EDT_ValorTotal.Text;
      QryPedproduto.Post;
      Limpacampo;
    end
    else
    if statusGravaPed = 'dsEdit' then
    begin
      QryPedproduto.IndexFieldNames := 'CodProduto';
      if QryPedproduto.FindKey([edt_CodigoProd.Text]) then
      begin
        QryPedproduto.Edit;
        QryPedprodutoCodProduto.AsString     := edt_CodigoProd.Text;
        QryPedprodutoDescrProduto.AsString   := EDT_DescrProduto.Text;
        QryPedprodutoQuantidade.AsString     := Edt_Qtde.Text;
        QryPedprodutoValor_Unitario.AsString := Edt_PrecProd.Text;
        QryPedprodutoValor_Total.AsString    := EDT_ValorTotal.Text;
        QryPedproduto.Post;
        statusGravaPed := 'dsInsert';
        BTN_Inserir.Caption := 'Inserir Produto';
      end;
      Limpacampo;
    end;
  except on e : exception do
    begin
      Application.MessageBox(pchar('Ocorreu erro Inesperado na Iser??o do Produto. Erro: '+e.Message), 'Erro', MB_ICONERROR + MB_OK);
      exit;
    end;
  end;
end;

procedure TfrmMov_PEDVendas.CalculaValor;
var
  fPrecoVenda, fQtde, fValorTot : Double;
begin
  try
    fPrecoVenda := 0;
    fQtde       := 0;
    fValorTot   := 0;
    if trim(Edt_Qtde.Text) = '' then
    begin
      Application.MessageBox('Qtde n?o pode ser Nulo, Favor prencha o campo da Quantidade.', 'Aten??o', MB_ICONASTERISK + MB_OK);
      Edt_Qtde.SetFocus;
      exit;
    end
    else
    begin
      fPrecoVenda   := StrToFloat(Edt_PrecProd.Text);
      fQtde         := StrToFloat(Edt_Qtde.Text);
      if ckb_Aplicadesconto.Checked then
        fValorTot     := (fQtde * fPrecoVenda) - ((fQtde * fPrecoVenda)*frmDatamodulo.LValDesconto)/100
      else
        fValorTot     := (fQtde * fPrecoVenda);
      Edt_Qtde.Text := FormatFloat(',0.00',StrToFloat(Edt_Qtde.Text));
      EDT_ValorTotal.Text := FormatFloat(',0.00',fValorTot);
    end;
  except
  end;
end;

procedure TfrmMov_PEDVendas.CancelaPedido;
var
  //Pedido: TPedidovenda;
  intVal: Integer;
begin
  try
  if Application.messageBox('Confirma o Cancelamento do Pedido?','Confirma??o',mb_YesNo+mb_IconInformation+mb_DefButton2) = IDYES then
  begin
    //Pedido:= TPedidovenda.Create;
    intVal := StrToInt(EDT_Numpedido.Text);
    //Pedido.GravaDados('Excluir',intVal.ToString());
    Showmessage('Pedido cancelado com sucesso..');
    strStatusPDV :='ABRIR OR?AMENTO';
    MenssagemPDV('F3 - ABRIR OR?AMENTO.');
    statusGravaPed := 'dsBrowse';
    EDT_CodCliente.Clear;
    EDT_NomeCliente.Clear;
    EdtTotVenda.Text    :='0,00';
    EDT_Numpedido.Text  := '000000';
    EDT_DTEMISSAO.Date  := Now();
    sCodCupom           :='';
    iTemPrd             :=0;
    statusGravaPed      := 'dsBrowse';
    vlTotalVenda        :=0;
    BTN_Inserir.Caption := 'Inserir Produto';
    QryPedproduto.Close;
    QryPedproduto.CreateDataSet;
  end;
  finally
   // Pedido.Free;
  end;
end;

procedure TfrmMov_PEDVendas.ConsultaClientes;
begin
  if strStatusPDV ='EM PROCESSO DE MOVIMENTACAO' then
  begin
    FrmPesquisa := TFrmPesquisa.Create(Self);
    FrmPesquisa.LNomeTabela :='TB_Clientes';
    FrmPesquisa.LNomeCampoPesquisaLIke := 'Nome';
    FrmPesquisa.ShowModal;
    EDT_CodCliente.Text  := FormatFloat('000000',frmDatamodulo.LValCodigo.ToInteger);
    EDT_NomeCliente.Text := frmDatamodulo.LValNome;
  end
  else
  begin
    Application.MessageBox('S? poder? consultar Clientes se estiver em precesso de Movimenta??o. Tecle <F3>', 'Aten??o', MB_ICONASTERISK + MB_OK);
    EDT_DTEMISSAO.SetFocus;
    exit;
  end;
end;

procedure TfrmMov_PEDVendas.ConsultaClientesPeloCodigo(const Value: string);
var
  oClientes: TClientes;
begin
  oClientes := TClientes.create;
  if strStatusPDV ='EM PROCESSO DE MOVIMENTACAO' then
  begin
    oClientes.ConsultaClientesPeloByID(StrToInt(EDT_CodCliente.Text));
    EDT_CodCliente.Text  := FormatFloat('000000',frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger);
    EDT_NomeCliente.Text := frmDatamodulo.dsPesquisa.DataSet.FieldByName('Nome').AsString;
  end
  else
  begin
    Application.MessageBox('S? poder? consultar Clientess se estiver em precesso de Movimenta??o. Tecle <F3>', 'Aten??o', MB_ICONASTERISK + MB_OK);
    EDT_DTEMISSAO.SetFocus;
    exit;
  end;
  oClientes.Free;
end;

procedure TfrmMov_PEDVendas.ConsultaCorretor;
begin
  if strStatusPDV ='EM PROCESSO DE MOVIMENTACAO' then
  begin
    FrmPesquisa := TFrmPesquisa.Create(Self);
    FrmPesquisa.LNomeTabela :='TB_Corretor';
    FrmPesquisa.LNomeCampoPesquisaLIke := 'Nome';
    FrmPesquisa.ShowModal;
    EDT_CodCorretor.Text  := FormatFloat('000000',frmDatamodulo.LValCodigo.ToInteger);
    EDT_NomeCorretor.Text := frmDatamodulo.LValNome;
  end
  else
  begin
    Application.MessageBox('S? poder? consultar Corretores se estiver em precesso de Movimenta??o. Tecle <F3>', 'Aten??o', MB_ICONASTERISK + MB_OK);
    EDT_DTEMISSAO.SetFocus;
    exit;
  end;
end;

procedure TfrmMov_PEDVendas.ConsultaCorretorPeloCodigo(const Value: string);
var
  oCorretor: TCorretor;
begin
  oCorretor := TCorretor.Create;
  if strStatusPDV ='EM PROCESSO DE MOVIMENTACAO' then
  begin
    oCorretor.ConsultaCorretorPeloByID(StrToInt(EDT_CodCorretor.Text));
    EDT_CodCorretor.Text  := FormatFloat('000000',frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger);
    EDT_NomeCorretor.Text := frmDatamodulo.dsPesquisa.DataSet.FieldByName('Nome').AsString;
  end
  else
  begin
    Application.MessageBox('S? poder? consultar Corretores se estiver em precesso de Movimenta??o. Tecle <F3>', 'Aten??o', MB_ICONASTERISK + MB_OK);
    EDT_DTEMISSAO.SetFocus;
    exit;
  end;
  oCorretor.Free;
end;

procedure TfrmMov_PEDVendas.ConsultaOperadora;
begin
  if strStatusPDV ='EM PROCESSO DE MOVIMENTACAO' then
  begin
    FrmPesquisa := TFrmPesquisa.Create(Self);
    FrmPesquisa.LNomeTabela :='TB_Operadoras';
    FrmPesquisa.LNomeCampoPesquisaLIke := 'RazaoSocial';
    FrmPesquisa.ShowModal;
    EDT_CodOperadora.Text  := FormatFloat('000000',frmDatamodulo.LValCodigo.ToInteger);
    EDT_NomeOperadora.Text := frmDatamodulo.LValNome;
  end
  else
  begin
    Application.MessageBox('S? poder? consultar Clientes se estiver em precesso de Movimenta??o. Tecle <F3>', 'Aten??o', MB_ICONASTERISK + MB_OK);
    EDT_DTEMISSAO.SetFocus;
    exit;
  end;
end;


procedure TfrmMov_PEDVendas.ConsultaOperadoraPeloCodigo(const Value: string);
var
  oOperadora: TOperadoras;
begin
  oOperadora := TOperadoras.Create;
  if strStatusPDV ='EM PROCESSO DE MOVIMENTACAO' then
  begin
    oOperadora.ConsultaOperadorasPeloByID(StrToInt(EDT_CodOperadora.Text));
    EDT_CodOperadora.Text  := FormatFloat('000000',frmDatamodulo.dsPesquisa.DataSet.FieldByName('ID').AsInteger);
    EDT_NomeOperadora.Text := frmDatamodulo.dsPesquisa.DataSet.FieldByName('RazaoSocial').AsString;
  end
  else
  begin
    Application.MessageBox('S? poder? consultar Operadora se estiver em precesso de Movimenta??o. Tecle <F3>', 'Aten??o', MB_ICONASTERISK + MB_OK);
    EDT_DTEMISSAO.SetFocus;
    exit;
  end;
  oOperadora.Free;
end;

procedure TfrmMov_PEDVendas.ConsultaProdutos;
var
  oTabPreco: TTabPreco;
begin
  if strStatusPDV ='EM PROCESSO DE MOVIMENTACAO' then
  begin
    FrmPesquisa := TFrmPesquisa.Create(Self);
    FrmPesquisa.LNomeTabela :='TB_ProdutoPLS';
    FrmPesquisa.LNomeCampoPesquisaLIke := 'DescricaoProd';
    FrmPesquisa.ShowModal;
    edt_CodigoProd.Text   := frmDatamodulo.LValCodigo;
    EDT_DescrProduto.Text := frmDatamodulo.LValNome;

    oTabPreco:= TTabPreco.Create;

    oTabPreco.PesquisaTabela('TB_TabelaPreco', 'ID_Produto', IntTostr(StrToInt(edt_CodigoProd.Text)));

    frmDatamodulo.LValPrcProd  := frmDatamodulo.dsPesquisa.DataSet.FieldByName('PrecoProduto').AsFloat;
    frmDatamodulo.LValDesconto := frmDatamodulo.dsPesquisa.DataSet.FieldByName('PercDesconto').AsFloat;

    Edt_PrecProd.Text := FormatFloat(',0.00',frmDatamodulo.dsPesquisa.DataSet.FieldByName('PrecoProduto').AsFloat);
    oTabPreco.Free;
  end
  else
  begin
    Application.MessageBox('S? poder? consultar Clientes se estiver em precesso de Movimenta??o. Tecle <F3>', 'Aten??o', MB_ICONASTERISK + MB_OK);
    EDT_DTEMISSAO.SetFocus;
    exit;
  end;
end;

procedure TfrmMov_PEDVendas.EDT_CodClienteEnter(Sender: TObject);
begin
  TEdit(Sender).Color := clInfoBk;
  CalculaValor;
end;

procedure TfrmMov_PEDVendas.EDT_CodClienteExit(Sender: TObject);
begin
  if EDT_CodCliente.Text <> '' then
    ConsultaClientesPeloCodigo(EDT_CodCliente.Text);
  TEdit(Sender).Color := clWindow;
end;

procedure TfrmMov_PEDVendas.EDT_CodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    ConsultaClientes;
  end;
end;

procedure TfrmMov_PEDVendas.EDT_CodClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  not ( Key in ['0'..'9', Chr(8), Chr(13)] ) then
    Key := #0
  else
  begin
    if Key=#13 then
    begin
      EDT_CodOperadora.SetFocus;
    end;
  end;
end;

procedure TfrmMov_PEDVendas.EDT_CodCorretorExit(Sender: TObject);
begin
  if EDT_CodCorretor.Text <> '' then
    ConsultaCorretorPeloCodigo(EDT_CodCorretor.Text);
  TEdit(Sender).Color := clWindow;
end;

procedure TfrmMov_PEDVendas.EDT_CodCorretorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F10 then
  begin
    ConsultaCorretor;
  end;
end;

procedure TfrmMov_PEDVendas.EDT_CodCorretorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  not ( Key in ['0'..'9', Chr(8), Chr(13)] ) then
    Key := #0
  else
  begin
    if Key=#13 then
    begin
      EDT_CodCliente.SetFocus;
    end;
  end;
end;

procedure TfrmMov_PEDVendas.edt_CodigoProdExit(Sender: TObject);
begin
  if edt_CodigoProd.Text <> '' then
  begin
    edt_CodigoProd.Text := FormatFloat('0000000000000',StrToInt(edt_CodigoProd.Text));
    PesquisaProduto;
  end;
  TEdit(Sender).Color := clWindow;
end;

procedure TfrmMov_PEDVendas.edt_CodigoProdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F4 then
    ConsultaProdutos
  else
    if key = vk_F6 then
      GRD_Produtos.SetFocus;
end;

procedure TfrmMov_PEDVendas.edt_CodigoProdKeyPress(Sender: TObject; var Key: Char);
begin
  if  not ( Key in ['0'..'9', Chr(8), Chr(13)] ) then
    Key := #0
  else
  begin
    if key = #13 then
    begin
      Edt_Qtde.SetFocus;
    end;
  end;
end;

procedure TfrmMov_PEDVendas.EDT_CodOperadoraExit(Sender: TObject);
begin
  if EDT_CodOperadora.Text <> '' then
    ConsultaOperadoraPeloCodigo(EDT_CodOperadora.Text);
  TEdit(Sender).Color := clWindow;
end;

procedure TfrmMov_PEDVendas.EDT_CodOperadoraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F11 then
  begin
    ConsultaOperadora;
  end;
end;

procedure TfrmMov_PEDVendas.EDT_CodOperadoraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  not ( Key in ['0'..'9', Chr(8), Chr(13)] ) then
    Key := #0
  else
  begin
    if key = #13 then
    begin
      edt_CodigoProd.SetFocus;
    end;
  end;
end;

procedure TfrmMov_PEDVendas.EDT_DTEMISSAOEnter(Sender: TObject);
begin
  TDateTimePicker(Sender).Color := clInfoBk;
end;

procedure TfrmMov_PEDVendas.EDT_DTEMISSAOExit(Sender: TObject);
begin
  TDateTimePicker(Sender).Color := clWindow;
end;

procedure TfrmMov_PEDVendas.EDT_DTEMISSAOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    EDT_CodCorretor.SetFocus;
end;

procedure TfrmMov_PEDVendas.Edt_PrecProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
  begin
    Edt_Qtde.SetFocus;
  end;
end;

procedure TfrmMov_PEDVendas.Edt_PrecProdKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08,#13, ',','.'] ) then
    key:=#0;
end;

procedure TfrmMov_PEDVendas.Edt_QtdeChange(Sender: TObject);
begin
  CalculaValor;
end;

procedure TfrmMov_PEDVendas.Edt_QtdeExit(Sender: TObject);
begin
  if Edt_Qtde.Text='' then
  begin
    Edt_Qtde.SetFocus;
    exit;
  end;
  TEdit(Sender).Color := clWindow;
  CalculaValor;
end;

procedure TfrmMov_PEDVendas.Edt_QtdeKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08,#13] ) then
    key:=#0;

  if key = #13 then
  begin
    if Edt_Qtde.Text <> '' then
    begin
      CalculaValor;
      BTN_Inserir.Click;
    end
    else
      Edt_Qtde.SetFocus;
  end;
end;

function TfrmMov_PEDVendas.Espaco(Tamanho: Integer): string;
begin
  Result := '';
  while Tamanho > 0 do
  begin
    Tamanho:= Tamanho - 1;
    Result := Result + ' ';
  end;
end;

function TfrmMov_PEDVendas.FormataMonetario(sValor: string): string;
var
  sVal: string;
begin
  sValor := FloatToStr(StrToFloat(sValor));
  sVal := StringReplace(sValor,'.','', [rfReplaceAll]);
  Result := sVal;
end;

procedure TfrmMov_PEDVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=cafree;
end;

procedure TfrmMov_PEDVendas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then
    frmMov_PEDVendas:= NIL;
end;

procedure TfrmMov_PEDVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    PedidovendaCab: TMovimentoVenda;
    ProdutosPedido: TMovimentoVendaItens;
    NumOrcamento: Integer;
begin
  if key = VK_ESCAPE then
    close;
  if Key = VK_F3 then
    AbrePedidoVenda;  //Abre a venda
  if key = vk_F6 then
    GRD_Produtos.SetFocus;
  if key = VK_F7 then
  begin
    if strStatusPDV ='EM PROCESSO DE MOVIMENTACAO' then
    begin
      if Application.messageBox('Deseja Gravar o Or?amento ?','Confirma??o',mb_YesNo+mb_IconInformation+mb_DefButton2) = IdYes then
      begin
        //Grava o cabe?alho do pedido
        PedidovendaCab := TMovimentoVenda.Create;
        NumOrcamento := PedidovendaCab.RetornaNumPedido;
        PedidovendaCab.SetIDCorretor(StrToint(EDT_CodCorretor.Text));
        PedidovendaCab.SetIDCliente(StrToInt(EDT_CodCliente.Text));
        PedidovendaCab.SetIDOperadora(StrToInt(EDT_CodOperadora.Text));
        PedidovendaCab.SetNumOrcamento(NumOrcamento.ToString);
        PedidovendaCab.SetDataEmissao(FormatDateTime('yyy-mm-dd',EDT_DTEMISSAO.DateTime));
        PedidovendaCab.SetDataValidade(FormatDateTime('yyy-mm-dd',EDT_DTEMISSAO.DateTime+SPE_diasValidade.Value));  //esse or?amento tem validade padr?o de 10 dias
        PedidovendaCab.GravaDados;
        EDT_Numpedido.Text := FormatFloat('000000',NumOrcamento);
        ProdutosPedido:= TMovimentoVendaItens.Create;
        //Grava os itens
        QryPedproduto.First;
        while not QryPedproduto.Eof do
        begin
           ProdutosPedido.SetIDMovtoVenda(PedidovendaCab.RetornaIDMovimentacao);
           ProdutosPedido.SetIDProduto(QryPedprodutoCodProduto.AsInteger);
           ProdutosPedido.SetIDTabpreco(QryPedprodutoCodProduto.AsInteger);
           ProdutosPedido.SetPrecoProduto(QryPedprodutoValor_Unitario.AsFloat);
           ProdutosPedido.SetDesconto(frmDatamodulo.LValDesconto);
           ProdutosPedido.SetQuantidade(QryPedprodutoQuantidade.AsFloat);
           ProdutosPedido.SetValorTotal(QryPedprodutoValor_Total.AsFloat);
           ProdutosPedido.GravaDados;
           QryPedproduto.Next;
        end;
        Showmessage('Seu Or?amento foi gravado com sucesso. O n?mero do seu pedido ? : '+FormatFloat('000000',NumOrcamento));
        strStatusPDV :='ABRIR PEDIDO';
        MenssagemPDV('F3 - ABRIR PEDIDO.');
        statusGravaPed := 'dsBrowse';
        PedidovendaCab.Free;  //finaliza a instancia da movimenta??o
        ProdutosPedido.Free;  //finaliza a instancia da movimenta??o dos itens
      end;
    end
    else
    begin
      Application.MessageBox('S? poder? persisstir no banco a movimenta??o se estiver em precesso de Movimenta??o. Tecle <F3>', 'Aten??o', MB_ICONASTERISK + MB_OK);
      EDT_DTEMISSAO.SetFocus;
      exit;
    end;
  end;
  if key = vk_f9 then
  begin
    CancelaPedido;
  end;
end;

procedure TfrmMov_PEDVendas.FormShow(Sender: TObject);
begin
  strStatusPDV :='ABRIR OR?AMENTO';
  MenssagemPDV('F3 - ABRIR OR?AMENTO.');
  statusGravaPed := 'dsBrowse';
  EDT_DTEMISSAO.SetFocus;
end;

procedure TfrmMov_PEDVendas.GRD_ProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
  begin
    if statusGravaPed = 'dsInsert' then
    begin
      edt_CodigoProd.Text   := QryPedprodutoCodProduto.AsString;
      EDT_DescrProduto.Text := QryPedprodutoDescrProduto.AsString;
      Edt_Qtde.Text         := QryPedprodutoQuantidade.AsString;
      Edt_PrecProd.Text     := QryPedprodutoValor_Unitario.AsString;
      EDT_ValorTotal.Text   := QryPedprodutoValor_Total.AsString;
      statusGravaPed        := 'dsEdit';
      BTN_Inserir.Caption   := 'Atualizar Produto';
      edt_CodigoProd.SetFocus;
    end
    else
    begin
      Showmessage('Pedido n?o est? em modo de Inser??o');
    end;
  end
  else
    if key = VK_DELETE then
    begin
       if Application.MessageBox('Deseja realmente Excluir esse produto ? ', 'Informa??o', MB_ICONQUESTION + MB_YESNO) = IDYES then
       begin
         QryPedproduto.Delete;
       end;
    end;
end;

procedure TfrmMov_PEDVendas.Limpacampo;
begin
  edt_CodigoProd.Text   :='';
  EDT_DescrProduto.Text :='';
  Edt_Qtde.Text         :='1,00';
  Edt_PrecProd.Text     :='0,00';
  EDT_ValorTotal.Text   :='0,00';
  edt_CodigoProd.SetFocus;
end;

procedure TfrmMov_PEDVendas.Memo_Print(Conteudo: TStrings);
Var
  MemoFile :TextFile;
  P :Integer;
begin
  AssignPrn(MemoFile);
  Rewrite(MemoFile);
  For P := 0 to Conteudo.Count-1 do
    Writeln(MemoFile,Conteudo.Strings[P]);
  CloseFile(MemoFile);
end;

procedure TfrmMov_PEDVendas.MenssagemPDV(pMenssagem: string);
begin
  lblMessagem.Caption :='';
  lblMessagem.Caption :=UpperCase(pMenssagem);
end;

function TfrmMov_PEDVendas.PadC(S: String; I: Integer): String;
var
  L:byte;
begin
  Result :='';
  if I < Length(s) then
  begin
    Exit;
  end;
  L := (I-Length(S)) div 2;
  while l > 0 do
  begin
    Result := Result + ' ';
    Dec(l);
  end;
  for l:=1 to Length(S) do
  begin
    Result := Result + S[L];
  end;
end;

Procedure TfrmMov_PEDVendas.PesquisaCliente;
var
  Clientes : TClientes;
begin
  try
    Clientes := TClientes.Create;
    //Clientes.PesquisaCliente('TB_Clientes','','Codigo',EDT_CodCliente.Text);
    //EDT_CodCliente.Text  := DM.gblValCodigo;
    //EDT_NomeCliente.Text := DM.gblValNome;
  finally
    Clientes.Free;
  end;
end;

procedure TfrmMov_PEDVendas.PesquisaProduto;
var
  Produtos : TProdutos;
begin
  try
    Produtos := TProdutos.Create;
    //Produtos.PesquisaProduto('tb_produtos','','Codigo',edt_CodigoProd.Text);
    //edt_CodigoProd.Text   := DM.gblValCodigo;
    //EDT_DescrProduto.Text := DM.gblValNome;
   // Edt_PrecProd.Text     := DM.gblValPrcProd;
  finally
    Produtos.Free;
  end;
end;

procedure TfrmMov_PEDVendas.QryPedprodutoAfterDelete(DataSet: TDataSet);
begin
  EdtTotVenda.Text := FormatFloat(',0.00',SomaValorTotal);
end;

procedure TfrmMov_PEDVendas.QryPedprodutoAfterPost(DataSet: TDataSet);
begin
  EdtTotVenda.Text := FormatFloat(',0.00',SomaValorTotal);
end;

function TfrmMov_PEDVendas.SomaValorTotal: Real;
var
  dblValor: Real;
begin
  Result   :=0;
  dblValor := 0;
  QryPedproduto.DisableControls;
  QryPedproduto.First;
  while not QryPedproduto.Eof do
  begin
    dblValor := dblValor + QryPedprodutoValor_Total.Value;
    QryPedproduto.Next;
  end;
  QryPedproduto.EnableControls;
  Result := dblValor;
end;

end.
