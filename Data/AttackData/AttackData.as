package Data.AttackData {
	
	import Assets.Units.Unit;
	import Utilities.UtilMaths;
	
	public class AttackData {

		private var attackName:String;
		private var attackType:String;
		private var attackPureRange:uint;
		private var attackAngle:uint;
		private var attackMinimumDamage:uint;
		private var attackMaximumDamage:uint;
		private var damageType:String;
		private var attackKnockback:uint;
		private var attackFrame:uint;
		
		public function AttackData(attackName:String, attackType:String, attackPureRange:uint, attackAngle:uint, attackMinimumDamage:uint, attackMaximumDamage:uint, damageType:String, attackKnockback:uint, attackFrame:uint) {
			this.attackName = attackName;
			this.attackType = attackType;
			this.attackPureRange = attackPureRange;
			this.attackAngle = attackAngle;
			this.attackMinimumDamage = attackMinimumDamage;
			this.attackMaximumDamage = attackMaximumDamage;
			this.damageType = damageType;
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
	
		public function getDamageType():String {
			return damageType;
		}
	
		public function getAttackKnockback():uint {
			return attackKnockback;
		}
	
		public function getAttackFrame():uint {
			return attackFrame;
		}
	
		public function getDamage():uint {
			var damage:uint = UtilMaths.randomMinMax(attackMinimumDamage, attackMaximumDamage);
			
			return damage;
		}

	}
	
}
