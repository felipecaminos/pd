unit trabajo_finalizar_input;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, FileUtil, Forms, base_form_maestro, Controls, Graphics, Dialogs, DBCtrls,
  ExtCtrls, Buttons, StdCtrls, DBGrids;

type

  { TTrabajosFinalizarInput }

  TTrabajosFinalizarInput = class(TFormMaestro)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBText2: TDBText;
    dsTareasSinFinalizar: TDataSource;
    dsTareas: TDataSource;
    DBGrid1: TDBGrid;
    DBText1: TDBText;
    dsTrabajoInput: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Observacion: TLabel;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  TrabajosFinalizarInput: TTrabajosFinalizarInput;

implementation

uses trabajo_dm;

{$R *.lfm}

{ TTrabajosFinalizarInput }

procedure TTrabajosFinalizarInput.FormCreate(Sender: TObject);
begin

end;

procedure TTrabajosFinalizarInput.Button1Click(Sender: TObject);
begin
end;

procedure TTrabajosFinalizarInput.DBEdit1Change(Sender: TObject);
begin

end;

end.

