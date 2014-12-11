package hu.vizoli.tddexercise.multilanguage.config 
{
	import hu.vizoli.tddexercise.multilanguage.view.LayoutMediator;
	import hu.vizoli.tddexercise.multilanguage.view.LayoutView;
	import hu.vizoli.tddexercise.multilanguage.view.MainMediator;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * Mediators config
	 * 
	 * @author vizoli
	 */
	public class MediatorConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		/**
		 * Configure
		 */
		public function configure():void
		{
			this.mediatorMap.map( Main ).toMediator( MainMediator );
			this.mediatorMap.map( LayoutView ).toMediator( LayoutMediator );
		}
		
	}

}