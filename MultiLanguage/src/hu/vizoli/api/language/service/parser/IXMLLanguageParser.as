package hu.vizoli.api.language.service.parser 
{
	import flash.utils.Dictionary;
	
	/**
	 * IXMLLanguageParser
	 * 
	 * @author vizoli
	 */
	public interface IXMLLanguageParser 
	{
		
		function parse( data:XML ):Dictionary;
		
	}
	
}