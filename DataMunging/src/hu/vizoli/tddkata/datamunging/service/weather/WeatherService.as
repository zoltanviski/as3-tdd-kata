package hu.vizoli.tddkata.datamunging.service.weather 
{
	import flash.events.Event;
	import hu.vizoli.api.base.BaseService;
	import hu.vizoli.api.mvc.validator.EmptyStringValidator;
	import hu.vizoli.api.mvc.validator.NullValueValidator;
	import hu.vizoli.api.util.net.FileLoaderUtil;
	import hu.vizoli.tddkata.datamunging.model.weather.WeatherModel;
	import hu.vizoli.tddkata.datamunging.service.weather.parser.WeatherServiceParser;
	
	/**
	 * Service for load the weather data.
	 * 
	 * @author vizoli
	 */
	public class WeatherService extends BaseService
	{
		[Inject]
		public var weatherModel:WeatherModel;
		
		[Inject]
		public var weatherServiceParser:WeatherServiceParser;
		
		public var _fileLoaderUtil:FileLoaderUtil;
		
		public function WeatherService() 
		{
			this._fileLoaderUtil = new FileLoaderUtil( );
		}
		
		/**
		 * Load weather data.
		 * 
		 * @param	url
		 */
		public function load( url:String ):void
		{
			EmptyStringValidator.validate( url, "The url MUST be non empty string!" );
			NullValueValidator.validate( url, "The url MUST be non null!" );
			
			this._fileLoaderUtil.load( url, this.urlLoaderCompleteHandler );
		}
		
		/**
		 * Complete handler.
		 * 
		 * @param	e
		 */
		private function urlLoaderCompleteHandler( e:Event ):void 
		{
			this.weatherModel.temperatures = this.weatherServiceParser.parse( e.target.data );
			
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
	}

}