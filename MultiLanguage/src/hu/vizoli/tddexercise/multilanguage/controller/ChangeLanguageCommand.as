package hu.vizoli.tddexercise.multilanguage.controller 
{
	import hu.vizoli.api.base.BaseCommand;
	import hu.vizoli.api.language.constant.CLanguages;
	import hu.vizoli.api.language.model.ILanguageModel;
	
	/**
	 * Change the current language
	 * 
	 * @author vizoli
	 */
	public class ChangeLanguageCommand extends BaseCommand 
	{
		[Inject]
		public var languageModel:ILanguageModel;
		
		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			this.languageModel.currentLanguage = this.languageModel.currentLanguage == CLanguages.HU ? CLanguages.EN : CLanguages.HU;
		}
		
	}

}