unit trabajo_finalizar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, FileUtil, Forms, base_form_maestro, Controls, Graphics, Dialogs, DBGrids,
  Buttons, trabajo_dm, trabajo_finalizar_input;

type

  { TTrabajoFinalizar }

  TTrabajoFinalizar = class(TFormMaestro)
    CuentaCorriente: TBitBtn;
    Facturar: TBitBtn;
    BitBtn2: TBitBtn;
    dsTrabajos: TDataSource;
    DBGrid1: TDBGrid;
    procedure CuentaCorrienteClick(Sender: TObject);
    procedure FacturarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure Comprobaciones;
  end;

var
  TrabajoFinalizar: TTrabajoFinalizar;
  dmTrabajo: TdmTrabajo;

implementation

{$R *.lfm}

{ TTrabajoFinalizar }

procedure TTrabajoFinalizar.FormCreate(Sender: TObject);
begin
  dmTrabajo := TdmTrabajo.Create(self);
  Comprobaciones;
end;

procedure TTrabajoFinalizar.FacturarClick(Sender: TObject);
begin
  dmTrabajo.FinalizarTrabajoFacturacion;
  dsTrabajos.DataSet.Refresh;
  Comprobaciones;
end;

procedure TTrabajoFinalizar.CuentaCorrienteClick(Sender: TObject);
begin
  // se graban todos los datos, se generan comprobantes y se pasa a cuenta corriente si corresponde
  dmTrabajo.FinalizarTrabajoCuentaCorriente;
  dsTrabajos.DataSet.Refresh;
  Comprobaciones;
end;

procedure TTrabajoFinalizar.FormDestroy(Sender: TObject);
begin
  dmTrabajo.Free;
end;

procedure TTrabajoFinalizar.Comprobaciones;
begin
  if dsTrabajos.DataSet.RecordCount > 0 then
  begin
    CuentaCorriente.Enabled := True;
    Facturar.Enabled := True;
    DBGrid1.Enabled := True;
  end;
end;

end.
