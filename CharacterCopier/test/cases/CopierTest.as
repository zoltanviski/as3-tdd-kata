package cases
{
	import flash.events.Event;
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	import hu.vizoli.common.constant.character.CNewLine;
	import hu.vizoli.tddkata.charactercopier.copier.Copier;
	import hu.vizoli.tddkata.charactercopier.copier.event.CopierEvent;
	import hu.vizoli.tddkata.charactercopier.copier.IDestination;
	import hu.vizoli.tddkata.charactercopier.copier.ISource;
	import mockolate.ingredients.Sequence;
	import mockolate.mock;
	import mockolate.runner.MockolateRule;
	import org.flexunit.async.Async;
	
	/**
	 * MockolateExample test case.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class CopierTest extends TestCase 
	{
		private static const A:String = "A";
		private static const B:String = "B";
		private static const C:String = "C";
		
		private static const TIMEOUT_VALUE:int = 10;
		
		[Rule]
		public var mocks:MockolateRule = new MockolateRule();
		
		[Mock]
		public var source:ISource;
		
		[Mock]
		public var destination:IDestination;
		
		private var _copier:Copier;
		private var _sequence:Sequence;
		
		[Before]
		override public function setUp():void 
		{
			this._copier = new Copier( this.source, this.destination );
		}
		
		[After]
		override public function tearDown():void 
		{
			this._copier = null;
			this.source = null;
			this.destination = null;
		}
		
		[Test]
		public function testCopyCallGetCharOnSource():void
		{
			mock( this.source ).method( "getChar" ).returns( CNewLine.SIMPLE );
			
			this._copier.copy();
		} 
		
		[Test]
		public function testCopyCallGetCharOnSourceInSequenceAndStopWhenNewLine():void
		{
			this._sequence = new Sequence();
			
			mock( this.source ).method( "getChar" ).returns( CopierTest.A ).inSequence( this._sequence ).once();
			mock( this.source ).method( "getChar" ).returns( CopierTest.B ).inSequence( this._sequence ).once();
			mock( this.source ).method( "getChar" ).returns( CNewLine.SIMPLE ).inSequence( this._sequence ).once();
			
			this._copier.copy();
		} 
		
		[Test]
		public function testCopyCharacters():void
		{
			this._sequence = new Sequence();
			
			mock( this.source ).method( "getChar" ).returns( CopierTest.A ).inSequence( this._sequence ).once();
			mock( this.source ).method( "getChar" ).returns( CopierTest.B ).inSequence( this._sequence ).once();
			mock( this.source ).method( "getChar" ).returns( CNewLine.SIMPLE ).inSequence( this._sequence ).once();
			
			this._sequence = new Sequence();
			
			mock( this.destination ).method( "setChar" ).args( CopierTest.A ).inSequence( this._sequence ).once();
			mock( this.destination ).method( "setChar" ).args( CopierTest.B ).inSequence( this._sequence ).once();
			
			this._copier.copy();
		} 
		
		[Test(async)]
		public function testCopyCharactersAfterEventDispatched():void
		{
			this._sequence = new Sequence();
			
			mock( this.source ).method( "getChar" ).returns( CopierTest.A ).inSequence( this._sequence ).once();
			mock( this.source ).method( "getChar" ).returns( CopierTest.B ).inSequence( this._sequence ).once();
			mock( this.source ).method( "getChar" ).returns( CNewLine.SIMPLE ).inSequence( this._sequence ).once();
			
			this._sequence = new Sequence();
			
			mock( this.destination ).method( "setChar" ).args( CopierTest.A ).inSequence( this._sequence ).once();
			mock( this.destination ).method( "setChar" ).args( CopierTest.B ).inSequence( this._sequence ).once();
			
			var asyncHandler:Function = Async.asyncHandler( this, checkCopyFinishedEvent, CopierTest.TIMEOUT_VALUE, { expected: CopierTest.A + CopierTest.B }, this.handleTimeout );
			
			this._copier.addEventListener( CopierEvent.COPY_FINISHED, asyncHandler );
			this._copier.copy();
		}
		
		/**
		 * Check the copier finished event.
		 * 
		 * @param	event
		 * @param	passThroughData
		 */
		private function checkCopyFinishedEvent( event:CopierEvent, passThroughData:Object ):void 
		{
			Assert.assertEquals( passThroughData.expected, event.copied );
		}
		
		/**
		 * Handle the timeout.
		 */
		private function handleTimeout():void 
		{
			trace( "Async TimeOut" );
		}
		
	}

}