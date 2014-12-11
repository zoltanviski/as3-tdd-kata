package hu.vizoli.api.language.service 
{
	import hu.vizoli.api.language.model.ILanguageModel;
	import hu.vizoli.api.language.service.parser.IXMLLanguageParser;
	
	/**
	 * ILanguageService
	 * 
	 * @author vizoli
	 */
	public interface ILanguageService 
	{
		
		function addLanguage( source:*, language:String ):void;
		
		function set parser( value:IXMLLanguageParser ):void;
		
		function set languageModel( value:ILanguageModel ):void;
		
		function get languageModel():ILanguageModel;
		
	}
	
}