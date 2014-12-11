package suites
{
	import cases.football.FootballModelTest;
	import cases.football.FootballServiceTest;
	import cases.weather.WeatherModelTest;
	import cases.weather.WeatherServiceTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class DataMungingTestSuite
	{
		public var weatherModelTest:WeatherModelTest;
		public var weatherServiceTest:WeatherServiceTest;
		
		public var fotballModelTest:FootballModelTest;
		public var footballServiceTest:FootballServiceTest;
	}
	
}