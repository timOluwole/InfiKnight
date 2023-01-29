package Data.AttackData {
	
	public class Attacks {
		
		protected var attackList:Array;

		public function Attacks() {
			this.attackList = new Array();
		}
	
		public function getAttackList():Array {
			return attackList;
		}

		public function getAttack(attackName:String):AttackData {
			for each (var attack:AttackData in attackList) {
				if (attack.getAttackName() == attackName) {
					return attack;
				}
			}
		
			return null;
		}

	}
	
}
