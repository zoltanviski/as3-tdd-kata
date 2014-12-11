package hu.vizoli.api.base 
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	/**
	 * BaseActor
	 * 
	 * @author vizoli
	 */
	public class BaseModel
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Dispatch event
		 * 
		 * @param	event
		 */
		protected function dispatch( e:Event ):void
		{
			if ( this.eventDispatcher.hasEventListener( e.type ) )
			{
				this.eventDispatcher.dispatchEvent( e );
			}
		}
	}
}