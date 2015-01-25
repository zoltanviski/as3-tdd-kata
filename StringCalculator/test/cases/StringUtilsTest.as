package cases
{
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	import hu.vizoli.tddkata.stringcalculator.util.StringUtils;
	
	/**
	 * StringCalculator tests
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class StringUtilsTest extends TestCase 
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
		public function testStringMatching( ):void
		{
			Assert.assertTrue( StringUtils.isMatch( TEST_STRING, "a" ) );
			Assert.assertTrue( StringUtils.isMatch( TEST_STRING, "ab" ) );
			
			Assert.assertFalse( StringUtils.isMatch( TEST_STRING, "v" ) );
		}
		
		[Test]
		public function testRegExpMatching( ):void
		{
			Assert.assertTrue( StringUtils.isMatch( TEST_STRING, /a/ ) );
			Assert.assertTrue( StringUtils.isMatch( TEST_STRING, /a.c/ ) );
			
			Assert.assertFalse( StringUtils.isMatch( TEST_STRING, /v/ ) );
		}
	}

}