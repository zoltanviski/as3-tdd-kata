package hu.vizoli.tddexercise.multilanguage.view.event
{
	import flash.events.Event;
	
	/**
	 * LayoutEvent
	 * 
	 * @author vizoli
	 */
	public class LayoutEvent extends Event 
	{
		public static const CHANGE_LANGUAGE:String = "LayoutEvent.changeLanguage";
		
		public function LayoutEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) 
		{
			super( type, bubbles, cancelable );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			return new LayoutEvent( type );
		}
		
	}

}