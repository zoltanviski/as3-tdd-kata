package hu.vizoli.api.language.model.event 
{
	import flash.events.Event;
	
	/**
	 * LanguageModelEvent
	 * 
	 * @author vizoli
	 */
	public class LanguageModelEvent extends Event 
	{
		public static const LANGUAGE_ADDED:String = "LanguageModelEvent.languageAdded";
		public static const LANGUAGE_UPDATED:String = "LanguageModelEvent.languageUpdated";
		
		public var data:*;
		
		public function LanguageModelEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) 
		{
			super( type, bubbles, cancelable );
			
			this.data = data;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			var event:LanguageModelEvent = new LanguageModelEvent( type );
			event.data = data;
			
			return event;
		}
		
	}

}