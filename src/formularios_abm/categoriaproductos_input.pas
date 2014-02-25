unit categoriaproductos_input;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, XMLPropStorage, DbCtrls, base_input, categoriaproductos_dm,
  db;

type

  { TCatProductosInput }

  TCatProductosInput = class(TFormBaseInput)
    DBEdit1: TDBEdit;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CatProductosInput: TCatProductosInput;

implementation

{$R *.lfm}

end.

