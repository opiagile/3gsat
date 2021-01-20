package mapeamento
{
    [RemoteClass(alias="S3GWeb_cadastro_cliente.cadastro_cliente")]
	public class atualizar_cadastro_cliente
	{
		public static const NAMESPACE:String = "S3GWeb_cadastro_cliente.cadastro_cliente";
		
		private var _endereco:String;
		public function get endereco():String { return this._endereco; }                
		public function set endereco(valor:String):void { this._endereco = valor; }			

		private var _numero:int;
		public function get numero():int{ return this._numero; }                
		public function set numero(valor:int):void { this._numero = valor; }	

		private var _cidade:String;
		public function get cidade():String { return this._cidade; }                
		public function set cidade(valor:String):void { this._cidade = valor; }	

		private var _estado:String;
		public function get estado():String { return this._estado; }                
		public function set estado(valor:String):void { this._estado = valor; }	

		private var _telefone:String;
		public function get telefone():String { return this._telefone; }                
		public function set telefone(valor:String):void { this._telefone = valor; }	

		private var _celular:String;
		public function get celular():String{ return this._celular; }                
	    public function set celular(valor:String):void { this._celular = valor; }	

		private var _email:String;
		public function get email():String{ return this._email; }                
		public function set email(valor:String):void { this._email = valor; }	

		private var _senha:String;
		public function get senha():String{ return this._senha; }                
		public function set senha(valor:String):void { this._senha = valor; }	
		
		public function atualizar_cadastro_cliente()
		{
		}

	}
}