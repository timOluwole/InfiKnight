package Data.AttackData {
	import Global.AttackTypes;
	
	public class BeetleAttacks extends Attacks {

		private static const BEETLE_BITE:AttackData = new AttackData("Bite", AttackTypes.MELEE, 250, 30, 20, 25, 20, 17);
		
		public function BeetleAttacks() {
			super();
			this.attackList.push(BEETLE_BITE);
		}

	}
	
}
