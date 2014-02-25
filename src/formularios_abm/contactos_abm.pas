unit contactos_abm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  Buttons, ExtCtrls, StdCtrls, XMLPropStorage, base_abm, contactos_input,
  contactos_dm, contactos_listado, db;

type

  { TContactosABM }

  TContactosABM = class(TFormBaseABM)
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    // Modulo de datos
    dmContactos: TdmContactos;
    // Formulario de ingreso de datos
    VentanaEdicion: TContactosInput;
  end;

var
  ContactosABM: TContactosABM;

implementation

{$R *.lfm}

{ TContactosABM }

procedure TContactosABM.btnBorrarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg ('Pregunta!!','¿¿¿Seguro que quiere borrar el registro???',
  mtConfirmation,[mbYes, mbNo],0) = mrYes then
     dmContactos.Borrar;
end;

procedure TContactosABM.BitBtn2Click(Sender: TObject);
var
   ListadoContactos: TListadoContactos;
begin
   ListadoContactos:= TListadoContactos.Create(self);
   ListadoContactos.ShowModal;
   ListadoContactos.Release;
end;

procedure TContactosABM.btnModificarClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TContactosInput.Create(self);
  try
  begin
     dsABM.Edit;
     if VentanaEdicion.ShowModal = mrOk then
        dmContactos.Grabar
     else
        dmContactos.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TContactosABM.btnNuevoClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TContactosInput.Create(self);
  try
  begin
     dsABM.DataSet.Append;
     if VentanaEdicion.ShowModal = mrOk then
        dmContactos.Grabar
     else
        dmContactos.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TContactosABM.FormCreate(Sender: TObject);
begin
  PanelBusqueda.Visible:= false;
  dmContactos:= TdmContactos.Create(self);
end;

procedure TContactosABM.FormDestroy(Sender: TObject);
begin
  dmContactos.Free;
end;

procedure TContactosABM.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnModificarClick(self);
end;

end.

