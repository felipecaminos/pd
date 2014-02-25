unit trabajo_dialogo_obs_dentista;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, DbCtrls;

type

  { TDialogoObservacionDentista }

  TDialogoObservacionDentista = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsObservacion: TDataSource;
    DBEdit1: TDBEdit;
    Label1: TLabel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DialogoObservacionDentista: TDialogoObservacionDentista;

implementation

{$R *.lfm}

end.

