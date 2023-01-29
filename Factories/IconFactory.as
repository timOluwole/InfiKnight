package Factories {
	
	import Assets.Icons.WeaponIcons.*;
	import Assets.Weapons.Weapon;
	
	public class IconFactory {
		
		public static function createWeaponIcon(weapon:Weapon):WeaponIcon {	
			var weaponIcon:WeaponIcon;
			
			switch (weapon.getWeaponName()) {
				case "Pistol":
					weaponIcon = new PistolIcon(weapon);
					break;
				case "Shotgun":
					weaponIcon = new ShotgunIcon(weapon);
					break;
				case "Katana":
					weaponIcon = new KatanaIcon(weapon);
					break;
				default:
					break;
			}
		
			return weaponIcon;
		}

	}
	
}
