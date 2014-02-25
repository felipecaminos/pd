unit iva_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate;

type

  { TdmIVA }

  TdmIVA = class(TDataModule)
    zCantidadesIVAID_CANT_IVA: TLongintField;
    zCantidadesIVAPORCENTAJE: TFloatField;
    zTiposIVA: TZQuery;
    upTiposIVA: TZUpdateSQL;
    zTiposIVADESCRIPCION: TStringField;
    zTiposIVAID_TIPO: TLongintField;
    zTiposIVAPORCENTAJE: TFloatField;
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
  dmIVA: TdmIVA;

implementation

{$R *.lfm}

{ TdmIVA }

procedure TdmIVA.DataModuleCreate(Sender: TObject);
begin
  Abrir;
end;

procedure TdmIVA.DataModuleDestroy(Sender: TObject);
begin
  zTiposIVA.Cancel;
end;

procedure TdmIVA.Grabar;
begin
  try
    {trato de aplicar los cambios}
    zTiposIVA.ApplyUpdates;
  except
    {o si hay un error cancelo}
    zTiposIVA.Cancel;
  end;
end;

procedure TdmIVA.Borrar;
begin
  zTiposIVA.Delete;
  zTiposIVA.ApplyUpdates;
end;

procedure TdmIVA.Cancelar;
begin
  {cancelo los datos en memoria}
  zTiposIVA.Cancel;
end;

procedure TdmIVA.Abrir;
begin
  {abro los datasets}
  zTiposIVA.Open;
end;

end.

