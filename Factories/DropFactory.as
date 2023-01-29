package Factories {
	
	import Events.UnitEvent;
	import Events.GameEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import Global.Game;
	import Utilities.UtilMaths;
	import Assets.Drops.Drop;
	import Assets.Drops.BuffDrops.HealDrop;
	
	public class DropFactory {

		private var healSpawnTimer:Timer;
		private var buffSpawnTimer:Timer;
		private var allySpawnTimer:Timer;
		private var skillSpawnTimer:Timer;		
		private var lastBuffSpawned:String;		
		private var score:uint;
		
		public function DropFactory() {
			this.score = 0;
			
			Game.STAGE.addEventListener(GameEvent.GAME_UPDATE_SCORE, updateScore);
			Game.STAGE.addEventListener(UnitEvent.UNIT_TAKE_DAMAGE, listenForDamage);
		}
	
		private function updateScore(g:GameEvent):void {
			if (g) {
				score = g.value;
				spawnHeal(null);
				//scoreBasedTimers();
			}
		}
	
		private function scoreBasedTimers():void {
			if (score == 1) {	
				var initialHealSpawnWait:uint = UtilMaths.seconds(1);
				healSpawnTimer = new Timer(initialHealSpawnWait, 1);	
				healSpawnTimer.addEventListener(TimerEvent.TIMER, spawnHeal);		
				healSpawnTimer.start();	
				
				var initialBuffSpawnWait:uint = UtilMaths.scatter10Percent(UtilMaths.minutes(2));
				buffSpawnTimer = new Timer(initialBuffSpawnWait, 1);	
				buffSpawnTimer.addEventListener(TimerEvent.TIMER, spawnBuff);		
				buffSpawnTimer.start();			
			}
		}
	
		private function spawnHeal(t:TimerEvent):void {	
			var drop:Drop = new HealDrop();
			drop.x = Math.round(Math.random() * Game.STAGE.stageWidth);
			drop.y = Math.round(Math.random() * Game.STAGE.stageHeight);
			Game.UNIT_LAYER.addChild(drop);
		}
	
		private function spawnBuff(T:TimerEvent):void {
			
		}
	
		private function listenForDamage(U:UnitEvent):void {
			if (U) {
				
			}
		}

	}
	
}
