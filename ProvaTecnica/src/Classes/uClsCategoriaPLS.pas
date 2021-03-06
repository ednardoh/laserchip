
unit uClsCategoriaPLS;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.Client, uPrincipal,
     Graphics, Variants, Jpeg, Windows, Classes, Controls, Forms, DBClient,
     uDatamodulo;

type
  TCategoria = class
    private
      FID           : Integer;
      FDescricao    : string;
    public
      //Ser? usado tanto para os insert como para select
      QryAuxiliar   : TFDQuery;

      //Get
      function GetID           : Integer;
      function GetDescricao    : string;

      //Set
      procedure SetID(const Value: Integer);
      procedure SetDescricao(const Value: string);

      //Consultas
      procedure PesquisaTabela(strNomeTabela, strNomepesquisa, strValorPesquisa : String); //pesquisa tabela filtrando por um valor
      procedure ConsultaClientesGeral(strNomeTabela : String); //prenche o grid de categoria no cadastro

      //Crud
      procedure GravaDados;
      procedure ALteraDados;
      procedure ExcluiDados;

      //Property
      property ID           : Integer read GetID          write SetID;
      property Descricao    : string  read GetDescricao   write SetDescricao;

    published
      constructor Create;
  end;

implementation

{ TCategoria }
constructor TCategoria.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := frmDatamodulo.DBConect;
end;

procedure TCategoria.GravaDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' INSERT INTO TB_CategoriaPLS' +
              '   (Descricao)       ' +
              ' VALUES              ' +
              '   (:Descricao)      ' ;

    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('Descricao').AsString  := GetDescricao;
    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Categoria): '+E.Message);
      end;
  end;
end;

procedure TCategoria.ALteraDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' UPDATE TB_CategoriaPLS                     ' +
              '       SET Descricao       =:Descricao      ' +
              ' WHERE Id                  =:Id             ';
    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('Descricao').AsString   := GetDescricao;
    QryAuxiliar.ParamByName('Id').AsInteger         := GetID;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Categoria): '+E.Message);
      end;
  end;
end;

procedure TCategoria.ExcluiDados;
begin
  try
    frmDatamodulo.DBConect.StartTransaction;
    //Agora exclui o cliente
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;
    QryAuxiliar.SQL.Add('DELETE FROM TB_CategoriaPLS Where Id=:Id');
    QryAuxiliar.ParamByName('Id').AsInteger := GetID;
    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Categoria): '+E.Message);
      end;
  end;
end;

procedure TCategoria.PesquisaTabela(strNomeTabela, strNomepesquisa,
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

procedure TCategoria.ConsultaClientesGeral(strNomeTabela: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add(' Order by Id');
  QryAuxiliar.Open;
  frmDatamodulo.dsCategoria.DataSet := QryAuxiliar;
end;

function TCategoria.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TCategoria.GetID: Integer;
begin
  Result := FID;
end;

procedure TCategoria.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TCategoria.SetID(const Value: Integer);
begin
  FID := Value;
end;

end.
