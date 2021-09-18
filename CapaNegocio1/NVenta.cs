using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos1;
using System.Data;


namespace CapaNegocio1
{
    public class NVenta
    {
        //Metodo Insertar que llama al metodo insertar de la clase DCategoria de la CapaDatos
        public static string Insertar(
            int idtrabajador, int idcliente, DateTime fecha,
            string tipo_comprobante, string serie, string correlativo,
            decimal igv, DataTable dtDetalles)
        {
            DVenta Obj = new DVenta();
            Obj.Idtrabajador = idtrabajador;
            Obj.Idcliente = idcliente;
            Obj.Fecha = fecha;
            Obj.Tipo_comprobante = tipo_comprobante;
            Obj.Serie = serie;
            Obj.Correlativo = correlativo;
            Obj.Igv = igv;
            List<DDetalle_Venta> detalles = new List<DDetalle_Venta>();
            foreach (DataRow row in dtDetalles.Rows)
            {
                DDetalle_Venta detalle = new DDetalle_Venta();
                detalle.Iddetalle_ingreso = Convert.ToInt32(row["iddetalle_ingreso"].ToString());
                detalle.Cantidad = Convert.ToInt32(row["cantidad"].ToString());
                detalle.Precio_venta = Convert.ToDecimal(row["precio_venta"].ToString());
                detalle.Descuento = Convert.ToDecimal(row["descuento"].ToString());
       detalles.Add(detalle);
            }
            return Obj.Insertar(Obj, detalles);
        }

        //Metodo Eliminar que llama al metodo anular de la clase DCategoria de la CapaDatos
        public static string Eliminar(int idiventa)
        {
            DVenta Obj = new DVenta();
            Obj.Idventa = idiventa;

            return Obj.Eliminar(Obj);
        }

        //Metodo Mostrar que llama al metodo mostrar de la clase DCategoria de la CapaDatos
        public static DataTable Mostrar()
        {
            return new DVenta().Mostrar();
        }

        //Metodo BuscarFechas que llama al metodo BuscarFechas de la clase DVenta de la CapaDatos
        public static DataTable BuscarFechas(string textobuscar, string textobuscar2)
        {
            DVenta Obj = new DVenta();
            return Obj.BuscarFechas(textobuscar, textobuscar2);
        }

        public static DataTable MostrarDetalle(string textobuscar)
        {
            DVenta Obj = new DVenta();
            return Obj.MostrarDetalle(textobuscar);
        }

        public static DataTable MostrarArticulo_Venta_Nombre(string textobuscar)
        {
            DVenta Obj = new DVenta();
            return Obj.MostrarArticulo_Venta_Nombre(textobuscar);
        }

        public static DataTable MostrarArticulo_Venta_Codigo(string textobuscar)
        {
            DVenta Obj = new DVenta();
            return Obj.MostrarArticulo_Venta_Codigo(textobuscar);
        }
    }
}
