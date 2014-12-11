package hu.vizoli.api.language.service.parser 
{
	import flash.utils.Dictionary;
	
	/**
	 * XML language parser
	 * 
	 * @author vizoli
	 */
	public class XMLLanguageParser implements IXMLLanguageParser 
	{
		/**
		 * Parse the data
		 * 
		 * @param	data
		 */
		public function parse( data:XML ):Dictionary 
		{
			var resultDictionary:Dictionary = new Dictionary();
			
			for each ( var item:XML in data.children() ) 
			{
				resultDictionary[ item.name() ] = item.text();
			}
			
			return resultDictionary;
		}
		
	}

}