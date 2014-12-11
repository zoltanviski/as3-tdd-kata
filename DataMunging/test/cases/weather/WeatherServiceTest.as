package cases.weather
{
	import flash.events.Event;
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	import hu.vizoli.tddkata.datamunging.constant.weather.CWeatherURL;
	import hu.vizoli.tddkata.datamunging.model.weather.WeatherModel;
	import hu.vizoli.tddkata.datamunging.service.weather.parser.WeatherServiceParser;
	import hu.vizoli.tddkata.datamunging.service.weather.WeatherService;
	import org.flexunit.async.Async;
	
	/**
	 * WheatherService test.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class WeatherServiceTest extends TestCase 
	{
		private static const TIMEOUT_VALUE:int = 500;
		
		private var _weatherModel:WeatherModel;
		private var _weatherService:WeatherService;
		private var _weatherServiceParser:WeatherServiceParser;
		
		[Before]
		override public function setUp():void 
		{
			this._weatherModel = new WeatherModel();
			
			this._weatherServiceParser = new WeatherServiceParser();
			
			this._weatherService = new WeatherService();
			this._weatherService.weatherModel = this._weatherModel;
			this._weatherService.weatherServiceParser = this._weatherServiceParser;
		}
		
		[After]
		override public function tearDown():void 
		{
			this._weatherService = null;
			this._weatherModel = null;
			this._weatherServiceParser = null;
		}
		
		//[Test(async)]
		public function testLoadComplete( ):void
		{
			var asyncHandler:Function = Async.asyncHandler( this, getTrueAssertValue, TIMEOUT_VALUE, null, handleTimeout );
			
			this._weatherService.load( CWeatherURL.ONE_VALUE_DATA );
		}
		
		[Test(async)]
		public function testLoadOneValuedDataAndStoreToModel( ):void
		{
			var asyncHandler:Function = Async.asyncHandler( this, checkModelData, TIMEOUT_VALUE, { expected: 9 }, handleTimeout );
			
			this._weatherService.addEventListener( Event.COMPLETE, asyncHandler );
			this._weatherService.load( CWeatherURL.DATA );
		}
		
		[Test(expects="Error")]
		public function testEmptyURLThrowError( ):void
		{
			this._weatherService.load( "" );
		}
		
		[Test(expects="Error")]
		public function testNullURLThrowError( ):void
		{
			this._weatherService.load( null );
		}
		
		private function checkModelData( event:Event, passThroughData:Object ):void 
		{
			Assert.assertEquals( passThroughData.expected, this._weatherService.weatherModel.smallestTemperature );
		}
		
		private function getTrueAssertValue( event:Event, passThroughData:Object ):void 
		{
			Assert.assertTrue( true );
		}
		
		private function handleTimeout( passThroughData:Object ):void 
		{
			Assert.fail( "Timeout reached before event" );          
		}
	}

}