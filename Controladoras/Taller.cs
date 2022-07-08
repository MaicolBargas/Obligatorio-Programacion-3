using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Controladoras
{
    public class Taller
    {

        #region Admin
        public static List<Admin> ListaAdmin()
        {
            return ContrAdmin.ListaAdmin();
        }


        public static Admin BuscarAdminCI(int pCI)
        {
            foreach (Admin unAdmin in ContrAdmin.ListaAdmin())
            {
                if (unAdmin.Ci == pCI)
                    return unAdmin;
            }
            return null;
        }

        public static bool AltaAdmin(Admin pAdmin)
        {
            return ContrAdmin.AltaAdmin(pAdmin);
        }
        public static DataTable MostrarAdmin()
        {
            return ContrAdmin.MostrarAdmin();
        }

        public static Admin BuscarAdminID(int pID)
        {
            foreach (Admin unAdmin in ContrAdmin.ListaAdmin())
            {
                if (unAdmin.IdAdmin == pID)
                    return unAdmin;
            }
            return null;
        }
        public static bool BajaAdmin(int pCi, int pClave)
        {
            return ContrAdmin.BajaAdmin(pCi, pClave);
        }
        public static bool ModificarAdmin(Admin pAdmin)
        {
            return ContrAdmin.ModificarAdmin(pAdmin);
        }
        #endregion

        #region Usuario
        public static List<Usuario> ListaUsuario()
        {
            return ContrUsuario.ListaUsuario();
        }
        public static DataTable MostrarUsuario()
        {
            return ContrUsuario.MostrarUsuarios();
        }
        public static Usuario BuscarUsuarioCI(int pCI)
        {
            foreach (Usuario unUsuario in ContrUsuario.ListaUsuario())
            {
                if (unUsuario.Ci == pCI)
                    return unUsuario;
            }
            return null;
        }
        public static Usuario BuscarUsuarioID(int pID)
        {
            foreach (Usuario unUsuario in ContrUsuario.ListaUsuario())
            {
                if (unUsuario.IdUsuario == pID)
                    return unUsuario;
            }
            return null;
        }

        public static bool AltaUsuario(Usuario pUsuario)
        {
            return ContrUsuario.AltaUsuario(pUsuario);
        }

        public static bool BajaUsuario(int pCi)
        {
            return ContrUsuario.BajaUsuario(pCi);
        }
        public static bool ModificarUsuario(Usuario pUsuario)
        {
            return ContrUsuario.ModificarUsuario(pUsuario);
        }
        #endregion

        #region Proveedor
        public static List<Proveedor> ListaProveedor()
        {
            return ContrProveedor.ListaProveedor();
        }
        public static DataTable MostrarProveedor()
        {
            return ContrProveedor.MostrarProveedor();
        }
        public static Proveedor BuscarProveedorID(int pID)
        {
            foreach (Proveedor unProveedor in ContrProveedor.ListaProveedor())
            {
                if (unProveedor.IdProveedor == pID)
                    return unProveedor;
            }
            return null;
        }

        public static bool AltaProveedor(Proveedor pProveedor)
        {
            return ContrProveedor.AltaProveedor(pProveedor);
        }

        public static bool BajaProveedor(int pId)
        {
            return ContrProveedor.BajaProveedor(pId);
        }
        public static bool ModificarProveedor(Proveedor pProveedor)
        {
            return ContrProveedor.ModificarProveedor(pProveedor);
        }
        #endregion

        #region Repuesto
        public static List<Repuesto> ListaRepuesto()
        {
            return ContrRepuesto.ListaRepuesto();
        }
        public static DataTable MostrarRepuesto()
        {
            return ContrRepuesto.MostrarRepuesto();
        }
        public static DataTable RepuestoMasUsado()
        {
            return ContrRepuesto.RepuestoMasUsado();
        }
        public static Repuesto BuscarRepuestoID(int pID)
        {
            foreach (Repuesto unRepuesto in ContrRepuesto.ListaRepuesto())
            {
                if (unRepuesto.IdRepuesto == pID)
                    return unRepuesto;
            }
            return null;
        }

        public static bool AltaRepuesto(Repuesto pRepuesto)
        {
            return ContrRepuesto.AltaRepuesto(pRepuesto);
        }

        public static bool BajaRepuesto(int pId)
        {
            return ContrRepuesto.BajaRepuesto(pId);
        }
        public static bool ModificarRepuesto(Repuesto pRepuesto)
        {
            return ContrRepuesto.ModificarRepuesto(pRepuesto);
        }
        #endregion

        #region Vehiculo
        public static List<Vehiculo> ListaVehiculo()
        {
            return ContrVehiculo.ListaVehiculo();
        }
        public static DataTable MostrarVehiculoDueno(int pdueno)
        {
            return ContrVehiculo.MostrarVehiculoDueno(pdueno);

        }

        public static DataTable MostrarVehiculo()
        {
            return ContrVehiculo.MostrarVehiculo();
        }
        public static Vehiculo BuscarVehiculoMatricula(string pMatricula)
        {
            foreach (Vehiculo unVehiculo in ContrVehiculo.ListaVehiculo())
            {
                if (unVehiculo.Matricula == pMatricula)
                    return unVehiculo;
            }
            return null;
        }

        public static Vehiculo BuscarVehiculoId(int pId)
        {
            foreach (Vehiculo unVehiculo in ContrVehiculo.ListaVehiculo())
            {
                if (unVehiculo.IdVehiculo == pId)
                    return unVehiculo;
            }
            return null;
        }

        public static bool AltaVehiculo(Vehiculo pVehiculo)
        {
            return ContrVehiculo.AltaVehiculo(pVehiculo);
        }

        public static bool BajaVehiculo(string pMatricula)
        {
            return ContrVehiculo.BajaVehiculo(pMatricula);
        }
        public static bool ModificarVehiculo(Vehiculo pVehiculo)
        {
            return ContrVehiculo.ModificarVehiculo(pVehiculo);
        }
        #endregion

        #region Mecanico
        public static List<Mecanico> ListaMecanico()
        {
            return ContrMecanico.ListaMecanico();
        }
        public static DataTable MostrarMecanico()
        {
            return ContrMecanico.MostrarMecanico();
        }
        public static Mecanico BuscarMecanicoCI(int pCI)
        {
            foreach (Mecanico unMecanico in ContrMecanico.ListaMecanico())
            {
                if (unMecanico.Ci == pCI)
                    return unMecanico;
            }
            return null;
        }
        public static Mecanico BuscarMecanicoID(int pID)
        {
            foreach (Mecanico unMecanico in ContrMecanico.ListaMecanico())
            {
                if (unMecanico.IdMecanico == pID)
                    return unMecanico;
            }
            return null;
        }

        public static bool AltaMecanico(Mecanico pMecanico)
        {
            return ContrMecanico.AltaMecanico(pMecanico);
        }

        public static bool BajaMecanico(int pCi)
        {
            return ContrMecanico.BajaMecanico(pCi);
        }
        public static bool ModificarMecanico(Mecanico pMecanico)
        {
            return ContrMecanico.ModificarMecanico(pMecanico);
        }
        #endregion

        #region Reparacion
        public static List<Reparacion> ListaReparacion()
        {
            return ContrReparacion.ListaReparacion();
        }

        public static DataTable MostrarReparacion()
        {
            return ContrReparacion.MostrarReparacion();
        }
        public static DataTable ListarReparacionXVehiculo(int pIdVehiculo)
        {
            return ContrReparacion.ListarReparacionXVehiculo(pIdVehiculo);
        }
        public static DataTable ListarReparacionXFecha(DateTime pFechaInicio, DateTime pFechaFin)
        {
            return ContrReparacion.ListarReparacionXFecha(pFechaInicio, pFechaFin);
        }

        public static DataTable ListarReparacionXFechaVehiculo(DateTime pFechaInicio, DateTime pFechaFin, int pIdVehiculo)
        {
            return ContrReparacion.ListarReparacionXFechaVehiculo(pFechaInicio, pFechaFin, pIdVehiculo);
        }

        public static Reparacion BuscarReparacionId(int pId)
        {
            foreach (Reparacion unaReparacion in ContrReparacion.ListaReparacion())
            {
                if (unaReparacion.IdReparacion == pId)
                    return unaReparacion;
            }
            return null;
        }

        public static bool AltaReparacion(Reparacion pReparacion)
        {
            return ContrReparacion.AltaReparacion(pReparacion);
        }

        public static bool BajaReparacion(int pId)
        {
            return ContrReparacion.BajaReparacion(pId);
        }
        public static bool ModificarReparacion(Reparacion pReparacion)
        {
            return ContrReparacion.ModificarReparacion(pReparacion);
        }
        #endregion

        #region Agenda
        public static List<Agenda> ListaAgenda()
        {
            return ContrAgenda.ListaAgenda();
        }

        public static DataTable MostrarAgenda()
        {
            return ContrAgenda.MostrarAgenda();
        }
        public static DataTable MostrarAgendaUsuario(int pUsuario)
        {
            return ContrAgenda.MostrarAgendaUsuario(pUsuario);

        }
        public static Agenda BuscarAgendaId(int pId)
        {
            foreach (Agenda unaAgenda in ContrAgenda.ListaAgenda())
            {
                if (unaAgenda.Id == pId)
                    return unaAgenda;
            }
            return null;
        }

        public static bool AltaAgenda(Agenda pAgenda)
        {
            return ContrAgenda.AltaAgenda(pAgenda);
        }

        public static bool BajaAgenda(int pId)
        {
            return ContrAgenda.BajaAgenda(pId);
        }

        #endregion

        #region Reparacion_Repuesto
        public static List<Reparacion_Repuesto> ListaReparacion_Repuesto()
        {
            return ContrReparacion_Repuesto.ListaReparacion_Repuesto();
        }

        public static DataTable MostrarReparacion_Repuesto()
        {
            return ContrReparacion_Repuesto.MostrarReparacion_Repuesto();
        } 

        public static DataTable ListarReparacionRepuestoxReparacion(int pIdReparacion)
        {
            return ContrReparacion_Repuesto.ListarReparacionRepuestoxReparacion(pIdReparacion);
       
        }
        public static bool AltaReparacion_Repuesto(Reparacion_Repuesto pReparacion_Repuesto)
        {
            return ContrReparacion_Repuesto.AltaReparacion_Repuesto(pReparacion_Repuesto);
        }



        #endregion


    }
}
