unit uClsCorretor;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.Client, uPrincipal,
     Graphics, Variants, Jpeg, Windows, Classes, Controls, Forms, DBClient,
     uDatamodulo;

type
  TCorretor = class
    private
      FID           : Integer;
      FNome         : string;
      FCpf          : string;
      FDTNascimento : string;
      FCelular      : string;
    public
      //Ser? usado tanto para os insert como para select
      QryAuxiliar   : TFDQuery;

      //Get
      function GetID           : Integer;
      function GetNome         : string;
      function GetCpf          : string;
      function GetDTNascimento : string;
      function GetCelular      : string;

      //Set
      procedure SetID(const Value: Integer);
      procedure SetNome(const Value: string);
      procedure SetCpf(const Value: string);
      procedure SetDTNascimento(const Value: string);
      procedure SetCelular(const Value: string);

      //Consultas
      procedure PesquisaTabela(strNomeTabela, strNomepesquisa, strValorPesquisa : String); //pesquisa tabela filtrando por um valor
      procedure ConsultaClientesGeral(strNomeTabela : String); //prenche o grid de clientes no cadastro
      procedure ConsultaCorretorPeloByID(ID: Integer);

      //Crud
      procedure GravaDados;
      procedure ALteraDados;
      procedure ExcluiDados;

      //Property
      property ID           : Integer read GetID          write SetID;
      property Nome         : string  read GetNome        write SetNome;
      property Cpf          : string  read GetCpf         write SetCpf;
      property DTNascimento : string  read GetDTNascimento write SetDTNascimento;
      property Celular      : string  read GetCelular  write SetCelular;

    published
      constructor Create;
  end;

implementation

{ TCorretor }
constructor TCorretor.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := frmDatamodulo.DBConect;
end;

function TCorretor.GetCelular: string;
begin
  Result := FCelular;
end;

function TCorretor.GetCpf: string;
begin
  Result :=FCpf;
end;

function TCorretor.GetDTNascimento: string;
begin
  Result :=FDTNascimento;
end;

function TCorretor.GetID: Integer;
begin
  Result := FID;
end;

function TCorretor.GetNome: string;
begin
  Result := FNome;
end;

procedure TCorretor.GravaDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' INSERT INTO TB_Corretor' +
              '   (Nome,            ' +
              '    Cpf,             ' +
              '    DT_Nascimento,   ' +
              '    Celular)         ' +
              ' VALUES              ' +
              '   (:Nome,           ' +
              '    :Cpf,            ' +
              '    :DT_Nascimento,  ' +
              '    :Celular)        ' ;

    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('NOME').AsString        := GetNome;
    QryAuxiliar.ParamByName('Cpf').AsString         := GetCpf;
    QryAuxiliar.ParamByName('DT_Nascimento').AsString := GetDTNascimento;
    QryAuxiliar.ParamByName('Celular').AsString     := GetCelular;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Corretor): '+E.Message);
      end;
  end;
end;

procedure TCorretor.ALteraDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' UPDATE TB_Corretor                         ' +
              '       SET Nome            =:Nome,          ' +
              '           Cpf             =:Cpf,           ' +
              '           DT_Nascimento   =:DT_Nascimento, ' +
              '           Celular         =:Celular        ' +
              ' WHERE Id                  =:Id             ';
    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('Nome').AsString        := GetNome;
    QryAuxiliar.ParamByName('Cpf').AsString         := GetCpf;
    QryAuxiliar.ParamByName('DT_Nascimento').AsString := GetDTNascimento;
    QryAuxiliar.ParamByName('Celular').AsString     := GetCelular;
    QryAuxiliar.ParamByName('Id').AsInteger         := GetID;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Corretor): '+E.Message);
      end;
  end;
end;

procedure TCorretor.ExcluiDados;
begin
  try
    frmDatamodulo.DBConect.StartTransaction;
    //Agora exclui o cliente
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;
    QryAuxiliar.SQL.Add('DELETE FROM TB_Corretor Where Id=:Id');
    QryAuxiliar.ParamByName('Id').AsInteger := GetID;
    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Corretor): '+E.Message);
      end;
  end;
end;

procedure TCorretor.PesquisaTabela(strNomeTabela, strNomepesquisa,
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

procedure TCorretor.ConsultaClientesGeral(strNomeTabela: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add(' Order by Id');
  QryAuxiliar.Open;
  frmDatamodulo.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TCorretor.ConsultaCorretorPeloByID(ID: Integer);
begin
  frmDatamodulo.dsPesquisa.DataSet := NIL;
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * from TB_Corretor ');
  QryAuxiliar.SQL.Add(' where ID = ' + ID.ToString);
  QryAuxiliar.Open;
  frmDatamodulo.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TCorretor.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TCorretor.SetCpf(const Value: string);
begin
  FCpf := Value;
end;

procedure TCorretor.SetDTNascimento(const Value: string);
begin
  FDTNascimento := Value;
end;

procedure TCorretor.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TCorretor.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
