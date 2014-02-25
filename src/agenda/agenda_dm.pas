unit agenda_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, PopupNotifier, Dialogs, conexion_dm, db,
  ZDataset, ZSqlUpdate;

type

  { TdmAgenda }

  TdmAgenda = class(TDataModule)
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    zTareasAtrasHoyTIPO_TAREA_ID: TLongintField;
    zTiposTareasBusquedaDESCRIPCION: TStringField;
    zTiposTareasBusquedaID_TIPO_TAREA: TLongintField;
    zTiposTareasBusquedaTIEMPO_ESTIMADO: TFloatField;
    zTiposTareasBusquedaTIENE_FECHA_SALIDA: TStringField;
    zTrabajosBusqueda: TZTable;
    zTareasAdelanteTIPO_TAREA_ID: TLongintField;
    zTiposTareasBusqueda: TZTable;
    zTareasAdelante: TZQuery;
    zTareasAdelanteDATO_REMITO: TStringField;
    zTareasAdelanteESTIMADO_SALIDA: TDateField;
    zTareasAdelanteFECHA_INGRESO: TDateTimeField;
    zTareasAdelanteID_TAREA: TLongintField;
    zTareasAdelanteORDEN: TSmallintField;
    zTareasAdelanteTERMINADO: TStringField;
    zTareasAdelanteTRABAJO_ID: TLongintField;
    zTareasAtrasHoy: TZQuery;
    zTareasAtrasHoyDATO_REMITO: TStringField;
    zTareasAtrasHoyESTIMADO_SALIDA: TDateField;
    zTareasAtrasHoyFECHA_INGRESO: TDateTimeField;
    zTareasAtrasHoyID_TAREA: TLongintField;
    zTareasAtrasHoyORDEN: TSmallintField;
    zTareasAtrasHoyTERMINADO: TStringField;
    zTareasAtrasHoyTRABAJO_ID: TLongintField;
    zTareasHoyAtrasDATO_REMITO: TStringField;
    zTareasHoyAtrasDESCRIPCION: TStringField;
    zTareasHoyAtrasESTIMADO_SALIDA: TDateField;
    zTareasHoyAtrasFECHA_INGRESO: TDateTimeField;
    zTareasHoyAtrasID_TAREA: TLongintField;
    zTareasHoyAtrasOBSERVACION_DENTISTA: TStringField;
    zTareasHoyAtrasORDEN: TSmallintField;
    zTareasHoyAtrasTERMINADO: TStringField;
    zTareasHoyAtrasTRABAJO_ID: TLongintField;
    upTareasAtrasHoy: TZUpdateSQL;
    upTareasAdelante: TZUpdateSQL;
    zTrabajosBusquedaDENTISTA: TStringField;
    zTrabajosBusquedaDENTISTA_ID: TLongintField;
    zTrabajosBusquedaFECHA_ENTRADA: TDateTimeField;
    zTrabajosBusquedaID_TRABAJOS: TLongintField;
    zTrabajosBusquedaPACIENTE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure GrabarAgenda;
    procedure CancelarAgenda;
    procedure GrabarAgregadoAgenda;
    procedure CancelarAgregadoAgenda;
    procedure AbrirAdelante;
    procedure CerrarAdelante;
    procedure AgregarAdelante;
  end;

var
  dmAgenda: TdmAgenda;

implementation

{$R *.lfm}

{ TdmAgenda }

procedure TdmAgenda.DataModuleCreate(Sender: TObject);
begin
  zTareasAtrasHoy.Open;
end;

procedure TdmAgenda.GrabarAgenda;
begin
  zTareasAtrasHoy.ApplyUpdates;
  zTareasAtrasHoy.Refresh;
end;

procedure TdmAgenda.CancelarAgenda;
begin
  zTareasAtrasHoy.Cancel;
end;

procedure TdmAgenda.GrabarAgregadoAgenda;
begin
  zTareasAdelante.ApplyUpdates;
end;

procedure TdmAgenda.CancelarAgregadoAgenda;
begin
  zTareasAdelante.Cancel;
end;

procedure TdmAgenda.AbrirAdelante;
begin
  zTareasAdelante.Open;
end;

procedure TdmAgenda.CerrarAdelante;
begin
  zTareasAdelante.Close;
end;

procedure TdmAgenda.AgregarAdelante;
begin
  zTareasAdelante.Edit;
  zTareasAdelanteESTIMADO_SALIDA.AsDateTime:=Date;
  GrabarAgregadoAgenda;
end;

end.

