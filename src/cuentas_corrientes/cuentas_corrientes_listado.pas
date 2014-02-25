unit cuentas_corrientes_listado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, FileUtil, Forms, base_form_maestro, Controls,
  Graphics, Dialogs, DBGrids,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, cuentas_corrientes_dm;

type

  { TCuentasCorrientes }

  TCuentasCorrientes = class(TFormMaestro)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    dsSaldo: TDataSource;
    DBText1: TDBText;
    dsDentistas: TDataSource;
    dsCuentasCorrientes: TDataSource;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Facturar: TBitBtn;
    ItemsFacturar: TLabel;
    Lista: TListBox;
    Panel1: TPanel;
    Saldo: TLabel;
    Odontologo: TLabel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBLookupComboBox1Change(Sender: TObject);
    procedure FacturarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListaDblClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure AgregarALista;
    procedure AgregarLinea;
  end;

var
  CuentasCorrientes: TCuentasCorrientes;
  dmCCorrientes: TdmCuentasCorrientes;

implementation

{$R *.lfm}

{ TCuentasCorrientes }

procedure TCuentasCorrientes.FormCreate(Sender: TObject);
begin
  dmCCorrientes := TdmCuentasCorrientes.Create(self);
end;

procedure TCuentasCorrientes.DBLookupComboBox1Change(Sender: TObject);
var
  cadena: string;
begin
  if DBLookupComboBox1.KeyValue > 0 then
  begin
    dmCCorrientes.FiltrarPorDentista(integer(DBLookupComboBox1.KeyValue));
    if dsCuentasCorrientes.DataSet.RecordCount = 0 then
    begin
      Facturar.Enabled := False;
      DBGrid1.Enabled := False;
    end
    else
    begin
      Facturar.Enabled := True;
      DBGrid1.Visible := True;
      DBGrid1.Enabled := True;
      Lista.Visible := True;
    end;
    Lista.Clear;
    Lista.Enabled := False;
  end
  else
    Close;
end;

procedure TCuentasCorrientes.FacturarClick(Sender: TObject);
begin
  // Generar Nuevo Comprobante TIPO = 1 (factura)
  // obtener ID nuevo comprobante
  // completar registros con el ID de remito (o varios) y el ID_TRABAJO y el ID_PRODUCTO
  //           uno por uno y si no corresponde a un trabajo se puede facturar solo el producto
  dmCCorrientes.NuevaFactura(Lista.Items);
  DBLookupComboBox1Change(self);
end;

procedure TCuentasCorrientes.DBGrid1DblClick(Sender: TObject);
begin
  AgregarALista;
end;

procedure TCuentasCorrientes.FormDestroy(Sender: TObject);
begin
  dmCCorrientes.Free;
end;

procedure TCuentasCorrientes.ListaDblClick(Sender: TObject);
begin
  Lista.Items.Delete(Lista.Items.IndexOf(Lista.GetSelectedText));
  if Lista.Count = 0 then
    Lista.Enabled := False;
end;

procedure TCuentasCorrientes.AgregarALista;
var
  remito: string;
  facturado: string;
  cont: integer;
  indice: integer;
begin
  Lista.Enabled := True;
  {toma el nro de remito para facturar}
  remito := dsCuentasCorrientes.DataSet.FieldByName('COMPR_DEBITO_ID').AsString;
  facturado := dsCuentasCorrientes.DataSet.FieldByName('FACTURADO').AsString;
  cont := 0;
  indice := 0;
  {verifica que el producto ya no esté facturado}
  if facturado = 'S' then
  begin
    MessageDlg('¡¡ El producto ya ha sido facturado, no se puede volver a facturar !!',
      mtError, [mbOK], 0);
    indice := 1;
  end;
  {recorre la lista de remitos para ver que ya no se encuentre seleccionado}
  while cont < Lista.Count do
  begin
    if Lista.Items.Strings[cont] = remito then
    begin
      MessageDlg('¡¡ El producto ya se encuentra en la lista de facturación !!',
        mtError, [mbOK], 0);
      indice := 1;
    end;
    cont := cont + 1;
  end;
  {si esta todo bien, agrega el remito}
  if indice = 0 then
    Indice := Lista.Items.Add(remito);
  {if Lista.Count = 0 then
    Indice := Lista.Items.Add(remito);}
end;

procedure TCuentasCorrientes.AgregarLinea;
begin
  // no se puede, hay que recorrer el zcuentascorrientes después de confirmada la facturacion
  {dsCuentasCorrientes.DataSet.Edit;
  dsCuentasCorrientes.DataSet.FieldByName('FACTURADO').AsString := 'S';
  dsCuentasCorrientes.DataSet.Post;}
end;

end.
