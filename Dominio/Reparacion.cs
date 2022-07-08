using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Reparacion
    {
        private int idReparacion;
        private int idVehiculo;
        private DateTime fchEntrada;
        private DateTime fchSalida;
        private int idMecanico;
        private string dscEntrada;
        private string dscSalida;
        private int kmsEntrada;

        public Reparacion( int idVehiculo, DateTime fchEntrada, DateTime fchSalida, int idMecanico, string dscEntrada, string dscSalida, int kmsEntrada)
        {
            this.idVehiculo = idVehiculo;
            this.fchEntrada = fchEntrada;
            this.fchSalida = fchSalida;
            this.idMecanico = idMecanico;
            this.dscEntrada = dscEntrada;
            this.dscSalida = dscSalida;
            this.kmsEntrada = kmsEntrada;
        }
        public Reparacion()
        { }

        public Reparacion(int idReparacion, int idVehiculo, DateTime fchEntrada, DateTime fchSalida, int idMecanico, string dscEntrada, string dscSalida, int kmsEntrada)
        {
            this.idReparacion = idReparacion;
            this.idVehiculo = idVehiculo;
            this.fchEntrada = fchEntrada;
            this.fchSalida = fchSalida;
            this.idMecanico = idMecanico;
            this.dscEntrada = dscEntrada;
            this.dscSalida = dscSalida;
            this.kmsEntrada = kmsEntrada;
        }

        public int IdReparacion { get => idReparacion; set => idReparacion = value; }
        public int IdVehiculo { get => idVehiculo; set => idVehiculo = value; }
        public DateTime FchEntrada { get => fchEntrada; set => fchEntrada = value; }
        public DateTime FchSalida { get => fchSalida; set => fchSalida = value; }
        public int IdMecanico { get => idMecanico; set => idMecanico = value; }
        public string DscEntrada { get => dscEntrada; set => dscEntrada = value; }
        public string DscSalida { get => dscSalida; set => dscSalida = value; }
        public int KmsEntrada { get => kmsEntrada; set => kmsEntrada = value; }
    }
}
