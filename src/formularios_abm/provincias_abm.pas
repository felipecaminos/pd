unit provincias_abm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, base_abm,
  provincias_dm, provincias_input, rxdbgrid, db;

type

  { TProvinciasABM }

  TProvinciasABM = class(TFormBaseABM)
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
    // este es el formulario donde se ingrean los datos
    VentanaEdicion: TProvinciasInput;
  end;

var
  ProvinciasABM: TProvinciasABM;
  dmProvincias: TdmProvincias;

implementation

{$R *.lfm}

{ TProvinciasABM }

procedure TProvinciasABM.btnBorrarClick(Sender: TObject);
begin
  if MessageDlg ('Pregunta!!','Seguro que quiere borrar el registro?',
     mtConfirmation,[mbYes, mbNo],0) = mrYes then
        dmProvincias.Borrar;
end;

procedure TProvinciasABM.btnModificarClick(Sender: TObject);
begin
  VentanaEdicion:= TProvinciasInput.Create(self);
  try
  begin
     dsABM.DataSet.Edit;
     if VentanaEdicion.ShowModal = mrOk then
     begin
        dsABM.DataSet.Post;
        dmProvincias.Grabar;
     end
     else
        dmProvincias.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TProvinciasABM.btnNuevoClick(Sender: TObject);
begin
  VentanaEdicion:= TProvinciasInput.Create(self);
  try
     dsABM.DataSet.Append;
     if VentanaEdicion.ShowModal = mrOk then
        dmProvincias.Grabar
     else
         dmProvincias.Cancelar;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TProvinciasABM.FormCreate(Sender: TObject);
begin
  dmProvincias:= TdmProvincias.Create(self);
end;

procedure TProvinciasABM.FormDestroy(Sender: TObject);
begin
  dmProvincias.Free;
end;

procedure TProvinciasABM.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnModificarClick(self);
end;

end.

