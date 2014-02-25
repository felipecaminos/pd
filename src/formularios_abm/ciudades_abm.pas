unit ciudades_abm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  Buttons, ExtCtrls, db, base_abm, ciudades_dm,
  ciudades_input;

type

  { TCiudadesABM }

  TCiudadesABM = class(TFormBaseABM)
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure btnBorrarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CiudadesABM: TCiudadesABM;
  dmCiudades: TdmCiudades;
  // este es el formulario donde se ingrean los datos
  VentanaEdicion: TCiudadesInput;

implementation

{$R *.lfm}

{ TCiudadesABM }

procedure TCiudadesABM.btnBorrarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg ('Pregunta!!','Seguro que quiere borrar el registro?',
     mtConfirmation,[mbYes, mbNo],0) = mrYes then
          dmCiudades.Borrar;
end;

procedure TCiudadesABM.btnModificarClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TCiudadesInput.Create(self);
  try
  begin
     dsABM.Edit;
     if VentanaEdicion.ShowModal = mrOk then
     begin
        dmCiudades.Grabar;
     end
     else
        dmCiudades.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TCiudadesABM.btnNuevoClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TCiudadesInput.Create(self);
  try
  begin
     dsABM.DataSet.Append;
     if VentanaEdicion.ShowModal = mrOk then
        begin
          dmCiudades.Grabar;
        end
     else
        dmCiudades.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TCiudadesABM.FormCreate(Sender: TObject);
begin
  PanelBusqueda.Visible:= false;
  dmCiudades:= TdmCiudades.Create(self);
end;

procedure TCiudadesABM.FormDestroy(Sender: TObject);
begin
  dmCiudades.Free;
end;

procedure TCiudadesABM.SpeedButton3Click(Sender: TObject);
begin
  dsABM.DataSet.First;
end;

procedure TCiudadesABM.SpeedButton4Click(Sender: TObject);
begin
  dsABM.DataSet.Last;
end;

end.

