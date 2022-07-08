using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Dominio;

namespace Persistencia
{
    public class PersAdmin : Conexion
    {
        public static List<Admin> ListaAdmin()
        {
            List<Admin> lista = new List<Admin>();
            try
            {
                Admin admin;

                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("ListarAdmin", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        admin = new Admin();
                        admin.IdAdmin = int.Parse(reader["IdAdmin"].ToString());
                        admin.Nombre = reader["Nombre"].ToString();
                        admin.Ci = int.Parse(reader["Ci"].ToString());
                        admin.Mail = reader["Mail"].ToString();
                        admin.Password = reader["Password"].ToString();
                        admin.ClaveAdmin = int.Parse(reader["ClaveAdmin"].ToString());

                        lista.Add(admin);
                    }
                }
                conexionSQL.Close();
            }
            catch (Exception ex)
            {

                throw new Exception(ex.ToString());

            }
            return lista;
        }

        public static DataTable MostrarAdmin()
        {
            var conexionSQL = new SqlConnection(CadenadaDeConexion);
            conexionSQL.Open();
            SqlDataAdapter da = new SqlDataAdapter("ListarAdmin", conexionSQL);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public static bool AltaAdmin(Admin pAdmin)
        {
            bool resultado = false;

            try
            {
                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("AltaAdmin", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@Nombre", pAdmin.Nombre));
                cmd.Parameters.Add(new SqlParameter("@Ci", pAdmin.Ci));
                cmd.Parameters.Add(new SqlParameter("@Mail", pAdmin.Mail));
                cmd.Parameters.Add(new SqlParameter("@Password", pAdmin.Password));
                cmd.Parameters.Add(new SqlParameter("@ClaveAdmin", pAdmin.ClaveAdmin));
                
                int resBD = cmd.ExecuteNonQuery();

                if (resBD > 0)
                {
                    resultado = true;
                }
                if (conexionSQL.State == ConnectionState.Open)
                {
                    conexionSQL.Close();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return resultado;

        }

        public static bool BajaAdmin(int pCi, int pClave)
        {
            bool resultado = false;

            try
            {
                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("BajaAdmin", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@Ci", pCi));
                cmd.Parameters.Add(new SqlParameter("@CodAdmin", pClave));


                int resBD = cmd.ExecuteNonQuery();

                if (resBD > 0)
                {
                    resultado = true;
                }
                if (conexionSQL.State == ConnectionState.Open)
                {
                    conexionSQL.Close();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return resultado;

        }

        public static bool ModificarAdmin(Admin pAdmin)
        {
            bool resultado = false;

            try
            {
                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("ModificarAdmin", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@Nombre", pAdmin.Nombre));
                cmd.Parameters.Add(new SqlParameter("@Ci", pAdmin.Ci));
                cmd.Parameters.Add(new SqlParameter("@Mail", pAdmin.Mail));
                cmd.Parameters.Add(new SqlParameter("@Password", pAdmin.Password));
                cmd.Parameters.Add(new SqlParameter("@ClaveAdmin", pAdmin.ClaveAdmin));

                int resBD = cmd.ExecuteNonQuery();

                if (resBD > 0)
                {
                    resultado = true;
                }
                if (conexionSQL.State == ConnectionState.Open)
                {
                    conexionSQL.Close();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return resultado;

        }
    }
}
