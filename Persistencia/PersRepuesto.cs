using System;
using Dominio;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public class PersRepuesto : Conexion
    {
        public static List<Repuesto> ListaRepuesto()
        {
            List<Repuesto> lista = new List<Repuesto>();
            try
            {
                Repuesto repuesto;

                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("ListarRepuesto", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        repuesto = new Repuesto();
                        repuesto.IdRepuesto = int.Parse(reader["IdRepuesto"].ToString());
                        repuesto.DescRepuesto1 = reader["Descripcion"].ToString();
                        repuesto.CostoRepuesto1 = int.Parse(reader["Costo"].ToString());
                        repuesto.TipoRepuesto1 = Convert.ToChar(reader["Tipo"].ToString());
                        repuesto.ProveedorRepuesto = int.Parse(reader["Proveedor"].ToString());

                        lista.Add(repuesto);
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

        public static DataTable MostrarRepuesto()
        {
            var conexionSQL = new SqlConnection(CadenadaDeConexion);
            conexionSQL.Open();
            SqlDataAdapter da = new SqlDataAdapter("ListarRepuesto", conexionSQL);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public static DataTable RepuestoMasUsado()
        {
            var conexionSQL = new SqlConnection(CadenadaDeConexion);
            conexionSQL.Open();
            SqlDataAdapter da = new SqlDataAdapter("RepuestoMasUsado", conexionSQL);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public static bool AltaRepuesto(Repuesto pRepuesto)
        {
            bool resultado = false;

            try
            {
                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("AltaRepuesto", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@IdRepuesto", pRepuesto.IdRepuesto));
                cmd.Parameters.Add(new SqlParameter("@Descripcion", pRepuesto.DescRepuesto1));
                cmd.Parameters.Add(new SqlParameter("@Costo", pRepuesto.CostoRepuesto1));
                cmd.Parameters.Add(new SqlParameter("@Tipo", pRepuesto.TipoRepuesto1));
                cmd.Parameters.Add(new SqlParameter("@Proveedor", pRepuesto.ProveedorRepuesto));

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

        public static bool BajaRepuesto(int pId)
        {
            bool resultado = false;

            try
            {
                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("BajaRespuesto", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@Id", pId));

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

        public static bool ModificarRepuesto(Repuesto pRepuesto)
        {
            bool resultado = false;

            try
            {
                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("ModificarRepuesto", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@Id", pRepuesto.IdRepuesto));
                cmd.Parameters.Add(new SqlParameter("@Descripcion", pRepuesto.DescRepuesto1));
                cmd.Parameters.Add(new SqlParameter("@Costo", pRepuesto.CostoRepuesto1));
                cmd.Parameters.Add(new SqlParameter("@Tipo", pRepuesto.TipoRepuesto1));
                cmd.Parameters.Add(new SqlParameter("@Proveedor", pRepuesto.ProveedorRepuesto));

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
