package hu.vizoli.api.language.model 
{
	import flash.utils.Dictionary;
	
	/**
	 * ILanguageModel
	 * 
	 * @author vizoli
	 */
	public interface ILanguageModel 
	{
		
		function addLanguage( data:Dictionary, language:String ):void;
		
		function getText( key:String, language:String = "Current" ):String;
		
		function set currentLanguage( value:String ):void;
		
		function get currentLanguage( ):String;
		
		function get languagesCount():int;
		
	}
	
}