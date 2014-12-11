package hu.vizoli.tddexercise.multilanguage.config 
{
	import hu.vizoli.api.language.model.ILanguageModel;
	import hu.vizoli.api.language.model.LanguageModel;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * Models config
	 * 
	 * @author vizoli
	 */
	public class ModelConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		/**
		 * Configure
		 */
		public function configure():void
		{
			this.injector.map( ILanguageModel ).toSingleton( LanguageModel );
		}
		
	}

}