using System;
using FluorineFx;
using System.Collections.Generic;

namespace IntegracaoFlex
{
    /// <summary>
    /// Representa uma Pessoa.
    /// </summary>
    [RemotingService]
    public class Pessoa
    {
        #region Atributos

        private int _id_Pessoa;

        /// <summary>
        /// Id da Pessoa.
        /// </summary>
        public int Id_Pessoa
        {
            get { return _id_Pessoa; }
            set { _id_Pessoa = value; }
        }
        private string _nome;

        /// <summary>
        /// Nome da Pessoa.
        /// </summary>
        public string Nome
        {
            get { return _nome; }
            set { _nome = value; }
        }
        private string _telefone;

        /// <summary>
        /// Telefone da Pessoa.
        /// </summary>
        public string Telefone
        {
            get { return _telefone; }
            set { _telefone = value; }
        }

        #endregion

        #region Construtores

        /// <summary>
        /// Construtor padrão da classe.
        /// </summary>
        public Pessoa()
        {

        }

        /// <summary>
        /// Construtor que alimenta todos os atributos da classe.
        /// </summary>
        /// <param name="id_Pessoa">Id da Pessoa.</param>
        /// <param name="nome">Nome da Pessoa.</param>
        /// <param name="telefone">Telefone da Pessoa.</param>
        public Pessoa(int id_Pessoa, string nome, string telefone)
        {
            this._id_Pessoa = id_Pessoa;
            this._nome = nome;
            this._telefone = telefone;
        }

        #endregion

        #region Metodos

        /// <summary>
        /// Insere um novo cliente no banco de dados.
        /// </summary>
        /// <returns>Cliente inserido no banco de dados.</returns>
        public string Insere(Pessoa _pessoa)
        {
            string _retorno = "--- Pessoa Inserida ---\n";

            _retorno += "Id_Pessoa: " + _pessoa._id_Pessoa.ToString() + "\n";
            _retorno += "Nome: " + _pessoa._nome + "\n";
            _retorno += "Telefone: " + _pessoa._telefone;

            return _retorno;
        }

        /// <summary>
        /// Seleciona uma lista de pessoas no banco de dados.
        /// </summary>
        /// <returns>Lista de pessoas cadastradas.</returns>
        public List<Pessoa> Lista()
        {
            List<Pessoa> _lista = new List<Pessoa>();

            //Adiciona algumas pessoas para exemplificar
            _lista.Add(new Pessoa(1, "Vinicius", "(16)3711-1111"));
            _lista.Add(new Pessoa(5, "Cristian", "(16)3722-2222"));
            _lista.Add(new Pessoa(9, "Juliano", "(16)3733-3333"));
            _lista.Add(new Pessoa(15, "Ricardo", "(16)3744-4444"));
            _lista.Add(new Pessoa(3, "Euripedes", "(16)3755-5555"));

            return _lista;
        }

        #endregion
    }
}