package hu.vizoli.api.util.net 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * File loader helper util.
	 * 
	 * @author vizoli
	 */
	public class FileLoaderUtil extends EventDispatcher 
	{
		private var _urlLoader:URLLoader;
		
		public function FileLoaderUtil( target:flash.events.IEventDispatcher = null ) 
		{
			super( target );
			
			this._urlLoader = new URLLoader();
		}
		
		/**
		 * Load weather data.
		 * 
		 * @param	url
		 */
		public function load( url:String, completeHandler:Function, faultHandler:Function = null ):void
		{
			this._urlLoader.addEventListener( Event.COMPLETE, completeHandler );
			this._urlLoader.load( new URLRequest( url ) );
		}
		
	}

}