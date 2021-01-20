package
{
	public class ClassGeral
	{
		public function ClassGeral()
		{
		}
		public function CriaURL(var surl:String)
		(
		var myRequest:URLRequest = new URLRequest(surl);  
		try {  
		navigateToURL(myRequest, "_blank");  
		} catch (e:Error) {  
		trace("Ops! URL não existe ou está fora do ar!");  
		}

		)
	
	}
}