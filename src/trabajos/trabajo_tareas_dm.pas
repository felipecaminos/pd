unit trabajo_tareas_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate, ZSequence;

type

  { TdmTrabajosTareas }

  TdmTrabajosTareas = class(TDataModule)
    dsTrabajos: TDatasource;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    zDentistas: TZReadOnlyQuery;
    zDentistasDENTISTA: TStringField;
    zDentistasID_DENTISTA: TLongintField;
    zLaboratoristasCOMPLETO: TStringField;
    zLaboratoristasID_LABORATORISTA: TLongintField;
    zProductos: TZReadOnlyQuery;
    zLaboratoristas: TZReadOnlyQuery;
    zProductosDESCRIPCION: TStringField;
    zProductosID_PRODUCTO: TLongintField;
    zProductosPRECIO_FINAL: TFloatField;
    zTiposTareas: TZReadOnlyQuery;
    zTareasDATO_REMITO: TStringField;
    zTareasESTIMADO_SALIDA: TDateField;
    zTareasFECHA_INGRESO: TDateTimeField;
    zTareasFECHA_SALIDA: TDateTimeField;
    zTareasID_TAREA: TLongintField;
    zTareasORDEN: TSmallintField;
    zTareasTERMINADO: TStringField;
    zTareasTIPO_TAREA_ID: TLongintField;
    zTareasTRABAJO_ID: TLongintField;
    zTiposTareasDESCRIPCION: TStringField;
    zTiposTareasID_TIPO_TAREA: TLongintField;
    zTrabajos: TZQuery;
    zTareas: TZQuery;
    upTrabajos: TZUpdateSQL;
    upTareas: TZUpdateSQL;
    zTrabajosANTAGONISTA: TStringField;
    zTrabajosCOLOR: TStringField;
    zTrabajosCOMPROBANTE_ID: TLongintField;
    zTrabajosCUENTA_CORRIENTE: TStringField;
    zTrabajosDENTISTA_ID: TLongintField;
    zTrabajosFECHA_ENTRADA: TDateTimeField;
    zTrabajosFECHA_SALIDA: TDateTimeField;
    zTrabajosID_TRABAJOS: TLongintField;
    zTrabajosLABORATORISTA_ID: TLongintField;
    zTrabajosOBSERVACION: TStringField;
    zTrabajosPACIENTE: TStringField;
    zTrabajosPAGADO: TSmallintField;
    zTrabajosPRECIO: TFloatField;
    zTrabajosPRODUCTO_ID: TLongintField;
    zTrabajosPROXIMO_PLAZO: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  dmTrabajosTareas: TdmTrabajosTareas;

implementation

{$R *.lfm}

{ TdmTrabajosTareas }

procedure TdmTrabajosTareas.DataModuleCreate(Sender: TObject);
begin
  zTrabajos.Open;
  zTareas.Open;
end;

end.

