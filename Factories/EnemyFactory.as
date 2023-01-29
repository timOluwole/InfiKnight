package Factories {
	
	import Assets.HUD.EnemyHUD;
	import Assets.Units.EnemyUnits.Beetle;
	import Events.GameEvent;
	import Events.UnitEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Global.Game;
	
	public class EnemyFactory {

		private var spawnTimer:Timer;
		private var score:uint;
		
		public function EnemyFactory() {
			score = 0;
			
			spawnTimer = new Timer(5000);			
			spawnTimer.addEventListener(TimerEvent.TIMER, spawnEnemy);
			Game.STAGE.addEventListener(GameEvent.GAME_UPDATE_SCORE, updateScore);
			spawnTimer.start();			
		}
	
		private function spawnEnemy(t:TimerEvent):void {			
			var beetle:Beetle = new Beetle();
			beetle.x = Math.round(Math.random() * Game.STAGE.stageWidth);
			beetle.y = Math.round(Math.random() * Game.STAGE.stageHeight);
			var enemyHUD:EnemyHUD = new EnemyHUD(beetle);
			beetle.initialiseHealth(100);
		}
	
		private function updateScore(G:GameEvent):void {
			if (G) {
				score = G.value;
			}
		}

	}
	
}
