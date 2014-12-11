package suites
{
	import cases.MathUtilsTest;
	import cases.StringCalculatorTest;
	import cases.ArrayUtilsTest
	import cases.StringUtilsTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class ProjectTestSuite
	{
		public var stringCalculatorTest:StringCalculatorTest;
		public var arrayUtilsTest:ArrayUtilsTest;
		public var stringUtilsTest:StringUtilsTest;
		public var mathUtilsTest:MathUtilsTest;
	}
}