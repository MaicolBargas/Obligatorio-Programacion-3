using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controladoras;
using Dominio;

namespace Taller_Mecanico
{
    public partial class GestionAdmins : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Listar();
                btnAlta.Enabled = true;
                btnBaja.Enabled = false;
                btnModificar.Enabled = false;
            }
        }

        #region Funciones auxiliares
            protected void linkMenu_Click(object sender, EventArgs e)
            {
                Response.Redirect("Admins.aspx");
            }
        protected void Listar()
            {
                GridAdmins.DataSource = Taller.MostrarAdmin();
                GridAdmins.DataBind();
            }

            protected void Limpiar()
            {
                this.txtId.Text = "";
                this.txtMail.Text = "";
                this.txtPassword.Text = "";
                this.txtNombre.Text = "";
                this.txtCi.Text = "";
                this.txtClave.Text = "";

                btnAlta.Enabled = true;
                btnBaja.Enabled = false;
                btnModificar.Enabled = false;
            }
            private bool FaltanDatos()
            {
                if (this.txtMail.Text == "" || this.txtPassword.Text == "" || this.txtNombre.Text == "" || this.txtCi.Text == "" || this.txtClave.Text == "")
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

                Admin admin = Taller.BuscarAdminID(id);

                this.txtId.Text = admin.IdAdmin.ToString();
                this.txtNombre.Text = admin.Nombre.ToString();
                this.txtCi.Text = admin.Ci.ToString();
                this.txtClave.Text = admin.ClaveAdmin.ToString();
                this.txtMail.Text = admin.Mail.ToString();
                this.txtPassword.Text = admin.Password.ToString();

                btnAlta.Enabled = false;
                btnBaja.Enabled = true;
                btnModificar.Enabled = true;
            }
            protected void btnLimpiar_Click(object sender, EventArgs e)
            {
                Limpiar();
            }

        #endregion

        #region ABM
        protected void btnAlta_Click(object sender, EventArgs e)
        {
            if (!FaltanDatos())
            {
                string nombre = this.txtNombre.Text;
                int ci = int.Parse(this.txtCi.Text);
                int clave = int.Parse(this.txtClave.Text);
                string mail = this.txtMail.Text;
                string password = this.txtPassword.Text;

                if (Taller.BuscarAdminCI(ci) == null)
                {
                    Admin unAdmin = new Admin(nombre, ci, mail, password, clave);

                    if (Taller.AltaAdmin(unAdmin))
                    {
                        this.lblAlertas.Text = "Admin ingresado con éxito";
                        Limpiar();
                        Listar();
                    }
                }
                else
                {
                    this.lblAlertas.Text = "Este admin ya ha sido registrado";
                }
            }
            else { this.lblAlertas.Text = "Debe ingresar todos los datos"; }
        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            int ci = int.Parse(this.txtCi.Text);
            int clave = int.Parse(Session["Code"].ToString()); 

            if (Taller.BajaAdmin(ci, clave))
            {
                this.lblAlertas.Text = "Admin dado de baja con éxito";
                Limpiar();
                Listar();
            }
            else
            {
                this.lblAlertas.Text = "No tienes permiso para eliminar a otro admin";
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (!FaltanDatos())
            {
                string nombre = this.txtNombre.Text;
                int ci = int.Parse(this.txtCi.Text);
                int clave = int.Parse(this.txtClave.Text);
                string mail = this.txtMail.Text;
                string password = this.txtPassword.Text;

                Admin unAdmin = new Admin(nombre, ci, mail, password, clave);

                if (Taller.ModificarAdmin(unAdmin))
                {
                    this.lblAlertas.Text = "Admin modificado con éxito";
                    Limpiar();
                    Listar();
                }
            }
            else { this.lblAlertas.Text = "Debe ingresar todos los datos"; }
        }

        #endregion


    }
}
