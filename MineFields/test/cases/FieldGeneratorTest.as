package cases
{
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	import hu.vizoli.tddkata.minefields.constant.CFieldType;
	import hu.vizoli.tddkata.minefields.field.FieldGenerator;
	import hu.vizoli.tddkata.minefields.util.StringUtil;
	
	/**
	 * FieldGenerator tests.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class FieldGeneratorTest extends TestCase 
	{
		private var _fieldGenerator:FieldGenerator;
		
		[Before]
		override public function setUp():void 
		{
			this._fieldGenerator = new FieldGenerator();
		}
		
		[After]
		override public function tearDown():void 
		{
			this._fieldGenerator = null;
		}
		
		[Test]
		public function testOneFieldWithNoMine( ):void
		{
			Assert.assertEquals( ".", this._fieldGenerator.generate( 1, 1, 0 ) );
		}
		
		[Test]
		public function testTwoColumnOneRowFieldWithNoMine( ):void
		{
			Assert.assertEquals( "..", this._fieldGenerator.generate( 2, 1, 0 ) );
		}
		
		[Test]
		public function testOneColumnTwoRowFieldWithNoMine( ):void
		{
			Assert.assertEquals( ".\n.", this._fieldGenerator.generate( 1, 2, 0 ) );
		}
		
		[Test]
		public function testTwoColumnTwoRowFieldWithNoMine( ):void
		{
			Assert.assertEquals( "..\n..", this._fieldGenerator.generate( 2, 2, 0 ) );
		}
		
		[Test]
		public function testTwoColumnFreeRowFieldWithNoMine( ):void
		{
			Assert.assertEquals( "..\n..\n..", this._fieldGenerator.generate( 2, 3, 0 ) );
		}
		
		[Test]
		public function test1ColoumnFieldWithMine( ):void
		{
			Assert.assertEquals( "*", this._fieldGenerator.generate( 1, 1, 1 ) );
		}
		
		[Test]
		public function test2ColoumnFieldWithMine( ):void
		{
			Assert.assertEquals( "**", this._fieldGenerator.generate( 2, 1, 2 ) );
		}
		
		[Test]
		public function test2RowFieldWithMine( ):void
		{
			Assert.assertEquals( "*\n*", this._fieldGenerator.generate( 1, 2, 2 ) );
		}
		
		[Test]
		public function test2Column2RowFieldWithMine( ):void
		{
			Assert.assertEquals( "**\n**", this._fieldGenerator.generate( 2, 2, 4 ) );
		}
		
		[Test]
		public function testCorrectMineCount( ):void
		{
			var field:String = this._fieldGenerator.generate( 5, 3, 6 );
			Assert.assertEquals( 6, StringUtil.getSpecificCharacterCount( field, CFieldType.MINE ) );
			
			field = this._fieldGenerator.generate( 12, 4, 19 );
			Assert.assertEquals( 19, StringUtil.getSpecificCharacterCount( field, CFieldType.MINE ) );
		}
		
		[Test(expects="Error")]
		public function testTooMuchMineThrowError( ):void
		{
			this._fieldGenerator.generate( 2, 2, 5 );
		}
	}

}