using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos1
{
    public class DDetalle_Venta
    {
        private int _Iddetalle_venta;
        private int _Idventa;
        private int _Iddetalle_ingreso;
        private int _Cantidad;
        private decimal _Precio_venta;
        private decimal _Descuento;

        public int Iddetalle_venta { get => _Iddetalle_venta; set => _Iddetalle_venta = value; }
        public int Idventa { get => _Idventa; set => _Idventa = value; }
        public int Iddetalle_ingreso { get => _Iddetalle_ingreso; set => _Iddetalle_ingreso = value; }
        public int Cantidad { get => _Cantidad; set => _Cantidad = value; }
        public decimal Precio_venta { get => _Precio_venta; set => _Precio_venta = value; }
        public decimal Descuento { get => _Descuento; set => _Descuento = value; }
        
        //Constructor
        public DDetalle_Venta()
        {

        }
        //Constructor con parametros
        public DDetalle_Venta(int iddetalle_venta, int ideventa,
            int iddetalle_ingreso, int cantidad, decimal precio_venta,
            decimal descuento)
        {
            this._Iddetalle_venta = iddetalle_venta;
            this.Idventa = Idventa;
            this.Iddetalle_ingreso = iddetalle_ingreso;
            this.Cantidad = cantidad;
            this.Precio_venta = precio_venta;
            this.Descuento = descuento;
        }

        //Metodo insertar
        public string Insertar(
            DDetalle_Venta Detalle_Venta,
            ref SqlConnection SqlCon,
            ref SqlTransaction SqlTra)
        {
            string rpta = "";
            try
            {
                //Establecer comando
                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.Transaction = SqlTra;
                SqlCmd.CommandText = "spinsertar_detalle_venta";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter ParIddetalle_venta = new SqlParameter();
                ParIddetalle_venta.ParameterName = "@iddetalle_venta";
                ParIddetalle_venta.SqlDbType = SqlDbType.Int;
                ParIddetalle_venta.Direction = ParameterDirection.Output;
                SqlCmd.Parameters.Add(ParIddetalle_venta);

                SqlParameter ParIdventa = new SqlParameter();
                ParIdventa.ParameterName = "@idventa";
                ParIdventa.SqlDbType = SqlDbType.Int;
                ParIdventa.Value = Detalle_Venta.Idventa;
                SqlCmd.Parameters.Add(ParIdventa);

                SqlParameter ParIddetalle_ingreso = new SqlParameter();
                ParIddetalle_ingreso.ParameterName = "@iddetalle_ingreso";
                ParIddetalle_ingreso.SqlDbType = SqlDbType.Int;
                ParIddetalle_ingreso.Value = Detalle_Venta.Iddetalle_ingreso;
                SqlCmd.Parameters.Add(ParIddetalle_ingreso);

                SqlParameter ParCantidad = new SqlParameter();
                ParCantidad.ParameterName = "@cantidad";
                ParCantidad.SqlDbType = SqlDbType.Int;
                ParCantidad.Value = Detalle_Venta.Cantidad;
                SqlCmd.Parameters.Add(ParCantidad);

                SqlParameter ParPrecio_venta = new SqlParameter();
                ParPrecio_venta.ParameterName = "@precio_venta";
                ParPrecio_venta.SqlDbType = SqlDbType.Money;
                ParPrecio_venta.Value = Detalle_Venta.Precio_venta;
                SqlCmd.Parameters.Add(ParPrecio_venta);

                SqlParameter ParDescuento = new SqlParameter();
                ParDescuento.ParameterName = "@descuento";
                ParDescuento.SqlDbType = SqlDbType.Money;
                ParDescuento.Value = Detalle_Venta.Descuento;
                SqlCmd.Parameters.Add(ParDescuento);

                //ejecutamos el comando
                rpta = SqlCmd.ExecuteNonQuery() == 1 ? "Ok" : "No se ingreso el registro";
            }
            catch (Exception ex)
            {
                rpta = ex.Message;
            }
            return rpta;
        }
    }   
}
