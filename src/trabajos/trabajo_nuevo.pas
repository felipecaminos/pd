unit trabajo_nuevo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, dbdateedit, RxVersInfo, LSControls, Forms,
  Controls, Graphics, Dialogs, DBGrids, StdCtrls, DbCtrls, Buttons, ExtCtrls,
  trabajo_dm, base_form_maestro;

type

  { TTrabajoNuevo }

  TTrabajoNuevo = class(TFormMaestro)
    Antagonista: TDBCheckBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    dsLaboratoristas: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    dsTrabajos: TDatasource;
    dsCategorias: TDatasource;
    DBGrid2: TDBGrid;
    DBLookupComboBox3: TDBLookupComboBox;
    dsTareas: TDatasource;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    dsDentistas: TDatasource;
    dsProductos: TDatasource;
    Dentista: TLabel;
    Laboratorista: TLabel;
    LabelColor: TLabel;
    Panel1: TPanel;
    Producto: TLabel;
    FEntrega: TLabel;
    Paciente: TLabel;
    Categoria: TLabel;
    Observacion: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBLookupComboBox3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }

  end;

var
  TrabajoNuevo: TTrabajoNuevo;
  dmTrabajo: TdmTrabajo;

implementation

{$R *.lfm}

{ TTrabajoNuevo }

procedure TTrabajoNuevo.FormCreate(Sender: TObject);
begin
  dmTrabajo:= TdmTrabajo.Create(self);
  dsTrabajos.DataSet.Append;
  DBDateEdit1.Date:=Date;
end;

procedure TTrabajoNuevo.DBLookupComboBox3Change(Sender: TObject);
begin
  dsProductos.DataSet.Close;
  //Caption:=IntToStr(DBLookupComboBox3.KeyValue);
  dsProductos.DataSet.Filter:='CATEGORIA = '+IntToStr(DBLookupComboBox3.KeyValue);
  dsProductos.DataSet.Open;
end;

procedure TTrabajoNuevo.BitBtn2Click(Sender: TObject);
begin
end;

procedure TTrabajoNuevo.BitBtn3Click(Sender: TObject);
begin
  dmTrabajo.GrabarNuevoTrabajo;
  dmTrabajo.CompletarTareas;
  Close;
end;

procedure TTrabajoNuevo.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TTrabajoNuevo.BitBtn1Click(Sender: TObject);
begin
end;

procedure TTrabajoNuevo.FormDestroy(Sender: TObject);
begin
  dmTrabajo.Free;
end;

end.

