unit uClsProdutosPLS;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.Client, uPrincipal,
     Graphics, Variants, Jpeg, Windows, Classes, Controls, Forms, DBClient,
     uDatamodulo;

type
  TProdutos= class
    private
      FID           : Integer;
      FDescricao    : string;
      FIDCategoria  : Integer;
    public
      //Ser? usado tanto para os insert como para select
      QryAuxiliar   : TFDQuery;

      //Get
      function GetID           : Integer;
      function GetDescricao    : string;
      function GetIDCategoria  : Integer;

      //Set
      procedure SetID(const Value: Integer);
      procedure SetDescricao(const Value: string);
      procedure SetIDCategoria(const Value: Integer);

      //Consultas
      procedure PesquisaTabela(strNomeTabela, strNomepesquisa, strValorPesquisa : String); //pesquisa tabela filtrando por um valor
      procedure ConsultaClientesGeral(strNomeTabela : String); //prenche o grid de clientes no cadastro

      //Crud
      procedure GravaDados;
      procedure ALteraDados;
      procedure ExcluiDados;

      //Property
      property ID           : Integer read GetID          write SetID;
      property Descricao    : string  read GetDescricao   write SetDescricao;
      property IDCategoria  : Integer  read GetIDCategoria write SetIDCategoria;

    published
      constructor Create;
  end;

implementation

{ TProdutos }
constructor TProdutos.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := frmDatamodulo.DBConect;
end;

procedure TProdutos.GravaDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' INSERT INTO TB_ProdutoPLS  ' +
              '   (DescricaoProd,           ' +
              '    ID_Categoria)            ' +
              ' VALUES                      ' +
              '   (:DescricaoProd,          ' +
              '    :ID_Categoria)           ' ;

    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('DescricaoProd').AsString    := GetDescricao;
    QryAuxiliar.ParamByName('ID_Categoria').AsInteger    := GetIDCategoria;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Produtos): '+E.Message);
      end;
  end;
end;

procedure TProdutos.ALteraDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' UPDATE TB_ProdutoPLS                           ' +
              '       SET DescricaoProd        =:DescricaoProd, ' +
              '           ID_Categoria         =:ID_Categoria   ' +
              ' WHERE Id =:Id ';
    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('DescricaoProd').AsString     := GetDescricao;
    QryAuxiliar.ParamByName('ID_Categoria').AsInteger     := GetIDCategoria;
    QryAuxiliar.ParamByName('Id').AsInteger               := GetID;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Produtos): '+E.Message);
      end;
  end;
end;

procedure TProdutos.ExcluiDados;
begin
  try
    frmDatamodulo.DBConect.StartTransaction;
    //Agora exclui o produto
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;
    QryAuxiliar.SQL.Add('DELETE FROM TB_ProdutoPLS Where Id=:Id');
    QryAuxiliar.ParamByName('Id').AsInteger := GetID;
    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Produtos): '+E.Message);
      end;
  end;
end;

procedure TProdutos.PesquisaTabela(strNomeTabela, strNomepesquisa,
  strValorPesquisa: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT ID, '+strNomepesquisa+' ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add('WHERE '+trim(strNomepesquisa)+ ' LIKE '+ quotedstr('%'+ trim(strValorPesquisa)+'%'));
  QryAuxiliar.Open();
  frmDatamodulo.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TProdutos.ConsultaClientesGeral(strNomeTabela: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add(' Order by Id');
  QryAuxiliar.Open;
  frmDatamodulo.dsClientes.DataSet := QryAuxiliar;
end;

//get
function TProdutos.GetID: Integer;
begin
  Result := FID;
end;

function TProdutos.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TProdutos.GetIDCategoria: Integer;
begin
  Result := FIDCategoria;
end;

//set
procedure TProdutos.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TProdutos.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProdutos.SetIDCategoria(const Value: Integer);
begin
  FIDCategoria := Value;
end;


end.
