package Assets.Weapons.MeleeWeapons {
	
	import Global.DamageTypes;
	import Utilities.UtilFrame;
	
	public class Katana extends MeleeWeapon {

		public var damageValues:Array;

		public function Katana() {
			super("Katana", DamageTypes.PHYSICAL);
			
			this.damageValues = new Array(30, 20, 30);
		}

		public override function useWeapon():void {
			if (UtilFrame.isStationaryFrame(this.currentLabel) || UtilFrame.isWindowFrame(this.currentLabel)) {
				var attackNumber:uint = UtilFrame.getWindowNumber(this.currentLabel) + 1;
				if(attackNumber < 4) {
					this.damage = damageValues[attackNumber - 1];
					this.gotoAndPlay("attack " + attackNumber.toString());
				}				
			}
		}
	}
	
}
