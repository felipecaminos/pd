unit productos_abm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, base_abm,
  productos_dm, productos_input;

type

  { TProductosABM }

  TProductosABM = class(TFormBaseABM)
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
  end;

var
  ProductosABM: TProductosABM;
  // Modulo de datos
  dmProductos: TdmProductos;
  // Formulario de ingreso de datos
  VentanaEdicion: TProductosInput;

implementation

{$R *.lfm}

{ TProductosABM }

procedure TProductosABM.btnBorrarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg ('Pregunta!!','¿¿¿Seguro que quiere borrar el registro???',
  mtConfirmation,[mbYes, mbNo],0) = mrYes then
     dmProductos.Borrar;
end;

procedure TProductosABM.btnModificarClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TProductosInput.Create(self);
  try
  begin
     dsABM.Edit;
     if VentanaEdicion.ShowModal = mrOk then
        dmProductos.Grabar
     else
        dmProductos.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TProductosABM.btnNuevoClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TProductosInput.Create(self);
  try
  begin
     dsABM.DataSet.Append;
     if VentanaEdicion.ShowModal = mrOk then
        dmProductos.Grabar
     else
        dmProductos.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TProductosABM.FormCreate(Sender: TObject);
begin
  PanelBusqueda.Visible:= false;
  dmProductos:= TdmProductos.Create(self);
end;

procedure TProductosABM.FormDestroy(Sender: TObject);
begin
  dmProductos.Free;
end;

procedure TProductosABM.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnModificarClick(self);
end;

end.

