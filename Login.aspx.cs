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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            { 
             txtCodeAdmin.Visible = false; 
            }
        }
        private bool FaltanDatos()
        {
            if (this.txtMail.Text == "" || this.txtPassword.Text == "")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {        
            List<Admin> lista = new List<Admin>();
            lista = Taller.ListaAdmin();

            if(!FaltanDatos())
            { 
                string mail = this.txtMail.Text;
                string password = this.txtPassword.Text;
               
                if(this.txtCodeAdmin.Text != "")
                { 
                    int code = int.Parse(this.txtCodeAdmin.Text);
               
                    foreach(Admin admin in lista)
                    {
                        if(admin.ClaveAdmin == code && admin.Mail == mail && admin.Password == password)
                        {
                            Session["Email"] = mail;
                            Session["Password"] = password;
                            Session["Code"] = code;

                            Response.Redirect("Admins.aspx");
                        }
                        else
                        {
                            lblAlertas.Text = "Email, Constraseña o Codigo de admin incorrectos, Verifique";
                        }
                    }
                }
                else
                {
                    List<Usuario> listaU = new List<Usuario>();
                    listaU = Taller.ListaUsuario();

                foreach(Usuario user in listaU)
                { 
                    if(user.Mail == mail && user.Password == password)
                    {
                            Session["Email"] = mail;
                            Session["Password"] = password;
                            Session["ci"] = user.Ci;
                            Response.Redirect("Users.aspx");
                    }
                        else
                        {
                            lblAlertas.Text = "Email o Constraseña incorrectos, Verifique";
                        }
                    }
                }
            }
            else { lblAlertas.Text = "Debe ingresar todos los datos"; }
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
        Response.Redirect("Register.aspx");
        }

        protected void linkAdmin_Click(object sender, EventArgs e)
        {
            txtCodeAdmin.Visible = true;
        }
    }
}