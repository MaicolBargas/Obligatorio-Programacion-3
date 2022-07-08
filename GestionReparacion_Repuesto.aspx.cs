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
    public partial class GestionReparacion_Repuesto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Listar();
                ListarRepuestos();
                this.txtIdReparacion.Enabled = false;
                this.txtDescripcion.Enabled = false;

            }
        }

        #region Funciones auxiliares
        protected void Listar()
        {
            GridReparaciones.DataSource = Taller.MostrarReparacion();
            GridReparaciones.DataBind();
        }

        protected void ListarRepuestos()
        {
            txtRepuesto.DataSource = Taller.MostrarRepuesto();
            txtRepuesto.DataTextField = "Descripcion";
            txtRepuesto.DataValueField = "IdRepuesto";
            txtRepuesto.DataBind();
            txtRepuesto.Items.Insert(0, new ListItem("<Seleccionar Repuesto>", "0"));
        }
        protected void linkMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admins.aspx");
        }

        protected void Limpiar()
        {
            this.txtIdReparacion.Text = "";
            this.txtRepuesto.SelectedValue = null;
            this.txtCantidad.Text = "";
            this.txtIdReparacion.Text = "";
        }
        private bool FaltanDatos()
        {
            if (this.txtIdReparacion.Text == "" || this.txtRepuesto.Text == ""
                || this.txtCantidad.Text == "" || this.txtIdReparacion.Text == "")
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

            this.txtIdReparacion.Text = reparacion.IdReparacion.ToString();
            this.txtDescripcion.Text = reparacion.DscEntrada.ToString();
        }

        #endregion

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if(!FaltanDatos())
            {
                int idReparacion = int.Parse(txtIdReparacion.Text);
                int idRepuesto = int.Parse(txtRepuesto.SelectedValue);
                int cantidad = int.Parse(txtCantidad.Text);

                Reparacion_Repuesto rr = new Reparacion_Repuesto(idReparacion, idRepuesto, cantidad);

                Taller.AltaReparacion_Repuesto(rr);
                this.lblAlertas.Text = "Repuesto agregado a reparacion";
                Limpiar();
                Listar();
            }
            else
            {
                this.lblAlertas.Text = "Debe ingresar todos los datos";
            }
        }

    }
}