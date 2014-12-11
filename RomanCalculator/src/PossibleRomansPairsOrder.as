package  
{
	/**
	 * A roman szamok sorrendjere vonatkozo osztaly
	 * 
	 * @author vizoli
	 */
	public class PossibleRomansPairsOrder 
	{
		
		/**
		 * Visszaadja a romain szamparok lehetseges sorrendjet
		 */
		public static function getOrder():Vector.<String>
		{
			var examinesSort:Vector.<String> = new Vector.<String>;
			examinesSort.push( "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" );
			
			return examinesSort;
		}
		
	}

}