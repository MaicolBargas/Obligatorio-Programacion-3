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
    public partial class MisDatos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListarDatos();
        }
        protected void linkMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");

        }
        protected void ListarDatos()
        {
            int ci = int.Parse(this.Session["ci"].ToString());
            Usuario user = Taller.BuscarUsuarioCI(ci);

            txtNombre.Text = user.Nombre.ToString();
            txtCI.Text = user.Ci.ToString();
            txtTelefono.Text = user.Telefono.ToString();
            txtMail.Text = user.Mail.ToString();
            txtPassword.Text = user.Password.ToString();
        }
        private bool FaltanDatos()
        {
            if (this.txtMail.Text == "" || this.txtPassword.Text == "" || this.txtNombre.Text == "" || this.txtCI.Text == "" || this.txtTelefono.Text == "")
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        protected void btnModificar_Click(object sender, EventArgs e)
        {
                string nombre = this.txtNombre.Text;
                int ci = int.Parse(this.Session["ci"].ToString());
                string telefono = this.txtTelefono.Text;
                string mail = this.txtMail.Text;
                string password = this.txtPassword.Text;

                Usuario user = new Usuario(nombre, ci, telefono, mail, password);
                 
                if (Taller.ModificarUsuario(user))
                {
                    this.lblAlertas.Text = "Modificado exitosamente";
                    ListarDatos();
                }
        }


    }
}