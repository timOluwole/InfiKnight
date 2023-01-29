package Assets.Projectiles {
	
	import Global.DamageTypes;
	import Assets.Units.Unit;
	import Assets.Weapons.Weapon;
	
	public class Bullet extends Projectile {
		
		public function Bullet(damage:int, speed:int, maximumLifeTimeSeconds:int, sourceUnit:Unit, sourceWeapon:Weapon = null) {	
			super(damage, DamageTypes.BULLET, speed, maximumLifeTimeSeconds, sourceUnit, sourceWeapon);		
			this.scaleX = 0.5;
			this.scaleY = 0.5;			
		}
	}
	
}
