unit trabajo_tareas_despacho;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  DBGrids, Menus, trabajo_dm, base_form_maestro;

type

  { TTareasDespacho }

  TTareasDespacho = class(TFormMaestro)
    BitBtn1: TBitBtn;
    Despachar: TBitBtn;
    dsDespacho: TDataSource;
    DBGrid1: TDBGrid;
    procedure DespacharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  TareasDespacho: TTareasDespacho;
  dmTrabajo: TdmTrabajo;

implementation

{$R *.lfm}

{ TTareasDespacho }

procedure TTareasDespacho.FormCreate(Sender: TObject);
begin
  dmTrabajo:= TdmTrabajo.Create(self);
  if dsDespacho.DataSet.RecordCount > 0 then
  begin
    Despachar.Enabled:=True;
    DBGrid1.Enabled:=True;
  end;
end;

procedure TTareasDespacho.DespacharClick(Sender: TObject);
begin
  dmTrabajo.EditarRemitoGuia;
end;

procedure TTareasDespacho.FormDestroy(Sender: TObject);
begin
  dmTrabajo.Free;
end;

end.

