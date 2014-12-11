package hu.vizoli.tddexercise.multilanguage.event 
{
	import flash.events.Event;
	
	/**
	 * ApplicationEvent
	 * 
	 * @author vizoli
	 */
	public class ApplicationEvent extends Event 
	{
		public static const INIT:String = "ApplicationEvent.init";
		
		public function ApplicationEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) 
		{
			super( type, bubbles, cancelable );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			return new ApplicationEvent( type );
		}
		
	}

}