using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Reparacion_Repuesto
    {
        private int idReparacion;
        private int idRepuesto;
        private int cantidad;

        public Reparacion_Repuesto(int idReparacion, int idRepuesto, int cantidad)
        {
            this.idReparacion = idReparacion;
            this.idRepuesto = idRepuesto;
            this.cantidad = cantidad;
        }

        public Reparacion_Repuesto()
        { }

        public int IdReparacion { get => idReparacion; set => idReparacion = value; }
        public int IdRepuesto { get => idRepuesto; set => idRepuesto = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
    }
}
