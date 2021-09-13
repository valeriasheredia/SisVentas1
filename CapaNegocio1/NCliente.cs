using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CapaDatos1;

namespace CapaNegocio1
{
    public class NCliente
    {
        //Metodo Insertar que llama al metodo insertar de la clase DCliente de la CapaDatos
        public static string Insertar(string nombre,string apellido,string sexo,DateTime fecha_nacimiento, string tipo_documento,string num_documento, string direccion, 
            string telefono, string email)
        {
            DCliente Obj = new DCliente();
            Obj.Nombre = nombre;
            Obj.Apellido = apellido;
            Obj.Sexo = sexo;
            Obj.Fecha_Nacimiento = fecha_nacimiento;
            Obj.Tipo_Documento = tipo_documento;
            Obj.Num_documento = num_documento;
            Obj.Direccion = direccion;
            Obj.Telefono = telefono;
            Obj.Email = email;

            return Obj.Insertar(Obj);
        }

        //Metodo Editar que llama al metodo editar de la clase DCliente de la CapaDatos
        public static string Editar(int idcliente, string nombre, string apellido, string sexo, DateTime fecha_nacimiento, string tipo_documento, string num_documento, string direccion,
            string telefono, string email)
        {
            DCliente Obj = new DCliente();
            Obj.Idcliente = idcliente;
            Obj.Nombre = nombre;
            Obj.Apellido = apellido;
            Obj.Sexo = sexo;
            Obj.Fecha_Nacimiento = fecha_nacimiento;
            Obj.Tipo_Documento = tipo_documento;
            Obj.Num_documento = num_documento;
            Obj.Direccion = direccion;
            Obj.Telefono = telefono;
            Obj.Email = email;

            return Obj.Editar(Obj);
        }

        //Metodo Eliminar que llama al metodo eliminar de la clase DCliente de la CapaDatos
        public static string Eliminar(int idcliente)
        {
            DCliente Obj = new DCliente();
            Obj.Idcliente = idcliente;

            return Obj.Eliminar(Obj);
        }

        //Metodo Mostrar que llama al metodo mostrar de la clase DCliente de la CapaDatos
        public static DataTable Mostrar()
        {
            return new DCliente().Mostrar();
        }

        //Metodo BuscarApellido que llama al metodo BuscarApellido de la clase DCliente de la CapaDatos
        public static DataTable BuscarApellido(string textobuscar)
        {
            DCliente Obj = new DCliente();
            Obj.TextoBuscar = textobuscar;
            return Obj.BuscarApellido(Obj);
        }

        //Metodo BuscarNum_Documento que llama al metodo BuscarNum_Documento de la clase DProveedor de la CapaDatos
        public static DataTable BuscarNum_Documento(string textobuscar)
        {
            DCliente Obj = new DCliente();
            Obj.TextoBuscar = textobuscar;
            return Obj.BuscarNum_Documento(Obj);
        }
    }
}
