package  
{
	/**
	 * Math utils.
	 * 
	 * @author vizoli
	 */
	public class MathUtil 
	{
		
		/**
		 * Test that the modulo is equal to the expression or not.
		 * 
		 * @param	dividend
		 * @param	divisor
		 * @param	expression
		 * @return
		 */
		public static function isModuloEquality( dividend:Number, divisor:Number, expression:Number ):Boolean 
		{
			return ( dividend % divisor ) == expression;
		}
		
		/**
		 * Get a random value between a range.
		 * 
		 * @param	minimum
		 * @param	maximum
		 * @return
		 */
		public static function getRandomInRange( minimum:Number, maximum:Number ):Number
		{
			return ( Math.floor( Math.random() * ( maximum - minimum + 1 ) ) );
		}
		
	}

}