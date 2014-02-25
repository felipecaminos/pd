program protesicodental;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, principal, conexion_dm, base_input, base_abm, pl_rx, pl_luicontrols,
  printer4lazarus, pl_zeosdbo, provincias_dm, provincias_abm, acercade,
  ciudades_dm, ciudades_input, ciudades_abm, dentistas_dm, provincias_input,
  dentistas_input, dentistas_abm, productos_dm, productos_input, productos_abm,
  contactos_dm, contactos_input, contactos_abm, contactos_listado, iva_dm,
  iva_input, iva_abm, HtmlHelp2Viewer, categoriaproductos_dm,
  categoriaproductos_input, categoriaproductos_abm, trabajo_dm, trabajo_nuevo,
  agenda_dm, agenda_seleccion, agenda_fecha_input, agenda_tarea_input,
  trabajo_tareas_finalizar, trabajo_tareas_dm, trabajo_tareas,
  trabajo_tareas_asignarplazos, trabajo_tareas_despacho,
  trabajo_dialogo_remitoguia, trabajo_dialogo_obs_dentista, trabajo_finalizar,
  trabajo_finalizar_input, trabajo_dialogo_facturacion,
  cuentas_corrientes_listado, cuentas_corrientes_dm, aaaa_unit_pruebas,
  base_form_maestro, trabajo_dialogo_factura, trabajo_dialogo_remito,
  cuentas_corrientes_facturacion, cuentes_corrientes_pagos,
  cuentas_corrientes_dialogo_recibo, uConvertirALetras;

{$R *.res}

begin
  Application.Title:='protesyx';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TdmConexion, dmConexion);
  Application.CreateForm(THelpViewerForm, HelpViewerForm);
  Application.Run;
end.
