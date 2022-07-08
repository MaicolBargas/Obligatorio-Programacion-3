using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Controladoras;
using System.Data;

namespace Taller_Mecanico
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Listar();
                ListarVehiculos();
            btnAlta.Enabled = false;
             }
        }

        #region funciones auxiliares
        protected void ListarVehiculos()
        {
            int ci = int.Parse(this.Session["ci"].ToString());
            Usuario unUsuario = Taller.BuscarUsuarioCI(ci);

            DataTable miVehiculo = Taller.MostrarVehiculoDueno(unUsuario.IdUsuario);
            GridVehiculos.DataSource = miVehiculo;
            GridVehiculos.DataBind();
        }
        
        protected void Listar()
        {
            int ci = int.Parse(this.Session["ci"].ToString());
            Usuario unUsuario = Taller.BuscarUsuarioCI(ci);
            
            GridAgenda.DataSource = Taller.MostrarAgendaUsuario(unUsuario.IdUsuario);
            GridAgenda.DataBind();
        }
        protected void Limpiar()
        {
            this.txtId.Text = "";
            this.txtMatricula.Text = "";
            this.txtMarca.Text = "";
            this.txtModelo.Text = "";
            this.txtDscEntrada.Text = "";
        }

        protected void linkAgendarReparacion_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Vehiculo vehiculo = Taller.BuscarVehiculoId(id);

            this.txtId.Text = vehiculo.IdVehiculo.ToString();
            this.txtMatricula.Text = vehiculo.Matricula.ToString();
            this.txtMarca.Text = vehiculo.Marca.ToString();
            this.txtModelo.Text = vehiculo.Modelo.ToString();

            btnAlta.Enabled = true;

            GridReparaciones.Visible = false;


        }

        protected void linkVerReparaciones_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            Session["IdVehiculo"] = id;

            GridReparaciones.DataSource = Taller.ListarReparacionXVehiculo(id);
            GridReparaciones.DataBind();

            GridReparaciones.Visible = true;
                
        }

        private bool FaltanDatos()
        {
            if (this.txtId.Text == "" || this.txtMatricula.Text == "" || this.txtMatricula.Text == "" || this.txtModelo.Text == "" || this.txtDscEntrada.Text == "")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void linkMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");

        }

        #endregion

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            if (!FaltanDatos())
            {
                int id = int.Parse(this.txtId.Text);
                string dscEntrada = this.txtDscEntrada.Text;
                int ci = int.Parse(this.Session["ci"].ToString());
                Usuario unUsuario = Taller.BuscarUsuarioCI(ci);
                int idUsuario = unUsuario.IdUsuario;
                Agenda unaAgenda= new Agenda(id, dscEntrada,idUsuario);

                if (Taller.AltaAgenda(unaAgenda))
                {
                    this.lblAlertas.Text = "Su agenda ha sido realizada con exito";
                    Listar();
                    Limpiar();
                }
 
            }
            else { this.lblAlertas.Text = "Debe ingresar todos los datos"; }
        }

        protected void linkEliminarAgenda_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            Taller.BajaAgenda(id);
            Listar();
            Limpiar();
                
            this.lblAlertas.Text = "Agenda cancelada";
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            DateTime fechaInicio = Convert.ToDateTime(this.txtFechaInicio.Text);
            DateTime fechaFin = Convert.ToDateTime(this.txtFechaFin.Text);
            int id = int.Parse(Session["IdVehiculo"].ToString());

            GridReparaciones.DataSource = Taller.ListarReparacionXFechaVehiculo(fechaInicio, fechaFin, id);
            GridReparaciones.DataBind();
        }


    }
}

