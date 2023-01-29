package Assets.Weapons.MeleeWeapons {
	
	import Assets.Weapons.Weapon;
	import Events.WeaponEvent;
	import flash.geom.Point;
	import Global.DamageTypes;
	import Utilities.UtilFrame;
	
	public class Katana extends Weapon {

		public var damageValues:Array;

		public function Katana() {
			super(0, "Katana");
			
			this.currentAmmo = this.maximumAmmo = 0;
			this.firingPointX = 0;
			this.firingPointY = 0;
			this.damage = 50;
			this.damageType = DamageTypes.PHYSICAL;
			this.damageValues = new Array(30, 20, 30);
		}

		public override function attack():void {
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
