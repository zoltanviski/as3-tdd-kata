package cases
{
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	
	/**
	 * StringCalculator tests
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class StringCalculatorTest extends TestCase 
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
		public function testEmptyStringIsZero( ):void
		{
			Assert.assertEquals( 0, StringCalculator.add( "" ) );
		}
		
		[Test]
		public function testAddWith1SimpleNumbers( ):void
		{
			Assert.assertEquals( 1, StringCalculator.add( "1" ) );
			Assert.assertEquals( 2, StringCalculator.add( "2" ) );
			Assert.assertEquals( 7, StringCalculator.add( "7" ) );
		}
		
		[Test]
		public function testAddWithNot1NotSimpleNumbers( ):void
		{
			Assert.assertEquals( 51, StringCalculator.add( "51" ) );
			Assert.assertEquals( 74, StringCalculator.add( "74" ) );
		}
		
		[Test]
		public function testAddWith2SimpleNumbers( ):void
		{
			Assert.assertEquals( 3, StringCalculator.add( "1,2" ) );
			Assert.assertEquals( 3, StringCalculator.add( "2,1" ) );
			Assert.assertEquals( 5, StringCalculator.add( "3,2" ) );
			Assert.assertEquals( 5, StringCalculator.add( "2,3" ) );
		}
		
		[Test]
		public function testAddWith2NotSimpleNumbers( ):void
		{
			Assert.assertEquals( 39, StringCalculator.add( "14,25" ) );
			Assert.assertEquals( 39, StringCalculator.add( "25,14" ) );
		}
		
		[Test]
		public function testAddWithManyNotSimpleNumbers( ):void
		{
			Assert.assertEquals( 15, StringCalculator.add( "1,2,3,4,5" ) );
			Assert.assertEquals( 75, StringCalculator.add( "10,21,35,9" ) );
		}
		
		[Test]
		public function testAddWith2NumbersSepeatedByNewLine( ):void
		{
			Assert.assertEquals( 3, StringCalculator.add( "1\n2" ) );
			Assert.assertEquals( 48, StringCalculator.add( "13\n35" ) );
		}
		
		[Test]
		public function testAddWithManyNumbersSepeatedByNewLine( ):void
		{
			Assert.assertEquals( 13, StringCalculator.add( "1\n2\n10" ) );
		}
		
		[Test]
		public function testAddWith2NumbersSepeatedByNewLineAndCommas( ):void
		{
			Assert.assertEquals( 6, StringCalculator.add( "1\n2,3" ) );
			Assert.assertEquals( 16, StringCalculator.add( "1,5\n10" ) );
		}
		
		[Test]
		public function testAddWith2NumbersSeperatedByCustomDelimiter( ):void
		{
			Assert.assertEquals( 3, StringCalculator.add( "//;\n1;2" ) );
			Assert.assertEquals( 11, StringCalculator.add( "//;\n5;6" ) );
		}
		
		[Test]
		public function testAddWith2NotSimpleNumbersSeperatedByCustomDelimiter( ):void
		{
			Assert.assertEquals( 31, StringCalculator.add( "//;\n10;21" ) );
		}
		
		[Test]
		public function testAddWithManyNotSimpleNumbersSeperatedByCustomDelimiter( ):void
		{
			Assert.assertEquals( 54, StringCalculator.add( "//;\n23;1;30" ) );
		}
		
		[Test]
		public function testAddNumbersSeperatedByOtherCustomDelimiter( ):void
		{
			Assert.assertEquals( 31, StringCalculator.add( "//V\n10V21" ) );
		}
		
		[Test(expects="Error")]
		public function testAddNegativeNumberThrowException( ):void
		{
			StringCalculator.add( "-3" );
		}
		
		[Test(expects="Error")]
		public function testAddNegativesNumberThrowException( ):void
		{
			StringCalculator.add( "-3,-83" );
		}
		
		[Test]
		public function testAddingAndRunOutFromLimit( ):void
		{
			Assert.assertEquals( 2, StringCalculator.add( "2,1001" ) );
			Assert.assertEquals( 925, StringCalculator.add( "423,502,3402" ) );
		}
	}

}