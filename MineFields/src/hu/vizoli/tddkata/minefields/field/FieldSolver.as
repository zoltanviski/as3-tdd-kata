package hu.vizoli.tddkata.minefields.field 
{
	import hu.vizoli.tddkata.minefields.constant.CFieldType;
	import hu.vizoli.tddkata.minefields.constant.CNewLineCharacter;
	import hu.vizoli.tddkata.minefields.util.StringUtil;
	
	/**
	 * This class responsible for solving the generated field of Mine Fields.
	 * 
	 * @author vizoli
	 */
	public class FieldSolver 
	{
		
		public function FieldSolver() 
		{
			
		}
		
		/**
		 * Solve the given field.
		 * 
		 * @param	field
		 * @return
		 */
		public function solve( field:String ):String
		{
			var result:String = "";
			var newLinesCount:int;
			
			var l:int = field.length;
			for ( var i:int = 0; i < l; i++ )
			{
				if ( this.isMine( field.charAt( i ) ) )
				{
					result += CFieldType.MINE;
				}
				else if ( this.isNewLineCharatcer( field.charAt( i ) ) )
				{
					newLinesCount++;
					
					result += CNewLineCharacter.SIMPLE_NEW_LINE;
				}
				else
				{
					result += this.getMinesCountAroundTheCell( i - newLinesCount, field );
				}
			}
			
			return result;
		}
		
		/**
		 * Returns the actual row.
		 * 
		 * @param	actualStringPosition
		 * @param	fieldVector
		 * @return
		 */
		private function getActualRow( actualStringPosition:int, fieldVector:Vector.<Vector.<*>> ):int
		{
			var maxRow:int = fieldVector.length;
			var maxColumn:int = fieldVector[0].length;
			
			if ( maxRow == 1 || actualStringPosition < maxColumn )
			{
				return 0;
			}
			
			return Math.floor( actualStringPosition / maxRow ) - 1;
		}
		
		/**
		 * Returns the actual column.
		 * 
		 * @param	actualStringPosition
		 * @param	fieldVector
		 * @return
		 */
		private function getActualColumn( actualStringPosition:int, fieldVector:Vector.<Vector.<*>> ):int
		{
			var maxColumn:int = fieldVector[0].length;
			
			if ( actualStringPosition < maxColumn )
			{
				return actualStringPosition;
			}
			
			return actualStringPosition % maxColumn;
		}
		
		/**
		 * Returns the count of the Mines around the cell.
		 * 
		 * @param	actualStringPosition
		 * @param	field 
		 * @return
		 */
		private function getMinesCountAroundTheCell( actualStringPosition:int, field:String ):int
		{
			var result:int;
			
			var fieldVector:Vector.<Vector.<*>> = this.convertFieldToVector( field );
			
			var actualRow:int = this.getActualRow( actualStringPosition, fieldVector );
			var actualColumn:int = this.getActualColumn( actualStringPosition, fieldVector );
			
			for ( var i:int = actualRow - 1; i <= actualRow + 1; i++ )
			{
				for ( var j:int = actualColumn - 1; j <= actualColumn + 1; j++ )
				{
					try
					{
						if ( this.isMine( fieldVector[ i ][ j ] ) )
						{
							result++;
						}
					} 
					catch ( e:Error )
					{
						
					}
				}
			}
			
			return result;
		}
		
		/**
		 * Returns the fake lined field.
		 * 
		 * @param	field
		 * @return
		 */
		private function getFakeNewLinedField( field:String ):String
		{
			return StringUtil.replace( field, CNewLineCharacter.SIMPLE_NEW_LINE, CNewLineCharacter.FAKE_NEW_LINE );
		}
		
		/**
		 * Convert the field to Vector.
		 * 
		 * @param	field
		 * @return
		 */
		private function convertFieldToVector( field:String ):Vector.<Vector.<*>>
		{		
			var result:Vector.< Vector.<*>> = new Vector.< Vector.<*>>;
			result[ 0 ] = new Vector.<*>;
			
			var lineCount:int;
			
			field = this.getFakeNewLinedField( field );
			
			var l:int = field.length;
			for ( var i:int = 0; i < l; i++ )
			{
				if ( this.isMine( field.charAt( i ) ) )
				{
					Vector.<*>( result[ lineCount ] ).push( CFieldType.MINE );
				}
				else if ( this.isFakeNewLineCharatcer( field.charAt( i ) ) )
				{
					lineCount++;
					
					result[ lineCount ] = new Vector.<*>;
				}
				else
				{
					Vector.<*>( result[ lineCount ] ).push( 0 );
				}
			}
			
			return result;
		}
		
		/**
		 * Check that char is Mine or not.
		 * 
		 * @param	char
		 * @return
		 */
		private function isMine( char:String ):Boolean
		{
			return char == CFieldType.MINE;
		}
		
		/**
		 * Check that char is new line character or not.
		 * 
		 * @param	char
		 * @return
		 */
		private function isNewLineCharatcer( char:String ):Boolean
		{
			return char == CNewLineCharacter.SIMPLE_NEW_LINE;
		}
		
		/**
		 * Check that char is fake new line character or not.
		 * 
		 * @param	char
		 * @return
		 */
		private function isFakeNewLineCharatcer( char:String ):Boolean
		{
			return char == CNewLineCharacter.FAKE_NEW_LINE;
		}
		
	}

}