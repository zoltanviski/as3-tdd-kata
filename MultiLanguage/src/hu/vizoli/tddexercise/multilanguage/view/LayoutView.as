package hu.vizoli.tddexercise.multilanguage.view 
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Dictionary;
	import hu.vizoli.tddexercise.multilanguage.view.event.LayoutEvent;
	
	/**
	 * LayoutView
	 * 
	 * @author vizoli
	 */
	public class LayoutView extends Sprite 
	{
		private var _firstText:TextField;
		private var _secondText:TextField;
		private var _button:Sprite;
		
		private var _firstSourceText:String = "first";
		private var _secondSourceText:String = "second";
		
		public function LayoutView() 
		{
			super();
			
			this.createChildren();
		}
		
		/**
		 * Update the text of firstText
		 * 
		 * @param	text
		 */
		public function updateFirstTexts( text:String ):void
		{
			this._firstText.text = text;
		}
		
		/**
		 * Update the text of secondText
		 * 
		 * @param	text
		 */
		public function updateSecondText( text:String ):void
		{
			this._secondText.text = text;
		}
		
		/**
		 * Create children
		 */
		private function createChildren():void
		{
			this._firstText = new TextField();
			this._firstText.x = 127;
			this._firstText.y = 10;
			this.addChild( this._firstText );
			
			this._secondText = new TextField();
			this._secondText.x = 127;
			this._secondText.y = 30;
			this.addChild( this._secondText );
			
			this._button = this.createButton( "Change Language" );
			this._button.x = 10;
			this._button.y = 13;
			this._button.buttonMode = true;
			this._button.addEventListener( MouseEvent.CLICK, this.buttonClickHandler );
			this.addChild( this._button )
		}
		
		/**
		 * Update the text of firstText
		 * 
		 * @param	e
		 */
		private function buttonClickHandler( e:MouseEvent ):void 
		{
			this.dispatchEvent( new LayoutEvent( LayoutEvent.CHANGE_LANGUAGE ) );
		}
		
		/**
		 * Create a button
		 * 
		 * @param	label
		 */
		private function createButton( label:String ):Sprite 
		{
              var textLabel:TextField = new TextField();
			  textLabel.mouseEnabled = false;
			  textLabel.autoSize = TextFieldAutoSize.LEFT;
			  textLabel.text = label;
              textLabel.x = 10;
              textLabel.y = 7;
              textLabel.height = 20;
              textLabel.width = 70;
              textLabel.selectable = false;
			  
			  var button:Sprite = new Sprite();
              button.graphics.clear();
              button.graphics.beginFill( 0xD4D4D4 );
              button.graphics.drawRoundRect( 0, 0, 107, 35, 10, 10 );
              button.graphics.endFill();
              button.addChild( textLabel );
			  
			  return button;
          }
		
		/**
		 * Get text of the first textField
		 */
		public function getFirstText():String 
		{
			return this._firstText.text;
		}
		
		/**
		 * Get text of the second textField
		 */
		public function getSecondText():String 
		{
			return this._secondText.text;
		}
		
		/**
		 * Get the source of the first text
		 */
		public function get firstSourceText():String 
		{
			return this._firstSourceText;
		}
		
		/**
		 * Get the source of the second text
		 */
		public function get secondSourceText():String 
		{
			return this._secondSourceText;
		}
		
	}

}