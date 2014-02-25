unit iva_input;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, XMLPropStorage, DbCtrls, base_input, db;

type

  { TIVAInput }

  TIVAInput = class(TFormBaseInput)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  IVAInput: TIVAInput;

implementation

{$R *.lfm}

{ TIVAInput }



end.

