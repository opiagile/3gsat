package mapeamento
{
	[RemoteClass(alias="IntegracaoFlex.Pessoa")]
	public class Pessoa
	{
		private var _id_Pessoa:int;		
		public function get Id_Pessoa():int { return this._id_Pessoa; }		
		public function set Id_Pessoa(valor:int):void { this._id_Pessoa = valor; }
		
		private var _nome:String;		
		public function get Nome():String { return this._nome; }		
		public function set Nome(valor:String):void { this._nome = valor; }
		
		private var _telefone:String;
		public function get Telefone():String { return this._telefone; }		
		public function set Telefone(valor:String):void { this._telefone = valor; }		
		
		public function Pessoa()
		{
			
		}		
	}
}