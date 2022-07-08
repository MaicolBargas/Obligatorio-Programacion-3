using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data;
using System.Data.SqlClient;


namespace Persistencia
{
    public class PersReparacion_Repuesto : Conexion
    {
        public static List<Reparacion_Repuesto> ListaReparacion_Repuesto()
        {
            List<Reparacion_Repuesto> lista = new List<Reparacion_Repuesto>();
            try
            {
                Reparacion_Repuesto reparacion_repuesto;

                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("ListarReparacion_Repuesto", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        reparacion_repuesto = new Reparacion_Repuesto();
                        reparacion_repuesto.IdReparacion = int.Parse(reader["IdReparacion"].ToString());
                        reparacion_repuesto.IdRepuesto = int.Parse(reader["IdRepuesto"].ToString());
                        reparacion_repuesto.Cantidad = int.Parse(reader["Cantidad"].ToString());

                        lista.Add(reparacion_repuesto);
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

        public static DataTable MostrarReparacion_Repuesto()
        {
            var conexionSQL = new SqlConnection(CadenadaDeConexion);
            conexionSQL.Open();
            SqlDataAdapter da = new SqlDataAdapter("ListarReparacion_Repuesto", conexionSQL);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public static DataTable ListarReparacionRepuestoxReparacion(int pIdReparacion)
        {
            var conexionSQL = new SqlConnection(CadenadaDeConexion);
            conexionSQL.Open();
            SqlCommand cmd = new SqlCommand("ListarReparacionRepuestoxReparacion", conexionSQL);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@idReparacion", pIdReparacion));
            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            return dt;
        }

        public static bool AltaReparacion_Repuesto(Reparacion_Repuesto pReparacion_Repuesto)
        {
            bool resultado = false;

            try
            {
                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("AltaReparacion_Repuesto", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;


                cmd.Parameters.Add(new SqlParameter("@IdReparacion", pReparacion_Repuesto.IdReparacion));
                cmd.Parameters.Add(new SqlParameter("@IdRepuesto", pReparacion_Repuesto.IdRepuesto));
                cmd.Parameters.Add(new SqlParameter("@Cantidad", pReparacion_Repuesto.Cantidad));


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
