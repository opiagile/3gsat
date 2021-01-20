package mapeamento
{
	[RemoteClass(alias="S3GWeb_inf_uf.inf_uf")]
	public class inf_uf
	{
		public static const NAMESPACE:String = "S3GWeb_inf_uf.inf_uf";

		private var _id_estado:int;
		public function get id_estado():int{ return this._id_estado; }                
		public function set id_estado(valor:int):void { this._id_estado = valor; }	

		private var _dsc_estado:String;
		public function get dsc_estado():String{ return this._dsc_estado; }                
		public function set dsc_estado(valor:String):void { this._dsc_estado = valor; }	

		private var _sigl_estado:String;
		public function get sigl_estado():String{ return this._sigl_estado; }                
		public function set sigl_estado(valor:String):void { this._sigl_estado = valor; }	

		public function inf_uf()
		{
		}

	}
}