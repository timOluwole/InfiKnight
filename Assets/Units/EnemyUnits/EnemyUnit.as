package Assets.Units.EnemyUnits {
	
	import Assets.Containers.HitBox;
	import Assets.Units.Unit;
	import Controllers.EnemyBrain;
	import Data.AttackData.AttackData;
	import Events.UnitEvent;
	import Factories.ParticleFactory;
	import flash.geom.Point;
	import Global.Teams;
	import Global.ParticleTypes;
	import Utilities.UtilMaths;
	import Utilities.UtilObject;
	
	public class EnemyUnit extends Unit {

		public var brain:EnemyBrain;
		public var visionRange:int;
		public var periphery:uint;
		
		public function EnemyUnit() {
			super(Teams.ENEMY);
			
			this.brain = new EnemyBrain(this);
			this.addListener(UnitEvent.UNIT_GET_HIT, getHit);
		}
	
		public function attack(selectedAttack:AttackData):void {
			if (selectedAttack) {
				this.gotoAndPlay(selectedAttack.getAttackFrame());
			}
		}
	
		public function getHit(u:UnitEvent):void {
			if (u) {
				if (u.attackSource) {
					var hitBox:HitBox = UtilObject.getHitBox(u.attackSource);
								
					var attackerPoint:Point = UtilMaths.getTransformedPoint((hitBox) ? hitBox : u.attackSource);
					ParticleFactory.createParticleSpread(ParticleTypes.BUG_HIT, attackerPoint);					
				}
			}
		}
	}
	
}
