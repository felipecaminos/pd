unit agenda_fecha_input;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, dbdateedit, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, Buttons, XMLPropStorage, DbCtrls, DBGrids, base_input, db, EditBtn;

type

  { TAgendaInputFecha }

  TAgendaInputFecha = class(TFormBaseInput)
    DBDateEdit1: TDBDateEdit;
    Label1: TLabel;
    procedure DBDateEdit1Exit(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure VerificarFecha;
  end;

var
  AgendaInputFecha: TAgendaInputFecha;

implementation

{$R *.lfm}

{ TAgendaInputFecha }

procedure TAgendaInputFecha.VerificarFecha;
begin
  if DayOfWeek(DBDateEdit1.Date) = 1 then
     ShowMessage('Atencion, la nueva fecha es DOMINGO !!!');
  if DayOfWeek(DBDateEdit1.Date) = 7 then
     ShowMessage('Atencion, la nueva fecha es SABADO !!!');
end;

procedure TAgendaInputFecha.DBDateEdit1Exit(Sender: TObject);
begin
  VerificarFecha;
end;

end.

