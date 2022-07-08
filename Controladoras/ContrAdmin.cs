using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Persistencia;
using System.Data;


namespace Controladoras
{
    public class ContrAdmin
    {
        public static List<Admin> ListaAdmin()
        {
            return PersAdmin.ListaAdmin();
        }        

        internal static bool AltaAdmin(Admin pAdmin)
        {
            return PersAdmin.AltaAdmin(pAdmin);
        }

        public static DataTable MostrarAdmin()
        {
            return PersAdmin.MostrarAdmin();
        }

        internal static bool BajaAdmin(int pCi, int pClave)
        {
            return PersAdmin.BajaAdmin(pCi, pClave);
        }
        internal static bool ModificarAdmin(Admin pAdmin)
        {
            return PersAdmin.ModificarAdmin(pAdmin);
        }
    }
}
