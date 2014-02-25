unit ciudades_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, ZDataset, ZSqlUpdate,
  conexion_dm;

type

  { TdmCiudades }

  TdmCiudades = class(TDataModule)
    busProvinciasID_PROVINCIA: TLongintField;
    busProvinciasNOMBRE: TStringField;
    dsProvincias: TDatasource;
    sqlCiudadesDEPARTAMENTO_ID: TLongintField;
    sqlCiudadesFECHA_BAJA: TDateField;
    sqlCiudadesID_CIUDAD: TLongintField;
    sqlCiudadesNOMBRE: TStringField;
    sqlDepartamentosID_DEPARTAMENTO: TLongintField;
    sqlDepartamentosID_PROVINCIA: TLongintField;
    sqlDepartamentosNOMBRE: TStringField;
    sqlDepartamentosNOMBRE_1: TStringField;
    sqlDepartamentosPROVINCIA_ID: TLongintField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    zCiudades: TZQuery;
    upCiudades: TZUpdateSQL;
    zCiudadesDEPARTAMENTO_ID: TLongintField;
    zCiudadesFECHA_BAJA: TDateField;
    zCiudadesID_CIUDAD: TLongintField;
    zCiudadesNOMBRE: TStringField;
    zDepartamentosID_DEPARTAMENTO: TLongintField;
    zDepartamentosNOMBRE: TStringField;
    zDepartamentosPROVINCIA_ID: TLongintField;
    zDepProvID_DEPARTAMENTO: TLongintField;
    zDepProvID_PROVINCIA: TLongintField;
    zDepProvNOMBRE: TStringField;
    zDepProvNOMBRE_1: TStringField;
    zDepProvPROVINCIA_ID: TLongintField;
    zProvinciasID_PROVINCIA: TLongintField;
    zProvinciasNOMBRE: TStringField;
    zProvincias: TZQuery;
    zDepartamentos: TZQuery;
    zDepProv: TZReadOnlyQuery;
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
    //procedure Editar;
    //procedure GrabarNuevo;
    //procedure Insertar;
  end;

var
  dmCiudades: TdmCiudades;

implementation

{$R *.lfm}

{ TdmCiudades }

procedure TdmCiudades.DataModuleCreate(Sender: TObject);
begin
  Abrir;
end;

procedure TdmCiudades.DataModuleDestroy(Sender: TObject);
begin
  {Cancelo los datos no grabado, no debería haber, pero por las dudas}
  //tranCiudades.Rollback;
  {Cierro las 3 consultas que estan abiertas}
  //sqlCiudades.Close;
  //busProvincias.Close;
  //busDepartamentos.Close;
  zCiudades.Cancel;
end;

procedure TdmCiudades.Grabar;
begin
  {verifico que no esté en modo navegación}
  //sqlCiudades.CheckBrowseMode;
  try
    {trato de aplicar los cambios}
    zCiudades.ApplyUpdates;
    //sqlCiudades.ApplyUpdates;
    {hago el commit de la transacción}
    //tranCiudades.CommitRetaining;
    {refresco la consulta que me muestra los datos en la grilla}
    //sqlCiudades.Refresh;
    //busDepartamentos.Refresh;
  except
    zCiudades.Cancel;
    //tranCiudades.Rollback;
    //sqlCiudades.Open;
  end;
end;

procedure TdmCiudades.Borrar;
begin
  zCiudades.Delete;
  zCiudades.ApplyUpdates;
  //sqlCiudades.Bookmark:= Indice;
  //sqlCiudades.Delete;
  //sqlCiudades.ApplyUpdates;
  //tranCiudades.CommitRetaining;
  //busDepartamentos.Refresh;
end;

procedure TdmCiudades.Cancelar;
begin
  //sqlCiudades.Cancel;
  zCiudades.Cancel;
end;

procedure TdmCiudades.Abrir;
begin
  zCiudades.Open;
  zProvincias.Open;
  zDepartamentos.Open;
  //sqlDepartamentos.Close;
  //sqlCiudades.Close;
end;

{procedure TdmCiudades.Editar;
begin
  // SI SE BORRA LA LLAMADA A ESTA FUNCION SE PUEDE BORRAR
  // PORQUE YA NO HACE FALTA
  zCiudades.Edit;
  //sqlCiudades.Bookmark:=Indice;
  //sqlCiudades.Edit;
end;}

{procedure TdmCiudades.GrabarNuevo;
begin
  zCiudades.Post;
  //sqlCiudades.Post;
  Grabar;
end;}

{procedure TdmCiudades.Insertar;
begin
  zCiudades.Append;
  //sqlCiudades.Append;
end;}

end.

