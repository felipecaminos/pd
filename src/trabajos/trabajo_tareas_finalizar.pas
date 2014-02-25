unit trabajo_tareas_finalizar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, base_form_maestro, Controls, Graphics,
  Dialogs, DBGrids, Buttons, trabajo_dm;

type

  { TTareaFinalizar }

  TTareaFinalizar = class(TFormMaestro)
    FinalizarTarea: TBitBtn;
    BitBtn2: TBitBtn;
    EstablecerPlazos: TBitBtn;
    Datasource1: TDatasource;
    DBGrid2: TDBGrid;
    dsTareasSinFinalizar: TDatasource;
    DBGrid1: TDBGrid;
    procedure FinalizarTareaClick(Sender: TObject);
    procedure EstablecerPlazosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  TareaFinalizar: TTareaFinalizar;
  dmTrabajo: TdmTrabajo;

implementation

{$R *.lfm}

{ TTareaFinalizar }

procedure TTareaFinalizar.FormCreate(Sender: TObject);
begin
  dmTrabajo:= TdmTrabajo.Create(self);
  if dsTareasSinFinalizar.DataSet.RecordCount > 0 then
  begin
    FinalizarTarea.Enabled:=True;
    EstablecerPlazos.Enabled:=True;
    DBGrid1.Enabled:=True;
  end;
end;

procedure TTareaFinalizar.FinalizarTareaClick(Sender: TObject);
begin
  {se cierra una tarea con el campo terminado en S}
  dmTrabajo.FinalizarTarea;
  // CERRAMOS ??
end;

procedure TTareaFinalizar.EstablecerPlazosClick(Sender: TObject);
begin
  dmTrabajo.AsignarPlazo;
end;

procedure TTareaFinalizar.FormDestroy(Sender: TObject);
begin
  dmTrabajo.Free;
end;

end.

