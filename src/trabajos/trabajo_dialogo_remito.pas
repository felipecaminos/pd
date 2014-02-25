unit trabajo_dialogo_remito;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, JDBGridControl, Forms, base_form_maestro, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, DbCtrls, Buttons;

type

  { TDialogoRemito }

  TDialogoRemito = class(TFormMaestro)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsRemito: TDataSource;
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
    Label3: TLabel;
    Remito: TLabel;
    InicioActividad: TLabel;
    Porcentaje: TLabel;
    ImporteTotal: TLabel;
    Odontologo: TLabel;
    Nro: TLabel;
    PV: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    procedure Label2Click(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DialogoRemito: TDialogoRemito;

implementation

{$R *.lfm}

{ TDialogoRemito }

procedure TDialogoRemito.Label2Click(Sender: TObject);
begin

end;

procedure TDialogoRemito.Shape1ChangeBounds(Sender: TObject);
begin

end;

end.

