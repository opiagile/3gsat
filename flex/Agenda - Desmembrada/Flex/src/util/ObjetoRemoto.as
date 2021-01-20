/*
******************************************************************************************
Data..........: 23/01/2009
Responsável...: Vinícius Sandim
Objeto........: Classe responsável por executar métodos no ASP.net remotamente
******************************************************************************************
*/

package util
{
	import mx.controls.Alert;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class ObjetoRemoto extends RemoteObject
	{
		public function ObjetoRemoto(classe:String, rstSucesso:Function = null)
		{
			this.destination = "fluorine";
			this.source = classe;
			this.showBusyCursor = true;
			
			this.addEventListener(FaultEvent.FAULT, rstFalha);
			
			if (rstSucesso != null)
				this.addEventListener(ResultEvent.RESULT, rstSucesso);
		}
		
		private function rstFalha(evt:FaultEvent):void{
			Alert.show("Ocorreu um erro ao tentar executar o método no asp.net.\r\r" + 
				evt.fault.message, "Erro");
		}

	}
}