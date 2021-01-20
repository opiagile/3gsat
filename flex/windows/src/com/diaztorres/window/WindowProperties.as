package com.diaztorres.window
{
	import mx.controls.Button;
	import mx.controls.Image;

	public class WindowProperties{

			/**
			 * The style name of the window.
			 */
			public var styleName:String;				// StyleName que hay que aplicar al Panel
			/**
			 * The style name of the alert box.
			 */ 
			public var alertStyleName:String;			// estilo que hay que aplicar al box de la alerta
			/** 
			 * The style name of the lateral container.
			 */
			public var lateralStyleName:String;			// estilo que hay que aplicar al box lateral
			// Cursor para redimensionar la ventana
			/**
			 * The resize cursor class.
			 */			
			[Embed(source="assets/resize_cursor.gif", mimeType="image/gif")]
			public var resizeCursor:Class; 

			// Imagen para redimensionar la ventana
			/**
			 * @private
			 */
			public var btResize:Image;
			/**
			 * The window resize class.
			 */
			[Embed(source="assets/resize_icon.gif", mimeType="image/gif")]
			public var resizeIconNormal:Class; 

		// Botón Close
			/**
			 * @private
			 */
			public var btClose:Button;
			/**
			 *  Name of the class to use as close icon (up state). 
			 */
			[Embed(source="assets/button_close.png")]
			public var closeIconNormal:Class; 
			/**
			 *  Name of the class to use as close icon (over state). 
			 */
			[Embed(source="assets/button_close_focus.png")]
			public var closeIconOver:Class; 
			/**
			 *  Name of the class to use as close icon (down state). 
			 */
			[Embed(source="assets/button_close_down.png")]
			public var closeIconDown:Class; 

		// Botón Minimize
			/**
			 * @private
			 */
			public var btMinimize:Button; 
			/**
			 *  Name of the class to use as minimize icon (up state). 
			 */
			[Embed(source="assets/button_min.png")]
			public var minimizeIconNormal:Class;
			/**
			 *  Name of the class to use as minimize icon (over state). 
			 */
			[Embed(source="assets/button_min_focus.png")]
			public var minimizeIconOver:Class; 
			/**
			 *  Name of the class to use as minimize icon (down state). 
			 */
			[Embed(source="assets/button_min_down.png")]
			public var minimizeIconDown:Class; 

		// Botón Maximize
			/**
			 * @private
			 */
			public var btMaximize:Button; 
			/**
			 *  Name of the class to use as maximize icon (up state). 
			 */
			[Embed(source="assets/button_max.png")]
			public var maximizeIconNormal:Class; 
			/**
			 *  Name of the class to use as maximize icon (over state). 
			 */
			[Embed(source="assets/button_max_focus.png")]
			public var maximizeIconOver:Class; 
			/**
			 *  Name of the class to use as maximize icon (down state). 
			 */
			[Embed(source="assets/button_max_down.png")]
			public var maximizeIconDown:Class; 

		// Sonido para Maximize
		//	[Embed(source="assets/maximizar.mp3")]
		//	public var sndMaximize:Class; 

		//public var useInternalStyle:Boolean=true;		// true si hay que utilizar el estilo interno predefinido
		
		
		
		/**
		 * Flag to indicate if sound is enabled on close, maximize, restore or minimize
		 */
		[Inspectable(category="General", enumeration="true,false", defaultValue="true")]
		public var enableSound:Boolean=true;			// habilitar los sonidos
		/**
		 * The close, maximize and minimize icons must be squared, this property indicates the width of the used icons.
		 */
		public var iconsWidth:Number=14;				// Ancho de los iconos
		/**
		 * Space in pixels between icons
		 */
		public var iconsHorizontalGap:Number=3;			// Pixels de separación entre los iconos de la parte superior derecha
		/**
		 * If the width of the window is too small, the title is cropped, this flag indicates if a tooltip with the title must be showed in this case.
		 */ 
		[Inspectable(category="General", enumeration="true,false", defaultValue="true")]
		public var showToolTip:Boolean=true;			// Si hay que recortar el label del panel indica si hay que mostrar el toolTip con el texto original del Panel

		/**
		 * Window title position, <code>right</code>, <code>center</code> or <code>left</code>.
		 */
		[Inspectable(category="General", enumeration="right,center,left", defaultValue="center")]
		public var titlePosition:String='center';		// right,center,left
		/**
		 * Where to place the header buttons, to the <code>right</code> or <code>left</code> of the window.
		 */
		[Inspectable(category="General", enumeration="right,left", defaultValue="left")]
		public var titleButtonsPosition:String="left";	// 0=right & 1=left
		/**
		 * Duration in milliseconds of the minimize and maximize effect.
		 */
		public var minmaxDuration:Number=200;			// Duración (milisegundos) del efecto de minimizado y maximizado
		/**
		 * Which buttons must be showed, see WindowConstants. By default all buttons are showed (close, maximize, minimize).
		 * 
		 * @see com.diaztorres.window.WindowConstants
		 */
		public var showButtons:int=WindowConstants.BUTTON_ALL;	// Por defecto se muestran todos los botones

		/**
		 * Tooltip for the close button.
		 */
		public var closeToolTip:String="Close";
		/**
		 * Tooltip for the maximize button.
		 */
		public var maximizeToolTip:String="Maximize";
		/**
		 * Tooltip for the minimize button.
		 */
		public var minimizeToolTip:String="Minimize";
		/**
		 * Tooltip for the restore button.
		 */
		public var restoreToolTip:String="Restore";
		/**
		 * Tooltip for the resize button.
		 */
		public var resizeToolTip:String="Resize";

		/**
		 * Default window width in pixels.
		 */
		public var defaultWidth:Number=500;				// Ancho por defecto del panel
		/**
		 * Default window height in pixels.
		 */
		public var defaultHeight:Number=500;			// Alto por defecto del panel
		
		/**
		 * Constructor
		 */
		public function WindowProperties():void{
			generate();
		}
		/**
		 * Call this method if you change any property of this class.
		 */
		public function generate():void{
			// Configurar botón cerrar
			//-------------------------			
				btClose = new Button();

				btClose.setStyle("paddingLeft"	,0);
				btClose.setStyle("paddingRight"	,0);
//				if( useInternalStyle ){
					btClose.setStyle("upIcon"	,closeIconNormal);
					btClose.setStyle("overIcon"	,closeIconOver);
					btClose.setStyle("downIcon"	,closeIconDown);
//				}else{
					//btClose.styleDeclaration = StyleManager.getStyleDeclaration(".buttonCloseStyle");
//					for( var x:String in StyleManager.selectors){
//						trace(':: '+ StyleManager.selectors[x] );
//					}
//				}
				
				btClose.toolTip=closeToolTip;
				btClose.explicitWidth = btClose.explicitHeight = iconsWidth;
				btClose.focusEnabled = false;
				btClose.visible = true;
			
			// Configurar botón minimizar
			//----------------------------
				btMinimize= new Button();

				btMinimize.setStyle("paddingLeft"	,0);
				btMinimize.setStyle("paddingRight"	,0);

//				if( useInternalStyle ){
					btMinimize.setStyle("upIcon"	,minimizeIconNormal);
					btMinimize.setStyle("overIcon"	,minimizeIconOver);
					btMinimize.setStyle("downIcon"	,minimizeIconDown);
//				}else{
//					btMinimize.styleDeclaration = StyleManager.getStyleDeclaration(".buttonMinimizeStyle");
//				}
				btMinimize.toolTip=minimizeToolTip;
				btMinimize.explicitWidth = btMinimize.explicitHeight = iconsWidth;
				btMinimize.focusEnabled = false;
				btMinimize.visible = true;

			// Configurar botón resize
			//----------------------------
/*			
				//btResize= new Image();
				btResize= new Box();

				btResize.setStyle("paddingLeft"	,0);
				btResize.setStyle("paddingRight"	,0);

//				if( useInternalStyle ){
					btResize.setStyle("backgroundImage", resizeIconNormal);
//				}else{
//					btResize.styleDeclaration = StyleManager.getStyleDeclaration(".resizeIconStyle");
//				}
				btResize.toolTip=resizeToolTip;
				btResize.explicitWidth = btResize.explicitHeight = 12;
				btResize.visible = true;
				btResize.setActualSize(12,12);
				btResize.setStyle("dropShadowEnabled",false);
*/					
			
				btResize = new Image();
				
				btResize.setStyle("paddingLeft"	,0);
				btResize.setStyle("paddingRight",0);
				
				//var newIconClass:Class = Class( StyleManager.getStyleDeclaration(".resizeIcon") );
				
//				if( useInternalStyle ){
					btResize.source=resizeIconNormal;	
//				}else{
					//var newIconClass:Class = Class( getStyle("resizeIcon") );
					//btResize.styleDeclaration = StyleManager.getStyleDeclaration(".resizeIcon");
//				}
				btResize.toolTip=resizeToolTip;
				btResize.explicitWidth = btResize.explicitHeight = 12;
				btResize.visible = true;
				btResize.setActualSize(12,12);
		

			// Configurar botón maximizar
			//----------------------------
				btMaximize= new Button();

				btMaximize.setStyle("paddingLeft"	,0);
				btMaximize.setStyle("paddingRight"	,0);

//				if( useInternalStyle ){
					btMaximize.setStyle("upIcon"	,maximizeIconNormal);
					btMaximize.setStyle("overIcon"	,maximizeIconOver);
					btMaximize.setStyle("downIcon"	,maximizeIconDown);
//				}else{
//					btMaximize.styleDeclaration = StyleManager.getStyleDeclaration(".buttonMaximizeStyle");
//				}
				btMaximize.toolTip=maximizeToolTip;
				btMaximize.explicitWidth = btMaximize.explicitHeight = iconsWidth;
				btMaximize.focusEnabled = false;
				btMaximize.visible = true;


		}
		
	}
}