package hu.vizoli.tddkata.stringcalculator.util {
	/**
	 * Utils of Math related operations.
	 * 
	 * @author vizoli
	 */
	public class MathUtils 
	{
		
		/**
		 * Get the sum of array elements.
		 * 
		 * @param	stringArray
		 */
		public static function getSumFromArray( array:Array, limit:int = 1000 ):int
		{
			var sum:int;
			var stringArrayLength:int = array.length;
			
			for ( var i:int = 0; i < stringArrayLength; i++ )
			{
				if ( int( array[ i ] ) > limit ) continue;
				
				sum += int( array[ i ] );
			}
			
			return sum;
		}
		
	}

}