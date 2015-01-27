package cases
{
	import flexunit.framework.TestCase;
	import mockolate.mock;
	import mockolate.nice;
	import mockolate.runner.MockolateRule;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.nullValue;
	
	/**
	 * MockolateExample test case.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class MockolateTest extends TestCase 
	{
		[Rule]
		public var mocks:MockolateRule = new MockolateRule();
		
		[Mock]
		public var testClass1:TestClass1;
		
		[Before]
		override public function setUp():void 
		{
			
		}
		
		[After]
		override public function tearDown():void 
		{
			
		}
		
		[Test]
		public function testClass1GetValue():void
		{
			this.testClass1 = nice( TestClass1 );
			
			mock( this.testClass1 ).method( "getValue" ).returns( true );
			
			assertThat( testClass1.getValue(), equalTo( true ) );
		} 
		
		[Test]
		public function testClassName():void
		{
			var testClass:TestClass1 = nice( TestClass1 );
    
			assertThat( testClass.name, nullValue() );
		}
	}

}