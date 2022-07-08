using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Persistencia;
using Dominio;
using System.Data;

namespace Controladoras
{
    class ContrReparacion_Repuesto
    {
        public static List<Reparacion_Repuesto> ListaReparacion_Repuesto()
        {
            return PersReparacion_Repuesto.ListaReparacion_Repuesto();
        }

        public static DataTable MostrarReparacion_Repuesto()
        {
            return PersReparacion_Repuesto.MostrarReparacion_Repuesto();
        }

        public static DataTable ListarReparacionRepuestoxReparacion(int pIdReparacion)
        {
            return PersReparacion_Repuesto.ListarReparacionRepuestoxReparacion(pIdReparacion);

        }
        internal static bool AltaReparacion_Repuesto(Reparacion_Repuesto pReparacion_Repuesto)
        {
            return PersReparacion_Repuesto.AltaReparacion_Repuesto(pReparacion_Repuesto);
        }

    }
}
