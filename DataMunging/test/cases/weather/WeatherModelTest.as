package cases.weather
{
	import flexunit.framework.TestCase;
	import hu.vizoli.tddkata.datamunging.model.weather.WeatherModel;
	import hu.vizoli.tddkata.datamunging.vo.weather.TemperatureVO;
	import org.flexunit.Assert;
	
	/**
	 * WeatherModel test.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class WeatherModelTest extends TestCase 
	{
		private var _weatherModel:WeatherModel;
		
		[Before]
		override public function setUp():void 
		{
			this._weatherModel = new WeatherModel();
		}
		
		[After]
		override public function tearDown():void 
		{
			this._weatherModel = null;
		}
		
		[Test]
		public function testSetAndGetSmallestTemperature( ):void
		{
			var temperatures:Vector.<TemperatureVO> = new Vector.<TemperatureVO>;
			temperatures.push( this.getTemperatureVO( 1, 5 ) );
			temperatures.push( this.getTemperatureVO( 2, 32 ) );
			temperatures.push( this.getTemperatureVO( 3, 1 ) );
			
			this._weatherModel.temperatures = temperatures;
			
			Assert.assertEquals( 3, this._weatherModel.smallestTemperature );
		}
		
		[Test]
		public function testSetMultipleAndGetSmallestTemperature( ):void
		{
			var temperatures:Vector.<TemperatureVO> = new Vector.<TemperatureVO>;
			temperatures.push( this.getTemperatureVO( 1, 2 ) );
			temperatures.push( this.getTemperatureVO( 2, -33 ) );
			temperatures.push( this.getTemperatureVO( 3, -9 ) );
			
			this._weatherModel.temperatures = temperatures;
			
			temperatures = new Vector.<TemperatureVO>;
			temperatures.push( this.getTemperatureVO( 1, 6 ) );
			temperatures.push( this.getTemperatureVO( 2, -13 ) );
			temperatures.push( this.getTemperatureVO( 3, -21 ) );
			
			this._weatherModel.temperatures = temperatures;
			
			Assert.assertEquals( 3, this._weatherModel.smallestTemperature );
		}
		
		private function getTemperatureVO( day:int, averageTemperature:Number ):TemperatureVO
		{
			var temperatureVO:TemperatureVO = new TemperatureVO();
			temperatureVO.day = day;
			temperatureVO.averageTemperature = averageTemperature;
			
			return temperatureVO;
		}
		
	}

}