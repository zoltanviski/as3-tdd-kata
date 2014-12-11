package hu.vizoli.tddexercise.multilanguage.controller 
{
	import hu.vizoli.api.base.BaseCommand;
	import hu.vizoli.api.language.service.ILanguageService;
	import hu.vizoli.tddexercise.multilanguage.service.mock.LangEnXMLMock;
	import hu.vizoli.tddexercise.multilanguage.service.mock.LangHuXMLMock;
	
	/**
	 * Add languages
	 * 
	 * @author vizoli
	 */
	public class AddLanguagesCommand extends BaseCommand 
	{
		[Inject]
		public var languageService:ILanguageService;
		
		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			this.languageService.addLanguage( XML( new LangHuXMLMock.LanguageHuXML ), LangHuXMLMock.LANGUAGE );
			
			this.languageService.addLanguage( XML( new LangEnXMLMock.LanguageEnXML ), LangEnXMLMock.LANGUAGE );
		}
		
	}

}