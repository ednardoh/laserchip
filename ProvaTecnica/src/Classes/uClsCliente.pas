unit uClsCliente;

interface

Uses Winapi.Messages, Vcl.Dialogs, System.SysUtils, UConecta, FireDAC.Stan.Intf,
     Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.Client, uPrincipal,
     Graphics, Variants, Jpeg, Windows, Classes, Controls, Forms, DBClient,
     uDatamodulo;

type
  TClientes = class
    private
      FID           : Integer;
      FCpfCNPJ      : string;
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
    public
      //Ser� usado tanto para os insert como para select
      QryAuxiliar   : TFDQuery;
      //Get
      function GetID          : Integer;
      function GetCpfCNPJ     : string;
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
      //Set
      procedure SetID(const Value: Integer);
      procedure SetCpfCnpj(const Value: string);
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
      //Consultas
      procedure PesquisaTabela(strNomeTabela, strNomepesquisa, strValorPesquisa : String); //pesquisa tabela filtrando por um valor
      procedure ConsultaClientesGeral(strNomeTabela : String); //prenche o grid de clientes no cadastro
      procedure ConsultaClientesPeloByID(ID: Integer);
      //Crud
      procedure GravaDados;
      procedure ALteraDados;
      procedure ExcluiDados;
      //Property
      property ID          : Integer read GetID          write SetID;
      property CpfCNPJ     : string  read GetCpfCNPJ     write SetCpfCNPJ;
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

    published
      constructor Create;
  end;

implementation

{ TClientes }
constructor TClientes.Create;
begin
  QryAuxiliar := TFDQuery.Create(nil);
  QryAuxiliar.Connection := frmDatamodulo.DBConect;
end;

function TClientes.GetCep: string;
begin
  Result := FCep;
end;

function TClientes.GetBairro: string;
begin
  Result := FBairro;
end;

function TClientes.GetCidade: string;
begin
  Result := FCidade;
end;

function TClientes.GetComplemento: string;
begin
  Result := FComplemento;
end;

function TClientes.GetCpfCNPJ: string;
begin
  Result :=FCpfCNPJ;
end;

function TClientes.GetIbge_cidade: string;
begin
  Result :=FIbge_cidade;
end;

function TClientes.GetIbge_uf: string;
begin
  Result := FIbge_uf;
end;

function TClientes.GetID: Integer;
begin
  Result := FID;
end;

function TClientes.GetLogradouro: string;
begin
  Result := FLogradouro;
end;

function TClientes.GetNome: string;
begin
  Result := FNome;
end;

function TClientes.GetNumero: string;
begin
  Result := FNumero;
end;

function TClientes.GetSigla_uf: string;
begin
  Result := FSigla_uf;
end;

procedure TClientes.GravaDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' INSERT INTO TB_Clientes' +
              '   (CpfCnpj,        ' +
              '    Nome,           ' +
              '    Cep,            ' +
              '    Logradouro,     ' +
              '    Numero,         ' +
              '    Complemento,    ' +
              '    Bairro,         ' +
              '    Cidade,         ' +
              '    Ibge_cidade,    ' +
              '    Sigla_uf,       ' +
              '    Ibge_uf)        ' +
              ' VALUES             ' +
              '   (:CpfCnpj,        ' +
              '    :Nome,          ' +
              '    :Cep,           ' +
              '    :Logradouro,    ' +
              '    :Numero,        ' +
              '    :Complemento,   ' +
              '    :Bairro,        ' +
              '    :Cidade,        ' +
              '    :Ibge_cidade,   ' +
              '    :Sigla_uf,      ' +
              '    :Ibge_uf)       ';

    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('CpfCnpj').AsString     := GetCpfCNPJ;
    QryAuxiliar.ParamByName('NOME').AsString        := GetNome;
    QryAuxiliar.ParamByName('Cep').AsString         := GetCep;
    QryAuxiliar.ParamByName('Logradouro').AsString  := GetLogradouro;
    QryAuxiliar.ParamByName('Numero').AsString      := GetNumero;
    QryAuxiliar.ParamByName('Complemento').AsString := GetComplemento;
    QryAuxiliar.ParamByName('Bairro').AsString      := GetBairro;
    QryAuxiliar.ParamByName('Cidade').AsString      := GetCidade;
    QryAuxiliar.ParamByName('Ibge_cidade').AsString := GetIbge_cidade;
    QryAuxiliar.ParamByName('Sigla_uf').AsString    := GetSigla_uf;
    QryAuxiliar.ParamByName('Ibge_uf').AsString     := GetIbge_uf;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa��o
        ShowMessage('Ocorreu um erro Inesperado. (Clientes): '+E.Message);
      end;
  end;
end;

procedure TClientes.ALteraDados;
var
  strSQL: string;
begin
  try
    strSQL :='';
    frmDatamodulo.DBConect.StartTransaction;
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;

    strSQL := ' UPDATE TB_Clientes               ' +
              '   SET CpfCnpj     =:CpfCnpj,     ' +
              '       Nome        =:Nome,        ' +
              '       Cep         =:Cep,         ' +
              '       Logradouro  =:Logradouro,  ' +
              '       Numero      =:Numero,      ' +
              '       Complemento =:Complemento, ' +
              '       Bairro      =:Bairro,      ' +
              '       Cidade      =:Cidade,      ' +
              '       Ibge_cidade =:Ibge_cidade, ' +
              '       Sigla_uf    =:Sigla_uf,    ' +
              '       Ibge_uf     =:Ibge_uf      ' +
              ' WHERE Id          =:Id           ';
    QryAuxiliar.SQL.Add(strSQL);
    QryAuxiliar.ParamByName('CpfCnpj').AsString     := GetCpfCNPJ;
    QryAuxiliar.ParamByName('Nome').AsString        := GetNome;
    QryAuxiliar.ParamByName('Cep').AsString         := GetCep;
    QryAuxiliar.ParamByName('Logradouro').AsString  := GetLogradouro;
    QryAuxiliar.ParamByName('Numero').AsString      := GetNumero;
    QryAuxiliar.ParamByName('Complemento').AsString := GetComplemento;
    QryAuxiliar.ParamByName('Bairro').AsString      := GetBairro;
    QryAuxiliar.ParamByName('Cidade').AsString      := GetCidade;
    QryAuxiliar.ParamByName('Ibge_cidade').AsString := GetIbge_cidade;
    QryAuxiliar.ParamByName('Sigla_uf').AsString    := GetSigla_uf;
    QryAuxiliar.ParamByName('Ibge_uf').AsString     := GetIbge_uf;
    QryAuxiliar.ParamByName('Id').AsInteger         := GetID;

    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa��o
        ShowMessage('Ocorreu um erro Inesperado. (Clientes): '+E.Message);
      end;
  end;
end;

procedure TClientes.ExcluiDados;
begin
  try
    frmDatamodulo.DBConect.StartTransaction;
    //Agora exclui o cliente
    QryAuxiliar.Close;
    QryAuxiliar.SQL.Clear;
    QryAuxiliar.SQL.Add('DELETE FROM TB_Clientes Where Id=:Id');
    QryAuxiliar.ParamByName('Id').AsInteger := GetID;
    QryAuxiliar.ExecSQL();
    frmDatamodulo.DBConect.Commit;
  except
    on E: Exception do
      begin
        frmDatamodulo.DBConect.Rollback;  //desfaz a transa��o
        ShowMessage('Ocorreu um erro Inesperado. (Clientes): '+E.Message);
      end;
  end;
end;

procedure TClientes.PesquisaTabela(strNomeTabela, strNomepesquisa,
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

procedure TClientes.ConsultaClientesGeral(strNomeTabela: String);
begin
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * ');
  QryAuxiliar.SQL.Add('FROM ' + trim(strNomeTabela));
  QryAuxiliar.SQL.Add(' Order by Id');
  QryAuxiliar.Open;
  frmDatamodulo.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TClientes.ConsultaClientesPeloByID(ID: Integer);
begin
  frmDatamodulo.dsPesquisa.DataSet := NIL;
  QryAuxiliar.Close;
  QryAuxiliar.SQL.Clear;
  QryAuxiliar.SQL.Add('SELECT * from TB_Clientes ');
  QryAuxiliar.SQL.Add(' where ID = ' + ID.ToString);
  QryAuxiliar.Open;
  frmDatamodulo.dsPesquisa.DataSet := QryAuxiliar;
end;

procedure TClientes.SetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TClientes.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TClientes.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TClientes.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TClientes.SetCpfCnpj(const Value: string);
begin
  FCpfCnpj := Value;
end;

procedure TClientes.SetIbge_cidade(const Value: string);
begin
  FIbge_cidade := Value;
end;

procedure TClientes.SetIbge_uf(const Value: string);
begin
  FIbge_uf := Value;
end;

procedure TClientes.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TClientes.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TClientes.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TClientes.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TClientes.SetSigla_uf(const Value: string);
begin
  FSigla_uf := Value;
end;

end.
