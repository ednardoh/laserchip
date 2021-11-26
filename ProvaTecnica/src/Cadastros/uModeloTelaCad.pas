unit uModeloTelaCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmModeloTelaCad = class(TForm)
    pn_Client_Cad: TPanel;
    pn_Left_Cad: TPanel;
    ds_Cadastro: TDataSource;
    TB_Cadastro: TClientDataSet;
    Dbn_Cad: TDBNavigator;
    Btn_Retornar: TSpeedButton;
    btn_CadOk: TSpeedButton;
    btn_Sair: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModeloTelaCad: TfrmModeloTelaCad;

implementation

{$R *.dfm}

procedure TfrmModeloTelaCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
     Perform(WM_nextdlgctl,0,0)
  else if Key=vk_escape then
     Perform(WM_nextdlgctl,1,0);
end;

end.
