unit dentistas_abm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, base_abm,
  dentistas_dm, dentistas_input;

type

  { TDentistasABM }

  TDentistasABM = class(TFormBaseABM)
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
  DentistasABM: TDentistasABM;
  // Modulo de datos
  dmDentistas: TdmDentistas;
  // Formulario de ingreso de datos
  VentanaEdicion: TDentistasInput;

implementation

{$R *.lfm}

{ TDentistasABM }

procedure TDentistasABM.btnBorrarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg ('Pregunta!!','¿¿¿Seguro que quiere borrar el registro???',
  mtConfirmation,[mbYes, mbNo],0) = mrYes then
     dmDentistas.Borrar;
end;

procedure TDentistasABM.btnModificarClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TDentistasInput.Create(self);
  try
  begin
     dsABM.Edit;
     if VentanaEdicion.ShowModal = mrOk then
        dmDentistas.Grabar
     else
        dmDentistas.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TDentistasABM.btnNuevoClick(Sender: TObject);
begin
  inherited;
  VentanaEdicion:= TDentistasInput.Create(self);
  try
  begin
     dsABM.DataSet.Append;
     if VentanaEdicion.ShowModal = mrOk then
        dmDentistas.Grabar
     else
        dmDentistas.Cancelar;
  end;
  finally
     VentanaEdicion.Release;
  end;
end;

procedure TDentistasABM.FormCreate(Sender: TObject);
begin
  PanelBusqueda.Visible:= false;
  dmDentistas:= TdmDentistas.Create(self);
end;

procedure TDentistasABM.FormDestroy(Sender: TObject);
begin
  dmDentistas.Free;
end;

procedure TDentistasABM.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnModificarClick(self);
end;

end.

