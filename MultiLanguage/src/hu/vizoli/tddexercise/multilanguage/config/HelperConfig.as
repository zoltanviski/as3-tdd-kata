package hu.vizoli.tddexercise.multilanguage.config 
{
	import hu.vizoli.api.language.service.parser.IXMLLanguageParser;
	import hu.vizoli.api.language.service.parser.XMLLanguageParser;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * Helper config
	 * 
	 * @author vizoli
	 */
	public class HelperConfig implements IConfig 
	{
		[Inject]
		public var injector:IInjector;
		
		/**
		 * Configure
		 */
		public function configure():void
		{
			this.injector.map( IXMLLanguageParser ).toSingleton( XMLLanguageParser );
		}
		
	}

}