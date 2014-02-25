unit trabajo_tareas_asignarplazos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  Buttons, trabajo_dm, db, base_form_maestro;

type

  { TTareasEstablecerPlazo }

  TTareasEstablecerPlazo = class(TFormMaestro)
    EstablecerPlazos: TBitBtn;
    BitBtn2: TBitBtn;
    dsTareasSinFinalizar: TDataSource;
    DBGrid1: TDBGrid;
    procedure EstablecerPlazosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  TareasEstablecerPlazo: TTareasEstablecerPlazo;
  dmTrabajo: TdmTrabajo;

implementation

{$R *.lfm}

{ TTareasEstablecerPlazo }

procedure TTareasEstablecerPlazo.FormCreate(Sender: TObject);
begin
  dmTrabajo:= TdmTrabajo.Create(self);
  if dsTareasSinFinalizar.DataSet.RecordCount > 0 then
  begin
    EstablecerPlazos.Enabled:=True;
    DBGrid1.Enabled:=True;
  end;
end;

procedure TTareasEstablecerPlazo.EstablecerPlazosClick(Sender: TObject);
begin
  dmTrabajo.AsignarPlazo;
end;

procedure TTareasEstablecerPlazo.FormDestroy(Sender: TObject);
begin
  dmTrabajo.Free;
end;

end.

