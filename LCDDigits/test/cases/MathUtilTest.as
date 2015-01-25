package cases
{
	import flexunit.framework.TestCase;
	import flexunit.framework.Assert;
	import hu.vizoli.tddkata.lcddigits.util.MathUtil;
	
	/**
	 * MathUtil tests.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class MathUtilTest extends TestCase 
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
		public function testPositiveNumber( ):void
		{
			Assert.assertTrue( MathUtil.isPositiveNumber( 1 ) );
			
			Assert.assertTrue( MathUtil.isPositiveNumber( 72 ) );
		}
		
		[Test]
		public function testNegativeNumber( ):void
		{
			Assert.assertFalse( MathUtil.isPositiveNumber( -3 ) );
		}
		
	}

}