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
    class ContrReparacion
    {
        public static List<Reparacion> ListaReparacion()
        {
            return PersReparacion.ListaReparacion();
        }

        public static DataTable MostrarReparacion()
        {
            return PersReparacion.MostrarReparacion();
        }
        public static DataTable ListarReparacionXVehiculo(int pIdVehiculo)
        {
            return PersReparacion.ListarReparacionXVehiculo(pIdVehiculo);
        }
        public static DataTable ListarReparacionXFecha(DateTime pFechaInicio, DateTime pFechaFin)
        {
            return PersReparacion.ListarReparacionXFecha(pFechaInicio, pFechaFin);
        }
        public static DataTable ListarReparacionXFechaVehiculo(DateTime pFechaInicio, DateTime pFechaFin, int pIdVehiculo)
        {
            return PersReparacion.ListarReparacionXFechaVehiculo(pFechaInicio, pFechaFin, pIdVehiculo);
        }
        internal static bool AltaReparacion(Reparacion pReparacion)
        {
            return PersReparacion.AltaReparacion(pReparacion);
        }
        internal static bool BajaReparacion(int pId)
        {
            return PersReparacion.BajaReparacion(pId);
        }
        internal static bool ModificarReparacion(Reparacion pReparacion)
        {
            return PersReparacion.ModificarReparacion(pReparacion);
        }

    }
}
