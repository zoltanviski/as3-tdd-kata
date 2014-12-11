package hu.vizoli.tddexercise.multilanguage.view 
{
	import hu.vizoli.api.base.BaseMediator;
	import hu.vizoli.tddexercise.multilanguage.event.ApplicationEvent;
	
	/**
	 * Mediator of Main
	 * 
	 * @author vizoli
	 */
	public class MainMediator extends BaseMediator 
	{
		[Inject]
		public var view:Main;
		
		/**
		 * @inheritDoc
		 */
		override public function initialize():void
		{
			this.view.createChildren();
		}
		
	}

}