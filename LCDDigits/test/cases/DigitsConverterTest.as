package cases
{
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	import hu.vizoli.tddkata.lcddigits.converter.DigitsConverter;
	
	/**
	 * DigitsConverter tests.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class DigitsConverterTest extends TestCase 
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
		public function test0Convert( ):void
		{
			Assert.assertEquals( "._.\n|.|\n|_|", DigitsConverter.toLCD( 0 ) );
		}
		
		[Test]
		public function test1Convert( ):void
		{
			Assert.assertEquals( "...\n..|\n..|", DigitsConverter.toLCD( 1 ) );
		}
		
		[Test]
		public function test2Convert( ):void
		{
			Assert.assertEquals( "._.\n._|\n|_.", DigitsConverter.toLCD( 2 ) );
		}
		
		[Test]
		public function test3Convert( ):void
		{
			Assert.assertEquals( "._.\n._|\n._|", DigitsConverter.toLCD( 3 ) );
		}
		
		[Test]
		public function test4Convert( ):void
		{
			Assert.assertEquals( "...\n|_|\n..|", DigitsConverter.toLCD( 4 ) );
		}
		
		[Test]
		public function test5Convert( ):void
		{
			Assert.assertEquals( "._.\n|_.\n._|", DigitsConverter.toLCD( 5 ) );
		}
		
		[Test]
		public function test6Convert( ):void
		{
			Assert.assertEquals( "._.\n|_.\n|_|", DigitsConverter.toLCD( 6 ) );
		}
		
		[Test]
		public function test7Convert( ):void
		{
			Assert.assertEquals( "._.\n..|\n..|", DigitsConverter.toLCD( 7 ) );
		}
		
		[Test]
		public function test8Convert( ):void
		{
			Assert.assertEquals( "._.\n|_|\n|_|", DigitsConverter.toLCD( 8 ) );
		}
		
		[Test]
		public function test9Convert( ):void
		{
			Assert.assertEquals( "._.\n|_|\n..|", DigitsConverter.toLCD( 9 ) );
		}
		
		[Test]
		public function test12Convert( ):void
		{
			Assert.assertEquals( "... ._.\n..| ._|\n..| |_.", DigitsConverter.toLCD( 12 ) );
		}
		
		[Test]
		public function test910Convert( ):void
		{
			Assert.assertEquals( "._. ... ._.\n|_| ..| |.|\n..| ..| |_|", DigitsConverter.toLCD( 910 ) );
		}
		
		[Test(expects="Error")]
		public function testNegativeNumberThrowException( ):void
		{
			DigitsConverter.toLCD( -9 );
		}
	}

}