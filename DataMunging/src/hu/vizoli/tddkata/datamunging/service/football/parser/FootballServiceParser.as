package hu.vizoli.tddkata.datamunging.service.football.parser 
{
	import hu.vizoli.api.constant.CRegExp;
	import hu.vizoli.tddkata.datamunging.vo.football.GoalRateVO;
	import hu.vizoli.tddkata.datamunging.vo.weather.TemperatureVO;
	
	/**
	 * Parse data to Number Vector.
	 * 
	 * @author vizoli
	 */
	public class FootballServiceParser 
	{
		
		/**
		 * Parse.
		 * 
		 * @param	data
		 */
		public function parse( data:String ):Vector.<GoalRateVO>
		{
			var values:Array;
			var temperatureVO:GoalRateVO;
			var returnVector:Vector.<GoalRateVO> = new Vector.<GoalRateVO>;
			var lines:Array = String( data ).split( "\n" );
			
			var l:int = lines.length;
			for ( var i:int = 2 ; i < l; i++ )
			{
				values = String( lines[ i ] ).split( CRegExp.WHITE_SPACES );
				
				if ( !isNaN( Number( values[ 4 ] ) ) ) 
				{
					temperatureVO = new GoalRateVO();
					temperatureVO.team = values[ 1 ];
					temperatureVO.givedGoal = Number( values[ 4 ] );
					temperatureVO.receivedGoal = Number( values[ 9 ] );
					
					returnVector.push( temperatureVO );
				}
			}
			
			return returnVector;
		}
		
	}

}