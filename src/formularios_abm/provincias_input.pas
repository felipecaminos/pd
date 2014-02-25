unit provincias_input;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, XMLPropStorage, DbCtrls, base_input, provincias_dm, db;

type

  { TProvinciasInput }

  TProvinciasInput = class(TFormBaseInput)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ProvinciasInput: TProvinciasInput;

implementation

{$R *.lfm}

{ TProvinciasInput }

procedure TProvinciasInput.FormKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  {se llama a esta funcion desde los dbedit para que al
  apretar enter no de error}
end;

end.

