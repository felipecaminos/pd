unit principal;

{$mode objfpc}{$H+}
{ TODO -cTAREAS DE TRABAJOS :
Protesis Removible
Impresion/Modelo            ->  Cubeta                      (S)
Imp./Mod. Definitivo        ->  Rodete                      (S)
Rod. c/ placa de oclusión   ->  Montar en articulador
                                Enfilado
                            ->  Encerado                    (S)
Encerado Probado            ->  Encerado Definitivo
                                Retenedores
                                Puesta en mufla
                                Desgaste y pulido           (S)

Cromo Cobalto
Impresion/Modelo            ->  Cubeta                      (S)
Imp./Mod. Definitivo        ->  A lab. de Metales
                                Rodete s/ Cromo             (S)
Rod. c/ placa de oclusión   ->  Montaje
                                Enfilado                    (S)
Encerado Probado            ->  Encerado Definitivo
                                Puesta en mufla
                                Desgaste y pulido           (S)
}
{ TODO 1 -cPedidos : Ir pensando el tema de pedido a proveedores (estilo de Sarriguren, donde se tiene un listado "fijo/mas pedidos/recientes" de productos y solo se completa la cantidad de cada uno -separado por proveedores-).
En principio se genera nuevo pedido sin fecha y al asignarle la fecha se lo da por pasado a proveedor. También hay que hacer control de lo que llega para anotar el faltante y agregarlo al proximo pedido. }

interface

uses
  SysUtils, PrintersDlgs, Forms, base_form_maestro, Controls, Menus, ComCtrls, ExtCtrls, Buttons,
  StdCtrls, XMLPropStorage, LazHelpHTML, HelpIntfs, dentistas_abm,
  productos_abm, contactos_abm, contactos_listado, iva_abm,
  categoriaproductos_abm, trabajo_nuevo, agenda_seleccion,
  trabajo_tareas_finalizar, trabajo_tareas, HtmlHelp2Viewer, provincias_abm,
  acercade, ciudades_abm, Classes, trabajo_tareas_asignarplazos,
  trabajo_tareas_despacho, trabajo_finalizar, cuentas_corrientes_listado;

type

  { TFormPrincipal }

  TFormPrincipal = class(TFormMaestro)
    BitBtn10: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    HTMLBrowserHelpViewer1: THTMLBrowserHelpViewer;
    HTMLHelpDatabase1: THTMLHelpDatabase;
    ImageList1: TImageList;
    ImagenFondo: TImage;
    Label1: TLabel;
    MenuArchivo: TMenuItem;
    MenuAyuda: TMenuItem;
    Itemsalir: TMenuItem;
    ItemAcercade: TMenuItem;
    ItemAyuda: TMenuItem;
    ItemIVA: TMenuItem;
    ItemABMCiudades: TMenuItem;
    ItemABMProvincias: TMenuItem;
    ItemABMContactos: TMenuItem;
    ItemABMDentistas: TMenuItem;
    ItemABMProductos: TMenuItem;
    MenuImpresion: TMenuItem;
    ItemListadoContactos: TMenuItem;
    ItemConfigImpresora: TMenuItem;
    ItemSeleccionarImpresora: TMenuItem;
    ItemCatProductos: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    ItemNuevoTrabajo: TMenuItem;
    ItemAgenda: TMenuItem;
    ItemTrabajosTareas: TMenuItem;
    ItemFinTrabajo: TMenuItem;
    ItemListaCC: TMenuItem;
    ItemRealizarPago: TMenuItem;
    MenuItem4: TMenuItem;
    ItemDespachoTarea: TMenuItem;
    ItemNuevaTareaTrabajo: TMenuItem;
    ItemFinalizarTarea: TMenuItem;
    MenuItemAgenda: TMenuItem;
    MenuCuentasCorrientes: TMenuItem;
    MenuGestionDatos: TMenuItem;
    MenuPrincipal: TMainMenu;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Configuracion: TXMLPropStorage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ItemABMProductosClick(Sender: TObject);
    procedure ItemABMCiudadesClick(Sender: TObject);
    procedure ItemABMProvinciasClick(Sender: TObject);
    procedure ItemAcercadeClick(Sender: TObject);
    procedure ItemAgendaClick(Sender: TObject);
    procedure ItemAyudaClick(Sender: TObject);
    procedure ItemCatProductosClick(Sender: TObject);
    procedure ItemConfigImpresoraClick(Sender: TObject);
    procedure ItemListaCCClick(Sender: TObject);
    procedure ItemFinalizarTareaClick(Sender: TObject);
    procedure ItemFinTrabajoClick(Sender: TObject);
    procedure ItemListadoContactosClick(Sender: TObject);
    procedure ItemNuevoTrabajoClick(Sender: TObject);
    procedure ItemRealizarPagoClick(Sender: TObject);
    procedure ItemsalirClick(Sender: TObject);
    procedure ItemABMDentistasClick(Sender: TObject);
    procedure ItemABMContactosClick(Sender: TObject);
    procedure ItemIVAClick(Sender: TObject);
    procedure ItemSeleccionarImpresoraClick(Sender: TObject);
    procedure ItemTrabajosTareasClick(Sender: TObject);
    procedure ItemDespachoTareaClick(Sender: TObject);
    procedure ItemNuevaTareaTrabajoClick(Sender: TObject);
    procedure MenuCuentasCorrientesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses cuentes_corrientes_pagos;

{$R *.lfm}

{ TFormPrincipal }

function DimeDirectorio(): string;
var
  directorio: string;
begin
  directorio := GetCurrentDir;
  {$IFDEF WIN32}
  Result := directorio + '\';
  {$ENDIF}
  {$IFDEF WIN64}
  Result := directorio + '\';
  {$ENDIF}
  {$IFDEF LINUX}
  Result := directorio + '/';
  {$ENDIF}

end;

function DimeDirectorioAyuda(): string;
var
  dir_ayuda: string;
begin
  dir_ayuda := 'file://' + DimeDirectorio();
  {$IFDEF WIN32}
  Result := dir_ayuda + 'ayuda\';
  {$ENDIF}
  {$IFDEF WIN64}
  Result := dir_ayuda + 'ayuda\';
  {$ENDIF}
  {$IFDEF LINUX}
  Result := dir_ayuda + 'ayuda/';
  {$ENDIF}
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
var
  hoy: TDate;
begin
  // This registers the help viewer
  HTMLHelpDatabase1.BaseURL := DimeDirectorioAyuda();
  HtmlHelp2Viewer.RegisterHelpViewer;
  //Caption := DimeDirectorioAyuda();
  Timer1Timer(self);
  hoy := date;
  {case DayOfWeek(hoy) of
    2: Label1.Caption:='lunes';
    3: Label1.Caption:='martes';
    4: Label1.Caption:='miercoles';
    5: Label1.Caption:='jueves';
    6: Label1.Caption:='viernes';
    7: Label1.Caption:='sabado';
    1: Label1.Caption:='domingo';
  end;}
  if DateToStr(hoy) = '24/12/13' then
    Caption := '¡¡¡ FELIZ NAVIDAD !!!';
  if DateToStr(hoy) = '31/12/13' then
    Caption := '¡¡¡ FELIZ AÑO NUEVO !!!';
  if DateToStr(hoy) = '24/12/13' then
    Caption := 'AÑO NUEVO, VIDA NUEVA!!!!';
  if DateToStr(hoy) = '06/05/14' then
    Label1.Caption := '¡Comprar regalo a tu hermana!';
  if DateToStr(hoy) = '07/05/14' then
    Label1.Caption := '¡¡¡¡ CUMPLE DE LAS GORDIS !!!';
  if DateToStr(hoy) = '20/02/14' then
    Caption := '¡¡HAY QUE COMPRAR REGALO A FELIPE!!';
  if DateToStr(hoy) = '24/02/14' then
    Caption := '¡¡HAY QUE COMPRAR REGALO A FELIPE!!';
  if DateToStr(hoy) = '25/02/14' then
    Caption := '¡¡HAY QUE COMPRAR REGALO A FELIPE!!';
  if DateToStr(hoy) = '26/02/14' then
    Label1.Caption := '¡¡Cumpleaños de Felipe!!';
  //Label1.Caption := DateToStr(hoy);
end;

procedure TFormPrincipal.FormDestroy(Sender: TObject);
begin
  Release;
end;

procedure TFormPrincipal.ItemABMProductosClick(Sender: TObject);
var
  VentanaProductos: TProductosABM;
begin
  VentanaProductos := TProductosABM.Create(self);
  VentanaProductos.ShowModal;
  VentanaProductos.Release;
end;

procedure TFormPrincipal.ItemABMCiudadesClick(Sender: TObject);
var
  VentanaCiudades: TCiudadesABM;
begin
  VentanaCiudades := TCiudadesABM.Create(self);
  VentanaCiudades.ShowModal;
  VentanaCiudades.Release;
end;

procedure TFormPrincipal.ItemABMProvinciasClick(Sender: TObject);
var
  VentanaProvincias: TProvinciasABM;
begin
  VentanaProvincias := TProvinciasABM.Create(self);
  VentanaProvincias.ShowModal;
  VentanaProvincias.Release;
end;

procedure TFormPrincipal.ItemAcercadeClick(Sender: TObject);
var
  VentanaAcercaDe: TFAcercaDe;
begin
  VentanaAcercaDe := TFAcercaDe.Create(self);
  VentanaAcercaDe.ShowModal;
  VentanaAcercaDe.Release;
end;

procedure TFormPrincipal.ItemAgendaClick(Sender: TObject);
var
  VentanaAgenda: TAgenda;
begin
  VentanaAgenda := TAgenda.Create(self);
  VentanaAgenda.ShowModal;
  VentanaAgenda.Release;
end;

procedure TFormPrincipal.ItemAyudaClick(Sender: TObject);
begin
  ShowHelpOrErrorForKeyword('', 'HTML/index.html');
end;

procedure TFormPrincipal.ItemCatProductosClick(Sender: TObject);
var
  VentanaCatProductos: TCatProductosABM;
begin
  VentanaCatProductos := TCatProductosABM.Create(self);
  VentanaCatProductos.ShowModal;
  VentanaCatProductos.Release;
end;

procedure TFormPrincipal.ItemConfigImpresoraClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFormPrincipal.ItemListaCCClick(Sender: TObject);
var
  CuentasCorrientes: TCuentasCorrientes;
begin
  CuentasCorrientes:=TCuentasCorrientes.Create(self);
  CuentasCorrientes.ShowModal;
  CuentasCorrientes.Release;
end;

procedure TFormPrincipal.ItemFinalizarTareaClick(Sender: TObject);
var
  FinTarea: TTareaFinalizar;
begin
  FinTarea := TTareaFinalizar.Create(self);
  FinTarea.ShowModal;
  FinTarea.Release;
end;

procedure TFormPrincipal.ItemFinTrabajoClick(Sender: TObject);
var
  FinalizarTrabajos: TTrabajoFinalizar;
begin
  FinalizarTrabajos := TTrabajoFinalizar.Create(self);
  FinalizarTrabajos.ShowModal;
  FinalizarTrabajos.Release;
end;

procedure TFormPrincipal.ItemListadoContactosClick(Sender: TObject);
var
  ListadoContactos: TListadoContactos;
begin
  ListadoContactos := TListadoContactos.Create(self);
  ListadoContactos.ShowModal;
  ListadoContactos.Release;
end;

procedure TFormPrincipal.ItemNuevoTrabajoClick(Sender: TObject);
var
  NuevoTrabajo: TTrabajoNuevo;
begin
  NuevoTrabajo := TTrabajoNuevo.Create(self);
  NuevoTrabajo.ShowModal;
  NuevoTrabajo.Release;
end;

procedure TFormPrincipal.ItemRealizarPagoClick(Sender: TObject);
var
  VentanaPagos: TCuentasCorrientesPagos;
begin
  VentanaPagos := TCuentasCorrientesPagos.Create(self);
  VentanaPagos.ShowModal;
  VentanaPagos.Release;
end;

procedure TFormPrincipal.ItemsalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPrincipal.ItemABMDentistasClick(Sender: TObject);
var
  VentanaDentistas: TDentistasABM;
begin
  VentanaDentistas := TDentistasABM.Create(self);
  VentanaDentistas.ShowModal;
  VentanaDentistas.Release;
end;

procedure TFormPrincipal.ItemABMContactosClick(Sender: TObject);
var
  VentanaContactos: TContactosABM;
begin
  VentanaContactos := TContactosABM.Create(self);
  VentanaContactos.ShowModal;
  VentanaContactos.Release;
end;

procedure TFormPrincipal.ItemIVAClick(Sender: TObject);
var
  VentanaIVA: TIVAABM;
begin
  VentanaIVA := TIVAABM.Create(self);
  VentanaIVA.ShowModal;
  VentanaIVA.Release;
end;

procedure TFormPrincipal.ItemSeleccionarImpresoraClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFormPrincipal.ItemTrabajosTareasClick(Sender: TObject);
var
  VentanaTrabajosTareas: TTrabajosYTareas;
begin
  VentanaTrabajosTareas := TTrabajosYTareas.Create(self);
  VentanaTrabajosTareas.ShowModal;
  VentanaTrabajosTareas.Release;
end;

procedure TFormPrincipal.ItemDespachoTareaClick(Sender: TObject);
// formulario de despacho de tareas (agrega timestamp y guia de despacho)
var
  VentanaDespacho: TTareasDespacho;
begin
  VentanaDespacho := TTareasDespacho.Create(self);
  VentanaDespacho.ShowModal;
  VentanaDespacho.Release;
end;

procedure TFormPrincipal.ItemNuevaTareaTrabajoClick(Sender: TObject);
var
  EstablecerPlazo: TTareasEstablecerPlazo;
begin
  EstablecerPlazo := TTareasEstablecerPlazo.Create(self);
  EstablecerPlazo.ShowModal;
  EstablecerPlazo.Release;
end;

procedure TFormPrincipal.MenuCuentasCorrientesClick(Sender: TObject);
begin

end;

procedure TFormPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := FormatDateTime('ddddd --- hh:mm:ss ', Now);
end;

end.
