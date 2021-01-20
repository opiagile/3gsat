using System;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.ComponentModel;
using System.Text;
using System.Web.Configuration;
using System.Collections.Generic;
using FluorineFx;

namespace S3GWeb
{
    [RemotingService]
    public class get_veiculos_por_cliente
    {
        private string _Conexao = WebConfigurationManager.ConnectionStrings["Conexao"].ToString();

        #region Atributos
        private int clienteid;
        public int clienteid
        {
            get { return _clienteid; }
            set { _clienteid = value; }
        }

        private string placa;
        public string placa
        {
            get { return _placa; }
            set { _placa = value; }
        }

        private int tipoveiculoid;
        public int tipoveiculoid
        {
            get { return _tipoveiculoid; }
            set { _tipoveiculoid = value; }
        }

        private string marca;
        public string marca
        {
            get { return _marca; }
            set { _marca = value; }
        }

        private string modelo;
        public string modelo
        {
            get { return _modelo; }
            set { _modelo = value; }
        }

        private string descricao;
        public string descricao
        {
            get { return _descricao; }
            set { _descricao = value; }
        }

        private string status;
        public string status
        {
            get { return _status; }
            set { _status = value; }
        }

        private string observacao;
        public string observacao
        {
            get { return _observacao; }
            set { _observacao = value; }
        }

        private string estado;
        public string estado
        {
            get { return _estado; }
            set { _estado = value; }
        }

        #endregion

        #region Construtores
        public get_veiculos_por_cliente()
        {
 
        }

        public get_veiculos_por_cliente(OleDbDataReader reader)
        {
            this._placa = (int)reader["placa"];
            this._tipoveiculoid = (int)reader["tipoveiculoid"];
            this._marca = (int)reader["marca"];
            this._modelo = (int)reader["modelo"];
            this._descricao = (int)reader["descricao"];
            this._status = (int)reader["status"];
            this._observacao = (int)reader["observacao"];
            this._estado = (int)reader["estado"];
        }
        #endregion

        #region Metodos
        public List<get_veiculos_por_cliente> SelecionaVeiculos()
        {
            SqlConnection connection = new SqlConnection(_Conexao);
            SqlDataReader leitor;

            SqlCommand command = new SqlCommand("sp_get_veiculos_por_cliente", connection);

            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add(new SqlParameter("@clienteid", clienteid));

            try
            {
                connection.Open();
                leitor = command.ExecuteReader();
                    leitor.Read(); 
                    if (leitor["usuario"].ToString() == validando._Usuario && leitor["senha"].ToString() == validando._Senha)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
            }
            catch (Exception) { throw; }
            finally { connection.Close(); }
        }

        #endregion
    }
}