unit trabajo_dialogo_factura;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, JDBGridControl, Forms, base_form_maestro, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, DbCtrls, Buttons, ValEdit, DBGrids;

type

  { TDialogoFacturaC }

  TDialogoFacturaC = class(TFormMaestro)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsLineasComprobante: TDataSource;
    DBGrid1: TDBGrid;
    dsFactura: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Fecha: TLabel;
    Cajero: TLabel;
    FormaPago: TLabel;
    Factura: TLabel;
    InicioActividad: TLabel;
    Label3: TLabel;
    Porcentaje: TLabel;
    ImporteTotal: TLabel;
    Odontologo: TLabel;
    Nro: TLabel;
    PV: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DialogoFacturaC: TDialogoFacturaC;

implementation

{$R *.lfm}

{ TDialogoFacturaC }

end.

