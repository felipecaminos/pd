unit agenda_tarea_input;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, Buttons, agenda_fecha_input, agenda_dm;

type

  { TAgendaInputTarea }

  TAgendaInputTarea = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsTareas: TDatasource;
    DBGrid1: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  AgendaInputTarea: TAgendaInputTarea;

implementation

{$R *.lfm}

{ TAgendaInputTarea }

procedure TAgendaInputTarea.BitBtn1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
  Hide;
end;

end.

