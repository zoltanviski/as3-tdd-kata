package cases
{
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	
	/**
	 * MathUtilTest tests.
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
		public function testModuloEqualityIfFalse( ):void
		{
			Assert.assertFalse( MathUtil.isModuloEquality( 1, 1, 1 ) );
			
			Assert.assertFalse( MathUtil.isModuloEquality( 6, 5, 2 ) );
		}
		
		[Test]
		public function testModuloEqualityIfTrue( ):void
		{
			Assert.assertTrue( MathUtil.isModuloEquality( 6, 2, 0 ) );
			
			Assert.assertTrue( MathUtil.isModuloEquality( 8, 4, 0 ) );
		}
		
	}

}