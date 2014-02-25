unit conexion_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, FileUtil, ZConnection,
  ZConnectionGroup, ZGroupedConnection, Dialogs;

type

  { TdmConexion }

  TdmConexion = class(TDataModule)
    ZConnection1: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  dmConexion: TdmConexion;

implementation

{$R *.lfm}

{ TdmConexion }
function DimeDirectorio(): string;
var
   directorio:string;
begin
  directorio:=GetCurrentDir;
  {$IFDEF WIN32}
  Result:=directorio+'\basededatos\';
  {$ENDIF}
  {$IFDEF WIN64}
  Result:=directorio+'\basededatos\';
  {$ENDIF}
  {$IFDEF LINUX}
  Result:=directorio+'/basededatos/';
  {$ENDIF}
end;

procedure TdmConexion.DataModuleCreate(Sender: TObject);
begin
  try
     ZConnection1.Database:=DimeDirectorio()+'pd.fdb';
     ZConnection1.Connect;
  except
     {para cambiar el directorio cuando se ejecuta desde un enlace en el escritorio,
     hay que ver como se arregla esto para que no pase ni en win ni en lin}
     //ShowMessage('ERROR DE CONEXION, INTENTANDO CON DIRECTORIO POR OMISION !!!'+#13+#13+ZConnection1.Database);
     ZConnection1.Database:='/home/felipe/workspace/sistemas propios/protesicodental/basededatos/pd.fdb';
     //ShowMessage('NUEVA DB'+#13+#13+ZConnection1.Database);
     ZConnection1.Connect;
  end;
end;

procedure TdmConexion.DataModuleDestroy(Sender: TObject);
begin
  ZConnection1.Disconnect;
end;

end.

