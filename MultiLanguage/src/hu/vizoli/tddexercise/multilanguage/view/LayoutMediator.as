package hu.vizoli.tddexercise.multilanguage.view 
{
	import flash.events.Event;
	import hu.vizoli.api.base.BaseMediator;
	import hu.vizoli.api.language.model.event.LanguageModelEvent;
	import hu.vizoli.api.language.model.ILanguageModel;
	import hu.vizoli.tddexercise.multilanguage.event.ApplicationEvent;
	import hu.vizoli.tddexercise.multilanguage.view.event.LayoutEvent;
	
	/**
	 * LayoutMediator
	 * 
	 * @author vizoli
	 */
	public class LayoutMediator extends BaseMediator 
	{
		[Inject]
		public var view:LayoutView;
		
		[Inject]
		public var languageModel:ILanguageModel;
		
		/**
		 * @inheritDoc
		 */
		override public function initialize():void
		{
			this.addContextListener( LanguageModelEvent.LANGUAGE_ADDED, this.languageModelAddedHandler );
			this.addContextListener( LanguageModelEvent.LANGUAGE_UPDATED, this.languageModelUpdatedHandler );
			
			this.addViewListener( LayoutEvent.CHANGE_LANGUAGE, this.viewChangeLanguageHandler );
			
			this.dispatch( new ApplicationEvent( ApplicationEvent.INIT ) );
		}
		
		/**
		 * Handle the change language event from view
		 * 
		 * @param	e
		 */
		private function viewChangeLanguageHandler( e:LayoutEvent ):void 
		{
			this.dispatch( e );
		}
		
		/**
		 * Handle the updated event from the language model
		 * 
		 * @param	LanguageModelEvent
		 */
		private function languageModelUpdatedHandler(e:LanguageModelEvent):void 
		{
			this.languageModelAddedHandler();
		}
		
		/**
		 * Handle the added event from the language model
		 * 
		 * @param	LanguageModelEvent
		 */
		private function languageModelAddedHandler( e:LanguageModelEvent = null ):void 
		{
			this.view.updateFirstTexts( this.languageModel.getText( this.view.firstSourceText ) );
			this.view.updateSecondText( this.languageModel.getText( this.view.secondSourceText ) );
		}
		
	}

}