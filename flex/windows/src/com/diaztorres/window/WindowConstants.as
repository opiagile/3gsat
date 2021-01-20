package com.diaztorres.window
{
	public final class WindowConstants
	{
		//public static const WINDOW_MDI:Number		=0;
		/**
		 * In the open method indicates that the opening window is a normal window.
		 */
		public static const WINDOW_NORMAL:Number	=1;
		/**
		 * In the open method indicates that the opening window is a modal window.
		 * 
		 * <p>When a modal window is opened, all other windows are disabled.</p>
		 */
		public static const WINDOW_MODAL:Number		=2;


		/**
		 * @private
		 */
		public static const STATUS_NORMAL:Number = 1;		// la ventana está en estado normal
		/**
		 * @private
		 */
		public static const STATUS_MAXIMIZED:Number = 2;	// estado maximizado
		/**
		 * @private
		 */
		public static const STATUS_MINIMIZED:Number = 3;	// estado minimizado


		/**
		 * When open a new window, show the close button.
		 */
		public static const BUTTON_CLOSE:int	= 1;	// close button
		/**
		 * When open a new window, show the minimize button.
		 */
		public static const BUTTON_MINIMIZE:int	= 2;	// minimize button
		/**
		 * When open a new window, show the maximize button.
		 */
		public static const BUTTON_MAXIMIZE:int	= 4;	// maximize button
		/**
		 * When open a new window, show all buttons.
		 */
		public static const BUTTON_ALL:int		= BUTTON_CLOSE+BUTTON_MINIMIZE+BUTTON_MAXIMIZE;	// all buttons

	}
}