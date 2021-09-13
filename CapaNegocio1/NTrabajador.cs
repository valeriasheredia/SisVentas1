using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos1;

namespace CapaNegocio1
{
    public class NTrabajador
    {
        //Metodo Insertar que llama al metodo insertar de la clase DTrabajador de la CapaDatos
        public static string Insertar(string nombre, string apellido, string sexo, DateTime fecha_nacimiento, 
             string num_documento, string direccion,  string telefono, string email, string acceso, string usuario,
             string password)
        {
            DTrabajador Obj = new DTrabajador();
            Obj.Nombre = nombre;
            Obj.Apellido = apellido;
            Obj.Sexo = sexo;
            Obj.Fecha_Nacimiento = fecha_nacimiento;
            Obj.Num_documento = num_documento;
            Obj.Direccion = direccion;
            Obj.Telefono = telefono;
            Obj.Email = email;
            Obj.Acceso = acceso;
            Obj.Usuario = usuario;
            Obj.Password = password;

            return Obj.Insertar(Obj);
        }

        //Metodo Editar que llama al metodo editar de la clase DTrabajador de la CapaDatos
        public static string Editar(int idtrabajador, string nombre, string apellido, string sexo, DateTime fecha_nacimiento,
             string num_documento, string direccion, string telefono, string email, string acceso, string usuario,
             string password)
        {
            DTrabajador Obj = new DTrabajador();
            Obj.Idtrabajador = idtrabajador;
            Obj.Nombre = nombre;
            Obj.Apellido = apellido;
            Obj.Sexo = sexo;
            Obj.Fecha_Nacimiento = fecha_nacimiento;
            Obj.Num_documento = num_documento;
            Obj.Direccion = direccion;
            Obj.Telefono = telefono;
            Obj.Email = email;
            Obj.Acceso = acceso;
            Obj.Usuario = usuario;
            Obj.Password = password;

            return Obj.Editar(Obj);
        }

        //Metodo Eliminar que llama al metodo eliminar de la clase DTrabajador de la CapaDatos
        public static string Eliminar(int idtrabajador)
        {
            DTrabajador Obj = new DTrabajador();
            Obj.Idtrabajador = idtrabajador;

            return Obj.Eliminar(Obj);
        }

        //Metodo Mostrar que llama al metodo mostrar de la clase DTrabajador de la CapaDatos
        public static DataTable Mostrar()
        {
            return new DTrabajador().Mostrar();
        }

        //Metodo BuscarApellido que llama al metodo BuscarApellido de la clase DTrabajador de la CapaDatos
        public static DataTable BuscarApellido(string textobuscar)
        {
            DTrabajador Obj = new DTrabajador();
            Obj.TextoBuscar = textobuscar;
            return Obj.BuscarApellido(Obj);
        }

        //Metodo BuscarNum_Documento que llama al metodo BuscarNum_Documento de la clase DTrabajador de la CapaDatos
        public static DataTable BuscarNum_Documento(string textobuscar)
        {
            DTrabajador Obj = new DTrabajador();
            Obj.TextoBuscar = textobuscar;
            return Obj.BuscarNum_Documento(Obj);
        }

        //Metodo Login que llama al metodo Login de la clase DTrabajador de la CapaDatos
        public static DataTable Login(string usuario, string password)
        {
            DTrabajador Obj = new DTrabajador();
            Obj.Usuario = usuario;
            Obj.Password = password;
            return Obj.Login(Obj);
        }
    }
}
