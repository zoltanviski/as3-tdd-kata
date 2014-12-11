package  
{
	/**
	 * Utils of Strings.
	 * 
	 * @author vizoli
	 */
	public class StringUtil 
	{
		
		/**
		 * Remove the last character from a String.
		 * 
		 * @param	source
		 * @return
		 */
		public static function removeLastCharacter( source:String ):String 
		{
			return removeAt( source, source.length - 1 );
		}
		
		/**
		 * Remove a specific character position from a String.
		 * 
		 * @param	source
		 * @param	position
		 * @return
		 */
		public static function removeAt( source:String, position:int ):String 
		{
			return replaceAt( source, position, '' );
		}
		
		/**
		 * Replace a character at the specific position.
		 * 
		 * @param	source
		 * @param	position
		 * @param	replace
		 * @return
		 */
		public static function replaceAt( source:String, position:int, replace:String ):String 
		{
			var result:Array = source.split( '' );
			result.splice( position, 1, replace );
			
			return result.join( '' );
		}
		
	}

}