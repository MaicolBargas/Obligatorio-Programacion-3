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
    public partial class Admins : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Listar();          
            }
        }

        #region Links
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionUsuarios.aspx");
        }
        protected void linkProveedores_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionProveedores.aspx");

        }
        protected void linkRepuestos_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionRepuestos.aspx");

        }

        protected void linkVehiculos_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionVehiculos.aspx");

        }

        protected void linkMecanicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionMecanicos.aspx");

        }

        protected void linkReparaciones_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionReparaciones.aspx");

        }
        protected void linkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void linkAgregarRepuesto_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionReparacion_Repuesto.aspx");

        }        
        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("GestionAdmins.aspx");

        }
        #endregion


        #region Listar
        protected void Listar()
        {
            GridReparaciones.DataSource = Taller.MostrarReparacion();
            GridReparaciones.DataBind();
        }

        protected void link_OnClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            Reparacion reparacion = Taller.BuscarReparacionId(id);
            Vehiculo vehiculo = Taller.BuscarVehiculoId(reparacion.IdVehiculo);
            Usuario usuario = Taller.BuscarUsuarioID(vehiculo.DuenoVehiculo);
            Mecanico mecanico = Taller.BuscarMecanicoID(reparacion.IdMecanico);

            this.txtDsc.Text = reparacion.DscEntrada;
            this.txtFecha.Text = Convert.ToString(reparacion.FchEntrada);
            this.txtDueno.Text = usuario.Nombre;
            this.txtVehiculo.Text = vehiculo.Matricula;
            this.txtMarca.Text = vehiculo.Marca + "  " + vehiculo.Modelo;
            this.txtMecanico.Text = mecanico.Nombre; 

            GridRepuestos.DataSource = Taller.ListarReparacionRepuestoxReparacion(reparacion.IdReparacion);
            GridRepuestos.DataBind();

            this.txt1.Visible = true;
            this.txt2.Visible = true;
            this.txt3.Visible = true;
            this.txt4.Visible = true;
            this.txt5.Visible = true;
            this.txt6.Visible = true;
            this.txt7.Visible = true;
            GridRepuestos.Enabled = true;
        }




        #endregion

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            DateTime fechaInicio = Convert.ToDateTime(this.txtFechaInicio.Text);
            DateTime fechaFin = Convert.ToDateTime(this.txtFechaFin.Text);

            GridReparaciones.DataSource = Taller.ListarReparacionXFecha(fechaInicio, fechaFin);
            GridReparaciones.DataBind();


            this.txt1.Visible = false;
            this.txt2.Visible = false;
            this.txt3.Visible = false;
            this.txt4.Visible = false;
            this.txt5.Visible = false;
            this.txt6.Visible = false;
            this.txt7.Visible = false;
            GridRepuestos.Enabled = false;
        }

        protected void btnRepuesto_Click(object sender, EventArgs e)
        {
            GridRepuestoMasUsado.DataSource = Taller.RepuestoMasUsado();
            GridRepuestoMasUsado.DataBind();
        }
    }
}