package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author vizoli
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if ( stage ) 
			{
				this.init();
			}
			else 
			{
				this.addEventListener(Event.ADDED_TO_STAGE, this.init);
			}
		}
		
		/**
		 * Init the application
		 * 
		 * @param 	e
		 */
		private function init( e:Event = null ):void 
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, this.init );
		}
		
	}
	
}