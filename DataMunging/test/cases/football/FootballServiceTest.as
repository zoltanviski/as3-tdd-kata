package cases.football
{
	import flexunit.framework.TestCase;
	import hu.vizoli.tddkata.datamunging.model.football.FootballModel;
	import hu.vizoli.tddkata.datamunging.service.football.FootballService;
	import hu.vizoli.tddkata.datamunging.service.football.parser.FootballServiceParser;
	import org.flexunit.Assert;
	
	/**
	 * FootballService test.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class FootballServiceTest extends TestCase 
	{
		private static const TIMEOUT_VALUE:int = 500;
		
		private var _footballModel:FootballModel;
		private var _footballService:FootballService;
		private var _footballServiceParser:FootballServiceParser;
		
		[Before]
		override public function setUp():void 
		{
			this._footballModel = new FootballModel();
			
			this._footballServiceParser = new FootballServiceParser();
			
			this._footballService = new FootballService();
			this._footballService.footballModel = this._footballModel;
			this._footballService.footballServiceParser = this._footballServiceParser;
		}
		
		[After]
		override public function tearDown():void 
		{
			this._footballService = null;
			this._footballModel = null;
			this._footballServiceParser = null;
		}
		
		[Test]
		public function aa():void 
		{
			
		}
		
	}

}