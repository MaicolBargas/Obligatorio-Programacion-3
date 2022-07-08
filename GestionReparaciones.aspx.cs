using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Controladoras;

namespace Taller_Mecanico
{
    public partial class GestionReparaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Listar();
                ListarAgenda();
                ListarVehiculos();
                ListarMecanicos();
                btnAlta.Enabled = false;
                btnBaja.Enabled = false;
                btnModificar.Enabled = false;
                this.txtId.Enabled = false;
                this.txtFchEntrada.Text = DateTime.Now.ToString("yyyy-MM-dd");
                this.txtFchSalida.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        #region Funciones auxiliares
        protected void Listar()
        {
            GridReparaciones.DataSource = Taller.MostrarReparacion();
            GridReparaciones.DataBind();
        }
        protected void ListarAgenda()
        {
            GridAgenda.DataSource = Taller.MostrarAgenda();
            GridAgenda.DataBind();
        }
        protected void Limpiar()
        {
            this.txtId.Text = "";
            this.txtVehiculo.SelectedValue = null;
            this.txtFchEntrada.Text = "";
            this.txtFchSalida.Text = "";
            this.txtMecanico.SelectedValue = null;
            this.txtDscEntrada.Text = "";
            this.txtDscSalida.Text = "";
            this.txtKms.Text = "";

            btnAlta.Enabled = true;
            btnBaja.Enabled = false;
            btnModificar.Enabled = false;
        }
        protected void linkMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admins.aspx");
        }

        protected void ListarVehiculos()
        {
            txtVehiculo.DataSource = Taller.MostrarVehiculo();
            txtVehiculo.DataTextField = "Matricula";
            txtVehiculo.DataValueField = "IdVehiculo";
            txtVehiculo.DataBind();
            txtVehiculo.Items.Insert(0, new ListItem("<Seleccionar Vehiculo>", "0"));
        }
        protected void ListarMecanicos()
        {
            txtMecanico.DataSource = Taller.MostrarMecanico();
            txtMecanico.DataTextField = "Nombre";
            txtMecanico.DataValueField = "IdMecanico";
            txtMecanico.DataBind();
            txtMecanico.Items.Insert(0, new ListItem("<Seleccionar Mecanico>", "0"));
        }

        private bool FaltanDatos()
        {
            if (this.txtVehiculo.Text == "" || this.txtFchEntrada.Text == "" 
                || this.txtFchSalida.Text == "" || this.txtMecanico.Text == "" || this.txtDscEntrada.Text == "" 
                || this.txtDscSalida.Text == "" || this.txtKms.Text == "")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected void link_OnClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            Reparacion reparacion = Taller.BuscarReparacionId(id);

            this.txtId.Text = reparacion.IdReparacion.ToString();
            this.txtVehiculo.Text = reparacion.IdVehiculo.ToString();
            this.txtFchEntrada.Text = reparacion.FchEntrada.ToString("yyyy-MM-dd");
            this.txtFchSalida.Text = reparacion.FchSalida.ToString("yyyy-MM-dd");
            this.txtMecanico.Text = reparacion.IdMecanico.ToString();
            this.txtDscEntrada.Text = reparacion.DscEntrada.ToString();
            this.txtDscSalida.Text = reparacion.DscSalida.ToString();
            this.txtKms.Text = reparacion.KmsEntrada.ToString();

            btnAlta.Enabled = false;
            btnBaja.Enabled = true;
            btnModificar.Enabled = true;
        }
        protected void linkSeleccionarAgenda_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            Agenda agenda = Taller.BuscarAgendaId(id);
            // Vehiculo vehiculo = Taller.BuscarVehiculoId(agenda.IdVehiculo);
            Session["id"] = agenda.Id;
            this.txtVehiculo.Text = agenda.IdVehiculo.ToString();
            this.txtDscEntrada.Text = agenda.DscEntrada.ToString();

            this.txtVehiculo.Enabled = false;
            this.txtDscEntrada.Enabled = false;
            btnAlta.Enabled = true;

        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }
        protected void btnAgregarRepuestos_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionReparacion_Repuesto.aspx");

        }
        #endregion

        #region ABM
        protected void btnAlta_Click(object sender, EventArgs e)
        {
            if (!FaltanDatos())
            {
                int idVehiculo = int.Parse(this.txtVehiculo.SelectedValue);
                DateTime fchEntrada = Convert.ToDateTime(this.txtFchEntrada.Text);
                DateTime fchSalida = Convert.ToDateTime(this.txtFchSalida.Text);
                int idMecanico = int.Parse(this.txtMecanico.SelectedValue);
                string entrada = this.txtDscEntrada.Text;
                string salida = this.txtDscSalida.Text;
                int kms = int.Parse(this.txtKms.Text);

                    Reparacion unaReparacion = new Reparacion(idVehiculo, fchEntrada, fchSalida, idMecanico, entrada, salida, kms);

                    if (Taller.AltaReparacion(unaReparacion))
                    {
                        this.lblAlertas.Text = "Reparacion ingresado con éxito";
                        Limpiar();
                        Listar();
                        Taller.BajaAgenda(int.Parse(Session["id"].ToString()));
                        ListarAgenda();
                        
                    }
            }
            else { this.lblAlertas.Text = "Debe ingresar todos los datos"; }
        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            int id = int.Parse(this.txtId.Text);

            if (Taller.BajaReparacion(id))
            {
                this.lblAlertas.Text = "Reparacion dada de baja con éxito";
                Limpiar();
                Listar();
            }
            else
            {
                this.lblAlertas.Text = "La Reparacion no existe";
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (!FaltanDatos())
            {
                int id = int.Parse(this.txtId.Text);
                int idVehiculo = int.Parse(this.txtVehiculo.SelectedValue);
                DateTime fchEntrada = Convert.ToDateTime(this.txtFchEntrada.Text);
                DateTime fchSalida = Convert.ToDateTime(this.txtFchSalida.Text);
                int idMecanico = int.Parse(this.txtMecanico.SelectedValue);
                string entrada = this.txtDscEntrada.Text;
                string salida = this.txtDscSalida.Text;
                int kms = int.Parse(this.txtKms.Text);

                Reparacion unaReparacion = new Reparacion(id, idVehiculo, fchEntrada, fchSalida, idMecanico, entrada, salida, kms);

                if (Taller.ModificarReparacion(unaReparacion))
                {
                    this.lblAlertas.Text = "Reparacion modificado con éxito";
                    Limpiar();
                    Listar();
                }
            }
            else { this.lblAlertas.Text = "Debe ingresar todos los datos"; }
        }

        #endregion


    }
}
