unit categoriaproductos_abm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, base_abm,
  categoriaproductos_dm, categoriaproductos_input;

type

  { TCatProductosABM }

  TCatProductosABM = class(TFormBaseABM)
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
    dmCategoriaProductos: TdmCategoriaProductos;
    // Formulario de ingreso de datos
    VentanaEdicion: TCatProductosInput;

  end;

var
  CatProductosABM: TCatProductosABM;

implementation

{$R *.lfm}

{ TCatProductosABM }

procedure TCatProductosABM.btnBorrarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg ('Pregunta!!','¿¿¿Seguro que quiere borrar el registro???',
  mtConfirmation,[mbYes, mbNo],0) = mrYes then
     dmCategoriaProductos.Borrar;
end;

procedure TCatProductosABM.btnModificarClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TCatProductosInput.Create(self);
  try
  begin
     dsABM.Edit;
     if VentanaEdicion.ShowModal = mrOk then
        dmCategoriaProductos.Grabar
     else
        dmCategoriaProductos.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TCatProductosABM.btnNuevoClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TCatProductosInput.Create(self);
  try
  begin
     dsABM.DataSet.Append;
     if VentanaEdicion.ShowModal = mrOk then
        dmCategoriaProductos.Grabar
     else
        dmCategoriaProductos.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TCatProductosABM.FormCreate(Sender: TObject);
begin
  PanelBusqueda.Visible:= false;
  dmCategoriaProductos:= TdmCategoriaProductos.Create(self);
end;

procedure TCatProductosABM.FormDestroy(Sender: TObject);
begin
  dmCategoriaProductos.Free;
end;

procedure TCatProductosABM.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnModificarClick(self);
end;

end.

