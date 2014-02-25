unit dentistas_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, ZDataset, ZSqlUpdate, db,
  conexion_dm;

type

  { TdmDentistas }

  TdmDentistas = class(TDataModule)
    StringField1: TStringField;
    StringField2: TStringField;
    zCiudadesCOMPLETO: TStringField;
    zCiudadesDEPARTAMENTO: TStringField;
    zCiudadesID_LOCALIDAD: TLongintField;
    zCiudadesLOCALIDAD: TStringField;
    zCiudadesPROVINCIA: TStringField;
    zDentistasAPELLIDO: TStringField;
    zDentistasCLINICA: TStringField;
    zDentistasCP: TStringField;
    zDentistasCREDITO_MAX: TFloatField;
    zDentistasCUIT: TStringField;
    zDentistasDIRECCION: TStringField;
    zDentistasDIRECCION2: TStringField;
    zDentistasDNI: TStringField;
    zDentistasEMAIL: TStringField;
    zDentistasFECHA_BAJA: TDateField;
    zDentistasID_DENTISTA: TLongintField;
    zDentistasLOCALIDAD_ID: TLongintField;
    zDentistasMOVIL: TStringField;
    zDentistasNOMBRE: TStringField;
    zDentistasPORCENTAJE: TFloatField;
    zDentistasTELEFONO: TStringField;
    zDentistasTIPOIVA_ID: TLongintField;
    zTipoIvaID_TIPO: TLongintField;
    zDentistas: TZQuery;
    zCiudades: TZReadOnlyQuery;
    zTipoIva: TZReadOnlyQuery;
    upDentistas: TZUpdateSQL;
    zTipoIvaNOMBRE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { private declarations }
  public
    procedure Grabar;
    procedure Borrar;
    procedure Cancelar;
    procedure Abrir;
    { public declarations }
  end;

var
  dmDentistas: TdmDentistas;

implementation

{$R *.lfm}

{ TdmDentistas }

procedure TdmDentistas.DataModuleCreate(Sender: TObject);
begin
  Abrir;
end;

procedure TdmDentistas.DataModuleDestroy(Sender: TObject);
begin
  {cancela los datos que no se han grabado}
  zDentistas.Cancel;
end;

procedure TdmDentistas.Grabar;
begin
  try
    {trato de aplicar los cambios}
    zDentistas.ApplyUpdates;
  except
    {o si hay un error cancelo}
    zDentistas.Cancel;
  end;
end;

procedure TdmDentistas.Borrar;
begin
  zDentistas.Delete;
  zDentistas.ApplyUpdates;
end;

procedure TdmDentistas.Cancelar;
begin
  {cancelo los datos en memoria}
  zDentistas.Cancel;
end;

procedure TdmDentistas.Abrir;
begin
  {abro los datasets}
  zCiudades.Open;
  zTipoIva.Open;
  zDentistas.Open;
end;

end.

