unit cuentas_corrientes_dialogo_recibo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, FZDB, dbdateedit, base_form_maestro,
  jdblabeledcurrencyedit, Forms, Controls, Graphics, Dialogs, DbCtrls, DBGrids,
  StdCtrls, ExtCtrls, Buttons;

type

  { TDialogoRecibo }

  TDialogoRecibo = class(TFormMaestro)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit3: TDBEdit;
    dsDentista: TDataSource;
    dsRecibo: TDataSource;
    dsFormaPago: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    JDBLabeledCurrencyEdit1: TJDBLabeledCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DialogoRecibo: TDialogoRecibo;

implementation

{$R *.lfm}

end.

