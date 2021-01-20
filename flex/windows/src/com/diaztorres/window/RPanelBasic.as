package com.diaztorres.window
{
import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.containers.Box;
import mx.containers.HBox;
import mx.containers.Panel;
import mx.core.Application;
import mx.core.SoundAsset;
import mx.effects.AnimateProperty;
import mx.effects.Move;
import mx.effects.Resize;
import mx.events.EffectEvent;
import mx.events.FlexEvent;
import mx.managers.CursorManager;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;

import com.diaztorres.window.EventAlert;
/**
 * Array of two colors used to draw the header when it has the focus.
 * <p>The first color is the top color. The second color is the bottom color.</p>
 *  @default #ffffff,#999999
 */
[Style(name="headerColorsFocus", type="Array", inherit="no")]
/**
 * Array of two colors used to draw the header when the window is disabled.
 * <p>The first color is the top color. The second color is the bottom color.</p>
 * 
 *  @default #DDDDDD,#DDDDDD
 */
[Style(name="headerColorsDisabled", type="Array", inherit="no")]


/**
 *  Name of the class to use as close icon (up state). 
 */
[Style(name="closeUpIcon", type="Class", inherit="no")]
/**
 *  Name of the class to use as close icon (over state). 
 */
[Style(name="closeOverIcon", type="Class", inherit="no")]
/**
 *  Name of the class to use as close icon (down state). 
 */
[Style(name="closeDownIcon", type="Class", inherit="no")]


/**
 *  Name of the class to use as maximize icon (up state). 
 */
[Style(name="maximizeUpIcon", type="Class", inherit="no")]
/**
 *  Name of the class to use as maximize icon (over state). 
 */
[Style(name="maximizeOverIcon", type="Class", inherit="no")]
/**
 *  Name of the class to use as maximize icon (down state). 
 */
[Style(name="maximizeDownIcon", type="Class", inherit="no")]


/**
 *  Name of the class to use as minimize icon (up state). 
 */
[Style(name="minimizeUpIcon", type="Class", inherit="no")]
/**
 *  Name of the class to use as minimize icon (over state). 
 */
[Style(name="minimizeOverIcon", type="Class", inherit="no")]
/**
 *  Name of the class to use as minimize icon (down state). 
 */
[Style(name="minimizeDownIcon", type="Class", inherit="no")]


/**
 *  Name of the sound class to use on window maximize. 
 */
[Style(name="sndMaximize", type="Class", inherit="no")]
/**
 *  Name of the sound class to use on window minimize. 
 */
[Style(name="sndMinimize", type="Class", inherit="no")]
/**
 *  Name of the sound class to use as window restore. 
 */
[Style(name="sndRestore", type="Class", inherit="no")]
/**
 *  Name of the sound class to use on window close. 
 */
[Style(name="sndClose", type="Class", inherit="no")]

//---------------------------------------------------------------------------------------------------------------------------------
//
// Eventos que lanza esta clase
//
//---------------------------------------------------------------------------------------------------------------------------------
/**
 *  Dispatched when user clicks the close button, after close effect has been played.
 *
 *  @eventType mx.events.Event
 */
[Event(name="close"		,type="flash.events.Event")]		// cuando se pulsa el botón close
/**
 *  Dispatched when user clicks the minimize button, after the window has been minimized.
 *
 *  @eventType mx.events.Event
 */
[Event(name="minimize"	,type="flash.events.Event")]		// cuando se pulsa el botón minimizar, después de haber minimizado
/**
 *  Dispatched when user clicks the maximize button, after the window has been maximized.
 *
 *  @eventType mx.events.Event
 */
[Event(name="maximize"	,type="flash.events.Event")]		// cuando se pulsa el botón maximizar, después de haber maximizado
/**
 *  Dispatched when user clicks the restore button, after the window has been restored.
 *
 *  @eventType mx.events.Event
 */
[Event(name="restore"	,type="flash.events.Event")]		// cuando se pulsa el botón restaurar, después de haber restaurado
/**
 *  Dispatched after the user resize the window.
 *
 *  @eventType mx.events.Event
 */
[Event(name="size"		,type="flash.events.Event")]		// cuando se ha redimensionado la ventana
/**
 *  Dispatched when user closes the alert window.
 *
 *  @eventType com.diaztorres.window.EventAlert
 */
[Event(name="alertclose",type="com.diaztorres.window.EventAlert")]	// cuando se cierra la ventana de alerta



/**
 * This class is the real core of the windows system.
 * 
 * 
 * 
 */
	public class RPanelBasic extends Panel {

		/**
		 * The Window object that owns this panel. In most cases will be the top container.
		 */
		public var ewin:Window;						// es el EWin padre
		/**
		 * The type of this window, see WindowConstants.
		 */ 
		public var windowType:Number;				// WindowConstants WINDOW_NORMAL,WINDOW_MODAL
		/**
		 * On child windows is the first opened window.
		 */
		public var topPadre:RPanelBasic;			// es el EPanel padre principal
		/**
		 * A reference to its parent (if has).
		 */
		public var padre:RPanelBasic;					// es el EPanel padre de este EPanel
		/**
		 * A reference to its child (if has).
		 */
		public var epanelHijo:RPanelBasic=null;			// es el EPanel hijo de este EPanel ( si lo tuviera )
		/**
		 * The window properties for this window.
		 */
		public var WP:WindowProperties;
		/**
		 * The name of the alias style applied to this window.
		 */
		public var registeredWindowStyle:String;
		//public var url:String;						// url de este EPanel
		//public var urlType:Number;					// tipo de url, ver EWin
		//public var modal:Boolean;					// este EPanel es modal ?
		/**
		 * The class or MXML to be included inside this panel.
		 */ 
		public var proc:*;							// es el objeto hijo que contiene este panel.
		/**
		 * The effect to play when this window is closed
		 */
		public var closeEffect:*;				// Close effect
		
			private var sav_position:Rectangle=new Rectangle();

			private var _status:Number;				// estado de la ventana
			private var hbox:HBox;					// contenedor para los botones
			private var originalLabel:String;		// texto original del caption de la ventana

			private var rbox:Box;					// Caja para el resizeo
			private var resize:Resize;				// Efecto para redimensionar las ventanas
			private var resizing:Boolean;			// Flag que indica si se está redimensionando la ventana
			private var numIconsDisplayed:Number;	// Número de iconos que se visualizan en la parte superior derecha

			private var cursorID:Number;
			
			// Para alerta:
				private var balert:Box;					// Caja para las alertas
				private var spmask:Sprite;				// Máscara para la ventana de las alertas
				private var alertaComp:*;
				private var alertEffect:AnimateProperty;
			// Para box lateral
				private var blateral:Box;				// Caja para el componente lateral
				private var spmask2:Sprite;				// Máscara para el componente lateral
				private var lateralComp:*;
				private var lateralEffect:AnimateProperty;
				private var lateralSide:String;			// en qué lado se ubica el componente lateral (left/right)
				private var lateralLocation:String;		// donde se ubica la barra in/out
				private var lateralVisible:Boolean=false;// indica si el componente lateral es visible 


		// Public constructor 
		//------------------------------------------------------------------------------------------------------------------------
		/**
		 * Constructor
		 */
		public function RPanelBasic(){
			super();
			numIconsDisplayed=0;
			_status=WindowConstants.STATUS_NORMAL;
			visible=false;
			addEventListener("creationComplete", creationComplete);

			alertEffect = new AnimateProperty();
			lateralEffect = new AnimateProperty();
		}
		//------------------------------------------------------------------------------------------------------------------------
		private function creationComplete(eventObj:Event):void {

			this.minWidth=150;
			this.minHeight=WP.iconsWidth+6;

			sav_position.width=this.width;
			sav_position.height=this.height;
			sav_position.x=this.x;
			sav_position.y=this.y;
			//originalLabel=titleTextField.text;
			originalLabel=title;
			removeEventListener("creationComplete", creationComplete);
			
		}
		/**
		 * Tells to this panel if can be resized or not.
		 * 
		 * @param flag True to enable resizing.
		 */
		public function canResize(flag:Boolean):void{
			this.WP.btResize.visible=flag;
		}
		//------------------------------------------------------------------------------------------------------------------------
		/**
		 * @private
		 */
		override protected function createChildren():void{
//trace( ':::'+WP.styleName );
			this.styleName = WP.styleName;  
			super.createChildren(); 
			
				// Estilo del title
					if( this.styleName!=null ){
						setStyle('titleStyleName', getStyle("titleStyleName") );
						//trace(':::'+getStyle("titleStyleName") );
						//trace('+++ '+StyleManager.getStyleDeclaration( '.'+getStyle("titleStyleName")+'') );
						if( WP.titleButtonsPosition=="left"){
							var titleStyle:CSSStyleDeclaration;
							titleStyle = StyleManager.getStyleDeclaration( '.'+getStyle("titleStyleName")+'');
							if( titleStyle!=null ){
								titleStyle.setStyle( 'textIndent' , WP.iconsWidth*3+10 );
							}
						}
					}else{
						titleStyle=new CSSStyleDeclaration();
						titleStyle.setStyle( 'textAlign'  , WP.titlePosition );
						titleStyle.setStyle( 'textIndent' , WP.iconsWidth*3+10 );
						StyleManager.setStyleDeclaration('.windowTitleStyleName',titleStyle,false);
						setStyle('titleStyleName', 'windowTitleStyleName' );	
					}

				// Resto de estilos
					var asty:Array = [ {"headerHeight":20} 
									 , {"verticalGap":0}
									 , {"cornerRadius":15}
									 , {"borderThicknessLeft":7}
									 , {'borderThicknessTop':0}
									 , {'borderThicknessRight':7}
									 , {'borderThicknessBottom':7}
									 , {'headerColors':['#ffffff','#999999']}
									 , {'headerColorsFocus':['#ffffff','#999999']}
									 , {'headerColorsDisabled':['#DDDDDD','#DDDDDD']}
									 ];
					for( var s:String in asty){
						var o:Object=asty[s];
						for( var r:String in o){
							//trace('sty antes: '+r+' ---- '+getStyle(r) );
							( getStyle(r) )? setStyle(r,getStyle(r)) : setStyle(r,o[r]);
							//trace('sty: '+r+' ---- '+getStyle(r) );
						}
					}

				// Estilo de los botones
					if( getStyle("closeUpIcon") ) 		WP.btClose.setStyle("upIcon", getStyle("closeUpIcon") );
					if( getStyle("closeOverIcon") ) 	WP.btClose.setStyle("overIcon", getStyle("closeOverIcon") );
					if( getStyle("closeDownIcon") ) 	WP.btClose.setStyle("downIcon", getStyle("closeDownIcon") );

					if( getStyle("maximizeUpIcon") ) 	WP.btMaximize.setStyle("upIcon", getStyle("maximizeUpIcon") );
					if( getStyle("maximizeOverIcon") ) 	WP.btMaximize.setStyle("overIcon", getStyle("maximizeOverIcon") );
					if( getStyle("maximizeDownIcon") ) 	WP.btMaximize.setStyle("downIcon", getStyle("maximizeDownIcon") );

					if( getStyle("minimizeUpIcon") ) 	WP.btMinimize.setStyle("upIcon", getStyle("minimizeUpIcon") );
					if( getStyle("minimizeOverIcon") ) 	WP.btMinimize.setStyle("overIcon", getStyle("minimizeOverIcon") );
					if( getStyle("minimizeDownIcon") ) 	WP.btMinimize.setStyle("downIcon", getStyle("minimizeDownIcon") );


				// Caja para el movimiento de la ventana
					rbox=new Box();
					rbox.setStyle('backgroundAlpha',1);
					rbox.setStyle('borderStyle','solid');
					rbox.setStyle('borderThickness',2);
					rbox.visible = false;
					this.rawChildren.addChild(rbox);

				// CAPTION - Caja Horizontal principal
					hbox=new HBox();
					hbox.id="titleBox";
					hbox.styleName = this;
					hbox.setStyle('backgroundAlpha',0);
					hbox.setStyle('borderStyle','none');
//hbox.setStyle('borderStyle','solid');	
//hbox.setStyle('borderThickness',1);
//hbox.setStyle('borderColor','#ff0000');
//hbox.setStyle('cornerRadius',0);
hbox.setStyle('borderThicknessBottom',0);
hbox.setStyle('borderThicknessLeft',0);
hbox.setStyle('borderThicknessRight',0);
					hbox.setStyle('dropShadowEnabled',false);
					hbox.setStyle('horizontalAlign','right');
					hbox.setStyle('horizontalGap',WP.iconsHorizontalGap);
					this.rawChildren.addChild(hbox);

				// Minimize button
					if( WP.showButtons & WindowConstants.BUTTON_MINIMIZE ){
						WP.btMinimize.styleName = this;
						WP.btMinimize.addEventListener(MouseEvent.CLICK,minimize);
						WP.btMinimize.enabled = enabled;
						numIconsDisplayed+=1;
					}

				// Maximize button
					if( WP.showButtons & WindowConstants.BUTTON_MAXIMIZE ){
						WP.btMaximize.styleName = this;
						WP.btMaximize.addEventListener(MouseEvent.CLICK,maximize);
						WP.btMaximize.enabled = enabled;
						numIconsDisplayed+=1; 
					}
				// Close button
					if( this.isPopUp==true ){
						if( WP.showButtons & WindowConstants.BUTTON_CLOSE ){
							WP.btClose.styleName = this;
							WP.btClose.addEventListener(MouseEvent.CLICK,close);
							WP.btClose.enabled = enabled;
							numIconsDisplayed+=1;
						}
					}

				if( WP.titleButtonsPosition=='left' ){
					// Botones a la izquierda
//if( this.isPopUp==true && (WP.showButtons & WindowConstants.BUTTON_CLOSE) ) trace('aaaaaaaaa');					
					if( this.isPopUp==true && (WP.showButtons & WindowConstants.BUTTON_CLOSE) ) hbox.addChild(WP.btClose);
					if( WP.showButtons & WindowConstants.BUTTON_MINIMIZE ) hbox.addChild(WP.btMinimize);
					if( WP.showButtons & WindowConstants.BUTTON_MAXIMIZE ) hbox.addChild(WP.btMaximize);
				}else{
					// Botones a la derecha
					if( WP.showButtons & WindowConstants.BUTTON_MINIMIZE ) hbox.addChild(WP.btMinimize);
					if( WP.showButtons & WindowConstants.BUTTON_MAXIMIZE ) hbox.addChild(WP.btMaximize);
					if( this.isPopUp==true && (WP.showButtons & WindowConstants.BUTTON_CLOSE) ) hbox.addChild(WP.btClose);
				}

				// Resize button (image)
					//WP.btResize.styleName = this;
					WP.btResize.addEventListener(MouseEvent.MOUSE_OVER,showResizeCursorOVER);
					WP.btResize.addEventListener(MouseEvent.MOUSE_OUT,hideResizeCursorOVER);
					WP.btResize.addEventListener(MouseEvent.MOUSE_DOWN,startResize);
					this.rawChildren.addChild(WP.btResize);
/*				
				// Caja para las alertas
					balert = new Box();
					balert.setStyle("backgroundColor","#FF0000");
					balert.move(0,getStyle('headerHeight'));
					balert.setActualSize(0,0);
					this.rawChildren.addChild(balert);
*/

			balert = new Box();
			spmask = new Sprite();
			hbox.rawChildren.addChild(balert);
			hbox.rawChildren.addChild(spmask);

			blateral = new Box();
			spmask2 = new Sprite();
			hbox.rawChildren.addChild(blateral);
			hbox.rawChildren.addChild(spmask2);

		}
		//------------------------------------------------------------------------------------------------------------------------------
		/**
		 * @private
		 */
		override protected function layoutChrome(unscaledWidth:Number, unscaledHeight:Number):void{
			super.layoutChrome(unscaledWidth, unscaledHeight);
			if(unscaledWidth > 10){
				this.visible = true;
/*
				var bm:EdgeMetrics = viewMetrics;
				var x:Number = bm.left;
				var y:Number = bm.top;
				var headerHeight:Number = getHeaderHeight();
*/
				var l:Number=(WP.iconsWidth+WP.iconsHorizontalGap)*numIconsDisplayed;
				hbox.setActualSize(l,WP.iconsWidth);
				if( WP.titleButtonsPosition=='left' ){
					hbox.move( 5, (this.getStyle('headerHeight')*1-WP.iconsWidth)/2 );
				}else{
					hbox.move( this.width-l-10,(this.getStyle('headerHeight')*1-WP.iconsWidth)/2);
				}

				// Mover la caja contenedora de los botones
//					var l:Number=(iconsWidth+iconsHorizontalGap)*numIconsDisplayed;
//					hbox.setActualSize(l,iconsWidth);
//					hbox.move( this.width-l-10,5);

				// Mover icono de redimensionar ventana
//					WP.btResize.setActualSize(12,12);
//					WP.btResize.move( this.width-12,this.height-12);
					WP.btResize.move( this.width-WP.btResize.width,this.height-WP.btResize.height);

				// Posicionamiento del componente lateral
					if( lateralVisible ){
	
						if( lateralSide=='right' ){
							var margen:Number = getStyle("cornerRadius");
							blateral.move( width-(getStyle("shadowDistance")*2)-margen , getStyle('headerHeight'));
							blateral.height = height- getStyle('headerHeight')*2 ;
							if( WP.titleButtonsPosition=='right' ) blateral.x -= hbox.x;	
							
							spmask2.graphics.clear();
							spmask2.graphics.beginFill(0xFFFFFF);
							spmask2.graphics.drawRect( blateral.x+margen , blateral.y, blateral.width+margen, blateral.height+margen );
							spmask2.graphics.endFill();
							blateral.mask = spmask2;
						}else{
							blateral.height = height- getStyle('headerHeight')*2 ;	
						}
					}
				// Fin de - Posicionamiento del componente lateral

			} else { 
				this.visible = false;
			} 

		}

		/**
		 * @private
		 * Disable this window and all children.
		 */
		public function disableAll():void{
			//trace( this+'    padre:'+this.padre+'      epanelHijo: '+this.epanelHijo);
			if( this.epanelHijo!=null )
				this.epanelHijo.disableAll();
			this.disable=true;
		}
		/**
		 * @private
		 * Si esta ventana tiene hija, llamar a esta misma función de la hija.
		 * Si no tiene hija, habilitar esta ventana
		 */
		public function enableFirstWindow():void{
			//trace( this+'    hijo:'+ this.epanelHijo );
			if( this.epanelHijo==null ){
				this.disable = false;
			}else{
				this.epanelHijo.enableFirstWindow();
			}
		}

		/**
		 * Enable/Disable this panel.
		 * 
		 * @param flag True to disable.
		 */
		public function set disable(flag:Boolean):void{
			
			this.hbox.enabled=!flag;
			this.proc.enabled=!flag;
			this.WP.btResize.enabled=!flag;

			if( flag ){
				this.setStyle('headerColors', this.getStyle('headerColorsDisabled') );
			}else{
				this.setStyle('headerColors', this.getStyle('headerColorsFocus') );
			}

			this.proc.setStyle("disabledOverlayAlpha",0.10);
			this.setStyle("disabledOverlayAlpha",0.10);
			this.hbox.setStyle("disabledOverlayAlpha",0.10);
			canResize(!flag);
			
			this.setStyle("dropShadowEnabled",!flag);
			if( flag ){
				this.setStyle("backgroundAlpha",0.8);

			}else{
				this.setStyle("backgroundAlpha",1);
			}
		}
		//--------------------------------------------------------------------------------------------------------------------------
		/**
		 * Close this window.
		 */
		public function close(e:MouseEvent=null):void{
			if( typeof(closeEffect)=="object" ){
				closeEffect.addEventListener("effectEnd",close2);
				closeEffect.target=this;
				closeEffect.play();
			}else{
				dispatchEvent(new Event('close'));
			}
			if( WP.enableSound ){
				var snd:Class=getStyle("sndClose");
				if( snd ){
					var beepSound:SoundAsset = SoundAsset( new snd );
					beepSound.play();
				}
			}
		}
		private function close2(e:EffectEvent):void{
			dispatchEvent(new Event('close'));
		}
		//--------------------------------------------------------------------------------------------------------------------------
		/**
		 * Maximize this window.
		 */
		public function maximize(event:MouseEvent=null):void{
			switch(_status){
			case WindowConstants.STATUS_NORMAL:	// MAXIMIZAR
				sav_position.width=this.width;
				sav_position.height=this.height;
				sav_position.x=this.x;
				sav_position.y=this.y;
			case WindowConstants.STATUS_MINIMIZED:	// MAXIMIZAR
				var w:Number=mx.core.Application.application.width;
				var h:Number=mx.core.Application.application.height;
				var x:Number=this.globalToLocal( new Point(x,y)).x;
				var y:Number=this.globalToLocal( new Point(x,y)).y;
//				var x:Number=0;
//				var y:Number=0;
				canResize(false);
				break;
			case WindowConstants.STATUS_MAXIMIZED:		// RESTAURAR
				w=sav_position.width;
				h=sav_position.height;
				x=sav_position.x;
				y=sav_position.y;
				canResize(true);
				break;
			}
			rawChildren.getChildAt(1).visible=false;

			// redimensionar y mover en paralelo
				resize = new Resize(this);
				resize.end();
				resize.heightTo = h;
				resize.widthTo = w;
				resize.duration = WP.minmaxDuration;
				resize.play();
				var move:Move = new Move(this);
				move.end();
				move.xTo=x;
				move.yTo=y;
				move.duration = WP.minmaxDuration;
				move.play();

			if( WP.enableSound ){
				switch(_status){
				case WindowConstants.STATUS_NORMAL:			// MAXIMIZAR
				case WindowConstants.STATUS_MINIMIZED:		// MAXIMIZAR
					var snd:Class=getStyle("sndMaximize");
					break;
				case WindowConstants.STATUS_MAXIMIZED:		// RESTAURAR
					snd=getStyle("sndRestore");
				}
				if( snd ){
					var beepSound:SoundAsset = SoundAsset( new snd );
					beepSound.play();
				}
			}
			resize.addEventListener('effectEnd',maximizeButton_clickHandler_finishEffect);
		}
			private function maximizeButton_clickHandler_finishEffect(event:Event):void{
				switch(_status){
				case WindowConstants.STATUS_NORMAL:
				case WindowConstants.STATUS_MINIMIZED:
					WP.btMaximize.toolTip=WP.restoreToolTip;
					_status=WindowConstants.STATUS_MAXIMIZED;
					this.dispatchEvent(new Event('maximize')); 
					break;
				case WindowConstants.STATUS_MAXIMIZED:
					WP.btMinimize.toolTip=WP.minimizeToolTip;
					WP.btMaximize.toolTip=WP.maximizeToolTip;
					_status=WindowConstants.STATUS_NORMAL;
					this.dispatchEvent(new Event('restore')); 
				}
				rawChildren.getChildAt(1).visible=true;
				ponerLabel();
			}
		//------------------------------------------------------------------------------------------------------------------------
		/**
		 * Minimize this window
		 */
		public function minimize(event:MouseEvent=null):void{
			rawChildren.getChildAt(1).visible=false;
			switch(_status){
			case WindowConstants.STATUS_NORMAL:
				var x:Number=this.x;
				var y:Number=this.y;
//				var w:Number=this.width;
				var w:Number=minWidth;
				var h:Number=xgetHeaderHeight();		// Minimizar
				
				sav_position.x = x;
				sav_position.y = y;
				sav_position.width = width;
				sav_position.height = height;
				canResize(false);
				break;
			case WindowConstants.STATUS_MAXIMIZED:
				x=sav_position.x;
				y=sav_position.y;
//				w=sav_position.width;
				w=minWidth;
				h=getHeaderHeight();		// Minimizar
				canResize(false);
				break;
			case WindowConstants.STATUS_MINIMIZED:
				x=sav_position.x;
				y=sav_position.y;
				w=sav_position.width;
				h=sav_position.height;		// Restaurar
				canResize(true);
			}
			var resize:Resize = new Resize(this);
			resize.heightTo = h;
			resize.widthTo = w;
			resize.duration = WP.minmaxDuration;
			resize.play();
			var move:Move = new Move(this);
			move.end();
			move.xTo=x;
			move.yTo=y;
			move.duration = WP.minmaxDuration;
			move.play();

			if( WP.enableSound ){
				switch(_status){
				case WindowConstants.STATUS_NORMAL:			// MINIMIZAR
				case WindowConstants.STATUS_MINIMIZED:		// MINIMIZAR
					var snd:Class=getStyle("sndMinimize");
					break;
				case WindowConstants.STATUS_MAXIMIZED:		// RESTAURAR
					snd=getStyle("sndRestore");
				}
				if( snd ){
					var beepSound:SoundAsset = SoundAsset( new snd );
					beepSound.play();
				}
			}

			resize.addEventListener('effectEnd',minimizeButton_clickHandler_finishEffect);
		}
			//------------------------------------------------------------------------------------------------------------------------
			private function minimizeButton_clickHandler_finishEffect(event:Event):void{
				switch(_status){
				case WindowConstants.STATUS_NORMAL:
				case WindowConstants.STATUS_MAXIMIZED:
					WP.btMinimize.toolTip=WP.restoreToolTip;
					_status=WindowConstants.STATUS_MINIMIZED;
					this.dispatchEvent(new Event('minimize')); 
					break;
				case WindowConstants.STATUS_MINIMIZED:
					WP.btMinimize.toolTip=WP.minimizeToolTip;
					WP.btMaximize.toolTip=WP.maximizeToolTip;
					_status=WindowConstants.STATUS_NORMAL;
					rawChildren.getChildAt(1).visible=true;
					this.dispatchEvent(new Event('restore')); 
					break;
				}
				ponerLabel();

			}
		//------------------------------------------------------------------------------------------------------------------------
		/**
		 * Sets the title for this window.
		 */
		override public function set title(value:String):void{
			originalLabel = value;
			super.title=value;
		}
		//-----------------------------------------------------------------------------------------------------------
		// Recorta el label del panel hasta que quepa
		private function ponerLabel():void {
			titleTextField.text=originalLabel;
			var w:Number=measureHeaderText().width;
			var m:Number=this.width-(WP.iconsWidth+WP.iconsHorizontalGap)*3-20;			
			if( w>m){
				var s:String = originalLabel;
				while (s.length > 1 && titleTextField.textWidth  > m){
					s = s.slice(0, -1);
					titleTextField.text = s + '...';
				}
				if(WP.showToolTip==true) this.toolTip=originalLabel;
			}else{
				if(WP.showToolTip==true) this.toolTip=null;
			}
		}
	//------------------------------------------------------------------------------------------------------------------------
	private static const HEADER_PADDING:Number = 14;
	//------------------------------------------------------------------------------------------------------------------------
		private function xgetHeaderHeight():Number{
			var headerHeight:Number = getStyle("headerHeight");
			
			if (isNaN(headerHeight))
				headerHeight = measureHeaderText().height + HEADER_PADDING;
			return headerHeight;
		}
		//------------------------------------------------------------------------------------------------------------------------
		private function measureHeaderText():Rectangle
		{
			var textWidth:Number = 20;
			var textHeight:Number = 14;
			
			if (titleTextField && titleTextField.text)
			{
				titleTextField.validateNow();
				textWidth = titleTextField.textWidth;
				textHeight = titleTextField.textHeight;
			}
			
			if (statusTextField)
			{
				statusTextField.validateNow();
				textWidth = Math.max(textWidth, statusTextField.textWidth);
				textHeight = Math.max(textHeight, statusTextField.textHeight);
			}
			
			return new Rectangle(0, 0, textWidth, textHeight);
		}
	//-----------------------------------------------------------------------------------------------------------------					
	//-----------------------------------------------------------------------------------------------------------------
	// FUNCTIONS TO RESIZE WINDOW
	//-----------------------------------------------------------------------------------------------------------------
		private function startResize(event:MouseEvent):void{
			resizing=true;
			rbox.x=0;
			rbox.y=0;
			rbox.width=this.width;
			rbox.height=this.height;
			rbox.visible=true;
			systemManager.addEventListener( MouseEvent.MOUSE_MOVE, ctlResizeMOUSE_MOVE, true);
			systemManager.addEventListener( MouseEvent.MOUSE_UP, ctlResizeMOUSE_UP, true);
//			stage.addEventListener( Event.MOUSE_LEAVE, stage_resizeMouseLeaveHandler);
			showResizeCursor();
		}
		private function ctlResizeMOUSE_MOVE(event:MouseEvent):void{
			//trace( "x: "+this.x+'  y: '+this.y+ ' stageX: '+event.stageX+' stageY: '+event.stageY);
			var aa:Point =  new Point( rbox.x,rbox.y);
			//trace( this.localToGlobal( aa).x + '______'+this.localToGlobal(aa).y );
			var xx:Number=event.stageX-this.localToGlobal( aa).x;
			var yy:Number=event.stageY-this.localToGlobal( aa).y;
			//trace("xx: "+xx+' yy: '+yy);
			if( xx> this.minWidth ) rbox.width=xx;
			if( yy> this.minHeight ) rbox.height=yy;
//			rbox.width=xx;
//			rbox.height=yy;
		}
		private function ctlResizeMOUSE_UP(event:MouseEvent):void{
			width=rbox.width;
			height=rbox.height;
			ponerLabel();
			stopResize();
		}
//		private function stage_resizeMouseLeaveHandler(event:MouseEvent):void{
	//Alert.show('stage stop');
//			stopResize();
//		}
		private function stopResize():void{
			rbox.visible=false;
			resizing=false;
			hideResizeCursor();
			systemManager.removeEventListener(MouseEvent.MOUSE_MOVE, ctlResizeMOUSE_MOVE, true);
			systemManager.removeEventListener(MouseEvent.MOUSE_UP, ctlResizeMOUSE_UP, true);
//			stage.removeEventListener(Event.MOUSE_LEAVE, stage_resizeMouseLeaveHandler);
			this.dispatchEvent(new Event('size')); 
		}
		private function showResizeCursorOVER(event:MouseEvent):void{
			showResizeCursor();
		}
		private function hideResizeCursorOVER(event:MouseEvent):void{
			if(!resizing) hideResizeCursor();
		}
			private function showResizeCursor():void{
				cursorID = CursorManager.setCursor ( WP.resizeCursor );
			}
			private function hideResizeCursor():void{
				if(cursorID!=CursorManager.NO_CURSOR){
					CursorManager.removeCursor(cursorID);
					CursorManager.removeAllCursors();
					cursorID=CursorManager.NO_CURSOR;
				}
			}
	//-----------------------------------------------------------------------------------------------------------------
	// END FUNCTIONS TO RESIZE WINDOW
	//-----------------------------------------------------------------------------------------------------------------
	
		// Esta funcion es llamada desde la clase Window cuando se cierra una ventana
		/**
		 * @private
		 */
		public function removeListeners():void{
			if( WP.btMinimize!=null )
				WP.btMinimize.removeEventListener(MouseEvent.CLICK,minimize);
			if( WP.btMaximize!=null )
				WP.btMaximize.removeEventListener(MouseEvent.CLICK,maximize);
			if( WP.btClose!=null )
				WP.btClose.removeEventListener(MouseEvent.CLICK,close);

			if( WP.btResize!=null ){
				WP.btResize.removeEventListener(MouseEvent.MOUSE_OVER,showResizeCursorOVER);
				WP.btResize.removeEventListener(MouseEvent.MOUSE_OUT,hideResizeCursorOVER);
				WP.btResize.removeEventListener(MouseEvent.MOUSE_DOWN,startResize);
			}

			if( resize!=null )
				resize.removeEventListener('effectEnd',maximizeButton_clickHandler_finishEffect);

			systemManager.removeEventListener( MouseEvent.MOUSE_MOVE, ctlResizeMOUSE_MOVE, true);
			systemManager.removeEventListener( MouseEvent.MOUSE_UP, ctlResizeMOUSE_UP, true);
		}
		
		//------------------------------------------------------------------------------
		//
		// Alerta
		//
		//------------------------------------------------------------------------------
		/**
		 * Shows an alert box.
		 * 
		 * @param s Can be a string, a class or MXML.
		 * @param botones Array of strings, one element for each button you want to show.
		 * @param ico A image class to show on the alert box.
		 * 
		 * Example:
		 * <pre>
		 * [Embed(source="assets/folder.png", mimeType="image/png")]
		 * private var folder:Class;
		 * 
		 * addEventListener('alertclose',alertclose);
		 * 
		 * var t:String='Este es un mensaje de &lt;font color="#FF0000"&gt;alerta&lt;/font&gt;, puede contener &lt;br&gt;texto simple o &lt;b&gt;HTML&lt;/b&gt;.&lt;br&gt;La utilización es &lt;u&gt;muy sencilla&lt;/u&gt;,&lt;br&gt;además puedes utilizar &lt;font color="#008800"&gt;tu propio componente&lt;/font&gt;.';
		 * thispanel.alerta(t , ['Ok','Cancel'] ,folder);
		 * ...
		 * thispanel.alerta( new customAlert );		// customAlert is a MXML (see samples)
		 * 
		 * private function alertclose(e:EventAlert):void{
		 * 	trace('Button pressed' + e.result );
		 * }
		 * </pre>
		 */
		public function alerta( s:* , botones:Array=null , ico:*=null ):void{

			if( balert.numChildren>0 ){
				balert.removeAllChildren();
			} 

			// Deshabilitar los componentes de esta ventana
				this.hbox.enabled=false;
				this.proc.enabled=false;
				canResize(false);

			balert.horizontalScrollPolicy='off';
			balert.verticalScrollPolicy='off';
			
			balert.move(0,getStyle('headerHeight'));
			balert.setActualSize(0,0);

			if( typeof(s)!='string' ){
				alertaComp = s;
			}else{
				alertaComp = new com.diaztorres.window.Alerta();
			}
			if( WP.alertStyleName==null ){
				alertaComp.setStyle("backgroundColor","#EEEEEE");
			}else{
				alertaComp.styleName=WP.alertStyleName;
			}
		
			alertaComp.addEventListener(FlexEvent.CREATION_COMPLETE, function():void{
						if( typeof(s)=='string' ){
							// Crear botones
							alertaComp.creaBotones(botones);
							alertaComp.creaIcono(ico);
	
							alertaComp.msg.htmlText = s;
						}						
						
						alertaComp.validateNow();
						balert.x = ( width - alertaComp.measuredWidth )/2;
						if( WP.titleButtonsPosition=='right' ) balert.x -= hbox.x;

						balert.y = hbox.height;
						
						balert.setActualSize( alertaComp.measuredWidth , alertaComp.measuredHeight);

						balert.y -= balert.height;
						
						spmask.graphics.clear();
						spmask.graphics.beginFill(0xFFFFFF);
						spmask.graphics.drawRect( balert.x , balert.y+balert.height, balert.width+5, balert.height+5 );
						spmask.graphics.endFill();
						balert.mask = spmask;

						alertEffect.target=balert;
						alertEffect.property="y";
						alertEffect.duration=1000;
						alertEffect.toValue=balert.y+balert.height-5;
						alertEffect.play();
						balert.visible=true;

																			} );
			alertaComp.addEventListener("alertclose", alertClose);
			balert.addChild(alertaComp);
		}
		private function alertClose(e:EventAlert):void{
			balert.removeEventListener('alertclose',alertClose);

			alertEffect.target=balert;
			alertEffect.property="y";
			alertEffect.duration=1000;
			alertEffect.toValue=(balert.y+balert.height)*-1;
			alertEffect.play();
			alertEffect.addEventListener(EffectEvent.EFFECT_END, alertClose2 );

			// Habilitar los componentes de esta ventana
				this.hbox.enabled=true;
				this.proc.enabled=true;
				canResize(true);
			// Enviar el evento al procedimiento
				var h:EventAlert = new EventAlert('alertclose',true);
				h.result=e.result;
				proc.dispatchEvent(h);
			
			alertaComp.removeEventListener("alertclose", alertClose);
		}
			private function alertClose2(e:EffectEvent):void{
				balert.visible=false;
				alertEffect.removeEventListener(EffectEvent.EFFECT_END, alertClose2 );
			}
		//---------------------------------------------------------------------------------------------------------
		//
		// COMPONENTE LATERAL
		//
		//---------------------------------------------------------------------------------------------------------
		/**
		 * You can use lateral containers like in OSX.
		 * 
		 * <p>There can be only one at a time and it can be at the left or right and inside or outside of the panel.</p>
		 * 
		 * @param comp A instantiated class or MXML to show into the lateral container.
		 * @param side Where to place the lateral container: "right" or "left".
		 * @param location Where to place the lateral container "out" or "in" (outside the panel or inside the panel).
		 * 
		 * <p>This example open a lateral container with our custom component at the right of the current panel and outside the panel.</p>
		 * <pre>
		 * externalLateralComponent = new customLateralComp();
		 * 
		 * thispanel.openLateral( externalLateralComponent, "right", "out" );
		 * </pre>
		 */
		public function openLateral( comp:* , side:String='right', location:String='out' ):void{

			lateralSide = side;
			lateralLocation = location;
			if( blateral.numChildren>0 ){
				blateral.removeAllChildren();
			} 

			blateral.horizontalScrollPolicy='off';
			blateral.verticalScrollPolicy='off';

			lateralComp = comp;

			if( lateralComp.hasOwnProperty('thispanel') )	lateralComp.thispanel= this;

			if( WP.lateralStyleName==null ){
				lateralComp.setStyle("backgroundColor","#EEEEEE");
			}else{
				lateralComp.styleName=WP.lateralStyleName;
			}

			( lateralComp.ready )? showLateral() : lateralComp.addEventListener(FlexEvent.CREATION_COMPLETE, showLateral );

			blateral.addChild(lateralComp);
		}
		/**
		 * Closes the current opened lateral container.
		 */
		public function closeLateral():void{
			//blateral.mask = null;
			
			lateralEffect.target=blateral;
			lateralEffect.property="x";
			lateralEffect.duration=1000;
			if( lateralSide=='left' ){
				// LEFT
				if( lateralLocation=='out'){
					if( WP.titleButtonsPosition=='right' ){
						lateralEffect.toValue= blateral.x+blateral.width;
					}else{
						lateralEffect.toValue= 0;
					}
				}else{
					if( WP.titleButtonsPosition=='right' ){
						lateralEffect.toValue = (hbox.x*-1)-lateralComp.width;
					}else{
						lateralEffect.toValue= lateralComp.width*-1;
					}
				}
			}else{
				// RIGHT
				if( lateralLocation=='out'){
					lateralEffect.toValue= blateral.x-blateral.width;
				}else{
					//IN
					if( WP.titleButtonsPosition=='right' ){
						lateralEffect.toValue = width - getStyle("borderThicknessRight")-1-hbox.x;
					}else{
						lateralEffect.toValue= width+(getStyle("shadowDistance")*2);	
					}
				}
			}
			
			lateralEffect.play();
			lateralVisible=false;
			lateralComp.removeEventListener(FlexEvent.CREATION_COMPLETE, showLateral );
		}
		private function drawMask(x:Number,y:Number,w:Number,h:Number,cornerTopLeft:Number,cornerTopRight:Number,cornerBottomRight:Number,cornerBottomLeft:Number):void{
			//trace(x+' '+y+' '+w+' '+h);
			var g:Graphics=spmask2.graphics;
			g.clear();
			g.beginFill(0xFFFFFF);
			g.moveTo (x + cornerTopLeft, y);
			g.lineTo (x+w-cornerTopRight, y);
			g.curveTo(x+w, y, x+w, y+cornerTopRight );
			g.lineTo (x+w, y+h-cornerBottomRight);
			g.curveTo(x+w, y+h, x+w-cornerBottomRight, y+h );
			g.lineTo (x+cornerBottomLeft , y+h);
			g.curveTo(x, y+h, x, y+h-cornerBottomLeft );
			g.lineTo (x, y+cornerTopLeft);
			g.curveTo(x, y, x+cornerTopLeft , y );
			g.endFill();
		} 
		private function showLateral(e:Event=null):void{ 
			lateralComp.ready=true;
			lateralComp.validateNow();
//--------------				
			lateralEffect.target=blateral;
			lateralEffect.property="x";
			lateralEffect.duration=1000;

			var cornerRadius:Number = lateralComp.getStyle('cornerRadius');
			var x2:Number;
			var y2:Number=getStyle('headerHeight');
			var wi:Number = lateralComp.width;
			var he:Number = height- getStyle('headerHeight')*2;

			if( lateralSide=='left' ){
				if( lateralLocation == 'out' ){
					// LEFT - OUT
					x2 = 0;
					if( WP.titleButtonsPosition=='right' ){
						x2 -= hbox.x;
						lateralEffect.toValue = (hbox.x*-1)-wi;
					}else{ 
						lateralEffect.toValue = wi*-1;
					}
					drawMask(lateralEffect.toValue,y2,wi,he,cornerRadius,0,0,cornerRadius);
				}else{
					// LEFT - IN
					x2 = wi*-1;
					if( WP.titleButtonsPosition=='right' ){ 
						x2 = (hbox.x*-1)-wi;
						lateralEffect.toValue = hbox.x*-1;
					}else{
						lateralEffect.toValue = 0;
					}
					drawMask(lateralEffect.toValue,y2,wi,he,0,cornerRadius,cornerRadius,0);
				}
			}else{
				if( lateralLocation == 'out' ){
					// RIGHT - OUT
					//x2 = width - wi - getStyle("shadowDistance") - lateralComp.getStyle("shadowDistance")-1;
					x2 = width - wi - getStyle("borderThicknessRight");
					if( WP.titleButtonsPosition=='right' ) x2 -= hbox.x;
					lateralEffect.toValue = x2+wi;
					drawMask(lateralEffect.toValue,y2,wi,he,0,cornerRadius,cornerRadius,0);
				}else{
					// RIGHT - IN
					//x2 = width - getStyle("shadowDistance") - lateralComp.getStyle("shadowDistance")-1;
					x2 = width - getStyle("borderThicknessRight");
					
					if( WP.titleButtonsPosition=='right' ) x2 -= hbox.x;
					lateralEffect.toValue = x2-wi;
					drawMask(lateralEffect.toValue,y2,wi,he,cornerRadius,0,0,cornerRadius);
				}
			}
		
			blateral.move( x2 , y2 );
			blateral.setActualSize( wi , he );
			
			blateral.mask = spmask2;

			lateralEffect.play();
			blateral.visible=true;
			lateralVisible=true;

		}
	}
}