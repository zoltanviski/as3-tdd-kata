package hu.vizoli.tddkata.minefields.field 
{
	import hu.vizoli.tddkata.minefields.constant.CFieldType;
	import hu.vizoli.tddkata.minefields.util.MathUtil;
	import hu.vizoli.tddkata.minefields.util.StringUtil;
	/**
	 * This class responsible for generating the field of Mine Fields.
	 * 
	 * @author vizoli
	 */
	public class FieldGenerator 
	{
		public const ROW_SEPARATOR:String = "\n";
		
		public function FieldGenerator() 
		{
			
		}
		
		/**
		 * Generate the field.
		 * 
		 * @param	columnCount
		 * @param	rowCount
		 * @param	mineCount
		 * @return
		 */
		public function generate( columnCount:int, rowCount:int, mineCount:int ):String
		{
			if ( !this.isValidMineCount( columnCount * rowCount, mineCount ) )
			{
				throw new Error( "The Mine count can't be more than the all fields!" );
			}
			
			var result:String = "";
			var getMinePositions:Vector.<int> = this.getMinePositions( columnCount * rowCount, mineCount );
			
			var l:int = columnCount * rowCount + 1;
			for ( var i:int = 1; i < l; i++ )
			{
				if ( this.isMinePosition( i - 1, getMinePositions ) )
				{
					result += CFieldType.MINE;	
				}
				else
				{
					result += CFieldType.CLEAR;	
				}
			}
			
			return this.getBreakLinedField( result, columnCount );
		}
		
		/**
		 * Validate the Mine count.
		 * 
		 * @param	sumFields
		 * @param	mineCount
		 * @return
		 */
		private function isValidMineCount( sumFields:int, mineCount:int ):Boolean
		{
			return mineCount <= sumFields;
		}
		
		/**
		 * Get the field with seperators.
		 * 
		 * @param	field
		 * @param	columnCount
		 * @return
		 */
		private function getBreakLinedField( field:String, columnCount:int ):String
		{
			var result:String = field;
			var lineCount:int;
			
			var l:int = field.length;
			for ( var i:int = 1; i < l; i++ )
			{
				if ( MathUtil.isModuloEquality( i, columnCount, 0 ) )
				{
					result = StringUtil.setCharAt( result, ROW_SEPARATOR + result.charAt( i + lineCount ), i + lineCount );
					
					lineCount++;
				}
			}
			
			return result;
		}
		
		/**
		 * Check that end of the line or not.
		 * 
		 * @param	column
		 * @param	row
		 * @return
		 */
		private function isEndOfLine( column:int, row:int ):Boolean 
		{
			return MathUtil.isModuloEquality( column, row, 0 );
		}
		
		/**
		 * Check that the actual position is mine position or not.
		 * 
		 * @param	actualPosition
		 * @param	minePositions
		 * @return
		 */
		private function isMinePosition( actualPosition:int, minePositions:Vector.<int> ):Boolean 
		{
			return !(minePositions.indexOf( actualPosition ) == -1);
		}
		
		/**
		 * Get Mine positions.
		 * 
		 * @param	fieldCount
		 * @param	mineCount
		 * @return
		 */
		private function getMinePositions( fieldCount:int, mineCount:int ):Vector.<int>
		{
			if ( mineCount == 0 )
			{
				return new Vector.<int>;
			}
			
			var result:Vector.<int> = new Vector.<int>;
			var minePosition:int;
			
			var l:int = mineCount;
			for ( var i:int = 0; i < l; i++ )
			{
				while ( true )
				{
					minePosition = MathUtil.getRandomInRange( 0, fieldCount - 1 );
					if ( result.indexOf( minePosition ) == -1 )
					{
						result.push( minePosition );
						
						break;
					}
				}
			}
			
			return result;
		}
		
	}

}