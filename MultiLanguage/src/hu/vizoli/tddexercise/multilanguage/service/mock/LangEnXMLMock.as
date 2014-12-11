package hu.vizoli.tddexercise.multilanguage.service.mock
{
	import hu.vizoli.api.language.constant.CLanguages;
	
	/**
	 * Mock of En Language xml
	 * 
	 * @author vizoli
	 */
	public class LangEnXMLMock 
	{
		[Embed( source="/../bin/assets/xml/lang_en.xml",mimeType="application/octet-stream" )]
		public static const LanguageEnXML:Class;
		
		public static const LANGUAGE:String = CLanguages.EN;
	}

}