package hu.vizoli.tddkata.romancalculator.operation
{
	import flash.utils.Dictionary;
	import hu.vizoli.tddkata.romancalculator.constant.CNumberFormats;
	import hu.vizoli.tddkata.romancalculator.constant.CPossibleRomansPairs;
	
	/**
	 * Romain szamokkal vegzett muveleteket vegzo osztaly
	 * 
	 * @author vizoli
	 */
	public class RomanOperations 
	{
		
		/**
		 * Arab szamot konvertal romaiva
		 * 
		 * @param	arabicNumber
		 */
		public static function romanize( arabicNumber:int ):String
		{
			var romansPairsOrder:Vector.<String> = PossibleRomansPairsOrder.getOrder();
			
			var romanString:String = "";
			
			for ( var i:int = 0; i < romansPairsOrder.length; i++ )
			{
				while ( arabicNumber >= CPossibleRomansPairs[ romansPairsOrder[ i ] ] )
				{
					romanString += romansPairsOrder [ i ];
					
					arabicNumber -= CPossibleRomansPairs[ romansPairsOrder [ i ] ];
				}
			}
			
			return romanString;
		}
		
		/**
		 * Romai szamot konvertal arabba
		 * 
		 * @param	roman
		 */
		public static function deromanize( roman:String ):int
		{	
			if ( !isValidRoman( roman ) )
			{
				return -1;
			}
			
			var arabic:int;
			
			var l:int = roman.length;
			for ( var i:int = l; i >= 0; i-- )
			{
				if ( CPossibleRomansPairs[ roman.charAt( i ) ] < CPossibleRomansPairs[ roman.charAt( i + 1 ) ] )
				{
					arabic -= CPossibleRomansPairs[ roman.charAt( i ) ];
				}
				else
				{
					arabic += CPossibleRomansPairs[ roman.charAt( i ) ];
				}
			}
		 
			return arabic;
		}
		
		/**
		 * Osszead ket romai szamot, az osszeget pedig az outputFormat-ben megadott formatum szerint adja vissza
		 * 
		 * @param	roman1
		 * @param	roman2
		 * @param	outputFormat
		 */
		public static function add( roman1:String, roman2:String, outputFormat:String = CNumberFormats.ARABIC ):*
		{
			if ( !isValidRoman( roman1 ) || !isValidRoman( roman2 ) )
			{
				return "ERROR";
			}
			
			var sum:int = deromanize( roman1 ) + deromanize ( roman2 );
			
			if ( outputFormat == CNumberFormats.ARABIC )
			{
				return sum;
			}
			
			if ( outputFormat == CNumberFormats.ROMAN )
			{
				var romanSum:String = romanize( deromanize( roman1 ) + deromanize ( roman2 ) );
				
				return isValidRoman( romanSum ) ? romanSum : "ERROR";
			}
		}
		
		/**
		 * Validalja a kapott erteket
		 * 
		 * @param	roman
		 */
		public static function isValidRoman( roman:String ):Boolean
		{
			//var validateRegexp:RegExp = /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})/;
			var validateRegexp:RegExp = /(IIII)|(XIIX)|(IM)|(VM)|(MMMCMXCIX)|(MMMM)/;
			
			if ( validateRegexp.test( roman ) )
			{
				return false;
			}
			
			return true;
		}
		
	}

}