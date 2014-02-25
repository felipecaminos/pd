unit contactos_listado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZDataset, LR_Class, LR_DBSet, LR_View, LR_DSet,
  LR_PGrid, LR_DB_Zeos, LR_IBConnection, LRDialogControls, rxdbgrid, Forms,
  Controls, Graphics, Dialogs, Buttons, ExtCtrls, StdCtrls, XMLPropStorage,
  base_abm, contactos_dm, db, IBConnection, sqldb;

type

  { TListadoContactos }

  TListadoContactos = class(TFormBaseABM)
    btnImprimir: TBitBtn;
    frdsInforme: TfrDBDataSet;
    frInforme: TfrReport;
    StringField1: TStringField;
    StringField2: TStringField;
    zInforme: TZTable;
    zInformeAPELLIDO: TStringField;
    zInformeCP: TStringField;
    zInformeDIRECCION: TStringField;
    zInformeDIRECCION2: TStringField;
    zInformeEMAIL: TStringField;
    zInformeID_AGENDA: TLongintField;
    zInformeLOCALIDAD_ID: TLongintField;
    zInformeMOVIL: TStringField;
    zInformeNOMBRE: TStringField;
    zInformeTELEFONO: TStringField;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    DestruirDM: Boolean;
  end;

var
  ListadoContactos: TListadoContactos;

implementation

{$R *.lfm}

{ TListadoContactos }

procedure TListadoContactos.FormCreate(Sender: TObject);
begin
  DestruirDM:=false;
  PanelBusqueda.Visible:= false;
  btnBorrar.Visible:=false;
  btnNuevo.Visible:=false;
  btnModificar.Visible:=false;

  {aqui veo si el modulos de datos ya fue creado por
  la ventana de ABM o si al listado se lo crea en
  la ventana principal y no existe el modulo de datos}
  if not(Assigned(dsABM.DataSet)) then
     begin
     dmContactos:= TdmContactos.Create(self);
     DestruirDM:=true;
     end;
end;

procedure TListadoContactos.btnImprimirClick(Sender: TObject);
begin
  zInforme.Open;
  //frInforme.PrepareReport;
  //frInforme.ShowPreparedReport;
  //frInforme.LoadFromFile('informes/prueba1.lrf');
  frInforme.ShowReport;
  zInforme.Close;
end;

procedure TListadoContactos.FormDestroy(Sender: TObject);
begin
  {si este form de listado construyo el abm, hay
  que destruirlo al cerrar}
  if DestruirDM then
     dmContactos.Free;
end;

end.

