package cases
{
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	import hu.vizoli.tddkata.minefields.util.StringUtil;
	
	/**
	 * MathUtilTest tests.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class StringUtilTest extends TestCase 
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
		public function testGetSpecificCharacterCount( ):void
		{
			Assert.assertEquals( 2, StringUtil.getSpecificCharacterCount( "aba", "a" ) );
			
			Assert.assertEquals( 1, StringUtil.getSpecificCharacterCount( "CffBbkKb", "B" ) );
		}
		
		[Test]
		public function testReplace( ):void
		{
			Assert.assertEquals( "aaX", StringUtil.replace( "aab", "b", "X" ) );
			
			Assert.assertEquals( "aaXX", StringUtil.replace( "aabb", "b", "X" ) );
		}
		
		[Test]
		public function testSetCharAt( ):void
		{
			Assert.assertEquals( "aba", StringUtil.setCharAt( "aaa", "b", 1 ) );
			
			Assert.assertEquals( "aab", StringUtil.setCharAt( "aaa", "b", 2 ) );
		}
	
	}

}