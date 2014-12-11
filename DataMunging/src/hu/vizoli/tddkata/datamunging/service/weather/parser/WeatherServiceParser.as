package hu.vizoli.tddkata.datamunging.service.weather.parser 
{
	import hu.vizoli.api.constant.CRegExp;
	import hu.vizoli.tddkata.datamunging.vo.weather.TemperatureVO;
	
	/**
	 * Parse data to Number Vector.
	 * 
	 * @author vizoli
	 */
	public class WeatherServiceParser 
	{
		
		/**
		 * Parse.
		 * 
		 * @param	data
		 */
		public function parse( data:String ):Vector.<TemperatureVO>
		{
			var values:Array;
			var temperatureVO:TemperatureVO;
			var returnVector:Vector.<TemperatureVO> = new Vector.<TemperatureVO>;
			var lines:Array = String( data ).split( "\n" );
			
			var l:int = lines.length;
			for ( var i:int = 2 ; i < l; i++ )
			{
				values = String( lines[ i ] ).split( CRegExp.WHITE_SPACES );
				
				if ( !isNaN( Number( values[ 4 ] ) ) ) 
				{
					temperatureVO = new TemperatureVO();
					temperatureVO.day = values[ 1 ];
					temperatureVO.averageTemperature = Number( values[ 4 ] );
					
					returnVector.push( temperatureVO );
				}
			}
			
			return returnVector;
		}
		
	}

}