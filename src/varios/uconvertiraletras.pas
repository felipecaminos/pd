unit uConvertirALetras;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  TALetras = Class (TObject)
    private
    public
      function Numero(Number :string; sepDecimal :string; sMoney :string):string;
  end;
const
  Unidad = 1;
  Decena = 10;
  Centena = 100;

implementation

function TALetras.Numero(Number :string; sepDecimal :String; sMoney :String):String;
begin

end;

end.

{

      String  V[] = initVector(), s = "", z = "", c = "", e = " ", t;
      int l = Number.length(), k = Number.indexOf( sepDecimal ), u = 1, n = 0, j = 0, b = 0, d, p, r;

      try{
           //obtiene los decimales
            if( k >= 0 ) { c = Number.substring( k + 1, l );  l = k; }

            if ( l <= 15 )
            {
                        for( int i = l ; i >= 1; i-- ){
                            d = Integer.parseInt( String.valueOf( Number.charAt( i - 1 ) ));
                            n = ( d * u ) + n;

                                switch( u ){
                                    case Unidad:
                                        s = V[ n ];
                                        if ( i == l && n == 1 ) b++;
                                    break;
                     case Decena:
                                        p = d - 2;

                                        if( p < 0 )
                                            s = V[ n ];
                                        else{
                                            t =  V[ 20 + p ];

                                            if( n % 10 != 0 )
                                               s  =  (d == 2)? "veinti" + s : t + " y " + s;
                                            else
                                               s = t;
                                         }
                                    break;
                                    case Centena:
                                       p = d - 1;
                                       t = V[ 30 + p ];

                                       if( n % 100  == 0 )
                                       { s = ""; e = ""; }
                                       else
                                         if( d == 1 ) t += "to";

                                       s = t + e + s;
                                       z = ( s + z );
                                    break;
                                }

                                e = " ";
                              //ini. calcula los miles, millones, billones
                                r = l - i;
                                if( r > 0 && r % 3 == 0  ){
                                        p = ( r > 2 )?  2 : j++ & 1;
                                        t = V[ 40 + p ];

                                        if( p > 0 )
                                           if( ( n == 1 && i > 1 ) || n > 1  ) t += "es";

                                        z = e + t + e + z;
                                }
                              //fin.

                               //reinicia las variables
                               if ( u == Centena ){  u = 1;  n = 0;  s = "";  } else u *= 10;
                         }

             }

           //ini. adiciona la moneda y los centavos
                if ( !c.equals("") ) c = " con " + c + " centavos";
                if ( !sMoney.equals("") )
                    sMoney = " " + sMoney;
                else
                    if( b > 0 ) z += "o";
           //fin.

            z = ( s + z ) + sMoney + c;
      }
      catch(NumberFormatException ex){
            z = "ERROR [readNumber]: Formato numerico incorrecto.";
      }

     return z;

   }



   private static String[] initVector(  ){
       String V[] = new String[43];

        V[0] = "cero";
        V[1] = "un";
        V[2] = "dos";
        V[3] = "tres";
        V[4] = "cuatro";
        V[5] = "cinco";
        V[6] = "seis";
        V[7] = "siete";
        V[8] = "ocho";
        V[9] = "nueve";
        V[10] = "diez";
        V[11] = "once";
        V[12] = "doce";
        V[13] = "trece";
        V[14] = "catorce";
        V[15] = "quince";
        V[16] = "dieciseis";
        V[17] = "diecisiete";
        V[18] = "dieciocho";
        V[19] = "diecinueve";
        V[20] = "veinte";
        V[21] = "treinta";
        V[22] = "cuarenta";
        V[23] = "cincuenta";
        V[24] = "secenta";
        V[25] = "setenta";
        V[26] = "ochenta";
        V[27] = "noventa";
        V[28] = "";
        V[29] = "";
        V[30] = "cien";
        V[31] = "doscientos";
        V[32] = "trescientos";
        V[33] = "cuatrocientos";
        V[34] = "quinientos";
        V[35] = "seiscientos";
        V[36] = "setecientos";
        V[37] = "ochocientos";
        V[38] = "novecientos";
        V[39] = "";
        V[40] = "mil";
        V[41] = "millon";
        V[42] = "billon";

        return V;
   }


}
}
