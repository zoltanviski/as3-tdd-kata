package  
{
	/**
	 * Calculate Strings as Numbers.
	 * 
	 * @author vizoli
	 */
	public class StringCalculator 
	{
		
		/**
		 * Add operation
		 * 
		 * @param	numbers
		 */
		public static function add( numbers:String ):int
		{
			if ( !numbers.length ) return 0;
			
			var numbersArray:Array = numbers.split( getUsedDelimiter( numbers ) );
			
			checkNegatives( numbersArray );
			
			return MathUtils.getSumFromArray( numbersArray );
		}
		
		/**
		 * Get the used delimiter.
		 * 
		 * @param	numbersArray
		 */
		private static function checkNegatives( numbersArray:Array ):*
		{
			var negatives:* = ArrayUtils.isContainNegatives( numbersArray );
			
			if ( negatives )
			{
				throw new Error( "Negatives not allowed! - " + negatives );
			}
		}
		
		/**
		 * Get the used delimiter.
		 * 
		 * @param	numbers
		 */
		private static function getUsedDelimiter( numbers:String ):*
		{
			var delimiter:* = CRegExp.STRING_CALCULATOR_DELIMITER;
			
			if ( StringUtils.isMatch( numbers, CRegExp.START_WITH_TWO_PER ) )
			{
				delimiter = numbers.charAt( 2 );
			}
			
			return delimiter;
		}
		
	}

}