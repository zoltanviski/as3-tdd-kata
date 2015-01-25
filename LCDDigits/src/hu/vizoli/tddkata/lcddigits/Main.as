package hu.vizoli.tddkata.lcddigits {
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Main of LCD Digits project.
	 * 
	 * @author vizoli
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if ( this.stage ) this.init();
			else this.addEventListener( Event.ADDED_TO_STAGE, this.init );
		}
		
		/**
		 * Init.
		 * 
		 * @param	e
		 */
		private function init( e:Event = null ):void 
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, this.init );
		}
		
	}
	
}