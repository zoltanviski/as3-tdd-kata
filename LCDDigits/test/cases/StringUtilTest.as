package cases
{
	import flexunit.framework.TestCase;
	import flexunit.framework.Assert;
	
	/**
	 * StringUtil tests.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class StringUtilTest extends TestCase 
	{
		private static const TEST_STRING:String = "abc";
		
		[Before]
		override public function setUp():void 
		{
			
		}
		
		[After]
		override public function tearDown():void 
		{
			
		}
		
		[Test]
		public function testRemoveAt( ):void
		{
			Assert.assertEquals( "bc", StringUtil.removeAt( TEST_STRING, 0 ) );
			
			Assert.assertEquals( "ac", StringUtil.removeAt( TEST_STRING, 1 ) );
			
			Assert.assertEquals( "ab", StringUtil.removeAt( TEST_STRING, 2 ) );
		}
		
		[Test]
		public function testReplaceAt( ):void
		{
			Assert.assertEquals( "xbc", StringUtil.replaceAt( TEST_STRING, 0, "x" ) );
			
			Assert.assertEquals( "axc", StringUtil.replaceAt( TEST_STRING, 1, "x" ) );
			
			Assert.assertEquals( "abF", StringUtil.replaceAt( TEST_STRING, 2, "F" ) );
		}
		
		[Test]
		public function testRemoveLastCharacter( ):void
		{
			Assert.assertEquals( "ab", StringUtil.removeLastCharacter( TEST_STRING ) );
		}
		
	}

}