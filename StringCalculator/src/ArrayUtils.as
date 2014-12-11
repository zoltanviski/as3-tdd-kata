package  
{
	/**
	 * Utils of Array related things.
	 * 
	 * @author vizoli
	 */
	public class ArrayUtils 
	{
		
		/**
		 * Get the sum of array elements.
		 * 
		 * @param	array
		 */
		public static function isContainNegatives( array:Array ):*
		{
			var stringArrayLength:int = array.length;
			var negativesArray:Array = [ ];
			
			for ( var i:int = 0; i < stringArrayLength; i++ )
			{
				if ( String( array[ i ] ).charAt( 0 ) == "-" )
				{
					negativesArray.push( array[ i ] );
				}
			}
			
			return negativesArray.length ? negativesArray : false;
		}
		
	}

}