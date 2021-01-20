package classes
{
	
	[RemoteClass(alias="S3GWeb_veiculos.veiculos")]
	public class veiculos
	{
		public static const NAMESPACE:String = "S3GWeb_veiculos.veiculos";

		private var _veiculoid:int;
		public function get veiculoid():int { return this._veiculoid; }                
		public function set veiculoid(valor:int):void { this._veiculoid = valor; }	

		private var _nomeveiculo:String;
		public function get nomeveiculo():String { return this._nomeveiculo; }                
		public function set nomeveiculo(valor:String):void { this._nomeveiculo = valor; }	

		private var _peso_max:Number;
		public function get peso_max():Number { return this._peso_max; }                
		public function set peso_max(valor:Number):void { this._peso_max = valor; }	

		private var _altura:Number;
		public function get altura():Number { return this._altura; }                
		public function set altura(valor:Number):void { this._altura = valor; }	

		private var _largura:Number;
		public function get largura():Number { return this._largura; }                
		public function set largura(valor:Number):void { this._largura = valor; }	
                                    
		private var _comprimento:Number;
		public function get comprimento():Number { return this._comprimento; }                
		public function set comprimento(valor:Number):void { this._comprimento = valor; }	

		private var _observacao:String;
		public function get observacao():String { return this._observacao; }                
		public function set observacao(valor:String):void { this._observacao = valor; }	

		private var _datacadastro:String;
		public function get datacadastro():String { return this._datacadastro; }                
		public function set datacadastro(valor:String):void { this._datacadastro = valor; }	

		private var _dataalteracao:String;
		public function get dataalteracao():String { return this._dataalteracao; }                
		public function set dataalteracao(valor:String):void { this._dataalteracao = valor; }	

		public function veiculos()
		{
		}

	}
}