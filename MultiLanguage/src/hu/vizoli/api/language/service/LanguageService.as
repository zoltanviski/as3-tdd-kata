package hu.vizoli.api.language.service 
{
	import hu.vizoli.api.base.BaseService;
	import hu.vizoli.api.language.model.ILanguageModel;
	import hu.vizoli.api.language.service.parser.IXMLLanguageParser;
	
	/**
	 * Language service
	 * 
	 * @author vizoli
	 */
	public class LanguageService extends BaseService implements ILanguageService
	{
		private var _languageModel:ILanguageModel;	
		private var _parser:IXMLLanguageParser;
		
		public function LanguageService() 
		{
			
		}
		
		/**
		 * Add the language
		 * 
		 * @param	source
		 * @param	language
		 */
		public function addLanguage( source:*, language:String ):void
		{
			this.parse( source, language );
		}
		
		/**
		 * Parse the source data
		 * 
		 * @param	source
		 * @param	language
		 */
		private function parse( source:*, language:String ):void
		{
			this._languageModel.addLanguage( this._parser.parse( source ), language );
		}
		
		[Inject]
		public function set parser( value:IXMLLanguageParser ):void 
		{
			this._parser = value;
		}
		
		[Inject]
		public function set languageModel( value:ILanguageModel ):void 
		{
			this._languageModel = value;
		}
		
		/**
		 * Get tha language model
		 */
		public function get languageModel():ILanguageModel 
		{
			return this._languageModel;
		}
		
	}

}