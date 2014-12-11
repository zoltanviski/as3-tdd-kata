package cases
{
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	
	/**
	 * FieldSolver tests.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class FieldSolverTest extends TestCase 
	{
		private var _fieldSolver:FieldSolver;
		
		[Before]
		override public function setUp():void 
		{
			this._fieldSolver = new FieldSolver();
		}
		
		[After]
		override public function tearDown():void 
		{
			this._fieldSolver = null;
		}
		
		[Test]
		public function testOneFieldWithNoMine( ):void
		{
			Assert.assertEquals( "0", this._fieldSolver.solve( "." ) ); 
		}
		
		[Test]
		public function testOneFieldWithMine( ):void
		{
			Assert.assertEquals( "*", this._fieldSolver.solve( "*" ) );
		}
		
		[Test]
		public function testTwoFieldWithMine( ):void
		{
			Assert.assertEquals( "1*", this._fieldSolver.solve( ".*" ) );
		}
		
		[Test]
		public function testThreeFieldWithMine( ):void
		{
			Assert.assertEquals( "1*1", this._fieldSolver.solve( ".*." ) );
		}
		
		[Test]
		public function testThreeFieldWithTwoMine( ):void
		{
			Assert.assertEquals( "*2*", this._fieldSolver.solve( "*.*" ) );
		}
		
		[Test]
		public function test2x2FieldWithOneMine( ):void
		{
			Assert.assertEquals( "11\n*1", this._fieldSolver.solve( "..\n*." ) );
		}
		
		[Test]
		public function test2x3FieldWithOneMine( ):void
		{
			Assert.assertEquals( "110\n*10", this._fieldSolver.solve( "...\n*.." ) );
		}
		
		[Test]
		public function test2x3FieldWithTwoMine( ):void
		{
			Assert.assertEquals( "12*\n1*2", this._fieldSolver.solve( "..*\n.*." ) );
		}
		
	}

}