package hu.vizoli.tddexercise.multilanguage.service.mock
{
	import hu.vizoli.api.language.constant.CLanguages;
	
	/**
	 * Mock of Hu Language xml
	 * 
	 * @author vizoli
	 */
	public class LangHuXMLMock 
	{
		[Embed( source="/../bin/assets/xml/lang_hu.xml",mimeType="application/octet-stream" )]
		public static const LanguageHuXML:Class;
		
		public static const LANGUAGE:String = CLanguages.HU;
	}

}