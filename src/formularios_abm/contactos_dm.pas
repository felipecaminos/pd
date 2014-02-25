unit contactos_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate;

type

  { TdmContactos }

  TdmContactos = class(TDataModule)
    StringField1: TStringField;
    zCiudadesCOMPLETO: TStringField;
    zCiudadesDEPARTAMENTO: TStringField;
    zCiudadesID_LOCALIDAD: TLongintField;
    zCiudadesLOCALIDAD: TStringField;
    zCiudadesPROVINCIA: TStringField;
    zContactos: TZQuery;
    upContactos: TZUpdateSQL;
    zContactosAPELLIDO: TStringField;
    zContactosCP: TStringField;
    zContactosCUIT: TStringField;
    zContactosDIRECCION: TStringField;
    zContactosDIRECCION2: TStringField;
    zContactosEMAIL: TStringField;
    zContactosFECHA_BAJA: TDateField;
    zContactosID_CONTACTOS: TLongintField;
    zContactosLOCALIDAD_ID: TLongintField;
    zContactosMOVIL: TStringField;
    zContactosMOVIL2: TStringField;
    zContactosNOMBRE: TStringField;
    zContactosTELEFONO: TStringField;
    zContactosTELEFONO2: TStringField;
    zContactosWEB: TStringField;
    zCiudades: TZReadOnlyQuery;
    zUnificados: TZTable;
    zUnificadosAPELLIDO: TStringField;
    zUnificadosCP: TStringField;
    zUnificadosDIRECCION: TStringField;
    zUnificadosDIRECCION2: TStringField;
    zUnificadosEMAIL: TStringField;
    zUnificadosID_AGENDA: TLongintField;
    zUnificadosLOCALIDAD_ID: TLongintField;
    zUnificadosMOVIL: TStringField;
    zUnificadosNOMBRE: TStringField;
    zUnificadosTELEFONO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure Grabar;
    procedure Borrar;
    procedure Cancelar;
    procedure Abrir;
  end;

var
  dmContactos: TdmContactos;

implementation

{$R *.lfm}

{ TdmContactos }

procedure TdmContactos.DataModuleCreate(Sender: TObject);
begin
  Abrir;
end;

procedure TdmContactos.DataModuleDestroy(Sender: TObject);
begin
  zContactos.Cancel;
end;

procedure TdmContactos.Grabar;
begin
  try
    {trato de aplicar los cambios}
    zContactos.ApplyUpdates;
  except
    {o si hay un error cancelo}
    zContactos.Cancel;
  end;
end;

procedure TdmContactos.Borrar;
begin
  zContactos.Delete;
  zContactos.ApplyUpdates;
end;

procedure TdmContactos.Cancelar;
begin
  {cancelo los datos en memoria}
  zContactos.Cancel;
end;

procedure TdmContactos.Abrir;
begin
  {abro los datasets}
  zContactos.Open;
  zCiudades.Open;
  zUnificados.Open;
end;

end.

