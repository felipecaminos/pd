unit productos_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate;

type

  { TdmProductos }

  TdmProductos = class(TDataModule)
    FloatField1: TFloatField;
    zProductos: TZQuery;
    upProductos: TZUpdateSQL;
    zProductosCANTIDAD_PASOS: TLongintField;
    zProductosCANT_PARALELO: TLongintField;
    zProductosCAT_PROD_ID: TLongintField;
    zProductosCODIGO_INTERNO: TLongintField;
    zProductosCOSTO: TFloatField;
    zProductosDATO_ADICIONAL: TStringField;
    zProductosDESCRIPCION: TStringField;
    zProductosID_PRODUCTO: TLongintField;
    zProductosTIPO_IVA_ID: TLongintField;
    zProductosMATERIALES: TStringField;
    zProductosPRECIO_FINAL: TFloatField;
    zProductosTIEMPO: TFloatField;
    zCategoria: TZReadOnlyQuery;
    zIVA: TZReadOnlyQuery;
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
  dmProductos: TdmProductos;

implementation

{$R *.lfm}

{ TdmProductos -}

procedure TdmProductos.DataModuleCreate(Sender: TObject);
begin
  Abrir;
end;

procedure TdmProductos.DataModuleDestroy(Sender: TObject);
begin
  zProductos.Cancel;
end;

procedure TdmProductos.Grabar;
begin
  try
    {trato de aplicar los cambios}
    zProductos.ApplyUpdates;
  except
    {o si hay un error cancelo}
    zProductos.Cancel;
  end;
end;

procedure TdmProductos.Borrar;
begin
  zProductos.Delete;
  zProductos.ApplyUpdates;
end;

procedure TdmProductos.Cancelar;
begin
  {cancelo los datos en memoria}
  zProductos.Cancel;
end;

procedure TdmProductos.Abrir;
begin
  {abro los datasets}
  zProductos.Open;
  zCategoria.Open;
  zIVA.Open;
end;

end.

