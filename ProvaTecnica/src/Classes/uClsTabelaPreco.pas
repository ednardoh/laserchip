unit uClsTabelaPreco;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.Client, uPrincipal,
     Graphics, Variants, Jpeg, Windows, Classes, Controls, Forms, DBClient,
     uDatamodulo;

type
  TTabPreco= class
    private
      FID           : Integer;
      FIDProduto    : Integer;
      FPercDesconto : Double;
      FPrecoProduto : Double;
    public
      //Ser? usado tanto para os insert como para select
      QryAuxiliar   : TFDQuery;

      //Get
      function GetID           : Integer;
      function GetIDProduto    : Integer;
      function GetPercDesconto : Double;
      function GetPrecoProduto : Double;

      //Set
      procedure SetID(const Value: Integer);
      procedure SetIDProduto(const Value: Integer);
      procedure SetPercDesconto(const Value: Double);
      procedure SetPrecoProduto(const Value: Double);

      //Consultas
      procedure PesquisaTabela(strNomeTabela, strNomepesquisa, strValorPesquisa : String); //pesquisa tabela filtrando por um valor
      procedure ConsultaTabprecoGeral(strNomeTabela : String); //prenche o grid de clientes no cadastro

      //Crud
      procedure GravaDados;
      procedure ALteraDados;
      procedure ExcluiDados;

      //Property
      property ID            : Integer read GetID          write SetID;
      property IDProduto     : Integer  read GetIDProduto   write SetIDProduto;
      property PercDesconto  : Double  read GetPercDesconto write SetPercDesconto;
      property PrecoProduto  : Double  read GetPrecoProduto write SetPrecoProduto;

    published
      constructor Create;
  end;

implementation

{ TProdutos }
constructor TTabPreco.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := frmDatamodulo.DBConect;
end;

procedure TTabPreco.GravaDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' INSERT INTO TB_TabelaPreco  ' +
              '   (ID_Produto,              ' +
              '    PercDesconto,            ' +
              '    PrecoProduto)            ' +
              ' VALUES                      ' +
              '   (:ID_Produto,             ' +
              '    :PercDesconto,           ' +
              '    :PrecoProduto)           ' ;

    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('ID_Produto').AsInteger       := GetIDProduto;
    QryAuxiliar.ParamByName('PercDesconto').AsFloat       := GetPercDesconto;
    QryAuxiliar.ParamByName('PrecoProduto').AsFloat       := GetPrecoProduto;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (TabPre?o): '+E.Message);
      end;
  end;
end;

procedure TTabPreco.ALteraDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' UPDATE TB_TabelaPreco                           ' +
              '       SET ID_Produto        =:ID_Produto,       ' +
              '           PercDesconto      =:PercDesconto,     ' +
              '           PrecoProduto      =:PrecoProduto      ' +
              ' WHERE Id =:Id ';
    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('ID_Produto').AsInteger        := GetIDProduto;
    QryAuxiliar.ParamByName('PercDesconto').AsFloat        := GetPercDesconto;
    QryAuxiliar.ParamByName('PrecoProduto').AsFloat        := GetPrecoProduto;
    QryAuxiliar.ParamByName('Id').AsInteger                := GetID;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (TabPre?o): '+E.Message);
      end;
  end;
end;

procedure TTabPreco.ExcluiDados;
begin
  try
    frmDatamodulo.DBConect.StartTransaction;
    //Agora exclui o produto
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;
    QryAuxiliar.SQL.Add('DELETE FROM TB_TabelaPreco Where Id=:Id');
    QryAuxiliar.ParamByName('Id').AsInteger := GetID;
    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (TabPre?o): '+E.Message);
      end;
  end;
end;

procedure TTabPreco.PesquisaTabela(strNomeTabela, strNomepesquisa,
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

procedure TTabPreco.ConsultaTabprecoGeral(strNomeTabela: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add(' Order by Id');
  QryAuxiliar.Open;
  frmDatamodulo.dsPesquisa.DataSet := QryAuxiliar;
end;

//get
function TTabPreco.GetID: Integer;
begin
  Result := FID;
end;

function TTabPreco.GetIDProduto: Integer;
begin
  Result := FIDProduto;
end;

function TTabPreco.GetPercDesconto: Double;
begin
  Result := FPercDesconto;
end;

function TTabPreco.GetPrecoProduto: Double;
begin
  Result := FPrecoProduto;
end;


//set
procedure TTabPreco.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TTabPreco.SetIDProduto(const Value: Integer);
begin
  FIDProduto := Value;
end;

procedure TTabPreco.SetPercDesconto(const Value: Double);
begin
  FPercDesconto := Value;
end;

procedure TTabPreco.SetPrecoProduto(const Value: Double);
begin
  FPrecoProduto := Value;
end;

end.
