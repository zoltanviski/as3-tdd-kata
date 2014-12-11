package suites
{
	import cases.DigitsConverterTest;
	import cases.MathUtilTest;
	import cases.StringUtilTest;
	import cases.VectorUtilTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class ProjectTestSuite
	{
		public var digitsConverterTest:DigitsConverterTest;
		public var mathUtilTest:MathUtilTest;
		public var stringUtilTest:StringUtilTest;
		public var vectorUtilTest:VectorUtilTest;
	}
}