unit iva_abm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  Buttons, ExtCtrls, StdCtrls, XMLPropStorage, DBGrids, ActnList, ComCtrls,
  PopupNotifier, base_abm, iva_dm, iva_input, db;

type

  { TIVAABM }

  TIVAABM = class(TFormBaseABM)
    procedure btnBorrarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RxDBGrid1Enter(Sender: TObject);
    procedure RxDBGrid2Enter(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    // Modulo de datos
    dmIVA: TdmIVA;
    // Formulario de ingreso de datos
    VentanaEdicion: TIVAInput;
  end;

var
  IVAABM: TIVAABM;

implementation

{$R *.lfm}

{ TIVAABM }

procedure TIVAABM.FormCreate(Sender: TObject);
begin
  PanelBusqueda.Visible:= false;
  dmIVA:= TdmIVA.Create(self);
end;

procedure TIVAABM.btnNuevoClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TIVAInput.Create(self);
  try
  begin
     dsABM.DataSet.Append;
     if VentanaEdicion.ShowModal = mrOk then
        dmIVA.Grabar
     else
        dmIVA.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TIVAABM.btnModificarClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TIVAInput.Create(self);
  try
  begin
     dsABM.Edit;
     if VentanaEdicion.ShowModal = mrOk then
        dmIVA.Grabar
     else
        dmIVA.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TIVAABM.btnBorrarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg ('Pregunta!!','¿¿¿Seguro que quiere borrar el registro???',
  mtConfirmation,[mbYes, mbNo],0) = mrYes then
     dmIVA.Borrar;
end;

procedure TIVAABM.FormDestroy(Sender: TObject);
begin
  dmIVA.Free;
end;

procedure TIVAABM.RxDBGrid1Enter(Sender: TObject);
begin
end;

procedure TIVAABM.RxDBGrid2Enter(Sender: TObject);
begin
end;

end.

