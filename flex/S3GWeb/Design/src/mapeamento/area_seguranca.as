package mapeamento
{
	[RemoteClass(alias="S3GWeb_area_seguranca.get_area_seguranca")]
	public class area_seguranca
	{
		public static const NAMESPACE:String = "S3GWeb_area_seguranca.get_area_seguranca";

		private var _cercaeletronicaid:int;
		public function get cercaeletronicaid():int { return this._cercaeletronicaid; }                
		public function set cercaeletronicaid(valor:int):void { this._cercaeletronicaid = valor; }	

		private var _nome:String;
		public function get nome():String { return this._nome; }                
		public function set nome(valor:String):void { this._nome = valor; }	
		
		private var _status:String;
		public function get status():String { return this._status; }                
		public function set status(valor:String):void { this._status = valor; }	

		private var _area:String;
		public function get area():String { return this._area; }                
		public function set area(valor:String):void { this._area = valor; }	

		private var _dataHoraCadastro:String;
		public function get dataHoraCadastro():String { return this._dataHoraCadastro; }                
		public function set dataHoraCadastro(valor:String):void { this._dataHoraCadastro = valor; }	

		private var _dataHoraAlteracao:String;
		public function get dataHoraAlteracao():String { return this._dataHoraAlteracao; }                
		public function set dataHoraAlteracao(valor:String):void { this._dataHoraAlteracao = valor; }	

		private var _sequencia:int;
		public function get sequencia():int { return this._sequencia; }                
		public function set sequencia(valor:int):void { this._sequencia = valor; }	

		private var _clienteid:int;
		public function get clienteid():int { return this._clienteid; }                
		public function set clienteid(valor:int):void { this._clienteid = valor; }	

		public function area_seguranca()
		{
		} 

	}
}