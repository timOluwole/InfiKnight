package Objects {
	
	import Assets.Units.AlliedUnits.InfiKnight;
	import Assets.Weapons.MeleeWeapons.Katana;
	import Assets.Weapons.RangedWeapons.*;
	import Controllers.HumanController;
	import Events.GameEvent;
	import Events.UnitEvent;
	import Factories.DropFactory;
	import Factories.EnemyFactory;
	import Global.Game;
	import Global.Teams;
	
	public class GameRun {
		
		private var score:uint;
		private var knight:InfiKnight;
		private var allies:Array;
		
		private var enemyFactory:EnemyFactory;
		private var dropFactory:DropFactory;

		public function GameRun() {
			this.score = 0;			
			this.knight = new InfiKnight();
			this.allies = new Array();
			
			this.enemyFactory = new EnemyFactory();
			this.dropFactory = new DropFactory();
			
			setUpController();
			
			knight.pickUpWeapon(new Katana());
			knight.pickUpWeapon(new Pistol());
			knight.pickUpWeapon(new Shotgun());	
			
			Game.STAGE.addEventListener(UnitEvent.UNIT_DIE, unitDies);
		}
	
		public function unitDies(U:UnitEvent):void {
			if (U.unit.getTeam() == Teams.ENEMY) {
				score++;
				Game.STAGE.dispatchEvent(new GameEvent(GameEvent.GAME_UPDATE_SCORE, score));
			}
		}
	
		public function setUpController():void {
			var controller:HumanController = new HumanController(this.knight);			
		}
	
		public function getKnight():InfiKnight {
			return this.knight;
		}

	}
	
}
