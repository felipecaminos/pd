unit acercade;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, base_form_maestro, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls;

type

  { TFAcercaDe }

  TFAcercaDe = class(TFormMaestro)
    btnCerrar: TBitBtn;
    etqDerechos: TLabel;
    etqLicencia: TLabel;
    Image1: TImage;
    memoLicencia: TMemo;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FAcercaDe: TFAcercaDe;

implementation

{$R *.lfm}

{ TFAcercaDe }

end.

