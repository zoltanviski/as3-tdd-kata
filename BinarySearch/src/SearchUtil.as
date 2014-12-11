package  
{
	/**
	 * ...
	 * @author vizoli
	 */
	public class SearchUtil 
	{
		
		public static function binarySearch( array:Array, value:String, left:int, right:int ):int
		{
			if( left > right )
			{
				return -1;
			}
				  
			 var middle:int = ( left + right ) / 2;
			 if ( array[ middle ] == value )
			 {
				return middle;
			 }
				  
			 else if ( array[ middle ] > value )
			 {
				return binarySearch( array, value, left, middle - 1 );
			 }
			 else
			 {
				return binarySearch( array, value, middle + 1, right );
			 }
		}
		
		public static function binarySearch3( array:Array, value:String, left:int = 0, right:int = 0 ):int
		{
			if ( left == right && left == 0 )
			{
				right = array.length;
			}
			
			if( left > right )
			{
				return -1;
			}
				  
			 var middle:int = ( left + right ) / 2;
			 if ( array[ middle ] == value )
			 {
				return middle;
			 }
				  
			 else if ( array[ middle ] > value )
			 {
				return binarySearch( array, value, left, middle - 1 );
			 }
			 else
			 {
				return binarySearch( array, value, middle + 1, right );
			 }
		}
		
	}

}