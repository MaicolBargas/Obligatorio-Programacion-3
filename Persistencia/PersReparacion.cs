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
    public class PersReparacion : Conexion
    {
        public static List<Reparacion> ListaReparacion()
        {
            List<Reparacion> lista = new List<Reparacion>();
            try
            {
                Reparacion reparacion;

                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("ListarReparacion", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        reparacion = new Reparacion();
                        reparacion.IdReparacion = int.Parse(reader["IdReparacion"].ToString());
                        reparacion.IdVehiculo = int.Parse(reader["IdVehiculo"].ToString());
                        reparacion.FchEntrada = Convert.ToDateTime(reader["FchEntrada"].ToString());
                        reparacion.FchSalida = Convert.ToDateTime(reader["FchSalida"].ToString());
                        reparacion.IdMecanico = int.Parse(reader["IdMecanico"].ToString());
                        reparacion.DscEntrada = reader["DscEntrada"].ToString();
                        reparacion.DscSalida = reader["DscSalida"].ToString();
                        reparacion.KmsEntrada = int.Parse(reader["KmsEntrada"].ToString());

                        lista.Add(reparacion);
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

        public static DataTable MostrarReparacion()
        {
            var conexionSQL = new SqlConnection(CadenadaDeConexion);
            conexionSQL.Open();
            SqlDataAdapter da = new SqlDataAdapter("ListarReparacion", conexionSQL);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public static DataTable ListarReparacionXVehiculo(int pIdVehiculo)
        {
            var conexionSQL = new SqlConnection(CadenadaDeConexion);
            conexionSQL.Open();
            SqlCommand cmd = new SqlCommand("ListarReparacionXVehiculo", conexionSQL);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IdVehiculo", pIdVehiculo));
            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            return dt;
        }

        public static DataTable ListarReparacionXFecha(DateTime pFechaInicio, DateTime pFechaFin)
        {
            var conexionSQL = new SqlConnection(CadenadaDeConexion);
            conexionSQL.Open();
            SqlCommand cmd = new SqlCommand("ListarReparacionXFecha", conexionSQL);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@FechaInicio", pFechaInicio));
            cmd.Parameters.Add(new SqlParameter("@FechaFin", pFechaFin));
            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            return dt;
        }

        public static DataTable ListarReparacionXFechaVehiculo(DateTime pFechaInicio, DateTime pFechaFin, int pIdVehiculo)
        {
            var conexionSQL = new SqlConnection(CadenadaDeConexion);
            conexionSQL.Open();
            SqlCommand cmd = new SqlCommand("ListarReparacionXFechaVehiculo", conexionSQL);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@FechaInicio", pFechaInicio));
            cmd.Parameters.Add(new SqlParameter("@FechaFin", pFechaFin));
            cmd.Parameters.Add(new SqlParameter("@IdVehiculo", pIdVehiculo));

            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            return dt;
        }

        public static bool AltaReparacion(Reparacion pReparacion)
        {
            bool resultado = false;

            try
            {
                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("AltaReparacion", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@IdVehiculo", pReparacion.IdVehiculo));
                cmd.Parameters.Add(new SqlParameter("@FechaEntrada", pReparacion.FchEntrada));
                cmd.Parameters.Add(new SqlParameter("@FechaSalida", pReparacion.FchSalida));
                cmd.Parameters.Add(new SqlParameter("@IdMecanico", pReparacion.IdMecanico));
                cmd.Parameters.Add(new SqlParameter("@DesEntrada", pReparacion.DscEntrada));
                cmd.Parameters.Add(new SqlParameter("@DesSalida", pReparacion.DscSalida));
                cmd.Parameters.Add(new SqlParameter("@KmsEntrada", pReparacion.KmsEntrada));

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


        public static bool BajaReparacion(int pId)
        {
            bool resultado = false;

            try
            {
                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("BajaReparacion", conexionSQL);

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

        public static bool ModificarReparacion(Reparacion pReparacion)
        {
            bool resultado = false;

            try
            {
                var conexionSQL = new SqlConnection(CadenadaDeConexion);
                conexionSQL.Open();

                SqlCommand cmd = new SqlCommand("ModificarReparacion", conexionSQL);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@IdReparacion", pReparacion.IdReparacion));
                cmd.Parameters.Add(new SqlParameter("@IdVehiculo", pReparacion.IdVehiculo));
                cmd.Parameters.Add(new SqlParameter("@FechaEntrada", pReparacion.FchEntrada));
                cmd.Parameters.Add(new SqlParameter("@FechaSalida", pReparacion.FchSalida));
                cmd.Parameters.Add(new SqlParameter("@IdMecanico", pReparacion.IdMecanico));
                cmd.Parameters.Add(new SqlParameter("@DesEntrada", pReparacion.DscEntrada));
                cmd.Parameters.Add(new SqlParameter("@DesSalida", pReparacion.DscSalida));
                cmd.Parameters.Add(new SqlParameter("@KmsEntrada", pReparacion.KmsEntrada));

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
