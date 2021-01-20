package util
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import mx.controls.Text;

	public class timerfx extends Text
	{
		private var tempo:Timer;
		
		public function timerfx():void	
		{
			this.tempo = new Timer(1000,0);
			this.tempo.addEventListener( "timer" , tempo_habil );
            this.tempo.start();
		}
		
		public function tempo_habil( event:TimerEvent ):void
        {
            if( this.visible )
            {            
                this.visible = false;                
            }
            else
            {            
                this.visible = true;                
            }        
        }
        
        public function get intervalo():uint
        {
            return this.tempo.delay;
        }
        
        public function set intervalo( value:uint ):void
        {
            this.tempo.delay = value;        
        }
	}
}