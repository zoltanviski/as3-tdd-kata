package cases
{
	import flexunit.framework.TestCase;
	import flexunit.framework.Assert;
	
	/**
	 * VectorUtil tests.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class VectorUtilTest extends TestCase 
	{
		[Before]
		override public function setUp():void 
		{
			
		}
		
		[After]
		override public function tearDown():void 
		{
			
		}
		
		[Test]
		public function testIntSplitToVector( ):void
		{
			var vector:Vector.<String> = new Vector.<String>;
			vector.push( "3" );
			vector.push( "2" );
			
			//Assert.assertEquals( vector, VectorUtil.intSplitToVector( 32 ) );
		}
		
	}

}