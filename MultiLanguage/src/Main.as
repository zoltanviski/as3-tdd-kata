package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import hu.vizoli.tddexercise.multilanguage.config.CommandConfig;
	import hu.vizoli.tddexercise.multilanguage.config.HelperConfig;
	import hu.vizoli.tddexercise.multilanguage.config.MediatorConfig;
	import hu.vizoli.tddexercise.multilanguage.config.ModelConfig;
	import hu.vizoli.tddexercise.multilanguage.config.ServiceConfig;
	import hu.vizoli.tddexercise.multilanguage.view.LayoutView;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	/**
	 * MultiLanguage Main
	 * 
	 * @author vizoli
	 */
	public class Main extends Sprite 
	{
		private var _context:IContext;
		
		public function Main():void 
		{
			if ( stage ) 
			{
				this.init();
			}
			else 
			{
				this.addEventListener( Event.ADDED_TO_STAGE, this.init );
			}
		}
		
		/**
		 * Create children
		 */
		public function createChildren():void
		{
			var layoutView:LayoutView = new LayoutView();
			this.addChild( layoutView );
		}
		
		/**
		 * Init the application
		 * 
		 * @param	e
		 */
		private function init( e:Event = null ):void 
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, this.init );
			
			this.setupContext();
		}
		
		/**
		 * Setup the context
		 */
		private function setupContext():void
		{
			this._context = new Context()
				.install( 	MVCSBundle )
				.configure( ModelConfig, 
							MediatorConfig, 
							CommandConfig, 
							HelperConfig,
							ServiceConfig,
							new ContextView( this ) 
						   );
		}
		
	}
	
}