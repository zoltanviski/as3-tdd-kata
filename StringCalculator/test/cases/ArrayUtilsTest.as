package cases
{
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	import hu.vizoli.tddkata.stringcalculator.util.ArrayUtils;
	
	/**
	 * StringCalculator tests
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class ArrayUtilsTest extends TestCase 
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
			Assert.assertFalse( ArrayUtils.isContainNegatives( [ ] ) );
		}
		
		[Test]
		public function testNotContainingNegatives( ):void
		{
			Assert.assertFalse( ArrayUtils.isContainNegatives( [ 2, 3, 5 ] ) );
		}
		
		[Test]
		public function testContainingNegatives( ):void
		{
			Assert.assertTrue( ArrayUtils.isContainNegatives( [ 2, -3, 5 ] ) );
		}
	}

}