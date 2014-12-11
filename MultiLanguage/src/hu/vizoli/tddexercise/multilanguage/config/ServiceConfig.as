package hu.vizoli.tddexercise.multilanguage.config 
{
	import hu.vizoli.api.language.service.ILanguageService;
	import hu.vizoli.api.language.service.LanguageService;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * Service config
	 * 
	 * @author vizoli
	 */
	public class ServiceConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		/**
		 * Configure
		 */
		public function configure():void
		{
			this.injector.map( ILanguageService ).toSingleton( LanguageService );
		}
		
	}

}