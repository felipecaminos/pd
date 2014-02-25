unit cuentes_corrientes_pagos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, base_form_maestro, cuentas_corrientes_dm,
  db, Controls, Graphics, Dialogs, StdCtrls, DbCtrls, DBGrids, Buttons,
  ExtCtrls;

type

  { TCuentasCorrientesPagos }

  TCuentasCorrientesPagos = class(TFormMaestro)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    dsCuentasCorrientes: TDataSource;
    dsDentistas: TDataSource;
    dsSaldo: TDataSource;
    RealizarPago: TBitBtn;
    Odontologo: TLabel;
    Panel1: TPanel;
    Saldo: TLabel;
    procedure DBLookupComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RealizarPagoClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CuentasCorrientesPagos: TCuentasCorrientesPagos;
  dmCCorrientes: TdmCuentasCorrientes;

implementation

{$R *.lfm}

{ TCuentasCorrientesPagos }

procedure TCuentasCorrientesPagos.DBLookupComboBox1Change(Sender: TObject);
var
  cadena: string;
begin
  if DBLookupComboBox1.KeyValue > 0 then
  begin
    dmCCorrientes.FiltrarPorDentista(integer(DBLookupComboBox1.KeyValue));
    if dsCuentasCorrientes.DataSet.RecordCount = 0 then
    begin
      RealizarPago.Enabled := False;
      DBGrid1.Enabled := False;
    end
    else
    begin
      RealizarPago.Enabled := True;
      DBGrid1.Visible := True;
      DBGrid1.Enabled := True;
    end;
  end
  else
    Close;
end;

procedure TCuentasCorrientesPagos.FormCreate(Sender: TObject);
begin
  dmCCorrientes := TdmCuentasCorrientes.Create(self);
end;

procedure TCuentasCorrientesPagos.FormDestroy(Sender: TObject);
begin
  dmCCorrientes.Free;
end;

procedure TCuentasCorrientesPagos.RealizarPagoClick(Sender: TObject);
begin
  // Generar Nuevo Recibo
  // obtener ID nuevo comprobante
  // completar registros con el ID de remito (o varios) y el ID_TRABAJO y el ID_PRODUCTO
  //           uno por uno y si no corresponde a un trabajo se puede facturar solo el producto
  {ver si conviene hacer recibos por trabajos -por el importe completo- o si es mejor hacerlos
  por importe aleatorio, el tema es ver como se computan los intereses y si hay que anular el
  campo FACTURADO}

  {no olvidarse que hay que reveer toda la ESTRUCTURA DE LA DB para optimizar un poco -va a
  llevar mucho trabajo- y ver que se puede pasar a PROC.ALMACENADO -por ejemplo el nuevo trabajo-}
  {ADEMÁS hay que optimizar los procedimientos -o pasar a funciones del datamodule-}
  {verificar todos los procedimientos de BORRADO y selects para que al borrar solo se modifique la fecha de baja}

  dmCCorrientes.NuevoRecibo(DBLookupComboBox1.KeyValue);
  DBLookupComboBox1Change(self);
end;

end.

