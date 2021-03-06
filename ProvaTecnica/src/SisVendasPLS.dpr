program SisVendasPLS;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDatamodulo in 'Datamodulo\uDatamodulo.pas' {frmDatamodulo: TDataModule},
  UConexaoBDpas in 'Conexao\UConexaoBDpas.pas' {frmConectaDB},
  UConecta in 'Conexao\UConecta.pas',
  uModeloCad in 'Cadastros\uModeloCad.pas' {frmModeloCad},
  uModeloTelaCad in 'Cadastros\uModeloTelaCad.pas' {frmModeloTelaCad},
  uConsultaCategoria in 'Cadastros\uConsultaCategoria.pas' {frmConsultaCategoria},
  uCadCategoria in 'Cadastros\uCadCategoria.pas' {frmCadCategoria},
  uClsOperadoras in 'Classes\uClsOperadoras.pas',
  uClsCategoriaPLS in 'Classes\uClsCategoriaPLS.pas',
  uCadClientes in 'Cadastros\uCadClientes.pas' {frmCadClientes},
  uConsultaClientes in 'Cadastros\uConsultaClientes.pas' {frmConsultaClientes},
  uCadOperadoras in 'Cadastros\uCadOperadoras.pas' {frmCadOperadoras},
  uConsultaOperadoras in 'Cadastros\uConsultaOperadoras.pas' {frmConsultaOperadoras},
  uClsMovimentoVendaItens in 'Classes\uClsMovimentoVendaItens.pas',
  uClsTabelaPreco in 'Classes\uClsTabelaPreco.pas',
  uCadTabpreco in 'Cadastros\uCadTabpreco.pas' {frmCadTabPreco},
  uConsultaTabpreco in 'Cadastros\uConsultaTabpreco.pas' {frmConsultaTabPreco},
  uCadCorretor in 'Cadastros\uCadCorretor.pas' {frmCadCorretor},
  uConsultaCorretor in 'Cadastros\uConsultaCorretor.pas' {frmConsultaCorretor},
  uClsCorretor in 'Classes\uClsCorretor.pas',
  uClsProdutosPLS in 'Classes\uClsProdutosPLS.pas',
  uCadProdutos in 'Cadastros\uCadProdutos.pas' {frmCadProdutos},
  uConsultaProdutos in 'Cadastros\uConsultaProdutos.pas' {frmConsultaProdutos},
  uClsCliente in 'Classes\uClsCliente.pas',
  uClsMovimentoVenda in 'Classes\uClsMovimentoVenda.pas',
  UPedidoDeVenda in 'Movimentos\UPedidoDeVenda.pas' {frmMov_PEDVendas},
  uPesquisa in 'uPesquisa.pas' {FrmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDatamodulo, frmDatamodulo);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
