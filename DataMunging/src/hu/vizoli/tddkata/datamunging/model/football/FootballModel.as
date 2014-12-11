package hu.vizoli.tddkata.datamunging.model.football 
{
	import hu.vizoli.api.base.BaseModel;
	import hu.vizoli.tddkata.datamunging.vo.football.GoalRateVO;
	import hu.vizoli.tddkata.datamunging.vo.weather.TemperatureVO;
	
	/**
	 * Football data Model.
	 * 
	 * @author vizoli
	 */
	public class FootballModel extends BaseModel 
	{
		private var _goalRates:Vector.<GoalRateVO>;
		
		public function FootballModel() 
		{
			this._goalRates = new Vector.<GoalRateVO>;
		}
		
		/**
		 * Returns with the most balanced team.
		 */
		public function get mostBalancedTeam():String 
		{
			var mostBalancedTeam:String;
			var mostBalanced:Number = Number.POSITIVE_INFINITY;
			var balance:int;
			
			var l:int = this._goalRates.length;
			for ( var i:int = 0; i < l; i++ )
			{
				balance = Math.abs( this._goalRates[ i ].givedGoal - this._goalRates[ i ].receivedGoal );
				
				if ( balance < mostBalanced )
				{
					mostBalanced = balance;
					mostBalancedTeam = this._goalRates[ i ].team;
				}
			}
			
			return mostBalancedTeam;
		}
		
		/**
		 * @private
		 */
		public function set goalRates( value:Vector.<GoalRateVO> ):void 
		{
			this._goalRates = value;
		}
		
	}

}