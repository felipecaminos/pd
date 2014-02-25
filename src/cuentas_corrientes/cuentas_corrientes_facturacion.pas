unit cuentas_corrientes_facturacion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs;

type

  { TFacturacionTrabajosCC }

  TFacturacionTrabajosCC = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FacturacionTrabajosCC: TFacturacionTrabajosCC;

implementation

{$R *.lfm}

end.

