unit trabajo_dialogo_remitoguia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, FileUtil, Forms, Controls, Graphics, Dialogs, DBCtrls,
  StdCtrls, Buttons, ActnList;

type

  { TDialogoRemitoGuia }

  TDialogoRemitoGuia = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    dsTipos: TDataSource;
    dsRemito: TDataSource;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    procedure DBLookupComboBox1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DialogoRemitoGuia: TDialogoRemitoGuia;

implementation

{$R *.lfm}

{ TDialogoRemitoGuia }

procedure TDialogoRemitoGuia.DBLookupComboBox1Change(Sender: TObject);
begin
  dsRemito.Edit;
  Label1.Caption:=DBLookupComboBox1.Text;
  DBEdit1.Field.AsString:=Label1.Caption;
  DBEdit1.SetFocus;
end;

end.

