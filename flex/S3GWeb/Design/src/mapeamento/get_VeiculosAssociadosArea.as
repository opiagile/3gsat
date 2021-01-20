package mapeamento
{
	[RemoteClass(alias="S3GWeb_associaAreaXVeiculo.AssociaAreaXVeiculo")]
	public class get_VeiculosAssociadosArea
	{
		public static const NAMESPACE:String = "S3GWeb_associaAreaXVeiculo.AssociaAreaXVeiculo";
		
		private var _placa:String;
		public function get placa():String { return this._placa; }                
		public function set placa(valor:String):void { this._placa = valor; }			

		private var _acao:String;
		public function get acao():String { return this._acao; }                
		public function set acao(valor:String):void { this._acao = valor; }			
		
		public function get_VeiculosAssociadosArea()
		{
		}

	}
}