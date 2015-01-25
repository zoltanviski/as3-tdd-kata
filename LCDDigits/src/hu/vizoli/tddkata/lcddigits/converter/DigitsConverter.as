package hu.vizoli.tddkata.lcddigits.converter 
{
	import flash.utils.Dictionary;
	import hu.vizoli.tddkata.lcddigits.constant.CLCDSymbol;
	import hu.vizoli.tddkata.lcddigits.constant.CNewLine;
	import hu.vizoli.tddkata.lcddigits.util.MathUtil;
	import hu.vizoli.tddkata.lcddigits.util.StringUtil;
	import hu.vizoli.tddkata.lcddigits.util.VectorUtil;
	
	/**
	 * Convert digits to other symbols.
	 *
	 * @author vizoli
	 */
	public class DigitsConverter 
	{
		private static var fakeLCDSymbols:Dictionary;
		private static var fakeLCDs:Dictionary;
		
		{
			DigitsConverter.fakeLCDSymbols = new Dictionary( true );
			DigitsConverter.fakeLCDSymbols[ "a" ] = CLCDSymbol.EMPTY + CLCDSymbol.HORIZONTAL + CLCDSymbol.EMPTY;
			DigitsConverter.fakeLCDSymbols[ "b" ] = CLCDSymbol.VERTICAL + CLCDSymbol.EMPTY + CLCDSymbol.VERTICAL;
			DigitsConverter.fakeLCDSymbols[ "c" ] = CLCDSymbol.VERTICAL + CLCDSymbol.HORIZONTAL + CLCDSymbol.VERTICAL;
			DigitsConverter.fakeLCDSymbols[ "d" ] = CLCDSymbol.EMPTY + CLCDSymbol.EMPTY + CLCDSymbol.EMPTY;
			DigitsConverter.fakeLCDSymbols[ "e" ] = CLCDSymbol.EMPTY + CLCDSymbol.EMPTY + CLCDSymbol.VERTICAL;
			DigitsConverter.fakeLCDSymbols[ "f" ] = CLCDSymbol.EMPTY + CLCDSymbol.HORIZONTAL + CLCDSymbol.VERTICAL;
			DigitsConverter.fakeLCDSymbols[ "g" ] = CLCDSymbol.VERTICAL + CLCDSymbol.HORIZONTAL + CLCDSymbol.EMPTY;
			
			DigitsConverter.fakeLCDs = new Dictionary( true );
			DigitsConverter.fakeLCDs[ 0 ] = "abc";
			DigitsConverter.fakeLCDs[ 1 ] = "dee";
			DigitsConverter.fakeLCDs[ 2 ] = "afg";
			DigitsConverter.fakeLCDs[ 3 ] = "aff";
			DigitsConverter.fakeLCDs[ 4 ] = "dce";
			DigitsConverter.fakeLCDs[ 5 ] = "agf";
			DigitsConverter.fakeLCDs[ 6 ] = "agc";
			DigitsConverter.fakeLCDs[ 7 ] = "aee";
			DigitsConverter.fakeLCDs[ 8 ] = "acc";
			DigitsConverter.fakeLCDs[ 9 ] = "ace";
		}
		
		/**
		 * Convert the given digit to LCD String.
		 * 
		 * @param	digit
		 * @return
		 */
		public static function toLCD( digit:int ):String
		{
			DigitsConverter.validateDigitToLCD( digit);
			
			var intVector:Vector.<String> = VectorUtil.intSplitToVector( digit );
			
			if ( DigitsConverter.isSingleDigit( intVector ) )
			{
				return processDigitsToLCD( fakeLCDs[ digit ] );
			}
			
			var stringVector:Vector.<Vector.<String>> = DigitsConverter.getlcdStringVector( intVector );
			
			return DigitsConverter.concatLCDNumbers( stringVector );
		}
		
		/**
		 * Validation of the digit.
		 * 
		 * @param	digit
		 */
		private static function validateDigitToLCD( digit:int ):void
		{
			if ( !MathUtil.isPositiveNumber( digit ) )
			{
				throw new Error( "The digit cannot be negative!" );
			}
		}
		
		/**
		 * Returns true if the digit is single otherwise false.
		 * 
		 * @param	intVector
		 * @return
		 */
		private static function isSingleDigit( intVector:Vector.<String> ):Boolean
		{
			return intVector.length == 1 ? true : false;
		}
		
		/**
		 * Returns a vedtor which contain all lcd digits string in Vector.
		 * 
		 * @param	intVector
		 * @return
		 */
		private static function getlcdStringVector( intVector:Vector.<String> ):Vector.<Vector.<String>>
		{
			var result:Vector.<Vector.<String>> = new Vector.<Vector.<String>>;
			
			var lcdNumberElementVector:Vector.<String> = new Vector.<String>;
			
			var l:int = intVector.length;
			for ( var i:int = 0; i < l; i++ )
			{
				lcdNumberElementVector = Vector.<String>( DigitsConverter.processDigitsToLCD( fakeLCDs[ intVector[ i ] ] ).split( CNewLine.SIMPLE ) );
				
				result.push( lcdNumberElementVector );
			}
			
			return result;
		}
		
		/**
		 * Concat the lcd strings.
		 * 
		 * @param	stringVector
		 * @return
		 */
		private static function concatLCDNumbers( stringVector:Vector.<Vector.<String>> ):String
		{
			var result:String = "";
			
			var l1:int = Vector.<String>( stringVector[ 0 ] ).length;
			var l2:int = stringVector.length;
			for ( var i:int = 0; i < l1; i++ )
			{
				for ( var j:int = 0; j < l2; j++ )
				{
					result += stringVector[ j ][ i ];
					
					if ( j != l2 - 1 ) 
					{
						result += " ";
					}
				}
				
				result += CNewLine.SIMPLE;
			}
			
			result = DigitsConverter.removeLastNewLineCharacter( result );
			
			return result;
		}
		
		/**
		 * Process the given digits.
		 * 
		 * @param	symbols
		 * @return
		 */
		private static function processDigitsToLCD( symbols:String ):String
		{
			var result:String = "";
			
			var l:int = symbols.length;
			for ( var i:int = 0; i < l; i++ )
			{
				result += DigitsConverter.decodeFakeSymbols( symbols.charAt( i ) ) + CNewLine.SIMPLE;
			}
			
			return DigitsConverter.removeLastNewLineCharacter( result );
		}
		
		/**
		 * Remove the last new line character from the LCD String.
		 * 
		 * @param	lcdString
		 * @return
		 */
		private static function removeLastNewLineCharacter( lcdString:String ):String
		{
			return StringUtil.removeLastCharacter( lcdString );
		}
		
		/**
		 * Decode the fake abc symbol to expected format.
		 * 
		 * @param	symbol
		 * @return
		 */
		private static function decodeFakeSymbols( symbol:String ):String
		{
			return DigitsConverter.fakeLCDSymbols[ symbol ];
		}
		
	}

}