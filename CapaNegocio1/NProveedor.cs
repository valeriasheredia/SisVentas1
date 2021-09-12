using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos1;

namespace CapaNegocio1
{
    public class NProveedor
    {
        //Metodo Insertar que llama al metodo insertar de la clase NProveedor de la CapaDatos
        public static string Insertar(string razon_social, string sector_comercial, string tipo_documento,
            string num_documento, string direccion, string telefono, string email, string url)
        {
            DProveedor Obj = new DProveedor();
            Obj.Razon_social = razon_social;
            Obj.Sector_comercial = sector_comercial;
            Obj.Tipo_documento = tipo_documento;
            Obj.Num_documento = num_documento;
            Obj.Direccion = direccion;
            Obj.Telefono = telefono;
            Obj.Email = email;
            Obj.Url = url;

            return Obj.Insertar(Obj);
        }

        //Metodo Editar que llama al metodo editar de la clase DProveedor de la CapaDatos
        public static string Editar(int idproveedor, string razon_social, string sector_comercial, 
            string tipo_documento,string num_documento, string direccion, string telefono, string email, string url)
        {
            DProveedor Obj = new DProveedor();
            Obj.IdProveedor = idproveedor;
            Obj.Razon_social = razon_social;
            Obj.Sector_comercial = sector_comercial;
            Obj.Tipo_documento = tipo_documento;
            Obj.Num_documento = num_documento;
            Obj.Direccion = direccion;
            Obj.Telefono = telefono;
            Obj.Email = email;
            Obj.Url = url;

            return Obj.Editar(Obj);
        }

        //Metodo Eliminar que llama al metodo eliminar de la clase DCategoria de la CapaDatos
        public static string Eliminar(int idproveedor)
        {
            DProveedor Obj = new DProveedor();
            Obj.IdProveedor = idproveedor;

            return Obj.Eliminar(Obj);
        }

        //Metodo Mostrar que llama al metodo mostrar de la clase DProveedor de la CapaDatos
        public static DataTable Mostrar()
        {
            return new DProveedor().Mostrar();
        }

        //Metodo BuscarProveedorRazon_Social que llama al metodo BuscarProveedorRazon_Social de la clase DProveedor de la CapaDatos
        public static DataTable BuscarProveedorRazon_Social(string textobuscar)
        {
            DProveedor Obj = new DProveedor();
            Obj.TextoBuscar = textobuscar;
            return Obj.BuscarProveedorRazon_Social(Obj);
        }

        //Metodo BuscarProveedorNum_Documento que llama al metodo BuscarProveedorNum_Documento de la clase DProveedor de la CapaDatos
        public static DataTable BuscarProveedorNum_Documento(string textobuscar)
        {
            DProveedor Obj = new DProveedor();
            Obj.TextoBuscar = textobuscar;
            return Obj.BuscarProveedorNum_Documento(Obj);
        }
    }
}
