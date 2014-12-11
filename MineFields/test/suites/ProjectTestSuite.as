package suites
{
	import cases.FieldGeneratorTest;
	import cases.FieldSolverTest;
	import cases.MathUtilTest;
	import cases.StringUtilTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class ProjectTestSuite
	{
		public var fieldGeneratorTest:FieldGeneratorTest;
		public var fieldSolverTest:FieldSolverTest;
		public var mathUtilTest:MathUtilTest;
		public var stringUtilTest:StringUtilTest;
	}
}