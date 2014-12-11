package hu.vizoli.api.language.model 
{
	import flash.events.Event;
	import flash.utils.Dictionary;
	import hu.vizoli.api.base.BaseModel;
	import hu.vizoli.api.language.model.event.LanguageModelEvent;
	
	/**
	 * Language Model
	 * 
	 * @author vizoli
	 */
	public class LanguageModel extends BaseModel implements ILanguageModel
	{
		private var _languages:Dictionary;
		private var _currentLanguage:String;
		private var _languagesCount:int;
		
		public function LanguageModel() 
		{
			this._languages = new Dictionary();
		}
		
		/**
		 * Add language
		 * 
		 * @param	data
		 * @param	language
		 */
		public function addLanguage( data:Dictionary, language:String ):void 
		{
			if ( !this._currentLanguage )
			{
				this._currentLanguage = language;
			}
			
			if ( this._languages[ language ] )
			{
				return;
			}
			
			this._languages[ language ] = data;
			
			this._languagesCount++;
			
			this.dispatch( new LanguageModelEvent( LanguageModelEvent.LANGUAGE_ADDED ) );
		}
		
		/**
		 * Get text from the stored language
		 * 
		 * @param	key
		 * @param	language
		 */
		public function getText( key:String, language:String = "Current" ):String 
		{
			var resultLanguage:String;
			
			if ( language == "Current" )
			{
				resultLanguage = this._currentLanguage;
			}
			else
			{
				resultLanguage = language;
			}
			
			return this._languages[ resultLanguage ][ key ] || key;
		}
		
		/**
		 * Get the languages count
		 */
		public function get languagesCount():int 
		{
			return this._languagesCount;
		}
		
		/**
		 * Get the current language
		 */
		public function get currentLanguage():String 
		{
			return this._currentLanguage;
		}
		
		/**
		 * @private
		 */
		public function set currentLanguage( value:String ):void 
		{
			for ( var i:String in this._languages )
			{
				if ( i == value )
				{
					this._currentLanguage = value;
			
					this.dispatch( new LanguageModelEvent( LanguageModelEvent.LANGUAGE_UPDATED ) );
					
					return;
				}
			}
			
			throw new Error( "You can't set the current language to not existing language!" );
		}
		
	}

}