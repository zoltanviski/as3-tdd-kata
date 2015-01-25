package cases
{
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	import hu.vizoli.tddkata.stringcalculator.util.MathUtils;
	
	/**
	 * StringCalculator tests
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class MathUtilsTest extends TestCase 
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
		public function testEmptyArray( ):void
		{
			Assert.assertEquals( 0, MathUtils.getSumFromArray( [ ] ) );
		}
		
		[Test]
		public function testSumWithNonNegatives( ):void
		{
			Assert.assertEquals( 6, MathUtils.getSumFromArray( [ 1, 2, 3 ] ) );
			Assert.assertEquals( 36, MathUtils.getSumFromArray( [ 1, 2, 3, 10, 20 ] ) );
		}
		
		[Test]
		public function testSumWithNegatives( ):void
		{
			Assert.assertEquals( 2, MathUtils.getSumFromArray( [ 1, -2, 3 ] ) );
			Assert.assertEquals( 16, MathUtils.getSumFromArray( [ 1, 2, 3, -10, 20 ] ) );
		}
		
		[Test]
		public function testValueLimitation( ):void
		{
			Assert.assertEquals( 2, MathUtils.getSumFromArray( [ 1, -2, 3, 40 ], 10 ) );
		}
		
	}

}