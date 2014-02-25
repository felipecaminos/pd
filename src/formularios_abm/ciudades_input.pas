unit ciudades_input;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls,
  Graphics, Dialogs, DbCtrls, StdCtrls, ExtCtrls,
  Buttons, DBGrids, base_input, db, Grids;

type

  { TCiudadesInput }

  TCiudadesInput = class(TFormBaseInput)
    BuscaDepartamento: TDatasource;
    BuscaProvincia: TDatasource;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CiudadesInput: TCiudadesInput;

implementation

{$R *.lfm}

{ TCiudadesInput }

procedure TCiudadesInput.DBLookupComboBox1Enter(Sender: TObject);
begin
  BuscaDepartamento.DataSet.Close;
  BuscaDepartamento.DataSet.Filter:=
     'PROVINCIA_ID = '+IntToStr(DBLookupComboBox2.KeyValue);
  BuscaDepartamento.DataSet.Open;
end;

procedure TCiudadesInput.DBLookupComboBox2Change(Sender: TObject);
begin
  DBLookupComboBox1Enter(self);
end;

procedure TCiudadesInput.FormCreate(Sender: TObject);
var
  dep :LongInt;
  pro :LongInt;
begin
  dep:= dsInput.DataSet.FieldValues['DEPARTAMENTO_ID'];
  BuscaDepartamento.DataSet.Filter:='id_departamento = '+IntToStr(dep);
  BuscaDepartamento.DataSet.Filtered:=true;
  pro:= BuscaDepartamento.DataSet.FieldValues['PROVINCIA_ID'];
  {with BuscaProvincia.DataSet do
     while (not EOF and (FieldValues['ID_PROVINCIA'] <> pro)) do
       begin
         Next;
         Caption:= IntToStr(pro);
       end;}
  DBLookupComboBox2.KeyValue:=pro;
  DBLookupComboBox1Enter(self);
end;

{ TCiudadesInput }

end.

