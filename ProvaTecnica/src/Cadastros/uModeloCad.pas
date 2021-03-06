unit uModeloCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient;

type
  TfrmModeloCad = class(TForm)
    pn_Client_Cad: TPanel;
    pn_Left_Cad: TPanel;
    Img_CadList: TImageList;
    btn_Filtrar: TSpeedButton;
    btn_Todos: TSpeedButton;
    btn_Incluir: TSpeedButton;
    btn_Alterar: TSpeedButton;
    btn_Excluir: TSpeedButton;
    btn_Consultar: TSpeedButton;
    btn_Sair: TSpeedButton;
    TB_Consulta: TClientDataSet;
    ds_Consulta: TDataSource;
    DBG_Cad: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModeloCad: TfrmModeloCad;

implementation

{$R *.dfm}

end.
