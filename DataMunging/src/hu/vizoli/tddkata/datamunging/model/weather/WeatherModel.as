package hu.vizoli.tddkata.datamunging.model.weather 
{
	import hu.vizoli.api.base.BaseModel;
	import hu.vizoli.tddkata.datamunging.vo.weather.TemperatureVO;
	
	/**
	 * Wheather data Model.
	 * 
	 * @author vizoli
	 */
	public class WeatherModel extends BaseModel 
	{
		private var _smallestTemperatureDay:Number;
		private var _temperatures:Vector.<TemperatureVO>;
		
		public function WeatherModel() 
		{
			this._temperatures = new Vector.<TemperatureVO>;
		}
		
		/**
		 * Returns with the smallest temperature value.
		 */
		public function get smallestTemperature():Number 
		{
			var smallestTemperatureDay:Number = -1;
			var smallestTemperature:Number = Number.POSITIVE_INFINITY;
			
			var l:int = this._temperatures.length;
			for ( var i:int = 0; i < l; i++ )
			{
				if ( this._temperatures[ i ].averageTemperature < smallestTemperature )
				{
					smallestTemperature = this._temperatures[ i ].averageTemperature;
					smallestTemperatureDay = this._temperatures[ i ].day;
				}
			}
			
			return smallestTemperatureDay;
		}
		
		/**
		 * @private
		 */
		public function set temperatures( value:Vector.<TemperatureVO> ):void 
		{
			this._temperatures = value;
		}
		
	}

}