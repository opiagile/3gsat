package classes
{
	import mx.formatters.CurrencyFormatter;
	
	[RemoteClass(alias="S3GWeb_pedidos.pedidos")]
	public class pedidos
	{
		public static const NAMESPACE:String = "S3GWeb_pedidos.pedidos";

		private var _pedidoid:int;
		public function get pedidoid():int { return this._pedidoid; }                
		public function set pedidoid(valor:int):void { this._pedidoid = valor; }	

		private var _distribuidorid:int;
		public function get distribuidorid():int { return this._distribuidorid; }                
		public function set distribuidorid(valor:int):void { this._distribuidorid = valor; }	

		private var _clienteid:int;
		public function get clienteid():int { return this._clienteid; }                
		public function set clienteid(valor:int):void { this._clienteid = valor; }	

		private var _fantasia:String;
		public function get fantasia():String { return this._fantasia; }                
		public function set fantasia(valor:String):void { this._fantasia = valor; }	

		private var _produtoid:int;
		public function get produtoid():int { return this._produtoid; }                
		public function set produtoid(valor:int):void { this._produtoid = valor; }	

		private var _descproduto:String;
		public function get descproduto():String { return this._descproduto; }                
		public function set descproduto(valor:String):void { this._descproduto = valor; }	

		private var _peso_liquido:Number;
		public function get peso_liquido():Number { return this._peso_liquido; }                
		public function set peso_liquido(valor:Number):void { this._peso_liquido = valor; }	

		private var _altura:Number;
		public function get altura():Number { return this._altura; }                
		public function set altura(valor:Number):void { this._altura = valor; }	
                                    
		private var _comprimento:Number;
		public function get comprimento():Number { return this._comprimento; }                
		public function set comprimento(valor:Number):void { this._comprimento = valor; }	

		private var _largura:Number;
		public function get largura():Number { return this._largura; }                
		public function set largura(valor:Number):void { this._largura = valor; }	

		private var _mcubico:Number;
		public function get mcubico():Number { return this._mcubico; }                
		public function set mcubico(valor:Number):void { this._mcubico = valor; }	

		private var _quantidade:Number;
		public function get quantidade():Number { return this._quantidade; }                
		public function set quantidade(valor:Number):void { this._quantidade = valor; }	
		
		private var _datacadastro:String;
		public function get datacadastro():String { return this._datacadastro; }                
		public function set datacadastro(valor:String):void { this._datacadastro = valor; }	

		public function pedidos()
		{
		}

	}
}