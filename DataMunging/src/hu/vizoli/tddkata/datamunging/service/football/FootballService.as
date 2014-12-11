package hu.vizoli.tddkata.datamunging.service.football 
{
	import flash.events.Event;
	import hu.vizoli.api.base.BaseService;
	import hu.vizoli.api.mvc.validator.EmptyStringValidator;
	import hu.vizoli.api.mvc.validator.NullValueValidator;
	import hu.vizoli.api.util.net.FileLoaderUtil;
	import hu.vizoli.tddkata.datamunging.model.football.FootballModel;
	import hu.vizoli.tddkata.datamunging.service.football.parser.FootballServiceParser;
	
	/**
	 * Service for load the football data.
	 * 
	 * @author vizoli
	 */
	public class FootballService extends BaseService 
	{
		[Inject]
		public var footballModel:FootballModel;
		
		[Inject]
		public var footballServiceParser:FootballServiceParser;
		
		public var _fileLoaderUtil:FileLoaderUtil;
		
		public function FootballService() 
		{
			this._fileLoaderUtil = new FileLoaderUtil( );
		}
		
		/**
		 * Load football data.
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
			this.footballModel.goalRates = this.footballServiceParser.parse( e.target.data );
			
			this.dispatchEvent( new Event( Event.COMPLETE ) );
		}
		
	}

}