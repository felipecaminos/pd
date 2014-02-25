unit provincias_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZDataset, ZSqlUpdate,
  conexion_dm, sqldb, db;

type

  { TdmProvincias }

  TdmProvincias = class(TDataModule)
    sqlProvincias: TSQLQuery;
    sqlProvinciasID_PROVINCIA: TLongintField;
    sqlProvinciasNOMBRE: TStringField;
    tblProvinciasID_PROVINCIA: TLongintField;
    tblProvinciasNOMBRE: TStringField;
    tranProvincias: TSQLTransaction;
    tblProvincias: TZTable;
    upProvincias: TZUpdateSQL;
    zProvincias: TZQuery;
    zProvinciasID_PROVINCIA: TLongintField;
    zProvinciasNOMBRE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
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
  dmProvincias: TdmProvincias;

implementation

{$R *.lfm}
procedure TdmProvincias.DataModuleCreate(Sender: TObject);
begin
   Abrir;
end;

procedure TdmProvincias.Grabar;
begin
   try
     //zProvincias.Post;
     zProvincias.ApplyUpdates;
     //zProvincias.Connection.Commit;
     //tblProvincias.CommitUpdates;
     //zProvincias.Refresh;
      //sqlProvincias.ApplyUpdates;
      //tranProvincias.CommitRetaining;
   except
      zProvincias.Cancel;
      //tranProvincias.Rollback;
      //sqlProvincias.Open;
   end;
end;

procedure TdmProvincias.Borrar;
begin
   zProvincias.Delete;
   zProvincias.ApplyUpdates;
   //zProvincias.CommitUpdates;
   {sqlProvincias.Delete;
   sqlProvincias.ApplyUpdates;
   tranProvincias.CommitRetaining;}
end;

procedure TdmProvincias.Cancelar;
begin
   zProvincias.Cancel;
   //tranProvincias.RollbackRetaining;
end;

procedure TdmProvincias.Abrir;
begin
   {if sqlProvincias.Active then
      sqlProvincias.Close;
   sqlProvincias.Open;}
   zProvincias.Open;
end;

end.

