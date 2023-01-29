package Data.AttackData {
	import Global.AttackTypes;
	import Global.DamageTypes;
	
	public class BeetleAttacks extends Attacks {

		private static const BEETLE_BITE:AttackData = new AttackData("Bite", AttackTypes.MELEE, 250, 30, 20, 25, DamageTypes.PHYSICAL, 20, 17);
		
		public function BeetleAttacks() {
			super();
			this.attackList.push(BEETLE_BITE);
		}

	}
	
}
