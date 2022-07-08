using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Admin
    {
        private int idAdmin;
        private string nombre;
        private int ci;
        private string mail;
        private string password;
        private int claveAdmin;

        public Admin(int idAdmin, string nombre, int ci, string mail, string password, int claveAdmin)
        {
            this.idAdmin = idAdmin;
            this.nombre = nombre;
            this.ci = ci;
            this.mail = mail;
            this.password = password;
            this.claveAdmin = claveAdmin;
        }
        public Admin() { }

        public Admin(string nombre, int ci, string mail, string password, int claveAdmin)
        {
            this.nombre = nombre;
            this.ci = ci;
            this.mail = mail;
            this.password = password;
            this.claveAdmin = claveAdmin;
        }

        public int IdAdmin { get => idAdmin; set => idAdmin = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public int Ci { get => ci; set => ci = value; }
        public string Mail { get => mail; set => mail = value; }
        public string Password { get => password; set => password = value; }
        public int ClaveAdmin { get => claveAdmin; set => claveAdmin = value; }
    }
}
