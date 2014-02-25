unit trabajo_dialogo_facturacion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, jdblabeleddateedit, Forms, base_form_maestro, Controls,
  Graphics, Dialogs, StdCtrls, DbCtrls, ExtCtrls, Buttons;

type

  { TDialogoFactura }

  TDialogoFactura = class(TFormMaestro)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    dsComprobante: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Fecha: TLabel;
    Panel2: TPanel;
    Porcentaje: TLabel;
    ImporteTotal: TLabel;
    Numero: TLabel;
    Panel1: TPanel;
    PuntoVenta: TLabel;
    Cajero: TLabel;
    Odontologo: TLabel;
    FormaPago: TLabel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DialogoFactura: TDialogoFactura;

implementation

{$R *.lfm}

end.

