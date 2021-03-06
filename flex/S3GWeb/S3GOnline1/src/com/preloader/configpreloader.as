package com.preloader
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    
    import mx.events.FlexEvent;
    import mx.preloaders.IPreloaderDisplay;

	public class configpreloader extends Sprite implements IPreloaderDisplay
	{
        protected var _IsInitComplete:Boolean = false;
        protected var _timer:Timer;                 
        protected var _bytesLoaded:uint = 0;
        protected var _bytesExpected:uint = 1;      
        protected var _fractionLoaded:Number = 0;   
        
        public function configpreloader()
        {
            super();
        }
	
        virtual protected function draw():void
        {
        }
	
        virtual public function initialize():void
        {
            _timer = new Timer(1);
            _timer.addEventListener(TimerEvent.TIMER, timerHandler);
            _timer.start();
        }

        protected var _preloader:Sprite;
        virtual public function set preloader(value:Sprite):void
        {
            _preloader = value;
        
            value.addEventListener(ProgressEvent.PROGRESS, progressHandler);    
            value.addEventListener(Event.COMPLETE, completeHandler);
            
        //    value.addEventListener(RSLEvent.RSL_PROGRESS, rslProgressHandler);
        //    value.addEventListener(RSLEvent.RSL_COMPLETE, rslCompleteHandler);
        //    value.addEventListener(RSLEvent.RSL_ERROR, rslErrorHandler);
            
            value.addEventListener(FlexEvent.INIT_PROGRESS, initProgressHandler);
            value.addEventListener(FlexEvent.INIT_COMPLETE, initCompleteHandler);
        }

        virtual public function set backgroundAlpha(alpha:Number):void{}
        virtual public function get backgroundAlpha():Number { return 1; }
        
        protected var _backgroundColor:uint = 0xffffffff;
        virtual public function set backgroundColor(color:uint):void { _backgroundColor = color; }
        virtual public function get backgroundColor():uint { return _backgroundColor; }
        
        virtual public function set backgroundImage(image:Object):void {}
        virtual public function get backgroundImage():Object { return null; }
        
        virtual public function set backgroundSize(size:String):void {}
        virtual public function get backgroundSize():String { return "auto"; }
        
        protected var _stageHeight:Number = 300;
        virtual public function set stageHeight(height:Number):void { _stageHeight = height; }
        virtual public function get stageHeight():Number { return _stageHeight; }

        protected var _stageWidth:Number = 400;
        virtual public function set stageWidth(width:Number):void { _stageWidth = width; }
        virtual public function get stageWidth():Number { return _stageWidth; }

        //--------------------------------------------------------------------------
        //
        //  Event handlers
        //
        //--------------------------------------------------------------------------
        
        // Called from time to time as the download progresses.
        virtual protected function 	progressHandler(event:ProgressEvent):void
        {
            _bytesLoaded = event.bytesLoaded;
            _bytesExpected = event.bytesTotal;
            _fractionLoaded = Number(_bytesLoaded) / Number(_bytesExpected);
            
            draw();
        }
        
        // Called when the download is complete, but initialization might not be done yet.  (I *think*)
        // Note that there are two phases- download, and init
        virtual protected function completeHandler(event:Event):void
        {
        }
    
        
        // Called from time to time as the initialization continues.        
        virtual protected function initProgressHandler(event:Event):void
        {
            draw();
        }
    
        // Called when both download and initialization are complete    
        virtual protected function initCompleteHandler(event:Event):void
        {
            _IsInitComplete = true;
        }

        // Called as often as possible
        virtual protected function timerHandler(event:Event):void
        {
            if (_IsInitComplete)
            {    
                // We're done!
                _timer.stop();
                dispatchEvent(new Event(Event.COMPLETE));
            }
            else
                draw();
        }		
	}
}