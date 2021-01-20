/*
******************************************************************************************
Data..........: 23/01/2009
Responsável...: Vinícius Sandim
Objeto........: Classe de negócio responsável por gerenciar a tabela Contatos.
******************************************************************************************
*/

using System;
using System.Text;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Data.OleDb;
using FluorineFx;

namespace Agenda.Net
{
    /// <summary>
    /// Representa um contato da agenda.
    /// </summary>
    [RemotingService]
    public class Contato
    {
        private string _stringConexao = WebConfigurationManager.ConnectionStrings["StringConexao"].ToString();

        #region Atributos

        private int _id_Contato;

        /// <summary>
        /// Código do contato.
        /// </summary>
        public int Id_Contato
        {
            get { return _id_Contato; }
            set { _id_Contato = value; }
        }
        private string _nome;

        /// <summary>
        /// Nome do contato.
        /// </summary>
        public string Nome
        {
            get { return _nome; }
            set { _nome = value; }
        }
        private string _email;

        /// <summary>
        /// Email do contato.
        /// </summary>
        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }
        private string _telefone;

        /// <summary>
        /// Telefone do contato.
        /// </summary>
        public string Telefone
        {
            get { return _telefone; }
            set { _telefone = value; }
        }
        private string _celular;

        /// <summary>
        /// Celular do contato.
        /// </summary>
        public string Celular
        {
            get { return _celular; }
            set { _celular = value; }
        }
        private string _observacoes;

        /// <summary>
        /// Observações gerais sobre o contato.
        /// </summary>
        public string Observacoes
        {
            get { return _observacoes; }
            set { _observacoes = value; }
        }

        #endregion

        #region Construtores

        /// <summary>
        /// Construtor padrão da classe.
        /// </summary>
        public Contato()
        {

        }
		
		/// <summary>
        /// Construtor que alimenta os atributos da classe através de um OleDbDataReader.
        /// </summary>
        /// <param name="reader">OleDbDataReader onde se encontram os atributos da classe.</param>
        public Contato(OleDbDataReader reader)
        {
            this._id_Contato = (int)reader["Id_Contato"];
            this._nome = (string)reader["Nome"];
            this._email = (string)reader["Email"];
            this._telefone = (string)reader["Telefone"];
            this._celular = (string)reader["Celular"];
            this._observacoes = (string)reader["Observacoes"];
        }

        #endregion

        #region Metodos

        /// <summary>
        /// Insere um novo contato no banco de dados.
        /// </summary>
        /// <param name="contato">Contato a ser inserido.</param>
        public void Insere(Contato contato)
        {
            StringBuilder sql = new StringBuilder();

            sql.Append("    INSERT INTO Contatos    ");
            sql.Append("    (                       ");
            sql.Append("        Nome,               ");
            sql.Append("        Email,              ");
            sql.Append("        Telefone,           ");
            sql.Append("        Celular,            ");
            sql.Append("        Observacoes         ");
            sql.Append("    )                       ");
            sql.Append("    VALUES                  ");
            sql.Append("    (                       ");
            sql.Append("        @P_Nome,            ");
            sql.Append("        @P_Email,           ");
            sql.Append("        @P_Telefone,        ");
            sql.Append("        @P_Celular,         ");
            sql.Append("        @P_Observacoes      ");
            sql.Append("     )                      ");

            OleDbConnection con = new OleDbConnection(_stringConexao);
            OleDbCommand cmd = new OleDbCommand(sql.ToString(), con);

            cmd.Parameters.AddWithValue("@P_Nome", contato._nome);
            cmd.Parameters.AddWithValue("@P_Email", contato._email);
            cmd.Parameters.AddWithValue("@P_Telefone", contato._telefone);
            cmd.Parameters.AddWithValue("@P_Celular", contato._celular);
            cmd.Parameters.AddWithValue("@P_Observacoes", contato._observacoes);

            con.Open();

            using(con)
                cmd.ExecuteNonQuery();
            
        }

        /// <summary>
        /// Altera os dados de um contato existente no banco de dados.
        /// </summary>
        /// <param name="contato">Contato a ser alterado.</param>
        public void Altera(Contato contato)
        {
            StringBuilder sql = new StringBuilder();

            sql.Append("    UPDATE Contatos SET 				");
            sql.Append("        Nome        = @P_Nome,          ");
            sql.Append("        Email       = @P_Email,         ");
            sql.Append("        Telefone    = @P_Telefone,      ");
            sql.Append("        Celular     = @P_Celular,       ");
            sql.Append("        Observacoes = @P_Observacoes    ");
            sql.Append("    WHERE                               ");
            sql.Append("        Id_Contato = @P_Id_Contato      ");

            OleDbConnection con = new OleDbConnection(_stringConexao);
            OleDbCommand cmd = new OleDbCommand(sql.ToString(), con);

            cmd.Parameters.AddWithValue("@P_Nome", contato._nome);
            cmd.Parameters.AddWithValue("@P_Email", contato._email);
            cmd.Parameters.AddWithValue("@P_Telefone", contato._telefone);
            cmd.Parameters.AddWithValue("@P_Celular", contato._celular);
            cmd.Parameters.AddWithValue("@P_Observacoes", contato._observacoes);
            cmd.Parameters.AddWithValue("@P_Id_Contato", contato._id_Contato);

            con.Open();

            using (con)
                cmd.ExecuteNonQuery();
        }

        /// <summary>
        /// Exclui um contato existente no banco de dados.
        /// </summary>
        /// <param name="id_Contato">Código do contato a ser excluido.</param>
        public void Exclui(int id_Contato)
        {
            StringBuilder sql = new StringBuilder();

            sql.Append("    DELETE FROM                     ");
            sql.Append("        Contatos                    ");
            sql.Append("    WHERE                           ");
            sql.Append("        Id_Contato = @P_Id_Contato  ");

            OleDbConnection con = new OleDbConnection(_stringConexao);
            OleDbCommand cmd = new OleDbCommand(sql.ToString(), con);

            cmd.Parameters.AddWithValue("@P_Id_Contato", id_Contato);

            con.Open();

            using (con)
                cmd.ExecuteNonQuery();
        }

        /// <summary>
        /// Seleciona todos os contatos existentes no banco de dados.
        /// </summary>
        /// <returns>Lista completa de contatos existentes no banco de dados ordenados pelo Nome.</returns>
        public List<Contato> SelecionaTodos()
        {
            StringBuilder sql = new StringBuilder();

            sql.Append("    SELECT              ");
            sql.Append("        *               ");       
            sql.Append("    FROM                ");
            sql.Append("        Contatos        ");
            sql.Append("    ORDER BY            ");
            sql.Append("        Nome            ");

            OleDbConnection con = new OleDbConnection(_stringConexao);
            OleDbCommand cmd = new OleDbCommand(sql.ToString(), con);

            List<Contato> lista = new List<Contato>();

            con.Open();

            using (con)
            {
                OleDbDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                    lista.Add(new Contato(reader));
            }

            return lista;
        }

        #endregion
    }
}