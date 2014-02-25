unit cuentas_corrientes_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Controls, FileUtil, ZDataset, ZSqlUpdate, ZSequence,
  ZStoredProcedure, Dialogs, trabajo_dialogo_factura, trabajo_dialogo_remito,
  aaaa_unit_pruebas, cuentas_corrientes_dialogo_recibo;

type

  { TdmCuentasCorrientes }

  TdmCuentasCorrientes = class(TDataModule)
    dsDentistas: TDataSource;
    seqIdComprobante: TZSequence;
    seqNumeroFactura: TZSequence;
    StringField1: TStringField;
    StringField2: TStringField;
    zCCFacturadoCLIENTE_ID: TLongintField;
    zCCFacturadoCOMPR_DEBITO_ID: TLongintField;
    zCCFacturadoFACTURADO: TStringField;
    zCCFacturadoFECHA_BAJA: TDateField;
    zCCFacturadoFECHA_HORA: TDateTimeField;
    zCCFacturadoID: TLongintField;
    zCCFacturadoIMPORTE_COMPR_DEB: TFloatField;
    zCCFacturadoSALDO: TFloatField;
    zCCorrientesParaFacturarCLIENTE_ID: TLongintField;
    zCCorrientesParaFacturarCOMPR_DEBITO_ID: TLongintField;
    zCCorrientesParaFacturarFACTURADO: TStringField;
    zCCorrientesParaFacturarFECHA_BAJA: TDateField;
    zCCorrientesParaFacturarFECHA_HORA: TDateTimeField;
    zCCorrientesParaFacturarID: TLongintField;
    zCCorrientesParaFacturarIMPORTE_COMPR_DEB: TFloatField;
    zCCorrientesParaFacturarIMPORTE_RECIBO_PAGO: TFloatField;
    zCCorrientesParaFacturarRECIBO_PAGO_ID: TLongintField;
    zCCorrientesParaFacturarSALDO: TFloatField;
    zComprobantesCAJERO: TLongintField;
    zComprobantesCLIENTE_ID: TLongintField;
    zComprobantesCONCEPTO: TStringField;
    zComprobantesFECHA: TDateTimeField;
    zComprobantesFECHA_BAJA: TDateField;
    zComprobantesFORMA_PAGO: TLongintField;
    zComprobantesID: TLongintField;
    zComprobantesIMPORTE_TOTAL: TFloatField;
    zComprobantesNUMERO_COMPROBANTE: TLongintField;
    zComprobantesPORCENTAJE: TFloatField;
    zComprobantesPUNTO_VENTA: TLongintField;
    zComprobantesTIPO: TLongintField;
    zComprobantesTRABAJO_ID: TLongintField;
    zCuentasCorrientes: TZQuery;
    upCuentasCorrientes: TZUpdateSQL;
    zCuentasCorrientesCLIENTE_ID: TLongintField;
    zCuentasCorrientesCOMPR_DEBITO_ID: TLongintField;
    zCuentasCorrientesFACTURADO: TStringField;
    zCuentasCorrientesFECHA_BAJA: TDateField;
    zCuentasCorrientesFECHA_HORA: TDateTimeField;
    zCuentasCorrientesID: TLongintField;
    zCuentasCorrientesIMPORTE_COMPR_DEB: TFloatField;
    zCuentasCorrientesSALDO: TFloatField;
    zDentistasCLINICA: TStringField;
    zDentistasDENTISTA: TStringField;
    zDentistasID_DENTISTA: TLongintField;
    zDentistasMOVIL: TStringField;
    zDentistasPORCENTAJE: TFloatField;
    zDentistas: TZQuery;
    zComprobantes: TZQuery;
    zLineasComprobantes: TZQuery;
    zLineasComprobantesCANTIDAD: TLongintField;
    zLineasComprobantesCOMPROBANTE_ID: TLongintField;
    zLineasComprobantesFECHA_BAJA: TDateField;
    zLineasComprobantesID: TLongintField;
    zLineasComprobantesPORCENTAJE_IVA: TFloatField;
    zLineasComprobantesPRECIO_UNITARIO: TFloatField;
    zLineasComprobantesPRODUCTO_ID: TLongintField;
    zLineasComprobantesREMITO_ID: TLongintField;
    zPorcentajeDentistaPORCENTAJE: TFloatField;
    zPorcentajeIVAPORCENTAJE: TLongintField;
    zCCFacturado: TZQuery;
    zProductoDeComprobante: TZQuery;
    zProductoDeComprobantePRODUCTO_ID: TLongintField;
    zProductosCODIGO_INTERNO: TLongintField;
    zProductosDESCRIPCION: TStringField;
    zProductosID_PRODUCTO: TLongintField;
    zProductosPRECIO_FINAL: TFloatField;
    zRecibosCAJERO: TLongintField;
    zRecibosCLIENTE_ID: TLongintField;
    zRecibosCONCEPTO: TStringField;
    zRecibosFECHA: TDateTimeField;
    zRecibosFECHA_BAJA: TDateField;
    zRecibosFORMA_PAGO: TLongintField;
    zRecibosID: TLongintField;
    zRecibosIMPORTE: TFloatField;
    zRecibosNUMERO_COMPROBANTE: TLongintField;
    zRemitos: TZReadOnlyQuery;
    zSaldoCuentaCorriente: TZReadOnlyQuery;
    zPorcentajeIVA: TZReadOnlyQuery;
    zSaldoCuentaCorrienteSALDO: TFloatField;
    upComprobantes: TZUpdateSQL;
    upLineasComprobantes: TZUpdateSQL;
    upCCFacturado: TZUpdateSQL;
    zProductos: TZTable;
    zPorcentajeDentista: TZStoredProc;
    seqNumeroRecibo: TZSequence;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure NuevaFactura(Lista: TStrings);
    procedure FiltrarPorDentista(id: integer);
    procedure NuevoRecibo(Dentista: integer);
  end;

var
  dmCuentasCorrientes: TdmCuentasCorrientes;
  DialogoRecibo: TDialogoRecibo;
  Form1: TForm1;

implementation

{$R *.lfm}

{ TdmCuentasCorrientes }

procedure TdmCuentasCorrientes.DataModuleCreate(Sender: TObject);
begin
  zDentistas.Open;
  zCuentasCorrientes.Open;
end;

procedure TdmCuentasCorrientes.NuevaFactura(Lista: TStrings);
var
  Facturar: TDialogoFacturaC;
  contador: integer;
  id: string;
  suma: double;
  mensaje: string;
begin
  suma := 0.0;
  contador := 0;
  zLineasComprobantes.Connection.StartTransaction;
  zProductos.Open;
  zLineasComprobantes.Open;
  while contador < Lista.Count do
  begin
    //filtramos los comprobantes para ir obteniendo los datos
    id := Lista.Strings[contador];
    zPorcentajeIVA.Close;
    zCCFacturado.Close;
    zComprobantes.Close;
    // filtro de CC
    zCCFacturado.Filter := ' COMPR_DEBITO_ID = ' + id;
    zCCFacturado.Filtered := True;
    // filtro de comprobantes
    zComprobantes.Filter := ' ID = ' + id;
    zComprobantes.Filtered := True;
    // filtro para buscar el porcentaje de IVA
    zPorcentajeIVA.ParamByName('ID').AsInteger := StrToInt(id);
    // se abren las tablas
    zCCFacturado.Open;
    zPorcentajeIVA.Open;
    zComprobantes.Open;
    // se cambia el estado de las tablas que se manipulan
    zLineasComprobantes.Insert;
    zCCFacturado.Edit;
    // se completa el registro con los datos
    zLineasComprobantesCOMPROBANTE_ID.AsInteger := seqIdComprobante.GetCurrentValue + 1;
    zLineasComprobantesCANTIDAD.AsInteger := 1;
    zLineasComprobantesREMITO_ID.AsInteger := StrToInt(id);
    // OJO, no se que pasa pero hay que hacer esta conversión strtoint
    {hay que obetener el tipo de producto a partir del id de comprobante}
    zProductoDeComprobante.Close;
    zProductoDeComprobante.ParamByName('ID').AsInteger := StrToInt(id);
    // OJO, no se que pasa pero hay que hacer esta conversión strtoint
    zProductoDeComprobante.Open;
    zLineasComprobantesPRODUCTO_ID.AsInteger :=
      zProductoDeComprobantePRODUCTO_ID.AsInteger;
    zLineasComprobantesPORCENTAJE_IVA.AsFloat := zPorcentajeIVAPORCENTAJE.AsFloat;
    zLineasComprobantesPRECIO_UNITARIO.AsFloat := zComprobantesIMPORTE_TOTAL.AsFloat;
    // se completa el campo facturado para que no se pueda volver a facturar
    zCCFacturadoFACTURADO.AsString := 'S';

    zCCFacturado.Post;
    zLineasComprobantes.Post;
    //variables de control y de suma para comprobante
    suma := suma + zLineasComprobantesPRECIO_UNITARIO.AsFloat;
    contador := contador + 1;
  end;
  // anulamos todo lo que modificamos antes
  zComprobantes.Close;
  zComprobantes.Filtered := False;
  zComprobantes.Open;
  // agregamos un nuevo registro
  zComprobantes.Insert;
  zComprobantesNUMERO_COMPROBANTE.AsInteger := seqNumeroFactura.GetNextValue;
  // 1= Factura - 2=Remito(p/C.Corriente) - 3= recibo de pago
  zComprobantesTIPO.AsInteger := 1;
  zComprobantesFECHA.AsDateTime := Now;
  // de momento solo odonologos
  zComprobantesCLIENTE_ID.AsInteger := zCuentasCorrientesCLIENTE_ID.AsInteger;
  // Por omision 1 (no implementado aún)
  zComprobantesPUNTO_VENTA.AsInteger := 1;
  // Por omisión 1 (no implementado aún)
  zComprobantesCAJERO.AsInteger := 1;
  // (no implementado) 1=contado - 2= T.Debito - 3=T.Credito - 4=cheque
  zComprobantesFORMA_PAGO.AsInteger := 1;
  //se llama al procedimiento almacenado para obtener el porcentaje
  zPorcentajeDentista.Close;
  zPorcentajeDentista.ParamByName('DEN_ID').AsInteger :=
    StrToInt(zComprobantesCLIENTE_ID.AsString);
  zPorcentajeDentista.Open;
  zComprobantesPORCENTAJE.AsFloat := zPorcentajeDentistaPORCENTAJE.AsFloat;
  //hay que obtenerlo de sumar todas las lineas
  zComprobantesIMPORTE_TOTAL.AsFloat := suma;
  // grabamos para poder obtener el nuevo valor de id del trigger
  zComprobantes.Post;
  // se filtra la tabla de lineas con el nuevo id
  zLineasComprobantes.Close;
  zLineasComprobantes.Filter :=
    ' COMPROBANTE_ID = ' + IntToStr(seqIdComprobante.GetCurrentValue);
  zLineasComprobantes.Filtered := True;
  zLineasComprobantes.Open;
  // se crea el form que muestra la nueva factura
  Facturar := TDialogoFacturaC.Create(self);
  Facturar.dsFactura.DataSet := zComprobantes;
  Facturar.dsLineasComprobante.DataSet := zLineasComprobantes;
  if Facturar.ShowModal = mrOk then
  begin
    zCCFacturado.ApplyUpdates;
    zLineasComprobantes.ApplyUpdates;
    zComprobantes.ApplyUpdates;
    zLineasComprobantes.Connection.Commit;
  end
  else
  begin
    zCCFacturado.Cancel;
    zLineasComprobantes.Cancel;
    zComprobantes.Cancel;
    zLineasComprobantes.Connection.Rollback;
  end;
  zPorcentajeDentista.Close;
  zProductos.Close;
  zCCFacturado.Close;
  zLineasComprobantes.Close;
  zComprobantes.Close;
  zDentistas.Close;
  zDentistas.Filtered := False;
end;

procedure TdmCuentasCorrientes.FiltrarPorDentista(id: integer);
begin
  zCuentasCorrientes.Close;
  zSaldoCuentaCorriente.Close;
  zCuentasCorrientes.ParamByName('ID_DENTISTA').AsInteger := id;
  zSaldoCuentaCorriente.ParamByName('ID').AsInteger := id;
  zSaldoCuentaCorriente.Open;
  zCuentasCorrientes.Open;
end;

procedure TdmCuentasCorrientes.NuevoRecibo(Dentista: integer);
var
  recibo: integer;
begin
  zComprobantes.Connection.StartTransaction;
  zComprobantes.Open;
  zCuentasCorrientes.Open;
  zDentistas.Open;

  zComprobantes.Insert;
  zCuentasCorrientes.Insert;
  // iniciar la transacción, abrir las tablas y completar con
  // los datos de valores autocompletables
  zComprobantesNUMERO_COMPROBANTE.AsInteger := seqNumeroRecibo.GetNextValue;
  // 1= Factura - 2=Remito(p/C.Corriente) - 3= recibo de pago
  zComprobantesTIPO.AsInteger := 3;
  zComprobantesFECHA.AsDateTime := Now;
  zComprobantesCLIENTE_ID.AsInteger := Dentista;
  zComprobantesPUNTO_VENTA.AsInteger := 1;
  zComprobantesCAJERO.AsInteger := 1;
  // (no implementado) 1=contado - 2= T.Debito - 3=T.Credito - 4=cheque
  zComprobantesFORMA_PAGO.AsInteger := 1;
  // No corresponde
  //zComprobantesTRABAJO_ID
  //zComprobantesPORCENTAJE
  zComprobantesIMPORTE_TOTAL.AsFloat := 0.00;
  zComprobantesCONCEPTO.AsString := 'Entrega a cuenta de deuda.-';
  recibo:=seqIdComprobante.GetCurrentValue;

  {*******}
  zCuentasCorrientesCLIENTE_ID.AsInteger := Dentista;
  zCuentasCorrientesCOMPR_DEBITO_ID.AsInteger := recibo;
  zCuentasCorrientesFECHA_HORA.AsDateTime := Now;
  zCuentasCorrientesFACTURADO.AsString:='S';
  {**obtener saldo CC - cambiarlo por un stored Proced.**}
  zSaldoCuentaCorriente.Close;
  zSaldoCuentaCorriente.ParamByName('ID').AsInteger := Dentista;
  zSaldoCuentaCorriente.Open;
  {******}
  {llamar al dialogo (que muestra el odontologo) para introducir
  importe, forma de pago y otros datos que hagan falta para el recibo}
  DialogoRecibo := TDialogoRecibo.Create(self);
  DialogoRecibo.Caption := 'ID RECIBO = ' + IntToStr(recibo);
  if DialogoRecibo.ShowModal = mrOk then
  begin
    zCuentasCorrientesCLIENTE_ID.AsInteger := zComprobantesCLIENTE_ID.AsInteger;
    zCuentasCorrientesSALDO.AsFloat :=
      zSaldoCuentaCorrienteSALDO.AsFloat - zComprobantesIMPORTE_TOTAL.AsFloat;
    zCuentasCorrientesIMPORTE_COMPR_DEB.AsFloat := zComprobantesIMPORTE_TOTAL.AsFloat;

    zCuentasCorrientes.Post;
    zComprobantes.ApplyUpdates;
    zCuentasCorrientes.ApplyUpdates;
    zComprobantes.Connection.Commit;
  end
  else
  begin
    zComprobantes.Cancel;
    zCuentasCorrientes.Cancel;
    zComprobantes.Connection.Rollback;
  end;
  {Con los datos del dialogo completar los campos y guardar un nuevo
  registro de RECIBO y de CUENTA_CORRIENTES ACTUALIZANDO EL SALDO}
  DialogoRecibo.Release;
  zComprobantes.Close;
  zCuentasCorrientes.Close;
end;

end.
