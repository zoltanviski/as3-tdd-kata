package hu.vizoli.tddkata.lcddigits.util 
{
	/**
	 * Utils of Vector.
	 * 
	 * @author vizoli
	 */
	public class VectorUtil 
	{
		
		/**
		 * Returns int Vector with the source int elements.
		 * 
		 * @param	source
		 * @return
		 */
		public static function intSplitToVector( source:int ):Vector.<String>
		{
			var sourceString:String = String( source );
			
			var result:Vector.<String>;
			result = Vector.<String>( sourceString.split( "" ) );
			
			return result
		}
		
	}

}