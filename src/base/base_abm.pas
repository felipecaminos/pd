unit base_abm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ButtonPanel, Buttons, StdCtrls, ExtCtrls, XMLPropStorage, DBGrids, base_form_maestro;

type

  { TFormBaseABM }

  TFormBaseABM = class(TFormMaestro)
    BitBtn1: TBitBtn;
    btnNuevo: TBitBtn;
    btnBorrar: TBitBtn;
    btnModificar: TBitBtn;
    dsABM: TDatasource;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PanelBusqueda: TPanel;
    RxDBGrid1: TRxDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Configuracion: TXMLPropStorage;
    procedure btnModificarClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormBaseABM: TFormBaseABM;

implementation

{$R *.lfm}

{ TFormBaseABM }

procedure TFormBaseABM.RxDBGrid1DblClick(Sender: TObject);
begin
  btnModificarClick(self);
end;

procedure TFormBaseABM.btnModificarClick(Sender: TObject);
begin

end;

end.

