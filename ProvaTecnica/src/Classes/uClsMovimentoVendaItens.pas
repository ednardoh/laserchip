unit uClsMovimentoVendaItens;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.Client, uPrincipal,
     Graphics, Variants, Jpeg, Windows, Classes, Controls, Forms, DBClient,
     uDatamodulo;

type
  TMovimentoVendaItens = class
    private
      //Itens da venda
      FID           : Integer;
      FIDMovtoVenda : Integer;
      FIDProduto    : Integer;
      FIDTabpreco   : Integer;
      FPrecoProduto : Double;
      FDesconto     : Double;
      FQuantidade   : Double;
      FValorTotal   : Double;
    public
      //Ser? usado tanto para os insert como para select
      QryAuxiliar   : TFDQuery;
      //Get
      function GetID            : Integer;
      function GetIDMovtoVenda  : Integer;
      function GetIDProduto     : Integer;
      function GetIDTabpreco    : Integer;
      function GetPrecoProduto  : Double;
      function GetDesconto      : Double;
      function GetQuantidade    : Double;
      function GetValorTotal    : Double;

      //Set
      procedure SetID(const Value: Integer);
      procedure SetIDMovtoVenda(const Value: Integer);
      procedure SetIDProduto(const Value: Integer);
      procedure SetIDTabpreco(const Value: Integer);
      procedure SetPrecoProduto(const Value: Double);
      procedure SetDesconto(const Value: Double);
      procedure SetQuantidade(const Value: Double);
      procedure SetValorTotal(const Value: Double);

      //Consultas
      procedure PesquisaTabela(strNomeTabela, strNomepesquisa, strValorPesquisa : String); //pesquisa tabela filtrando por um valor
      procedure ConsultaClientesGeral(strNomeTabela : String); //prenche o grid de clientes no cadastro
      //Crud
      procedure GravaDados;
      procedure ALteraDados;
      procedure ExcluiDados;

      //Property
      property ID           : Integer read GetID            write SetID;
      property IDMovtoVenda : Integer read GetIDMovtoVenda  write SetIDMovtoVenda;
      property IDProduto    : Integer read GetIDProduto     write SetIDProduto;
      property IDTabpreco   : Integer read GetIDTabpreco    write SetIDTabpreco;
      property PrecoProduto : Double  read GetPrecoProduto  write SetPrecoProduto;
      property Desconto     : Double  read GetDesconto      write SetDesconto;
      property Quantidade   : Double  read GetQuantidade    write SetQuantidade;
      property ValorTotal   : Double  read GetValorTotal    write SetValorTotal;

    published
      constructor Create;
  end;

implementation

{ TMovimentoVendaItens }
constructor TMovimentoVendaItens.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := frmDatamodulo.DBConect;
end;

function TMovimentoVendaItens.GetDesconto: Double;
begin
  Result := FDesconto;
end;

function TMovimentoVendaItens.GetID: Integer;
begin
  Result := FID;
end;

function TMovimentoVendaItens.GetIDMovtoVenda: Integer;
begin
  Result := FIDMovtoVenda;
end;

function TMovimentoVendaItens.GetIDProduto: Integer;
begin
  Result := FIDProduto;
end;

function TMovimentoVendaItens.GetIDTabpreco: Integer;
begin
  Result := FIDTabpreco;
end;

function TMovimentoVendaItens.GetPrecoProduto: Double;
begin
  Result := FPrecoProduto;
end;

function TMovimentoVendaItens.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

function TMovimentoVendaItens.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TMovimentoVendaItens.GravaDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' INSERT INTO TB_MovtoItens   ' +
              '   (ID_MovtoVenda,           ' +
              '    ID_Produto,              ' +
              '    ID_Tabpreco,             ' +
              '    PrecoProduto,            ' +
              '    Desconto,                ' +
              '    Quantidade,              ' +
              '    ValorTotal)              ' +
              ' VALUES                      ' +
              '   (:ID_MovtoVenda,          ' +
              '    :ID_Produto,             ' +
              '    :ID_Tabpreco,            ' +
              '    :PrecoProduto,           ' +
              '    :Desconto,               ' +
              '    :Quantidade,             ' +
              '    :ValorTotal)             ';

    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('ID_MovtoVenda').AsInteger := GetIDMovtoVenda;
    QryAuxiliar.ParamByName('ID_Produto').AsInteger    := GetIDProduto;
    QryAuxiliar.ParamByName('ID_Tabpreco').AsInteger   := GetIDTabpreco;
    QryAuxiliar.ParamByName('PrecoProduto').AsFloat    := GetPrecoProduto;
    QryAuxiliar.ParamByName('Desconto').AsFloat        := GetDesconto;
    QryAuxiliar.ParamByName('Quantidade').AsFloat      := GetQuantidade;
    QryAuxiliar.ParamByName('ValorTotal').AsFloat      := GetValorTotal;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Movimentos de Vendas Itens): '+E.Message);
      end;
  end;
end;

procedure TMovimentoVendaItens.ALteraDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' UPDATE TB_MovtoItens                    ' +
              '   SET ID_MovtoVenda   =:ID_MovtoVenda,  ' +
              '       ID_Produto      =:ID_Produto,     ' +
              '       ID_Tabpreco     =:ID_Tabpreco,    ' +
              '       PrecoProduto    =:PrecoProduto,   ' +
              '       Desconto        =:Desconto,       ' +
              '       Quantidade      =:Quantidade,     ' +
              '       ValorTotal      =:ValorTotal,     ' +
              ' WHERE Id              =:Id              ';
    QryAuxiliar.ParamByName('ID_MovtoVenda').AsInteger := GetIDMovtoVenda;
    QryAuxiliar.ParamByName('ID_Produto').AsInteger    := GetIDProduto;
    QryAuxiliar.ParamByName('ID_Tabpreco').AsInteger   := GetIDTabpreco;
    QryAuxiliar.ParamByName('PrecoProduto').AsFloat    := GetPrecoProduto;
    QryAuxiliar.ParamByName('Desconto').AsFloat        := GetDesconto;
    QryAuxiliar.ParamByName('Quantidade').AsFloat      := GetQuantidade;
    QryAuxiliar.ParamByName('ValorTotal').AsFloat      := GetValorTotal;
    QryAuxiliar.ParamByName('Id').AsInteger            := GetID;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Movimentos de Vendas Itens): '+E.Message);
      end;
  end;
end;

procedure TMovimentoVendaItens.ExcluiDados;
begin
  try
    frmDatamodulo.DBConect.StartTransaction;
    //Agora exclui o cliente
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;
    QryAuxiliar.SQL.Add('DELETE FROM TB_MovtoItens Where Id=:Id');
    QryAuxiliar.ParamByName('Id').AsInteger := GetID;
    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Movimentos de Vendas Itens): '+E.Message);
      end;
  end;
end;

procedure TMovimentoVendaItens.PesquisaTabela(strNomeTabela, strNomepesquisa,
  strValorPesquisa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add('WHERE '+trim(strNomepesquisa)+ ' LIKE '+ quotedstr('%'+ trim(strValorPesquisa)+'%'));
  QryAuxiliar.Open();
  frmDatamodulo.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TMovimentoVendaItens.ConsultaClientesGeral(strNomeTabela: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add(' Order by Id');
  QryAuxiliar.Open;
  frmDatamodulo.dsClientes.DataSet := QryAuxiliar;
end;

procedure TMovimentoVendaItens.SetDesconto(const Value: Double);
begin
  FDesconto := Value;
end;

procedure TMovimentoVendaItens.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TMovimentoVendaItens.SetIDMovtoVenda(const Value: Integer);
begin
  FIDMovtoVenda := Value;
end;

procedure TMovimentoVendaItens.SetIDProduto(const Value: Integer);
begin
  FIDProduto := Value;
end;

procedure TMovimentoVendaItens.SetIDTabpreco(const Value: Integer);
begin
  FIDTabpreco := Value;
end;

procedure TMovimentoVendaItens.SetPrecoProduto(const Value: Double);
begin
  FPrecoProduto := Value;
end;

procedure TMovimentoVendaItens.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TMovimentoVendaItens.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.
