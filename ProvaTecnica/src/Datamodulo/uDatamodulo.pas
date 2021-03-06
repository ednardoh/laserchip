unit uDatamodulo;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Vcl.Forms, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  FireDAC.Comp.UI;

type
  TfrmDatamodulo = class(TDataModule)
    dsPesquisa: TDataSource;
    dsClientes: TDataSource;
    dsCategoria: TDataSource;
    DBConect: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    QryAux: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    TB_Categoria: TFDQuery;
    TB_Prduto: TFDQuery;
    dsProdutoPLS: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    LValCodigo,
    LValNome  : string;
    LValPrcProd,
    LValDesconto : Double;
    function CharEspeciais(Texto:String):String;
    function ChecaCpf(CPF_Text: String): Boolean;
    function ChecaCnpj(xCNPJ: String) : Boolean;
  end;

var
  frmDatamodulo: TfrmDatamodulo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TfrmDatamodulo.CharEspeciais(Texto: String): String;
var
  i,t:integer;
begin
  t:=length(texto);
  i:=1;
  While i <= t do
  begin
   if texto[i] in ['0'..'9','a'..'z','A'..'Z',#32] Then
     result:=result+Texto[i];
   i:=i+1;
  end;
end;

function TfrmDatamodulo.ChecaCnpj(xCNPJ: String): Boolean;
var
  d1,d4,xx,nCount,Fator,Resto,Digito1,Digito2 : Integer;
  Check : String;
begin
  try
    d1 := 0;
    d4 := 0;
    xx := 1;
    for nCount := 1 to Length(xCNPJ) - 2 do
    begin
      if Pos (Copy (xCNPJ, nCount, 1), '/-.') = 0 then
      begin
        if xx < 5 then
          Fator := 6 - xx
        else
          Fator := 14 - xx;

        d1 := d1 + StrToInt (Copy (xCNPJ, nCount, 1)) * Fator;

        if xx < 6 then
          Fator := 7 - xx
        else
          Fator := 15 - xx;

        d4 := d4 + StrToInt (Copy (xCNPJ, nCount, 1)) * Fator;
        xx := xx + 1;
      end;
    end;

    Resto := (d1 mod 11);
    if resto < 2 then
      Digito1 := 0
    else
      Digito1 := 11 - Resto;

    d4 := d4 + 2 * Digito1;
    resto := (d4 mod 11);

    if Resto < 2 then
      Digito2 := 0
    else
      Digito2 := 11 - Resto;

    Check := IntToStr(Digito1) + IntToStr(Digito2);

    if Check <> Copy(xCNPJ, Succ(Length (xCNPJ) - 2), 2) then
      Result := False
    else
      Result := True;
  except
    Result := False;
  end;
end;

function TfrmDatamodulo.ChecaCpf(CPF_Text: String): Boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9: Integer;
  d1,d2: Integer;
  Digitado, Calculado: String;
begin
  try
    n1 := StrToInt (CPF_Text[1]);
    n2 := StrToInt (CPF_Text[2]);
    n3 := StrToInt (CPF_Text[3]);
    n4 := StrToInt (CPF_Text[5]);
    n5 := StrToInt (CPF_Text[6]);
    n6 := StrToInt (CPF_Text[7]);
    n7 := StrToInt (CPF_Text[9]);
    n8 := StrToInt (CPF_Text[10]);
    n9 := StrToInt (CPF_Text[11]);

    d1 := n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
    d1 := 11 - (d1 mod 11);
    if d1 = 10 then d1 := 0;

    d2 := d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
    d2 := 11 - (d2 mod 11);
    if d2 = 10 then d2 := 0;

    Calculado := IntToStr (d1) + IntToStr (d2);
    Digitado := CPF_Text[13] + CPF_Text[14];

    if Calculado = Digitado then
      Result := True
    else
      Result := False;
  except
    Result := False;
  end;
end;

end.
