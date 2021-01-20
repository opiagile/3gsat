/*
******************************************************************************************
Data..........: 23/01/2009
Responsável...: Vinícius Sandim
Objeto........: Classe responsável por fazer o mapeamento da classe Contato do ASP.net
******************************************************************************************
*/

package mapeamento
{
	[RemoteClass(alias="Agenda.Net.Contato")]
	public class Contato
	{		
		public static const NAMESPACE:String = "Agenda.Net.Contato";

		public var Id_Contato:int;
		public var Nome:String;
		public var Email:String;
		public var Telefone:String;
		public var Celular:String;
		public var Observacoes:String;			

		public function Contato()
		{
		}
	}
}