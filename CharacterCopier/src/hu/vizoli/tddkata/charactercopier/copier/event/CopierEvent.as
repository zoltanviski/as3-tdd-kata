package hu.vizoli.tddkata.charactercopier.copier.event 
{
	import flash.events.Event;
	
	/**
	 * Copier events.
	 * 
	 * @author vizoli
	 */
	public class CopierEvent extends Event 
	{
		public static const COPY_FINISHED:String = "copyFinished";
		
		public var copied:String;
		
		public function CopierEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) 
		{ 
			super( type, bubbles, cancelable );
			
			this.copied = copied;
		} 
		
		/**
		 * Clone.
		 * 
		 * @return
		 */
		public override function clone():Event 
		{ 
			var event:CopierEvent = new CopierEvent( type, bubbles, cancelable );
			event.copied = copied;
			
			return event;
		} 
		
	}
	
}