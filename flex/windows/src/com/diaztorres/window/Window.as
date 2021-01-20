////////////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2007 Raul Diaz Torres
//  Licensing type: MIT License (http://www.opensource.org/licenses/mit-license.php)
//
///////////////////////////////////////////////////////////////////////////////////////

package com.diaztorres.window
{
import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;

import mx.containers.Box;
import mx.controls.SWFLoader;
import mx.core.IChildList;
/**
 * This is the main class to manage the Window system, it must be instantiated only once.
 * 
 * <p>This class needs a parent container (like a Box) to draw windows over it. The parent container must be the last thing drawn (top z-order).</p>
 * 
 * <pre>&lt;mx:Box id='TOP' width="100%" height="100%"/&gt;
 * &lt;/Application&gt;
 * </pre>
 * 
 *  
 */
	public class Window extends EventDispatcher {
		//************************************************************************************************************
		//
		//public var msg:String;			// para recibir datos del hijo

		private var epanel:RPanelBasic;	// Variable for the EPanel container
		private var TOP:DisplayObject;

		private var aw:Array;			// Stack de ventanas hijas del TOP
		
		/**
		 * Close effect for the windows system.
		 * 
		 * <pre>
		 * &lt;mx:Parallel id="blurFadeOut" duration="200"&gt;
		 * 		&lt;mx:Fade id="fadeOut" alphaFrom="1.0" alphaTo="0.0"/&gt;
		 * 		&lt;mx:Blur id="blurImage" blurXFrom="0.0" blurXTo="10.0" blurYFrom="0.0" blurYTo="10.0"/&gt;
		 * &lt;/mx:Parallel&gt;
		 * ...
		 * ewin=new Window(TOP);
		 * ewin.closeEffect = blurFadeOut;
		 * </pre>
		 */
		public var closeEffect:*;		// Close effect
		
		private var arrayWindowProperties:Array;	// array asociativo que contiene funciones externas que devuelven una clase WindowProperties
	
	
		//************************************************************************************************************
	    /**
	     *  Constructor.
	     * 
	     * @param top The window system needs a parent container to draw windows, this can be a simple Box created at the end of the main MXML.
	     * 
	     * <pre>
	     * ...
	     * public var ewin:Window;
	     * ...
	     * ewin=new Window(TOP);
	     * ...
	     * &lt;mx:Box id='TOP' width="100%" height="100%"/&gt;
	     * &lt;/Application&gt;
	     * </pre>
	     */
		public function Window(top:DisplayObject) {
			TOP=top;
			aw=new Array();
			arrayWindowProperties=new Array();
		}
		/**
		 * Register a style for the windows system.
		 * 
		 * @param aliasName An alias for the style
		 * @param functionName Is a function that must return a WindowProperties class.
		 * 
		 * <pre>
		 * &lt;mx:Style&gt;
		 * .winPanelSty{
		 * 		headerHeight:30;
		 * 		headerColors:#0053E1, #026AFE;
		 * 		headerColorsFocus:#0053E1, #026AFE;
		 * 		headerColorsDisabled:#7998DF, #82ABE9;
		 * 		cornerRadius:10;
		 * 		borderThicknessLeft: 0.1;
		 * 		borderThicknessRight: 0.1;
		 * 		borderThicknessTop: 0.1;
		 * 		borderThicknessBottom: 7;
		 * 		titleStyleName: winPanelStyTitle;
		 * 		closeUpIcon: 		Embed(source="assets/windowicons/win/close.png");
		 * 		closeOverIcon: 		Embed(source="assets/windowicons/win/close_over.png");
		 * 		closeDownIcon: 		Embed(source="assets/windowicons/win/close_down.png");
		 * 		maximizeUpIcon:		Embed(source="assets/windowicons/win/maximize.png");
		 * 		maximizeOverIcon:	Embed(source="assets/windowicons/win/maximize_over.png");
		 * 		maximizeDownIcon:	Embed(source="assets/windowicons/win/maximize_down.png");
		 * 		minimizeUpIcon:		Embed(source="assets/windowicons/win/minimize.png");
		 * 		minimizeOverIcon:	Embed(source="assets/windowicons/win/minimize_over.png");
		 * 		minimizeDownIcon:	Embed(source="assets/windowicons/win/minimize_down.png");
		 * 		sndMaximize:		Embed(source="assets/sound0.mp3");
		 * 		sndMinimize:		Embed(source="assets/arcade_sound_5.mp3");
		 * 		sndRestore:			Embed(source="assets/sound2.mp3");
		 * 		sndClose:			Embed(source="assets/droid_beep.mp3");
		 * }
		 * .winPanelStyTitle{
		 * 		fontFamily: Arial;
		 * 		fontSize: 12;
		 * 		color: #ffffff;
		 * 		textAlign: left;
		 * }
		 * .winAlertStyle{
		 * 		backgroundColor:#A7CEFB;
		 * 		cornerRadius:7;
		 * 		border-thickness:1;	
		 * 		border-color:#3333D1;
		 * 		border-style:solid;
		 * 		drop-shadow-enabled:true;
		 * 		shadow-direction:right;
		 * }
		 * .winLateralStyle{
		 * 		backgroundColor:#A7CEFB;
		 * 		cornerRadius:10;
		 * }
		 * &lt;/mx:Style&gt;
		 * 
		 * public var ewin:Window;
		 * ewin=new Window(TOP);
		 * ewin.registerWindowStyle('win',customWindowProperties);
		 * ...
		 * private function customWindowProperties():WindowProperties{
		 * 		var wp:WindowProperties=new WindowProperties();
		 * 		wp.iconsWidth = 21;
		 * 		wp.titleButtonsPosition="right";
		 * 		wp.enableSound = enableSnd.selected;
		 * 		wp.styleName="winPanelSty";
		 * 		wp.alertStyleName ="winAlertStyle";
		 * 		wp.lateralStyleName="winLateralStyle";
		 * 		wp.generate();
		 * 		return wp;
		 * }
		 * </pre>
		 */
		public function registerWindowStyle(aliasName:String,functionName:Function):void{
			arrayWindowProperties[aliasName]=functionName;		// la funcion f debe devolver un WindowProperties
		}
		//---------------------------------------------------------------------------------------------------------------------------------------------------------
		/**
		 * Open a new window.
		 * 
		 * <p>The top container acts as a MDI (Multiple Document Interface) frame window. You can open multiple windows with the top as parent,
		 * then all opened windows can receive the focus. If you open a window and specify its parent other than the top, then its parent
		 * will be disabled and so on.</p>  
		 * 
		 * @param url The class or MXML we want to open into the window. It must be instantiated previously.
		 * @param tit Title for the window.
		 * @param windowType The type of the window, see com.diaztorres.window.WindowConstants.
		 * @param padre If the window to open is a child window place the parent window reference (RPanelBasic).
		 * @param registeredWindowStyle You can indicate a registered alias as style.
		 * 
		 * @return This method returns a reference to the created window as a RPanelBasic class. 
		 * 
		 * Example:
		 * <pre>
		 * var w:RPanelBasic=ewin.open( new com.empresa.SimpleProc , "SimpleProc", WindowConstants.WINDOW_NORMAL, TOP , 'win' );
		 *
		 * </pre>
		 * 
		 * <p>In this example <code>com.empresa.SimpleProc</code> can be a class or a MXML, i will call it <code>procedure</code>,
		 * so in that procedure we want to know a reference to the panel that contains it for many purposes, close manually the window
		 * for example, then we can refer to it by the following way: 
		 * </p>
		 * 
		 * <pre>
		 * public var thispanel:RPanelBasic;
		 * thispanel =  this.parent as RPanelBasic ;	// now thispanel refers to the panel containing our procedure.
		 * thispanel.close();	// close this panel.
		 * </pre>
		 *  
		 * @see com.diaztorres.window.WindowConstants
		 * @see com.diaztorres.window.RPanelBasic
		 */
		public function open( url:* , tit:String='', windowType:Number=WindowConstants.WINDOW_NORMAL , padre:*=null, registeredWindowStyle:String=null ):RPanelBasic {
			// Si es una ventana modal, deshabilitar todas las demás ventanas
			if( windowType == WindowConstants.WINDOW_MODAL )	disableAll();

			epanel = new RPanelBasic();

			if( registeredWindowStyle == null ){
				epanel.WP=new WindowProperties();
				epanel.registeredWindowStyle = null;
			}else{
				var f:Function = arrayWindowProperties[registeredWindowStyle];	// Obtener el estilo previamente registrado
				epanel.WP = f();
				epanel.registeredWindowStyle = registeredWindowStyle;
				
			}

			epanel.ewin=this;
			
			epanel.windowType=windowType;
			epanel.title = tit;	//'epanel: '+epanel;
			epanel.width = epanel.WP.defaultWidth;
			epanel.height= epanel.WP.defaultHeight;
			epanel.addEventListener("close", ewinClose);

			epanel.setStyle("borderAlpha", 1);
			epanel.setStyle("shadowDirection", 'right');

			if( closeEffect != null )
				epanel.closeEffect = closeEffect;


			if( padre==null ) padre=TOP;
			if( padre != TOP ){
				/*
				for(var x:Number=0 ; x<aw.length ;x++ ){
					if( aw[x] == padre ){
						//						trace('su padre: '+aw[x]);
						aw[x].epanelHijo=epanel;
						break;
					}
				}
				*/

				epanel.padre=padre as RPanelBasic;
				epanel.padre.epanelHijo=epanel;
				epanel.topPadre = epanel.padre.topPadre;
				
				epanel.y += epanel.padre.getStyle("headerHeight");
				epanel.x += 20;
				
				// Si esta es una ventana normal y tiene padre que no sea TOP, deshabilitar la ventana padre
				if( padre != TOP ){
					padre.disable = true;
				}
			}else{
				epanel.padre=null;
				epanel.topPadre = epanel;
			}
		
			// populateWindow
			if( url is String ){
				loadSWF(url);	
				epanel.isPopUp=true;			
				padre.rawChildren.addChild(epanel);
				epanel.addEventListener("click",ctlClick);

			}else{
				//epanel.proc=new url;
				epanel.proc=url;
				epanel.addChild(epanel.proc);

			//PopUpManager.addPopUp( epanel, padre, modal, PopUpManagerChildList.APPLICATION );		// Use the PopUpManager to display the EPanel container.
					//PopUpManager.centerPopUp( epanel );					// centrarla respecto a su padre

				epanel.isPopUp=true;			
				padre.rawChildren.addChild(epanel);
				epanel.proc.addEventListener("click",ctlClick);
				epanel.addEventListener("click",ctlClick);
			}	
			if( epanel.padre==null ) aw[aw.length]=epanel;
			epanel.disable=false;
			return epanel;
		}
		/**
		 * Poner delante (cambiar el z-order de la ventana seleccionada
		 */
		private function ctlClick(e:MouseEvent):void{
			//trace('------TOP childrens '+ Box(TOP).rawChildren.numChildren );
			if( Box(TOP).rawChildren.numChildren <= 1 ) return;
			var t:Box = TOP as Box;
			var front:RPanelBasic = t.rawChildren.getChildAt( t.rawChildren.numChildren-1 ) as RPanelBasic;

			if( e.currentTarget.hasOwnProperty("topPadre") ){
				t.swapChildren( e.currentTarget.topPadre, front );
			}else if( !e.currentTarget.hasOwnProperty("thispanel") ){
				t.swapChildren( e.currentTarget.owner.topPadre as RPanelBasic, front );
				//t.swapChildren( e.currentTarget.owner as RPanelBasic, front );
				
			}else{
			//	t.swapChildren( e.currentTarget.thispanel.topPadre, front );
			}
		}
		private function loadSWF(swf2load:String):void {
trace("Cargando: "+swf2load);
			var loader:SWFLoader = new SWFLoader();
//			loader.addEventListener(Event.COMPLETE, this.LoadContentComplete);
			loader.id='child';
			loader.source=swf2load;
//			loader.load(swf2load);
			epanel.addChild(loader);
		}
			private function LoadContentComplete(event:Event):void{
				var loader:SWFLoader = SWFLoader(event.target);
				epanel.addChild(loader.content);
trace("CARGADO");
			}		
		/**
		 * Disable all windows.
		 */
		public function disableAll():void{
			for( var x:int=aw.length-1 ; x>-1 ; x-- ){
				aw[x].disableAll();
			}
		}
		/**
		 * Close all windows.
		 */
		public function closeAll():void{
			//trace('aw.length ' +aw.length);
			for( var x:int=aw.length-1 ; x>-1 ; x-- ){
				if( aw[x].padre==null ){
					aw[x].close();		// Sólo llama a la función close de la ventana que es hija del TOP
				}
			}
		}
		/**
		 * Habilitar la última ventana hija de todas las ventanas abiertas
		 */
		private function enableFirstWindow():void{
			for( var x:int=aw.length-1 ; x>-1 ; x-- ){
				aw[x].enableFirstWindow();
			}
		}
		/**
		 * Close window
		 */
		private function ewinClose(e:Event):void {
			var o:RPanelBasic=e.target as RPanelBasic;
			// Remove epanel from aw
			for(var x:Number=0 ; x<aw.length ;x++ ){
				if( aw[x] == o ){
					aw.splice(x,1);
					break;
				}
			}
			o.removeEventListener("close", ewinClose);
			o.removeEventListener("click",ctlClick);
			if( o.proc!=undefined )
				o.proc.removeEventListener("click",ctlClick);

			if( o.windowType ==  WindowConstants.WINDOW_MODAL )
				this.enableFirstWindow();
			// Activar su padre si lo tiene
			if( o.padre != TOP && o.padre!=null){
				o.removeListeners();
				o.padre.disable = false;
				o.padre.rawChildren.removeChild(o);
				o.padre.epanelHijo=null;
			}else{
				o.removeListeners();
				//if( o.parent!=null )
				var ff:Box=o.parent as Box;
				var gg:IChildList=ff.rawChildren;
				for( var s:int =0 ; s<gg.numChildren ;s++){
					var t:*=gg.getChildAt(s);
					if( t==o ){
						gg.removeChild(t);
						break;
					}
				}
			}
			
		}
	}
}