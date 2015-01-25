package hu.vizoli.tddkata.minefields.util 
{
	/**
	 * String Utils.
	 * 
	 * @author vizoli
	 */
	public class StringUtil 
	{
		
		/**
		 * Set char at the gived index.
		 * 
		 * @param	string
		 * @param	char
		 * @param	index
		 * @return
		 */
		public static function setCharAt( string:String, char:String, index:int ):String 
		{
			return string.substr( 0, index ) + char + string.substr( index + 1 );
		}
		
		/**
		 * Returns the count of the specific character in the string.
		 * 
		 * @param	string
		 * @param	char
		 * @return
		 */
		public static function getSpecificCharacterCount( string:String, char:String ):int 
		{
			return string.split( char ).length - 1;
		}
		
		/**
		 * Returns the replaced string.
		 * 
		 * @param	string
		 * @param	from
		 * @param	to
		 * @return
		 */
		public static function replace( string:String, from:String, to:String ):String 
		{
			return string.split( from ).join( to );
		}
		
	}

}