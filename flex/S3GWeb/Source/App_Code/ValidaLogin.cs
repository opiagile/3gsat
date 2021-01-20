using System;
using System.Data;
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
using System.Data.OleDb;
using FluorineFx;

namespace S3GWeb
{
    [RemotingService]
    public class ValidaLogin
    {
        private string _Conexao = WebConfigurationManager.ConnectionStrings["Conexao"].ToString();

        #region Atributos
        private string _Usuario;
        public string Usuario
        {
            get { return _Usuario; }
            set { _Usuario = value; }
        }

        private string _Senha;
        public string Senha
        {
            get { return _Senha; }
            set { _Senha = value; }
        }

        private string _Senha;
        public string Senha
        {
            get { return _Senha; }
            set { _Senha = value; }
        }

        private int _clienteid;
        public int _clienteid
        {
            get { return _clienteid; }
            set { _Senha = value; }
        }

        private int _grupoId;
        public int grupoId
        {
            get { return _grupoId; }
            set { _grupoId = value; }
        }

        private int _codcli;
        public int codcli
        {
            get { return _codcli; }
            set { _codcli = value; }
        }

        private string _natureza;
        public string natureza
        {
            get { return _natureza; }
            set { _natureza = value; }
        }

        private string _nome;
        public string nome
        {
            get { return _nome; }
            set { _nome = value; }
        }

        private string _nome;
        public string nome
        {
            get { return _nome; }
            set { _nome = value; }
        }

        private string _endereco;
        public string endereco
        {
            get { return _endereco; }
            set { _endereco = value; }
        }

        private string _cidade;
        public string cidade
        {
            get { return _cidade; }
            set { _cidade = value; }
        }

        private string _estado;
        public string estado
        {
            get { return _estado; }
            set { _estado = value; }
        }
        
        private string _estado;
        public string estado
        {
            get { return _estado; }
            set { _estado = value; }
        }

        private string _telefone;
        public string telefone
        {
            get { return _telefone; }
            set { _telefone = value; }
        }

        private string _celular;
        public string celular
        {
            get { return _celular; }
            set { _celular = value; }
        }

        private string _email;
        public string email
        {
            get { return _email; }
            set { _email = value; }
        }

        private string _observacao;
        public string observacao
        {
            get { return _observacao; }
            set { _observacao = value; }
        }

        private Boolean _Validado;
        public Boolean Validado
        {
            get { return _Validado; }
            set { _Validado = value; }
        }
        #endregion

        #region Construtores
        public ValidaLogin()
        {

        }

        public ValidaLogin(string usuario, string senha, Boolean validado)
        {
            this._Usuario = usuario;
            this._Senha = senha;
            this._Validado = validado;
        }
        #endregion

        #region Metodos
        public Boolean validacao(ValidaLogin validando)
        {
            StringBuilder sql = new StringBuilder();

            sql.Append(" SELECT *                  ");
            sql.Append("   FROM acesso             ");
            sql.Append("  WHERE usuario = @USUARIO ");
            sql.Append("    AND senha   = @SENHA   ");

            OleDbConnection con = new OleDbConnection(_Conexao);
            OleDbCommand cmd = new OleDbCommand(sql.ToString(), con);

            cmd.Parameters.AddWithValue("@USUARIO", validando._Usuario);
            cmd.Parameters.AddWithValue("@SENHA", validando._Senha);

            con.Open();

            using (cmd.ExecuteReader)
            {
                OleDbDataReader leitor = cmd.ExecuteReader();

                string senha_teste = (string)leitor["senha"];
                string usuario_teste = (string)leitor["usuario"];

                while (leitor.Read())
                {
                    if (validando._Usuario == leitor["usuario"] && validando._Senha == leitor["senha"])
                    {
                        validando._Validado = true;
                    }
                    else
                    {
                        validando._Validado = true;
                    }
                }
                return validando._Validado;
            }
        }
        #endregion

    }
}