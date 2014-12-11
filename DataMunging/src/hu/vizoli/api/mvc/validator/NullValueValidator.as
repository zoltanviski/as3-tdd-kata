package hu.vizoli.api.mvc.validator 
{
	/**
	 * Validate a value that its null or not.
	 * 
	 * @author vizoli
	 */
	public class NullValueValidator 
	{
		
		/**
		 * Validate the value.
		 * 
		 * @param	value
		 */
		public static function validate( value:*, errorMessage:String = null ):Boolean
		{
			if ( value == null )
			{
				if ( errorMessage )
				{
					throw new Error( errorMessage );
				}
				
				return false;
			}
			
			return true;
		}
		
	}

}