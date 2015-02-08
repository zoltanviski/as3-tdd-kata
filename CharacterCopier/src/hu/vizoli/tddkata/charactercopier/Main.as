package hu.vizoli.tddkata.charactercopier 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * The Main of CharacterCopier project.
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