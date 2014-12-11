package hu.vizoli.api.mvc.validator 
{
	/**
	 * Validate a string that its an empty string or not.
	 * 
	 * @author vizoli
	 */
	public class EmptyStringValidator 
	{
		
		/**
		 * Validate the value.
		 * 
		 * @param	value
		 * @param	errorMessage
		 */
		public static function validate( value:String, errorMessage:String = null ):Boolean
		{
			if ( value == "" )
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