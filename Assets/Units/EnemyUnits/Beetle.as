package Assets.Units.EnemyUnits {
	
	import Events.UnitEvent;	
	import Data.AttackData.BeetleAttacks;
	import Data.Stats.*
	
	public class Beetle extends EnemyUnit {

		public function Beetle() {
			super();
			this.scaleX = 0.5;
			this.scaleY = 0.5;
			
			this.maximumTurnSpeed = new BasicStat(2);
			this.walkSpeed = new FlexiStat(200);
			this.visionRange = 600;
			this.periphery = 45;
			this.setAttacks(new BeetleAttacks());
			
			this.damage = new CompoundStat();
			this.resistances = new CompoundStat();
			
			this.addListener(UnitEvent.UNIT_DIE, die);
		}
	
		private function die(U:UnitEvent):void {
		}
	}
	
}
