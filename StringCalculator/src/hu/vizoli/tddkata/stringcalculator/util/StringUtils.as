package hu.vizoli.tddkata.stringcalculator.util 
{
	/**
	 * Utils of String.
	 * 
	 * @author vizoli
	 */
	public class StringUtils 
	{
		
		/**
		 * Check matching string with the matcher.
		 * 
		 * @param	string
		 * @param	matcher
		 */
		public static function isMatch( string:String, matcher:* ):Boolean
		{
			return Boolean( string.match( matcher ) );
		}
		
	}

}