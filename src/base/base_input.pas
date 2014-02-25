unit base_input;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs,
  ButtonPanel, XMLPropStorage, ExtCtrls, Buttons, StdCtrls, base_form_maestro;

type

  { TFormBaseInput }

  TFormBaseInput = class(TFormMaestro)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsInput: TDatasource;
    Configuracion: TXMLPropStorage;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormBaseInput: TFormBaseInput;

implementation

uses LCLType;

{$R *.lfm}

end.

