unit agenda_seleccion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, Buttons, agenda_dm, agenda_fecha_input, agenda_tarea_input, db, base_form_maestro;

type

  { TAgenda }

  TAgenda = class(TFormMaestro)
    BitBtn1: TBitBtn;
    CambiarPlazo: TBitBtn;
    AgregarTarea: TBitBtn;
    dsAgenda: TDatasource;
    DBGrid1: TDBGrid;
    procedure CambiarPlazoClick(Sender: TObject);
    procedure AgregarTareaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure Comprobaciones;
  end;

var
  Agenda: TAgenda;
  dmAgenda: TdmAgenda;

implementation

{$R *.lfm}

{ TAgenda }

procedure TAgenda.FormCreate(Sender: TObject);
begin
  dmAgenda:= TdmAgenda.Create(self);
  Comprobaciones;
end;

procedure TAgenda.CambiarPlazoClick(Sender: TObject);
var
  VentanaFecha: TAgendaInputFecha;
begin
  VentanaFecha:=TAgendaInputFecha.Create(self);
  dsAgenda.Edit;
  if VentanaFecha.ShowModal = mrOk then
     dmAgenda.GrabarAgenda
  else
     dmAgenda.CancelarAgenda;
  VentanaFecha.Release;
  Comprobaciones;
end;

procedure TAgenda.AgregarTareaClick(Sender: TObject);
var
   VentanaTarea: TAgendaInputTarea;
begin
  dmAgenda.AbrirAdelante;
  VentanaTarea:= TAgendaInputTarea.Create(self);
  if VentanaTarea.ShowModal = mrOk then
     begin
     dmAgenda.AgregarAdelante;
     ShowMessage('Agregado Correctamente');
     dsAgenda.DataSet.Refresh;
     end
  else
     dmAgenda.CancelarAgregadoAgenda;
  VentanaTarea.Release;
  dmAgenda.CerrarAdelante;
  Comprobaciones;
end;

procedure TAgenda.FormDestroy(Sender: TObject);
begin
  dmAgenda.Free;
end;

procedure TAgenda.Comprobaciones;
begin
  if dsAgenda.DataSet.RecordCount > 0 then
  begin
    CambiarPlazo.Enabled := True;
    AgregarTarea.Enabled := True;
    DBGrid1.Enabled := True;
  end;
end;

end.

