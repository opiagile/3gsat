package classes
{
	import mx.messaging.channels.StreamingAMFChannel;
	
	[RemoteClass(alias="S3GWeb_cliente.cliente")]
	public class cliente
	{
		public static const NAMESPACE:String = "S3GWeb_cliente.cliente";

		private var _clienteid:int;
		public function get clienteid():int { return this._clienteid; }                
		public function set clienteid(valor:int):void { this._clienteid = valor; }	

		private var _codcli:int;
		public function get codcli():int { return this._codcli; }                
		public function set codcli(valor:int):void { this._codcli = valor; }	
        
		private var _distribuidorid:int;
		public function get distribuidorid():int { return this._distribuidorid; }                
		public function set distribuidorid(valor:int):void { this._distribuidorid = valor; }	

		private var _natureza:int;
		public function get natureza():int { return this._natureza; }                
		public function set natureza(valor:int):void { this._natureza = valor; }	

		private var _cpf_cnpj:int;
		public function get cpf_cnpj():int { return this._cpf_cnpj; }                
		public function set cpf_cnpj(valor:int):void { this._cpf_cnpj = valor; }	

		private var _inscricaouf:int;
		public function get inscricaouf():int { return this._inscricaouf; }                
		public function set inscricaouf(valor:int):void { this._inscricaouf = valor; }	

		private var _fantasia:String;
		public function get fantasia():String { return this._fantasia; }                
		public function set fantasia(valor:String):void { this._fantasia = valor; }	

		private var _razaosocial:String;
		public function get razaosocial():String { return this._razaosocial; }                
		public function set razaosocial(valor:String):void { this._razaosocial = valor; }	

		private var _endereco:String;
		public function get endereco():String { return this._endereco; }                
		public function set endereco(valor:String):void { this._endereco = valor; }	
		
		private var _bairro:String;
		public function get bairro():String { return this._bairro; }                
		public function set bairro(valor:String):void { this._bairro = valor; }	
		
		private var _numero:int;
		public function get numero():int { return this._numero; }                
		public function set numero(valor:int):void { this._numero = valor; }	

		private var _complemento:String;
		public function get complemento():String { return this._complemento; }                
		public function set complemento(valor:String):void { this._complemento = valor; }	

		private var _cidade:String;
		public function get cidade():String { return this._cidade; }                
		public function set cidade(valor:String):void { this._cidade = valor; }	
		
		private var _estado:String;
		public function get estado():String { return this._estado; }                
		public function set estado(valor:String):void { this._estado = valor; }	
		
		private var _telefone1:int;
		public function get telefone1():int { return this._telefone1; }                
		public function set telefone1(valor:int):void { this._telefone1 = valor; }	
		
		private var _telefone2:int;
		public function get telefone2():int { return this._telefone2; }                
		public function set telefone2(valor:int):void { this._telefone2 = valor; }	
	
		private var _email:String;
		public function get email():String { return this._email; }                
		public function set email(valor:String):void { this._email = valor; }	
		
		private var _observacao:String;
		public function get observacao():String { return this._observacao; }                
		public function set observacao(valor:String):void { this._observacao = valor; }	
		
		private var _inativo:int;
		public function get inativo():int { return this._inativo; }                
		public function set inativo(valor:int):void { this._inativo = valor; }	

		private var _datacadastro:String;
		public function get datacadastro():String { return this._datacadastro; }                
		public function set datacadastro(valor:String):void { this._datacadastro = valor; }	

		public function cliente()
		{
		}

	}
}