package classes
{
	[RemoteClass(alias="S3GWeb_valida_usuario.valida_usuario")]
	public class autenticar_usuario
	{
		public static const NAMESPACE:String = "S3GWeb_valida_usuario.valida_usuario";

		private var _Usuario:String;
		public function get Usuario():String { return this._Usuario; }                
		public function set Usuario(valor:String):void { this._Usuario = valor; }	
		
		private var _Senha:String;
		public function get Senha():String { return this._Senha; }                
		public function set Senha(valor:String):void { this._Senha = valor; }	

		private var _distribuidorid:int;
		public function get distribuidorid():int { return this._distribuidorid; }                
		public function set distribuidorid(valor:int):void { this._distribuidorid = valor; }	

		private var _grupoId:int;
		public function get grupoId():int { return this._grupoId; }                
		public function set grupoId(valor:int):void { this._grupoId = valor; }	

		private var _codcli:int;
		public function get codcli():int { return this._codcli; }                
		public function set codcli(valor:int):void { this._codcli = valor; }	

		private var _natureza:String;
		public function get natureza():String { return this._natureza; }                
		public function set natureza(valor:String):void { this._natureza = valor; }	

		private var _nome:String;
		public function get nome():String { return this._nome; }                
		public function set nome(valor:String):void { this._nome = valor; }	

		private var _endereco:String;
		public function get endereco():String { return this._endereco; }                
		public function set endereco(valor:String):void { this._endereco = valor; }	

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
		public function get celular():String { return this._celular; }                
		public function set celular(valor:String):void { this._celular = valor; }	

		private var _email:String;
		public function get email():String { return this._email; }                
		public function set email(valor:String):void { this._email = valor; }	

		private var _observacao:String;
		public function get observacao():String { return this._observacao; }                
		public function set observacao(valor:String):void { this._observacao = valor; }	

		private var _ultimoacesso:String;
		public function get ultimoacesso():String { return this._ultimoacesso; }                
		public function set ultimoacesso(valor:String):void { this._ultimoacesso = valor; }	
		
		public function autenticar_usuario()
		{
		}

	}
}