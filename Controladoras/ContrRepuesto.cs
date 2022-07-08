using System;
using System.Collections.Generic;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Persistencia;
using Dominio;

namespace Controladoras
{
    class ContrRepuesto
    {
        public static List<Repuesto> ListaRepuesto()
        {
            return PersRepuesto.ListaRepuesto();
        }

        public static DataTable MostrarRepuesto()
        {
            return PersRepuesto.MostrarRepuesto();
        }
        public static DataTable RepuestoMasUsado()
        {
            return PersRepuesto.RepuestoMasUsado();
        }
        internal static bool AltaRepuesto(Repuesto pRepuesto)
        {
            return PersRepuesto.AltaRepuesto(pRepuesto);
        }
        internal static bool BajaRepuesto(int pId)
        {
            return PersRepuesto.BajaRepuesto(pId);
        }
        internal static bool ModificarRepuesto(Repuesto pRepuesto)
        {
            return PersRepuesto.ModificarRepuesto(pRepuesto);
        }
    }
}
