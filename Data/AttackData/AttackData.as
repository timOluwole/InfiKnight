package Data.AttackData {
	
	import Assets.Units.Unit;
	
	public class AttackData {

		private var attackName:String;
		private var attackType:String;
		private var attackPureRange:uint;
		private var attackAngle:uint;
		private var attackMinimumDamage:uint;
		private var attackMaximumDamage:uint;
		private var attackKnockback:uint;
		private var attackFrame:uint;
		
		public function AttackData(attackName:String, attackType:String, attackPureRange:uint, attackAngle:uint, attackMinimumDamage:uint, attackMaximumDamage:uint, attackKnockback:uint, attackFrame:uint) {
			this.attackName = attackName;
			this.attackType = attackType;
			this.attackPureRange = attackPureRange;
			this.attackAngle = attackAngle;
			this.attackMinimumDamage = attackMinimumDamage;
			this.attackMaximumDamage = attackMaximumDamage;
			this.attackKnockback = attackKnockback;
			this.attackFrame = attackFrame;
		}
	
		public function getAttackName():String {
			return attackName;
		}
	
		public function getAttackType():String {
			return attackType;
		}
	
		public function getAttackPureRange():uint {
			return attackPureRange;
		}
	
		public function getAttackAngle():uint {
			return attackAngle;
		}
	
		public function getAttackMinimumDamage():uint {
			return attackMinimumDamage;
		}
	
		public function getAttackMaximumDamage():uint {
			return attackMaximumDamage;
		}
	
		public function getAttackKnockback():uint {
			return attackMaximumDamage;
		}
	
		public function getAttackFrame():uint {
			return attackFrame;
		}
	
		public function getDamage(attackingUnit:Unit, attackedUnit:Unit):uint {
			var range:uint = attackMaximumDamage - attackMinimumDamage;
			var damage:uint = attackMinimumDamage + Math.round(Math.random() * range);
			
			return damage;
		}

	}
	
}
