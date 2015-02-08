package hu.vizoli.tddkata.charactercopier.copier 
{
	import flash.events.EventDispatcher;
	import hu.vizoli.common.constant.character.CNewLine;
	import hu.vizoli.tddkata.charactercopier.copier.event.CopierEvent;
	
	/**
	 * The Copier.
	 * 
	 * @author vizoli
	 */
	public class Copier extends EventDispatcher
	{
		private var _source:ISource;
		private var _destination:IDestination;
		
		public function Copier( source:ISource, destination:IDestination) 
		{
			this._source = source;
			this._destination = destination;
		}
		
		/**
		 * Copy from the source to the destination.
		 */
		public function copy( ):void
		{
			var char:String;
			var copied:String = "";
			
			while ( true )
			{
				char = this._source.getChar();
				
				if ( char == CNewLine.SIMPLE ) 
				{
					break;
				}
				
				copied += char;
				this._destination.setChar( char );
			}
			
			this.dispatchFinishedEvent( copied );
		}
		
		/**
		 * Dispatch finished event.
		 * 
		 * @param	copied
		 */
		private function dispatchFinishedEvent( copied:String ):void
		{
			var event:CopierEvent = new CopierEvent( CopierEvent.COPY_FINISHED );
			event.copied = copied;
			this.dispatchEvent( event );
		}
		
	}

}