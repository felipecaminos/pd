unit trabajo_tareas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, JLabeledDateEdit, Forms, Controls, Graphics,
  Dialogs, DBGrids, Buttons, ExtCtrls, StdCtrls, EditBtn, DbCtrls,
  trabajo_tareas_dm, base_form_maestro;

type

  { TTrabajosYTareas }

  TTrabajosYTareas = class(TFormMaestro)
    BitBtn1: TBitBtn;
    dsDentista: TDataSource;
    dsLaboratorista: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Laboratorista: TCheckBox;
    Odontologo: TCheckBox;
    Fin: TCheckBox;
    Inicio: TCheckBox;
    FInicio: TDateEdit;
    FFin: TDateEdit;
    Terminado: TCheckBox;
    CuentaCorriente: TCheckBox;
    dsTrabajos: TDatasource;
    dsTareas: TDatasource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Filtrado: TGroupBox;
    procedure DBLookupComboBox1Change(Sender: TObject);
    procedure DBLookupComboBox2Change(Sender: TObject);
    procedure FiltradoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  TrabajosYTareas: TTrabajosYTareas;
  dmTrabajosTareas: TdmTrabajosTareas;

implementation

{$R *.lfm}

{ TTrabajosYTareas }

procedure TTrabajosYTareas.FormCreate(Sender: TObject);
begin
  dmTrabajosTareas:= TdmTrabajosTareas.Create(self);
end;

procedure TTrabajosYTareas.FiltradoExit(Sender: TObject);
var
  filtro: String;
  primera: Boolean;
begin
  //dmTrabajosTareas.zTrabajos.Close;
  filtro :='';
  primera := false;
  if Terminado.Checked then
    begin
    if primera = true then
      filtro:=filtro+' and ';
    filtro:=filtro+' FECHA_SALIDA is not null ';
    primera:=true;
    end;

  if CuentaCorriente.Checked then
    begin
    if primera = true then
      filtro:=filtro+' and ';
    filtro:=filtro+' CUENTA_CORRIENTE = ''S''';
    primera:=true;
    end;
  if Inicio.Checked then
    begin
    if primera = true then
      filtro:=filtro+' and ';
    filtro:=filtro+' FECHA_ENTRADA > '''+ FormatDateTime('yyyy-mm-dd',FInicio.Date)+'''';
    primera:=true;
    end;
  if Fin.Checked then
    begin
    if primera = true then
      filtro:=filtro+' and ';
    filtro:=filtro+' FECHA_ENTRADA < '''+ FormatDateTime('yyyy-mm-dd',FFin.Date)+'''';
    primera:=true;
    end;
  if Laboratorista.Checked then
    begin
    if primera = true then
      filtro:=filtro+' and ';
    filtro:=filtro+' LABORATORISTA_ID = '+IntToStr(DBLookupComboBox1.KeyValue);
    primera:=true;
    end;
  if Odontologo.Checked then
    begin
    if primera = true then
      filtro:=filtro+' and ';
    filtro:=filtro+' DENTISTA_ID = '+IntToStr(DBLookupComboBox2.KeyValue);
    primera:=true;
    end;
  //Caption:=filtro;
  dmTrabajosTareas.zTrabajos.Filter:=filtro;
  dmTrabajosTareas.zTrabajos.Filtered:=true;
  //dmTrabajosTareas.zTrabajos.Open;
end;

procedure TTrabajosYTareas.DBLookupComboBox1Change(Sender: TObject);
begin
  Laboratorista.Checked:=False;
  Laboratorista.Checked:=True;
  Laboratorista.Enabled:=True;
end;

procedure TTrabajosYTareas.DBLookupComboBox2Change(Sender: TObject);
begin
  Odontologo.Checked:=False;
  Odontologo.Checked:=True;
  Odontologo.Enabled:=True;
end;

procedure TTrabajosYTareas.FormDestroy(Sender: TObject);
begin
  dmTrabajosTareas.Free;
end;

end.

