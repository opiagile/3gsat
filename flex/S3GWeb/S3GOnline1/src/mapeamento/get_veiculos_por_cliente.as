package mapeamento
{
	[RemoteClass(alias="S3GWeb_get_veiculo.get_veiculos_por_cliente")]
	public class get_veiculos_por_cliente
	{
		public static const NAMESPACE:String = "S3GWeb_get_veiculo.get_veiculos_por_cliente";
		
		private var _placa:String;
		public function get placa():String { return this._placa; }                
		public function set placa(valor:String):void { this._placa = valor; }			

		private var _tipoveiculoid:int;
		public function get tipoveiculoid():int{ return this._tipoveiculoid; }                
		public function set tipoveiculoid(valor:int):void { this._tipoveiculoid = valor; }	

		private var _marca:String;
		public function get marca():String { return this._marca; }                
		public function set marca(valor:String):void { this._marca = valor; }	

		private var _modelo:String;
		public function get modelo():String { return this._modelo; }                
		public function set modelo(valor:String):void { this._modelo = valor; }	

		private var _descricao:String;
		public function get descricao():String { return this._descricao; }                
		public function set descricao(valor:String):void { this._descricao = valor; }	

		private var _latitude:Number;
		public function get latitude():Number{ return this._latitude; }                
		public function set latitude(valor:Number):void { this._latitude = valor; }	

		private var _longitude:Number;
		public function get longitude():Number{ return this._longitude; }                
		public function set longitude(valor:Number):void { this._longitude = valor; }	

		private var _datahorarecebimento:Date;
		public function get datahorarecebimento():Date{ return this._datahorarecebimento; }                
	    public function set datahorarecebimento(valor:Date):void { this._datahorarecebimento = valor; }	

		private var _velocidade:int;
		public function get velocidade():int{ return this._velocidade; }                
		public function set velocidade(valor:int):void { this._velocidade = valor; }	

		private var _ignicao:int;
		public function get ignicao():int{ return this._ignicao; }                
		public function set ignicao(valor:int):void { this._ignicao = valor; }	

		private var _motor:int;
		public function get motor():int{ return this._motor; }                
		public function set motor(valor:int):void { this._motor = valor; }	

		private var _panico:int;
		public function get panico():int{ return this._panico; }                
		public function set panico(valor:int):void { this._panico = valor; }	

		private var _coordenada:int;
		public function get coordenada():int { return this._coordenada; }                
		public function set coordenada(valor:int):void { this._coordenada = valor; }	

		private var _sinalgprs:int;
		public function get sinalgprs():int { return this._sinalgprs; }                
		public function set sinalgprs(valor:int):void { this._sinalgprs = valor; }	

		private var _mensagemRastreamentoId:int;
		public function get mensagemRastreamentoId():int { return this._mensagemRastreamentoId; }                
		public function set mensagemRastreamentoId(valor:int):void { this._mensagemRastreamentoId = valor; }	

		public function get_veiculos_por_cliente()
		{		
		}

	}
}