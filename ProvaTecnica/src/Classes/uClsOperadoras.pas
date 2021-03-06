unit uClsOperadoras;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.Client, uPrincipal,
     Graphics, Variants, Jpeg, Windows, Classes, Controls, Forms, DBClient,
     uDatamodulo;

type
  TOperadoras = class
    private
      FID           : Integer;
      FCNPJ         : string;
      FNome         : string;
      FCep          : string;
      FLogradouro   : string;
      FNumero       : string;
      FComplemento  : string;
      FBairro       : string;
      FCidade       : string;
      FIbge_cidade  : string;
      FSigla_uf     : string;
      FIbge_uf      : string;
      FLogo         : string;
    public
      //Ser? usado tanto para os insert como para select
      QryAuxiliar   : TFDQuery;
      //Get
      function GetID          : Integer;
      function GetCNPJ        : string;
      function GetNome        : string;
      function GetCep         : string;
      function GetLogradouro  : string;
      function GetNumero      : string;
      function GetComplemento : string;
      function GetBairro      : string;
      function GetCidade      : string;
      function GetIbge_cidade : string;
      function GetSigla_uf    : string;
      function GetIbge_uf     : string;
      function GetLogo        : string;
      //Set
      procedure SetID(const Value: Integer);
      procedure SetCnpj(const Value: string);
      procedure SetNome(const Value: string);
      procedure SetCep(const Value: string);
      procedure SetLogradouro(const Value: string);
      procedure SetNumero(const Value: string);
      procedure SetComplemento(const Value: string);
      procedure SetBairro(const Value: string);
      procedure SetCidade(const Value: string);
      procedure SetIbge_cidade(const Value: string);
      procedure SetSigla_uf(const Value: string);
      procedure SetIbge_uf(const Value: string);
      procedure SetLogo(const Value: string);
      //Consultas
      procedure PesquisaTabela(strNomeTabela, strNomepesquisa, strValorPesquisa : String); //pesquisa tabela filtrando por um valor
      procedure ConsultaClientesGeral(strNomeTabela : String); //prenche o grid de clientes no cadastro
      procedure ConsultaOperadorasPeloByID(ID: Integer);
      //Crud
      procedure GravaDados;
      procedure ALteraDados;
      procedure ExcluiDados;
      //Property
      property ID          : Integer read GetID          write SetID;
      property CNPJ        : string  read GetCNPJ        write SetCNPJ;
      property Nome        : string  read GetNome        write SetNome;
      property Cep         : string  read GetCep         write SetCep;
      property Logradouro  : string  read GetLogradouro  write SetLogradouro;
      property Numero      : string  read GetNumero      write SetNumero;
      property Complemento : string  read GetComplemento write SetComplemento;
      property Bairro      : string  read GetBairro      write SetBairro;
      property Cidade      : string  read GetCidade      write SetCidade;
      property Ibge_cidade : string  read GetIbge_cidade write SetIbge_cidade;
      property Sigla_uf    : string  read GetSigla_uf    write SetSigla_uf;
      property Ibge_uf     : string  read GetIbge_uf     write SetIbge_uf;
      property Logo        : string  read GetLogo        write SetLogo;
    published
      constructor Create;
  end;

implementation

{ TClientes }
constructor TOperadoras.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := frmDatamodulo.DBConect;
end;

function TOperadoras.GetCep: string;
begin
  Result := FCep;
end;

function TOperadoras.GetBairro: string;
begin
  Result := FBairro;
end;

function TOperadoras.GetCidade: string;
begin
  Result := FCidade;
end;

function TOperadoras.GetComplemento: string;
begin
  Result := FComplemento;
end;

function TOperadoras.GetCNPJ: string;
begin
  Result :=FCNPJ;
end;

function TOperadoras.GetIbge_cidade: string;
begin
  Result :=FIbge_cidade;
end;

function TOperadoras.GetIbge_uf: string;
begin
  Result := FIbge_uf;
end;

function TOperadoras.GetID: Integer;
begin
  Result := FID;
end;

function TOperadoras.GetLogo: string;
begin
  Result := FLogo;
end;

function TOperadoras.GetLogradouro: string;
begin
  Result := FLogradouro;
end;

function TOperadoras.GetNome: string;
begin
  Result := FNome;
end;

function TOperadoras.GetNumero: string;
begin
  Result := FNumero;
end;

function TOperadoras.GetSigla_uf: string;
begin
  Result := FSigla_uf;
end;

procedure TOperadoras.GravaDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' INSERT INTO TB_Operadoras' +
              '   (Cnpj,           ' +
              '    RazaoSocial,    ' +
              '    Cep,            ' +
              '    Logradouro,     ' +
              '    Numero,         ' +
              '    Complemento,    ' +
              '    Bairro,         ' +
              '    Cidade,         ' +
              '    Ibge_cidade,    ' +
              '    Sigla_uf,       ' +
              '    Ibge_uf,        ' +
              '    Logo)           ' +
              ' VALUES             ' +
              '   (:Cnpj,          ' +
              '    :RazaoSocial,   ' +
              '    :Cep,           ' +
              '    :Logradouro,    ' +
              '    :Numero,        ' +
              '    :Complemento,   ' +
              '    :Bairro,        ' +
              '    :Cidade,        ' +
              '    :Ibge_cidade,   ' +
              '    :Sigla_uf,      ' +
              '    :Ibge_uf,       ' +
              '    :Logo)          ';

    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('Cnpj').AsString        := GetCNPJ;
    QryAuxiliar.ParamByName('RazaoSocial').AsString := GetNome;
    QryAuxiliar.ParamByName('Cep').AsString         := GetCep;
    QryAuxiliar.ParamByName('Logradouro').AsString  := GetLogradouro;
    QryAuxiliar.ParamByName('Numero').AsString      := GetNumero;
    QryAuxiliar.ParamByName('Complemento').AsString := GetComplemento;
    QryAuxiliar.ParamByName('Bairro').AsString      := GetBairro;
    QryAuxiliar.ParamByName('Cidade').AsString      := GetCidade;
    QryAuxiliar.ParamByName('Ibge_cidade').AsString := GetIbge_cidade;
    QryAuxiliar.ParamByName('Sigla_uf').AsString    := GetSigla_uf;
    QryAuxiliar.ParamByName('Ibge_uf').AsString     := GetIbge_uf;
    QryAuxiliar.ParamByName('Logo').AsString        := GetLogo;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Clientes): '+E.Message);
      end;
  end;
end;

procedure TOperadoras.ALteraDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' UPDATE TB_Operadoras               ' +
              '   SET Cnpj        =:Cnpj,        ' +
              '       RazaoSocial =:RazaoSocial, ' +
              '       Cep         =:Cep,         ' +
              '       Logradouro  =:Logradouro,  ' +
              '       Numero      =:Numero,      ' +
              '       Complemento =:Complemento, ' +
              '       Bairro      =:Bairro,      ' +
              '       Cidade      =:Cidade,      ' +
              '       Ibge_cidade =:Ibge_cidade, ' +
              '       Sigla_uf    =:Sigla_uf,    ' +
              '       Ibge_uf     =:Ibge_uf,     ' +
              '       Logo        =:Logo         ' +
              ' WHERE Id          =:Id           ';
    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('Cnpj').AsString        := GetCNPJ;
    QryAuxiliar.ParamByName('RazaoSocial').AsString := GetNome;
    QryAuxiliar.ParamByName('Cep').AsString         := GetCep;
    QryAuxiliar.ParamByName('Logradouro').AsString  := GetLogradouro;
    QryAuxiliar.ParamByName('Numero').AsString      := GetNumero;
    QryAuxiliar.ParamByName('Complemento').AsString := GetComplemento;
    QryAuxiliar.ParamByName('Bairro').AsString      := GetBairro;
    QryAuxiliar.ParamByName('Cidade').AsString      := GetCidade;
    QryAuxiliar.ParamByName('Ibge_cidade').AsString := GetIbge_cidade;
    QryAuxiliar.ParamByName('Sigla_uf').AsString    := GetSigla_uf;
    QryAuxiliar.ParamByName('Ibge_uf').AsString     := GetIbge_uf;
    QryAuxiliar.ParamByName('Logo').AsString        := GetLogo;
    QryAuxiliar.ParamByName('Id').AsInteger         := GetID;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Clientes): '+E.Message);
      end;
  end;
end;

procedure TOperadoras.ExcluiDados;
begin
  try
    frmDatamodulo.DBConect.StartTransaction;
    //Agora exclui o cliente
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;
    QryAuxiliar.SQL.Add('DELETE FROM TB_Operadoras Where Id=:Id');
    QryAuxiliar.ParamByName('Id').AsInteger := GetID;
    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa??o
        ShowMessage('Ocorreu um erro Inesperado. (Clientes): '+E.Message);
      end;
  end;
end;

procedure TOperadoras.PesquisaTabela(strNomeTabela, strNomepesquisa,
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

procedure TOperadoras.ConsultaClientesGeral(strNomeTabela: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add(' Order by Id');
  QryAuxiliar.Open;
  frmDatamodulo.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TOperadoras.ConsultaOperadorasPeloByID(ID: Integer);
begin
  frmDatamodulo.dsPesquisa.DataSet := NIL;
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * from TB_Operadoras ');
  QryAuxiliar.SQL.Add(' where ID = ' + ID.ToString);
  QryAuxiliar.Open;
  frmDatamodulo.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TOperadoras.SetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TOperadoras.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TOperadoras.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TOperadoras.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TOperadoras.SetCnpj(const Value: string);
begin
  FCnpj := Value;
end;

procedure TOperadoras.SetIbge_cidade(const Value: string);
begin
  FIbge_cidade := Value;
end;

procedure TOperadoras.SetIbge_uf(const Value: string);
begin
  FIbge_uf := Value;
end;

procedure TOperadoras.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TOperadoras.SetLogo(const Value: string);
begin
  FLogo := Value;
end;

procedure TOperadoras.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TOperadoras.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TOperadoras.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TOperadoras.SetSigla_uf(const Value: string);
begin
  FSigla_uf := Value;
end;

end.
