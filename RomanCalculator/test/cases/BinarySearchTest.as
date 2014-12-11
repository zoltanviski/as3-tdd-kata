package cases
{
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	
	/**
	 * A binaris search-t tesztelo osztaly
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class BinarySearchTest extends TestCase 
	{
		public static var testDatas:Array 	= [   	
												[ "XIX", 		"MMMCDXXIII", 		"MMMCDXLII" ],
												[ "CMXCIX", 	"CXI", 				"MCX" ],
												[ "DCLXVI", 	"CMXCIX", 			"MDCLXV" ],
												[ "LI", 		"XV", 				"LXVI" ],
												[ "CDXCIX", 	"XLIX", 			"DXLVIII" ],
												[ "XIV", 		"LX", 				"LXXIV" ],
												[ "XXIII", 		"XXVI", 			"XLIX" ],
												[ "XCIX", 		"MCMXCIX", 			"MMXCVIII" ],
												[ "IIII", 		"V", 				"ERROR" ],
												[ "XIIX", 		"LXVI", 			"ERROR" ],
												[ "IM", 		"I", 				"ERROR" ],
												[ "VM", 		"IX", 				"ERROR" ],
												[ "I", 			"MMMCMXCIX", 		"ERROR" ],
												[ "MM", 		"MM", 				"ERROR" ],
												[ "M", 			"MMM", 				"ERROR" ]
											  ];
											  
		[Before]
		override public function setUp():void 
		{
			
		}
		
		[After]
		override public function tearDown():void 
		{
			
		}
		
		[Test]
		public function test1Linear( ):void
		{
			Assert.assertEquals( 1, RomanOperations.deromanize( "I" ) );
			Assert.assertEquals( 2, RomanOperations.deromanize( "II" ) );
			Assert.assertEquals( 3, RomanOperations.deromanize( "III" ) );
			Assert.assertEquals( 5, RomanOperations.deromanize( "V" ) );
		}
		
		[Test]
		public function test2Linear( ):void
		{
			Assert.assertEquals( 10, RomanOperations.deromanize( "X" ) );
			Assert.assertEquals( 11, RomanOperations.deromanize( "XI" ) );
			Assert.assertEquals( 15, RomanOperations.deromanize( "XV" ) );
			Assert.assertEquals( 20, RomanOperations.deromanize( "XX" ) );
			Assert.assertEquals( 16, RomanOperations.deromanize( "XVI" ) );
			Assert.assertEquals( 17, RomanOperations.deromanize( "XVII" ) );
			Assert.assertEquals( 18, RomanOperations.deromanize( "XVIII" ) );
		}
		
		[Test]
		public function test3Linear( ):void
		{
			Assert.assertEquals( 30, RomanOperations.deromanize( "XXX" ) );
			Assert.assertEquals( 21, RomanOperations.deromanize( "XXI" ) );
			Assert.assertEquals( 25, RomanOperations.deromanize( "XXV" ) );
		}
		
		[Test]
		public function testComplex( ):void
		{
			Assert.assertEquals( 4, RomanOperations.deromanize( "IV" ) );
			Assert.assertEquals( 9, RomanOperations.deromanize( "IX" ) );
			
			Assert.assertEquals( 2700, RomanOperations.deromanize( "MMDCC " ) );
		}
		
		[Test]
		public function add1Linear( ):void
		{
			Assert.assertEquals( 2, RomanOperations.add( "I", "I" ) );
			Assert.assertEquals( 6, RomanOperations.add( "I", "V" ) );
			Assert.assertEquals( 7, RomanOperations.add( "II", "V" ) );
		}
		
		[Test]
		public function add12Linear( ):void
		{
			Assert.assertEquals( 12, RomanOperations.add( "I", "XI" ) );
			Assert.assertEquals( 21, RomanOperations.add( "I", "XX" ) );
		}
		
		[Test]
		public function romanizeSimpleNumbersTest( ):void
		{
			Assert.assertEquals( "I", RomanOperations.romanize( 1 ) );
			Assert.assertEquals( "V", RomanOperations.romanize( 5 ) );
			Assert.assertEquals( "X", RomanOperations.romanize( 10 ) );
			Assert.assertEquals( "L", RomanOperations.romanize( 50 ) );
			Assert.assertEquals( "C", RomanOperations.romanize( 100 ) );
			Assert.assertEquals( "D", RomanOperations.romanize( 500 ) );
			Assert.assertEquals( "M", RomanOperations.romanize( 1000 ) );
		}
		
		[Test]
		public function romanizeComplexNumbersTest( ):void
		{
			Assert.assertEquals( "II", RomanOperations.romanize( 2 ) );
			Assert.assertEquals( "IV", RomanOperations.romanize( 4 ) );
			Assert.assertEquals( "XI", RomanOperations.romanize( 11 ) );
			Assert.assertEquals( "XL", RomanOperations.romanize( 40 ) );
			Assert.assertEquals( "XC", RomanOperations.romanize( 90 ) );
			Assert.assertEquals( "LX", RomanOperations.romanize( 60 ) );
			Assert.assertEquals( "MMX", RomanOperations.romanize( 2010) );
		}
		
		[Test]
		public function addRomanicOutputTest( ):void
		{
			Assert.assertEquals( "II", RomanOperations.add( "I", "I", CNumberFormats.ROMAN ) );
			Assert.assertEquals( "XX", RomanOperations.add( "X", "X", CNumberFormats.ROMAN ) );
			Assert.assertEquals( "XI", RomanOperations.add( "X", "I", CNumberFormats.ROMAN ) );
			Assert.assertEquals( "XI", RomanOperations.add( "I", "X", CNumberFormats.ROMAN ) );
			Assert.assertEquals( "MMX", RomanOperations.add( "MM", "X", CNumberFormats.ROMAN ) );
			Assert.assertEquals( "MMX", RomanOperations.add( "X", "MM", CNumberFormats.ROMAN ) );
		}
		
		[Test(dataProvider="testDatas")]
		public function testBinarySearch( value1:String, value2:String, expected:String ):void
		{
			Assert.assertEquals( expected, RomanOperations.add( value1, value2, CNumberFormats.ROMAN ) );
		}
	}

}