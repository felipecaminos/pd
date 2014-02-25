unit trabajo_dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, conexion_dm, Controls, DB, ZDataset, ZSqlUpdate,
  ZSequence, ZStoredProcedure, StdCtrls, ExtDlgs, trabajo_dialogo_remitoguia,
  trabajo_dialogo_obs_dentista, trabajo_dialogo_factura, trabajo_dialogo_remito,
  Dialogs, trabajo_finalizar_input;

type

  { TdmTrabajo }

  TdmTrabajo = class(TDataModule)
    dsComprobantes: TDataSource;
    DialogoCalendario: TCalendarDialog;
    dsMaestro: TDatasource;
    PORCENTAJE: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DENTISTA: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    zCategoriasDESCRIPCION: TStringField;
    zCategoriasID_CAT_PROD: TLongintField;
    zCCorrientesCLIENTE_ID: TLongintField;
    zCCorrientesCOMPR_DEBITO_ID: TLongintField;
    zCCorrientesFECHA_BAJA: TDateField;
    zCCorrientesFECHA_HORA: TDateTimeField;
    zCCorrientesID: TLongintField;
    zCCorrientesIMPORTE_COMPR_DEB: TFloatField;
    zCCorrientesSALDO: TFloatField;
    zComprobantesCAJERO: TLongintField;
    zComprobantesCLIENTE_ID: TLongintField;
    zComprobantesFECHA: TDateTimeField;
    zComprobantesFORMA_PAGO: TLongintField;
    zComprobantesID: TLongintField;
    zComprobantesIMPORTE_TOTAL: TFloatField;
    zComprobantesNUMERO_COMPROBANTE: TLongintField;
    zComprobantesPORCENTAJE: TFloatField;
    zComprobantesPUNTO_VENTA: TLongintField;
    zComprobantesTIPO: TLongintField;
    zDentistas: TZReadOnlyQuery;
    zDentistasCLINICA: TStringField;
    zDentistasDENTISTA: TStringField;
    zDentistasID_DENTISTA: TLongintField;
    zDentistasMOVIL: TStringField;
    zDentistasPORCENTAJE: TFloatField;
    zProductos: TZReadOnlyQuery;
    zProductosCATEGORIA: TLongintField;
    zProductosCODIGO_INTERNO: TLongintField;
    zProductosID_PRODUCTO: TLongintField;
    zProductosPRECIO: TFloatField;
    zProductosPRODUCTO: TStringField;
    genTrabajos: TZSequence;
    zCategorias: TZReadOnlyQuery;
    zComprobantes: TZQuery;
    seqNumeroFactura: TZSequence;
    seqNumeroRemito: TZSequence;
    seqNumeroRecibo: TZSequence;
    zCCorrientes: TZQuery;
    zLaboratoristas: TZReadOnlyQuery;
    zLineasComprobantes: TZQuery;
    zSaldoCuentaCorriente: TZReadOnlyQuery;
    zSaldoCuentaCorrienteSALDO: TFloatField;
    seqIdComprobante: TZSequence;
    zTrabajosANTAGONISTA: TStringField;
    zTrabajosCOLOR: TStringField;
    zTrabajosCOMPROBANTE_ID: TLongintField;
    zTrabajosCUENTA_CORRIENTE: TStringField;
    zTrabajosFinalizarANTAGONISTA: TStringField;
    zTrabajosFinalizarCOLOR: TStringField;
    zTrabajosFinalizarCOMPROBANTE_ID: TLongintField;
    zTrabajosFinalizarCUENTA_CORRIENTE: TStringField;
    zTrabajosFinalizarOBSERVACION: TStringField;
    zTrabajosFinalizarTareasDATO_REMITO: TStringField;
    zTrabajosFinalizarTareasDESCRIPCION: TStringField;
    zTrabajosFinalizarTareasESTIMADO_SALIDA: TDateField;
    zTrabajosFinalizarTareasFECHA_INGRESO: TDateTimeField;
    zTrabajosFinalizarTareasFECHA_SALIDA: TDateTimeField;
    zTrabajosFinalizarTareasID_TAREA: TLongintField;
    zTrabajosFinalizarTareasORDEN: TSmallintField;
    zTrabajosFinalizarTareasTERMINADO: TStringField;
    zTrabajosFinalizarTareasTIPO_TAREA_ID: TLongintField;
    zTrabajosFinalizarTareasTRABAJO_ID: TLongintField;
    zTrabajosLABORATORISTA_ID: TLongintField;
    zTrabajosOBSERVACION: TStringField;
    zTrabajosTareasSinFinalizar: TZReadOnlyQuery;
    zTrabajosFinalizarTareas: TZQuery;
    zTrabajosFinalizar: TZQuery;
    zTiposRemitos: TZTable;
    zTareasDespacho: TZQuery;
    zTareasDespachoDATO_REMITO: TStringField;
    zTareasDespachoESTIMADO_SALIDA: TDateField;
    zTareasDespachoFECHA_INGRESO: TDateTimeField;
    zTareasDespachoFECHA_SALIDA: TDateTimeField;
    zTareasDespachoID_TAREA: TLongintField;
    zTareasDespachoORDEN: TSmallintField;
    zTareasDespachoTERMINADO: TStringField;
    zTareasDespachoTIPO_TAREA_ID: TLongintField;
    zTareasDespachoTRABAJO_ID: TLongintField;
    zTareasSinFinalizar: TZQuery;
    zTareasParaVer: TZReadOnlyQuery;
    zTareasParaVerDATO_REMITO: TStringField;
    zTareasParaVerDESCRIPCION: TStringField;
    zTareasParaVerESTIMADO_SALIDA: TDateField;
    zTareasParaVerFECHA_INGRESO: TDateTimeField;
    zTareasParaVerFECHA_SALIDA: TDateTimeField;
    zTareasParaVerID_TAREA: TLongintField;
    zTareasParaVerORDEN: TSmallintField;
    zTareasParaVerTERMINADO: TDateTimeField;
    zTareasParaVerTIPO_TAREA_ID: TLongintField;
    zTareasParaVerTRABAJO_ID: TLongintField;
    zTareasSinFinalizarDATO_REMITO: TStringField;
    zTareasSinFinalizarESTIMADO_SALIDA: TDateField;
    zTareasSinFinalizarFECHA_INGRESO: TDateTimeField;
    zTareasSinFinalizarFECHA_SALIDA: TDateTimeField;
    zTareasSinFinalizarID_TAREA: TLongintField;
    zTareasSinFinalizarORDEN: TSmallintField;
    zTareasSinFinalizarTERMINADO: TStringField;
    zTareasSinFinalizarTIPO_TAREA_ID: TLongintField;
    zTareasSinFinalizarTRABAJO_ID: TLongintField;
    zTareasTERMINADO: TStringField;
    zTiposTareas: TZReadOnlyQuery;
    zRelaciones: TZReadOnlyQuery;
    zRelacionesORDEN: TSmallintField;
    zRelacionesPRODUCTO_ID: TLongintField;
    zRelacionesTIPO_TAREA_ID: TLongintField;
    zTareas: TZQuery;
    zTareasDATO_REMITO: TStringField;
    zTareasESTIMADO_SALIDA: TDateField;
    zTareasFECHA_INGRESO: TDateTimeField;
    zTareasFECHA_SALIDA: TDateTimeField;
    zTareasID_TAREA: TLongintField;
    zTareasORDEN: TSmallintField;
    zTareasTIPO_TAREA_ID: TLongintField;
    zTareasTRABAJO_ID: TLongintField;
    zTiposTareasBusqueda: TZTable;
    zTiposTareasBusquedaDESCRIPCION: TStringField;
    zTiposTareasBusquedaID_TIPO_TAREA: TLongintField;
    zTiposTareasBusquedaTIEMPO_ESTIMADO: TFloatField;
    zTiposTareasBusquedaTIENE_FECHA_SALIDA: TStringField;
    zTiposTareasDESCRIPCION: TStringField;
    zTiposTareasID_TIPO_TAREA: TLongintField;
    zTiposTareasTIEMPO_ESTIMADO: TFloatField;
    zTiposTareasTIENE_FECHA_SALIDA: TStringField;
    zTrabajos: TZQuery;
    upTrabajos: TZUpdateSQL;
    zTrabajosBusqueda: TZTable;
    zTrabajosBusquedaDENTISTA: TStringField;
    zTrabajosBusquedaDENTISTA_ID: TLongintField;
    zTrabajosBusquedaFECHA_ENTRADA: TDateTimeField;
    zTrabajosBusquedaID_TRABAJOS: TLongintField;
    zTrabajosBusquedaPACIENTE: TStringField;
    zTrabajosDENTISTA_ID: TLongintField;
    zTrabajosFECHA_ENTRADA: TDateTimeField;
    zTrabajosFECHA_SALIDA: TDateTimeField;
    zTrabajosFinalizarDENTISTA_ID: TLongintField;
    zTrabajosFinalizarFECHA_ENTRADA: TDateTimeField;
    zTrabajosFinalizarFECHA_SALIDA: TDateTimeField;
    zTrabajosFinalizarID_TRABAJOS: TLongintField;
    zTrabajosFinalizarPACIENTE: TStringField;
    zTrabajosFinalizarPRECIO: TFloatField;
    zTrabajosFinalizarPRODUCTO_ID: TLongintField;
    zTrabajosFinalizarPROXIMO_PLAZO: TDateField;
    zTrabajosID_TRABAJOS: TLongintField;
    zTrabajosPACIENTE: TStringField;
    zTrabajosPRECIO: TFloatField;
    zTrabajosPRODUCTO_ID: TLongintField;
    zTrabajosPROXIMO_PLAZO: TDateField;
    upTareas: TZUpdateSQL;
    upTareasSinFinalizar: TZUpdateSQL;
    upTareasDespacho: TZUpdateSQL;
    zTrabajosTareasSinFinalizarCANTIDAD: TLongintField;
    upComprobantes: TZUpdateSQL;
    upTrabajosFinalizar: TZUpdateSQL;
    upCCorrientes: TZUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure Abrir;
    procedure GrabarNuevoTrabajo;
    procedure CompletarTareas;
    procedure FinalizarTarea;
    procedure CargarTareasDeTrabajo;
    procedure AsignarPlazo;
    procedure EditarRemitoGuia;
    procedure FinalizarTrabajoFacturacion;
    procedure FinalizarTrabajoCuentaCorriente;
    procedure CompletarTareasSinFinalizar(cant: integer);
    procedure CompletarCuentaCorriente;
    procedure ImprimirComprobante;
    procedure GenerarFactura;
    function ObtenerSaldo(id: integer): double;

  end;

var
  dmTrabajo: TdmTrabajo;

implementation

{$R *.lfm}
{ TdmTrabajo }

procedure TdmTrabajo.DataModuleCreate(Sender: TObject);
begin
  Abrir;
end;

procedure TdmTrabajo.Abrir;
begin
  {se abre todo}
  zProductos.Open;
  zDentistas.Open;
  zTrabajos.Open;
  zCategorias.Open;
  zTareasSinFinalizar.Open;
  zTareasDespacho.Open;
  zTrabajosFinalizar.Open;
end;

procedure TdmTrabajo.GrabarNuevoTrabajo;
var
  reg: integer;
  precio: double;
begin
  {se genera el nuevo numero de id de trabajo}
  reg := genTrabajos.GetNextValue;
  {se toma el precio actual del producto (solo
  se utilizará para verificacion o control interno)}
  precio := zProductosPRECIO.AsFloat;
  {se almacenan los datos de los campos}
  zTrabajosFECHA_ENTRADA.AsDateTime := Now;
  zTrabajosID_TRABAJOS.AsInteger := reg;
  zTrabajosPRECIO.AsFloat := precio;
  {se aplican los datos}
  zTrabajos.Post;
  zTrabajos.ApplyUpdates;
end;

{carga la tabla de tareas con los nuevos trabajos que
se deberán hacer para realizar este producto}
procedure TdmTrabajo.CompletarTareas;
var
  trabajo: integer;
  tarea: integer;
  fecha: boolean;
  primero: boolean;
begin
  {bandera que nos indica se se cargó la fecha de plazo}
  fecha := False;
   {bandera que indica que es la primera tarea, y se le
   asigna la fecha de entrada}
  primero := True;
  {se verifica la tabla de relaciones y se abre}
   {if dsMaestro.Enabled then
     zTrabajos.Refresh
   else zTrabajos.Open;}

  if zRelaciones.Active then
    zRelaciones.Refresh
  else
    zRelaciones.Open;
  {se verifica la tabla de tareas y se abre}
  if zTareas.Active then
    zTareas.Refresh
  else
    zTareas.Open;
  {se verifica que tipos tareas esté cerrado}
  if zTiposTareas.Active then
    zTiposTareas.Close;

  {se guarda el numero de trabajo con el que operamos}
  trabajo := genTrabajos.GetCurrentValue;
   {se recorren todos los registros (que representan las
   tareas necesarias que tiene este tipo producto)}
  while not zRelaciones.EOF do
  begin
      {se guarda el tipo de tarea en una variable para
      manipularla mejor}
    tarea := zRelacionesTIPO_TAREA_ID.AsInteger;

    {agrego un nuevo registro en las tareas}
    zTareas.Append;
    // se carga el numero de trabajo
    zTareasTRABAJO_ID.AsInteger := trabajo;
    // se carga el tipo de tarea
    zTareasTIPO_TAREA_ID.AsInteger := tarea;
    // se le asigna un orden de realización
    zTareasORDEN.AsInteger :=
      zRelacionesORDEN.AsInteger;
    {se verifica que sea la primer tarea y se guarda fecha de ingreso}
    if primero = True then
    begin
      zTareasFECHA_INGRESO.AsDateTime := Now;
      primero := False;
    end;
      {se verifica si hay que asignar la fecha de entrega de la
      tarea, si ya no se hizo}
    if fecha = False then
    begin
          {se busca el registro con el tipo de tarea que se
          procesa cargando el parámetro}
      zTiposTareas.ParamByName(
        'REGISTRO').AsInteger := tarea;
      {se abre el query para tener el registro con el nuevo parametro}
      zTiposTareas.Open;
      {se busca si esta tarea tiene plazo de finalizacion}
      if zTiposTareasTIENE_FECHA_SALIDA.AsString = 'S' then
      begin
        { se carga el plazo de finalizacion}
        zTareasESTIMADO_SALIDA.
          AsDateTime :=
          zTrabajosPROXIMO_PLAZO.AsDateTime;
        { se cancela la carga de proximos plazos de finalizacion}
        fecha := True;
      end;
      {se cierra tipo tareas para poder cargarle nuevamente el parametro}
      zTiposTareas.Close;
    end;

    // falta recorrer para atrás y ver si no hay tareas anteriores
    // a las que asignarles plazo de entrega (o sea ver si no hay
    // tareas sin salida del laboratorio antes


    {se graban los datos de la tarea}
    zTareas.Post;
    zTareas.ApplyUpdates;
    {se pasa a la proxima relacion para agregar una nueva tarea}
    zRelaciones.Next;
  end;
   {se abren los tipos de tareas para buscar la descripción
   que se utilizará en la tabla de ver las tareas}
  zTiposTareas.Open;
  {se filtra la tabla de ver las tareas para el trabajo actual}

  {zTareasParaVer.Close;
  zTareasParaVer.Filtered := True;
  zTareasParaVer.Filter :=
    'trabajo_id = ' + IntToStr(trabajo);
  zTareasParaVer.Open;}
end;

procedure TdmTrabajo.FinalizarTarea;
begin
  // ACáFinalizamos la tarea cambiando N a S en
  zTareasSinFinalizar.Edit;
  zTareasSinFinalizarTERMINADO.AsString := 'S';
  // fecha de salida se aplica cuando sale (despacha) el trabajo.
  //zTareasSinFinalizarFECHA_SALIDA.AsDateTime := Now;
  zTareasSinFinalizar.Post;
  zTareasSinFinalizar.ApplyUpdates;
  zTareasSinFinalizar.Refresh;
end;

procedure TdmTrabajo.CargarTareasDeTrabajo;
var
  trabajo: string;
begin
  trabajo := zTareasSinFinalizarTRABAJO_ID.AsString;
  zTareas.Close;
  zTareas.Filter := 'TERMINADO = ''N'' AND TRABAJO_ID = ' + trabajo;
  zTareas.Filtered := True;
  zTareas.Open;
end;

procedure TdmTrabajo.AsignarPlazo;
var
  {dialogo para ingresar observaciones del dentista}
  DialogoObservacionDentista: TDialogoObservacionDentista;
  {contador para ver cuantas tareas hay que
   recorrer para atras y ponerles fecha}
  contador: integer;
  {numero de tipo de tareas}
  tarea: integer;
  {total de tareas que hay que retroceder}
  Total: integer;
  {plazo de entrega}
  fecha_entrega: TDate;

  fecha_aux: TDate;
begin
  {cargamos las tareas del trabajo para poder recorrerlas y ponerles fecha}
  CargarTareasDeTrabajo;

  {abre dialogo para elegir fecha}
  DialogoCalendario.Date := Now + 1;
  if DialogoCalendario.Execute then
  begin
    fecha_entrega := DialogoCalendario.Date;

    contador := 0;
    zTiposTareas.Close;
    {recorremos las tareas del trabajo para encontrar la que tiene plazo y
    se completa el plazo para las anteriores}
    while not zTareas.EOF do
    begin
      tarea := zTareasTIPO_TAREA_ID.AsInteger;
      {se busca el registro con el tipo de tarea que se
      procesa cargando el parámetro}
      zTiposTareas.ParamByName('REGISTRO').AsInteger := tarea;
      {se abre el query para tener el registro con el nuevo parametro}
      zTiposTareas.Open;
      {se busca si esta tarea tiene plazo de finalizacion}
      if zTiposTareasTIENE_FECHA_SALIDA.AsString = 'S' then
      begin
        {se carga el plazo de finalizacion}
        zTareas.Edit;
        zTareasESTIMADO_SALIDA.AsDateTime := fecha_entrega;
        zTareasFECHA_INGRESO.AsDateTime := Now;
        zTareas.Post;

        {se anula porque se saca la observacion del tabla tareas, se muda a trabajos}
        {zTareas.Edit;
        DialogoObservacionDentista := TDialogoObservacionDentista.Create(self);
        if DialogoObservacionDentista.ShowModal = mrOk then
          zTareas.Post
        else
          zTareas.Cancel;
        DialogoObservacionDentista.Release;}

        {recorre para atrás las tareas intermedias que no
        tienen salida y les asigna fecha decreciente en 1 día}

        Total := contador;
        {fecha anterior para ir cargando hacia atras (despues se corrige si es sabado o domingo)}
        fecha_aux := fecha_entrega - 1;
        while (contador > 0) do
        begin
          zTareas.Prior;
          zTareas.Edit;
          //verifica si es domingo y cirre todo al viernes
          if (DayOfWeek(fecha_aux) = 1) then
          begin
            fecha_aux := fecha_aux - 2;
            fecha_entrega := -2;
          end;
          //verifica si es sabado y cirre todo al viernes
          if (DayOfWeek(fecha_aux) = 7) then
          begin
            fecha_aux := fecha_aux - 1;
            fecha_entrega := -1;
          end;
          zTareasESTIMADO_SALIDA.AsDateTime := fecha_aux;
          zTareasFECHA_INGRESO.AsDateTime := Now;
          zTareas.Post;
          fecha_aux:=fecha_aux - 1;
          contador := contador - 1;
        end;
        //vamos al final para salir de la tabla
        zTareas.ApplyUpdates;
        zTareas.Last;
      end;
      contador := contador + 1;
      {se cierra tipo tareas para poder cargarle nuevamente el parametro}
      zTiposTareas.Close;
      zTareas.Next;
    end;
    zTareasSinFinalizar.Refresh;
  end;
end;

procedure TdmTrabajo.EditarRemitoGuia;
var
  DialogoRemitoGuia: TDialogoRemitoGuia;
begin
  zTiposRemitos.Open;
  DialogoRemitoGuia := TDialogoRemitoGuia.Create(self);
  if DialogoRemitoGuia.ShowModal = mrOk then
  begin
    zTareasDespachoFECHA_SALIDA.AsDateTime := Now;
    zTareasDespacho.Post;
  end
  else
    zTareasDespacho.Cancel;
  zTareasDespacho.ApplyUpdates;
  DialogoRemitoGuia.Release;
  zTiposRemitos.Close;
end;

procedure TdmTrabajo.FinalizarTrabajoFacturacion;
var
  id: integer;
  cantidad: integer;
  VentanaInput: TTrabajosFinalizarInput;
begin
  VentanaInput := TTrabajosFinalizarInput.Create(self);
  VentanaInput.Caption := 'Verifique datos a cargar en FACTURA';
  // filtramos las tareas del trabajo y buscamos cuantas están sin finalizar
  id := zTrabajosFinalizarID_TRABAJOS.AsInteger;
  zTrabajosFinalizarTareas.Close;
  zTrabajosTareasSinFinalizar.Close;
  zTrabajosFinalizarTareas.ParamByName('ID').AsInteger := id;
  zTrabajosTareasSinFinalizar.ParamByName('ID').AsInteger := id;
  zTrabajosFinalizarTareas.Open;
  zTrabajosTareasSinFinalizar.Open;
  // se abre la ventana de edición
  cantidad := zTrabajosTareasSinFinalizarCANTIDAD.AsInteger;
  // 1º hay que controlar y modificar bien las tareas del trabajo
  // si no se finalizan las tareas no se hace nada !!!!! y se sigue finalizando el trabajo
  if cantidad > 0 then
  begin
    if VentanaInput.ShowModal = mrOk then
        CompletarTareasSinFinalizar(cantidad)
    else
      // se cancelan todos los cambios
      zTrabajosTareasSinFinalizar.Close;
  end;
  VentanaInput.Release;

  GenerarFactura;
  // debe contene1r a impresión del comprobante (opcional)
  ImprimirComprobante;
 end;

procedure TdmTrabajo.FinalizarTrabajoCuentaCorriente;
var
  id: integer;
  cantidad: integer;
  VentanaInput: TTrabajosFinalizarInput;
begin
  VentanaInput := TTrabajosFinalizarInput.Create(self);
  VentanaInput.Caption := 'Verifique datos a cargar en CC';
  // filtramos las tareas del trabajo y buscamos cuantas están sin finalizar
  id := zTrabajosFinalizarID_TRABAJOS.AsInteger;
  zTrabajosFinalizarTareas.Close;
  zTrabajosTareasSinFinalizar.Close;
  zTrabajosFinalizarTareas.ParamByName('ID').AsInteger := id;
  zTrabajosTareasSinFinalizar.ParamByName('ID').AsInteger := id;
  zTrabajosFinalizarTareas.Open;
  zTrabajosTareasSinFinalizar.Open;
  // se calculan la cantidad de tareas sin finalizar del trabajo
  cantidad := zTrabajosTareasSinFinalizarCANTIDAD.AsInteger;
  if cantidad > 0 then
  begin
    // se abre la ventana de edición
    if VentanaInput.ShowModal = mrOk then
       // 1º hay que controlar y modificar bien las tareas del trabajo
       // si no se finalizan las tareas no se hace nada !!!!! y se sigue finalizando el trabajo
       CompletarTareasSinFinalizar(cantidad)
    else
    // se cancelan todos los cambios
    zTrabajosTareasSinFinalizar.Close;
  end;
  // se libera la ventana de edición del trabajo
  VentanaInput.Release;
  // hacer la entrada en la cuenta corriente
  CompletarCuentaCorriente;
end;

procedure TdmTrabajo.CompletarTareasSinFinalizar(cant: integer);
begin
  if MessageDlg('¡Atencion!', 'Hay ' + IntToStr(cant) +
    'tareas del trabajo sin finalizar!. Desea finalizarlas con fecha de hoy?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    // comenzamos a recorrer los registros desde el principio
  begin
    zTrabajosFinalizarTareas.First;
    // hata llegar al final
    while not zTrabajosFinalizarTareas.EOF do
    begin
      // si la tarea no está terminada la finalizamos
      if zTrabajosFinalizarTareasTERMINADO.AsString = 'N' then
        FinalizarTarea;
      // pasamos a la siguiente para seguir
      zTrabajosFinalizarTareas.Next;
    end;
  end
  else
    ShowMessage(
      'No se finalizaron las tareas, igualmente se procedera a finalizar el trabajo, pero no es lo recomendado');
end;

procedure TdmTrabajo.CompletarCuentaCorriente;
var
  AsentarCC: TDialogoRemito;
  id: integer;
  cliente: integer;
  importe: double;
  //   CREAR UN NUEVO DIALOGO PARA CUENTA CORRIENTE
begin
  zComprobantes.Open;
  zCCorrientes.Open;
  // se agrega un nuevo registro y se completan los campos con los valores obtenidos y algunos fijos
  zComprobantes.Insert;
  // 1= Factura - 2=Remito(p/C.Corriente)
  zComprobantesTIPO.AsInteger := 2;
  // despues hay que hacer un generador para ir guardando el último valor
  //zComprobantesNUMERO_COMPROBANTE.AsInteger:=1000;
  zComprobantesNUMERO_COMPROBANTE.AsInteger := seqNumeroRemito.GetNextValue;
  // De momento hoy, despues se ve si es necesario agregar un selector
  zComprobantesFECHA.AsDateTime := Now;
  // de momento solo odonologos
  zComprobantesCLIENTE_ID.AsInteger := zTrabajosFinalizarDENTISTA_ID.AsInteger;
  // Por omision 1 (no implementado aún)
  zComprobantesPUNTO_VENTA.AsInteger := 1;
  // Por omisión 1 (no implementado aún)
  zComprobantesCAJERO.AsInteger := 1;
  // (no implementado) 0=C.Corriente - 1=contado - 2= T.Debito - 3=T.Credito - 4=cheque
  zComprobantesFORMA_PAGO.AsInteger := 0;

  //zComprobantesTRABAJO_ID.AsInteger:=zTrabajosFinalizarID_TRABAJOS.AsInteger;
  zComprobantesPORCENTAJE.AsFloat := PORCENTAJE.AsFloat;

  importe := zTrabajosFinalizarPRECIO.AsFloat * (1 + PORCENTAJE.AsFloat / 100.0);
  zComprobantesIMPORTE_TOTAL.AsFloat := importe;

  AsentarCC := TDialogoRemito.Create(self);
  AsentarCC.Caption := 'Cuenta Corriente';
  if AsentarCC.ShowModal = mrOk then
  begin
    // casting que hago para que no me de error por haber sido marcado como currency
    zComprobantesIMPORTE_TOTAL.AsFloat := zComprobantesIMPORTE_TOTAL.AsFloat;
    zComprobantes.Post;
    zComprobantes.ApplyUpdates;
    //zComprobantes.Refresh;

    id := seqIdComprobante.GetCurrentValue;
    cliente := zTrabajosFinalizarDENTISTA_ID.AsInteger;
    // se graba la fecha de salida en el trabajo (que lo marca como finalizado)
    zTrabajosFinalizar.Edit;
    zTrabajosFinalizarFECHA_SALIDA.AsDateTime := Now;
    zTrabajosFinalizarCUENTA_CORRIENTE.AsString := 'S';
    zTrabajosFinalizarCOMPROBANTE_ID.AsInteger := id;
    zTrabajosFinalizar.Post;
    zTrabajosFinalizar.ApplyUpdates;

    {ShowMessage('ID DE COMPROBANTE:' + IntToStr(id) + #13 + 'ID DE CLIENTE:' +
      IntToStr(cliente) + #13 + 'IMPORTE:' + FloatToStr(importe));}

    // ahora se cargan los datos en la cuenta corriente
    zCCorrientes.Insert;
    zCCorrientesCOMPR_DEBITO_ID.AsInteger := id;
    zCCorrientesCLIENTE_ID.AsInteger := cliente;
    zCCorrientesIMPORTE_COMPR_DEB.AsFloat := zComprobantesIMPORTE_TOTAL.AsFloat;
    {
    **********************
    zCCorrientesRECIBO_PAGO_ID.AsInteger := 0;
    zCCorrientesIMPORTE_RECIBO_PAGO.AsFloat := 0;
    ***********************
    }
    zCCorrientesFECHA_HORA.AsDateTime := Now;
    zCCorrientesSALDO.AsFloat :=
      ObtenerSaldo(zCCorrientesCLIENTE_ID.AsInteger) + zCCorrientesIMPORTE_COMPR_DEB.AsFloat;
    zCCorrientes.Post;
    zCCorrientes.ApplyUpdates;
  end
  else
    zComprobantes.Cancel;
  AsentarCC.Release;
  zComprobantes.Close;
  zCCorrientes.Close;
  zTrabajosFinalizar.Refresh;
end;

procedure TdmTrabajo.ImprimirComprobante;
begin
  // **************************************************************************************
  // ACA HAY IMPLEMENTAR LA GENERACIÓN DE LA FACTURA (AUNQUE MAS NO SEA UN PDF EN UN SUBDIRECTORIO)
  // DE MOMENTO NO SE HACE NADA
  // **************************************************************************************
end;

procedure TdmTrabajo.GenerarFactura;
var
  Facturar: TDialogoFacturaC;
begin
  zComprobantes.Open;
  // se agrega un nuevo registro y se completan los campos con los valores obtenidos y algunos fijos
  zComprobantes.Insert;
  // 1= Factura - 2=Remito(p/C.Corriente)
  zComprobantesTIPO.AsInteger := 1;
  // despues hay que hacer un generador para ir guardando el último valor
  // zComprobantesNUMERO_COMPROBANTE.AsInteger:=1000;
  zComprobantesNUMERO_COMPROBANTE.AsInteger := seqNumeroFactura.GetNextValue;
  // De momento hoy, despues se ve si es necesario agregar un selector
  zComprobantesFECHA.AsDateTime := Now;
  // de momento solo odonologos
  zComprobantesCLIENTE_ID.AsInteger := zTrabajosFinalizarDENTISTA_ID.AsInteger;
  // Por omision 1 (no implementado aún)
  zComprobantesPUNTO_VENTA.AsInteger := 1;
  // Por omisión 1 (no implementado aún)
  zComprobantesCAJERO.AsInteger := 1;
  // (no implementado) 1=contado - 2= T.Debito - 3=T.Credito - 4=cheque
  zComprobantesFORMA_PAGO.AsInteger := 1;

  //zComprobantesTRABAJO_ID.AsInteger:=zTrabajosFinalizarID_TRABAJOS.AsInteger;
  zComprobantesPORCENTAJE.AsFloat := PORCENTAJE.AsFloat;
  zComprobantesIMPORTE_TOTAL.AsFloat := zTrabajosFinalizarPRECIO.AsFloat *
    (1 + PORCENTAJE.AsFloat / 100.0);
  //seqIdComprobante.GetCurrentValue+1;
  zLineasComprobantes.Open;

  zTrabajosFinalizar.Edit;
  zTrabajosFinalizarFECHA_SALIDA.AsDateTime := Now;

  zComprobantesIMPORTE_TOTAL.AsFloat := zComprobantesIMPORTE_TOTAL.AsFloat;

  Facturar := TDialogoFacturaC.Create(self);
  if Facturar.ShowModal = mrOk then
  begin
    // se graba la fecha de salida en el trabajo (que lo marca como finalizado)
    zTrabajosFinalizar.Post;
    zTrabajosFinalizar.ApplyUpdates;
    // casting que hago para que no me de error por haber sido marcado como currency
    zComprobantes.Post;
    zComprobantes.ApplyUpdates;
  end
  else
    zComprobantes.CancelUpdates;
    zTrabajosFinalizar.CancelUpdates;
  Facturar.Release;

  zComprobantes.Close;
  zTrabajosFinalizar.Close;
  zLineasComprobantes.Close;
end;

function TdmTrabajo.ObtenerSaldo(id: integer): double;
begin
  zSaldoCuentaCorriente.Close;
  zSaldoCuentaCorriente.ParamByName('ID').AsInteger := id;
  zSaldoCuentaCorriente.Open;
  Result := zSaldoCuentaCorrienteSALDO.AsFloat;
end;

end.
