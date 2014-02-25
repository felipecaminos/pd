unit categoriaproductos_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, conexion_dm, db, ZDataset, ZSqlUpdate;

type

  { TdmCategoriaProductos }

  TdmCategoriaProductos = class(TDataModule)
    zCategoriaProductos: TZQuery;
    upCategoriaProductos: TZUpdateSQL;
    zCategoriaProductosDESCRIPCION: TStringField;
    zCategoriaProductosID_CAT_PROD: TLongintField;
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
  dmCategoriaProductos: TdmCategoriaProductos;

implementation

{$R *.lfm}

{ TdmCategoriaProductos }

procedure TdmCategoriaProductos.DataModuleCreate(Sender: TObject);
begin
  Abrir;
end;

procedure TdmCategoriaProductos.DataModuleDestroy(Sender: TObject);
begin
  zCategoriaProductos.Cancel;
end;

procedure TdmCategoriaProductos.Grabar;
begin
  try
    {trato de aplicar los cambios}
    zCategoriaProductos.ApplyUpdates;
  except
    {o si hay un error cancelo}
    zCategoriaProductos.Cancel;
  end;
end;

procedure TdmCategoriaProductos.Borrar;
begin
  zCategoriaProductos.Delete;
  zCategoriaProductos.ApplyUpdates;
end;

procedure TdmCategoriaProductos.Cancelar;
begin
  {cancelo los datos en memoria}
  zCategoriaProductos.Cancel;
end;

procedure TdmCategoriaProductos.Abrir;
begin
  {abro los datasets}
  zCategoriaProductos.Open;
end;

end.

