package hu.vizoli.tddexercise.multilanguage.config 
{
	import hu.vizoli.tddexercise.multilanguage.controller.AddLanguagesCommand;
	import hu.vizoli.tddexercise.multilanguage.controller.ChangeLanguageCommand;
	import hu.vizoli.tddexercise.multilanguage.event.ApplicationEvent;
	import hu.vizoli.tddexercise.multilanguage.view.event.LayoutEvent;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * CommandConfig
	 * 
	 * @author vizoli
	 */
	public class CommandConfig implements IConfig 
	{
		[Inject]
		public var commandMap:IEventCommandMap;
		
		/**
		 * Configure
		 */
		public function configure():void
		{
			this.commandMap.map( ApplicationEvent.INIT, ApplicationEvent ).toCommand( AddLanguagesCommand );
			this.commandMap.map( LayoutEvent.CHANGE_LANGUAGE, LayoutEvent ).toCommand( ChangeLanguageCommand );
		}
		
	}

}