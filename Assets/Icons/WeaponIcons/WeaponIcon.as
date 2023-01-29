package Assets.Icons.WeaponIcons {
	
	import Assets.Asset;
	import Assets.Weapons.Weapon;
	
	public class WeaponIcon extends Asset {
		var attachedWeapon:Weapon;

		public function WeaponIcon(weapon:Weapon) {
			this.attachedWeapon = weapon;
			
			this.rotation = -10;
			this.scaleX = this.scaleY = 1.5;
		}

	}
	
}
