unit uClsMovimentoVenda;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.Client, uPrincipal,
     Graphics, Variants, Jpeg, Windows, Classes, Controls, Forms, DBClient,
     uDatamodulo;

type
  TMovimentoVenda = class
    private
      //Cabeçalho da venda
      FID           : Integer;
      FIDCorretor   : Integer;
      FIDCliente    : Integer;
      FIDOperadora  : Integer;
      FNumOrcamento : string;
      FDataEmissao  : string;
      FDataValidade : string;
    public
      //Será usado tanto para os insert como para select
      QryAuxiliar   : TFDQuery;
      //Get
      function GetID          : Integer;
      function GetIDCorretor  : Integer;
      function GetIDCliente   : Integer;
      function GetIDOperadora : Integer;
      function GetNumOrcamento: string;
      function GetDataEmissao : string;
      function GetDataValidade: string;

      //Retorna um sequencial para o pedido de vendas
      function RetornaNumPedido: Integer;
      //Retorna o id da movimentação
      function RetornaIDMovimentacao: Integer;

      //Set
      procedure SetID(const Value: Integer);
      procedure SetIDCorretor(const Value: Integer);
      procedure SetIDCliente(const Value: Integer);
      procedure SetIDOperadora(const Value: Integer);
      procedure SetNumOrcamento(const Value: string);
      procedure SetDataEmissao(const Value: string);
      procedure SetDataValidade(const Value: string);

      //Consultas
      procedure PesquisaTabela(strNomeTabela, strNomepesquisa, strValorPesquisa : String); //pesquisa tabela filtrando por um valor
      procedure ConsultaClientesGeral(strNomeTabela : String); //prenche o grid de clientes no cadastro
      //Crud
      procedure GravaDados;
      procedure ALteraDados;
      procedure ExcluiDados;
      //Property
      property ID           : Integer read GetID            write SetID;
      property IDCorretor   : Integer read GetIDCorretor    write SetIDCorretor;
      property IDCliente    : Integer read GetIDCliente     write SetIDCliente;
      property IDOperadora  : Integer read GetIDOperadora   write SetIDOperadora;
      property NumOrcamento : string  read GetNumOrcamento  write SetNumOrcamento;
      property DataEmissao  : string  read GetDataEmissao   write SetDataEmissao;
      property DataValidade : string  read GetDataValidade  write SetDataValidade;

    published
      constructor Create;
  end;

implementation

{ TMovimentoVenda }
constructor TMovimentoVenda.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := frmDatamodulo.DBConect;
end;

function TMovimentoVenda.GetDataEmissao: string;
begin
  Result := FDataEmissao;
end;

function TMovimentoVenda.GetDataValidade: string;
begin
  Result := FDataValidade;
end;

function TMovimentoVenda.GetID: Integer;
begin
  Result := FID;
end;

function TMovimentoVenda.GetIDCliente: Integer;
begin
  Result := FIDCliente;
end;

function TMovimentoVenda.GetIDCorretor: Integer;
begin
  Result := FIDCorretor;
end;

function TMovimentoVenda.GetIDOperadora: Integer;
begin
  Result := FIDOperadora;
end;

function TMovimentoVenda.GetNumOrcamento: string;
begin
  Result := FNumOrcamento;
end;

procedure TMovimentoVenda.GravaDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' INSERT INTO TB_MovtoVenda ' +
              '   (ID_Corretor,           ' +
              '    ID_Cliente,            ' +
              '    ID_Operadora,          ' +
              '    NumOrcamento,          ' +
              '    DataEmissao,           ' +
              '    DataValidade)          ' +
              ' VALUES                    ' +
              '   (:ID_Corretor,          ' +
              '    :ID_Cliente,           ' +
              '    :ID_Operadora,         ' +
              '    :NumOrcamento,         ' +
              '    :DataEmissao,          ' +
              '    :DataValidade)         ';

    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('ID_Corretor').AsInteger    := GetIDCorretor;
    QryAuxiliar.ParamByName('ID_Cliente').AsInteger     := GetIDCliente;
    QryAuxiliar.ParamByName('ID_Operadora').AsInteger   := GetIDOperadora;
    QryAuxiliar.ParamByName('NumOrcamento').AsString    := GetNumOrcamento;
    QryAuxiliar.ParamByName('DataEmissao').AsString     := GetDataEmissao;
    QryAuxiliar.ParamByName('DataValidade').AsString    := GetDataValidade;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transação
        ShowMessage('Ocorreu um erro Inesperado. (Movimentos de Vendas): '+E.Message);
      end;
  end;
end;

procedure TMovimentoVenda.ALteraDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' UPDATE TB_MovtoVenda                  ' +
              '   SET ID_Corretor     =:ID_Corretor,  ' +
              '       ID_Cliente      =:ID_Cliente,   ' +
              '       ID_Operadora    =:ID_Operadora, ' +
              '       NumOrcamento    =:NumOrcamento, ' +
              '       DataEmissao     =:DataEmissao,  ' +
              '       DataValidade    =:DataValidade, ' +
              ' WHERE Id              =:Id            ';
    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('ID_Corretor').AsInteger    := GetIDCorretor;
    QryAuxiliar.ParamByName('ID_Cliente').AsInteger     := GetIDCliente;
    QryAuxiliar.ParamByName('ID_Operadora').AsInteger   := GetIDOperadora;
    QryAuxiliar.ParamByName('NumOrcamento').AsString    := GetNumOrcamento;
    QryAuxiliar.ParamByName('DataEmissao').AsString     := GetDataEmissao;
    QryAuxiliar.ParamByName('DataValidade').AsString    := GetDataValidade;
    QryAuxiliar.ParamByName('Id').AsInteger             := GetID;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transação
        ShowMessage('Ocorreu um erro Inesperado. (Movimentos de Vendas): '+E.Message);
      end;
  end;
end;

procedure TMovimentoVenda.ExcluiDados;
begin
  try
    frmDatamodulo.DBConect.StartTransaction;
    //Agora exclui o cliente
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;
    QryAuxiliar.SQL.Add('DELETE FROM TB_MovtoVenda Where Id=:Id');
    QryAuxiliar.ParamByName('Id').AsInteger := GetID;
    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transação
        ShowMessage('Ocorreu um erro Inesperado. (Movimentos de Vendas): '+E.Message);
      end;
  end;
end;

procedure TMovimentoVenda.PesquisaTabela(strNomeTabela, strNomepesquisa,
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

function TMovimentoVenda.RetornaIDMovimentacao: Integer;
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('select Max(ID) as IDMovto from TB_MovtoVenda ');
  QryAuxiliar.Open;
  Result := QryAuxiliar.FieldByName('IDMovto').AsInteger;
end;

function TMovimentoVenda.RetornaNumPedido: Integer;
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('select Max(isnull(ID,0))+1 as NumPedido from TB_MovtoVenda ');
  QryAuxiliar.Open;
  if QryAuxiliar.Eof then
    Result := 1
  else
  begin
    if QryAuxiliar.FieldByName('NumPedido').AsInteger = 0 then
      Result := QryAuxiliar.FieldByName('NumPedido').AsInteger + 1
    else
      Result := QryAuxiliar.FieldByName('NumPedido').AsInteger;
  end;
end;

procedure TMovimentoVenda.ConsultaClientesGeral(strNomeTabela: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add(' Order by Id');
  QryAuxiliar.Open;
  frmDatamodulo.dsClientes.DataSet := QryAuxiliar;
end;

procedure TMovimentoVenda.SetDataEmissao(const Value: string);
begin
  FDataEmissao := Value;
end;

procedure TMovimentoVenda.SetDataValidade(const Value: string);
begin
  FDataValidade := Value;
end;

procedure TMovimentoVenda.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TMovimentoVenda.SetIDCliente(const Value: Integer);
begin
  FIDCliente := Value;
end;

procedure TMovimentoVenda.SetIDCorretor(const Value: Integer);
begin
  FIDCorretor := Value;
end;

procedure TMovimentoVenda.SetIDOperadora(const Value: Integer);
begin
  FIDOperadora := Value;
end;

procedure TMovimentoVenda.SetNumOrcamento(const Value: string);
begin
  FNumOrcamento := Value;
end;

end.
