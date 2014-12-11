package cases.football
{
	import flexunit.framework.TestCase;
	import hu.vizoli.tddkata.datamunging.model.football.FootballModel;
	import hu.vizoli.tddkata.datamunging.vo.football.GoalRateVO;
	import hu.vizoli.tddkata.datamunging.vo.weather.TemperatureVO;
	import org.flexunit.Assert;
	
	/**
	 * FootballModel test.
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class FootballModelTest extends TestCase 
	{
		private var _footballModel:FootballModel;
		
		[Before]
		override public function setUp():void 
		{
			this._footballModel = new FootballModel();
		}
		
		[After]
		override public function tearDown():void 
		{
			this._footballModel = null;
		}
		
		[Test]
		public function testSetAndGetMostbalancedTeam( ):void
		{
			var goalRates:Vector.<GoalRateVO> = new Vector.<GoalRateVO>;
			goalRates.push( this.getGoalRateVO( "Arsenal", 5, 2 ) );
			
			this._footballModel.goalRates = goalRates;
			
			Assert.assertEquals( "Arsenal", this._footballModel.mostBalancedTeam );
		}
		
		[Test]
		public function testSetAndGetMostbalancedTeamWithMoreTeam( ):void
		{
			var goalRates:Vector.<GoalRateVO> = new Vector.<GoalRateVO>;
			goalRates.push( this.getGoalRateVO( "Arsenal", 8, 2 ) );
			goalRates.push( this.getGoalRateVO( "Barcelona", 7, 2 ) );
			
			this._footballModel.goalRates = goalRates;
			
			Assert.assertEquals( "Barcelona", this._footballModel.mostBalancedTeam );
		}
		
		[Test]
		public function testSetAndGetMostbalancedTeamWithMoreReceivedGoal( ):void
		{
			var goalRates:Vector.<GoalRateVO> = new Vector.<GoalRateVO>;
			goalRates.push( this.getGoalRateVO( "Arsenal", 4, 6 ) );
			goalRates.push( this.getGoalRateVO( "Barcelona", 7, 2 ) );
			
			this._footballModel.goalRates = goalRates;
			
			Assert.assertEquals( "Arsenal", this._footballModel.mostBalancedTeam );
		}
		
		private function getGoalRateVO( team:String, givedGoal:int, receivedGoal:int ):GoalRateVO
		{
			var goalRateVO:GoalRateVO = new GoalRateVO();
			goalRateVO.team = team;
			goalRateVO.givedGoal = givedGoal;
			goalRateVO.receivedGoal = receivedGoal;
			
			return goalRateVO;
		}
		
	}

}