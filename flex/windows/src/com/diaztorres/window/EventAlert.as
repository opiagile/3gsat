package com.diaztorres.window
{
	import flash.events.Event;
	
	/**
	 * This class is used to return the button pressed on an alert box.
	 * 
	 * <p>You can use the implemented "alerta" method or build your own.
	 * If you build your custom alert then you can return any value.</p>
	 * 
	 * Example of custom alert (customAlert.mxml):
	 * <pre>
	 * ...
	 *	import com.diaztorres.window.EventAlert;
	 *	private function close():void{
	 * 		var e:EventAlert = new EventAlert('alertclose',true);
	 * 		e.result = grupo.selectedValue as String;
	 * 		dispatchEvent( e );
	 * 	}
	 * ...
	 *	&lt;mx:RadioButtonGroup id="grupo"/&gt;
	 * 	&lt;mx:RadioButton groupName="grupo" value="one" label="one" selected="true"/&gt;
	 * 	&lt;mx:RadioButton groupName="grupo" value="two" label="two"/&gt;
	 * 	&lt;mx:RadioButton groupName="grupo" value="three" label="three"/&gt;
	 * 
	 * 	&lt;mx:Button label="OK" click="close()"/&gt;
	 * 
	 * Then to call the custom alert from our window:
	 *	
	 * addEventListener('alertclose',alertclose);
	 * thispanel.alerta( new customAlert );
	 * ...
	 * private function alertclose(e:EventAlert):void{
	 * 		trace("Result: "+ e.result );
	 * } 
	 * </pre>
	 */
	public class EventAlert extends Event
	{
		/**
		 * This property contains the string of the pressed button.
		 */
		public var result:*;
		/**
		 * Constuctor
		 */
		public function EventAlert(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}