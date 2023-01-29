package Assets.Weapons.RangedWeapons {
	
	import Assets.Particles.ShotParticles.GunShotParticle;
	import Assets.Projectiles.PistolBullet;
	import Assets.Weapons.Weapon;
	import Events.WeaponEvent;
	import flash.geom.Point;
	import Global.DamageTypes;
	import Global.Game;
	import Utilities.UtilMaths;
	
	public class Pistol extends RangedWeapon {

		public function Pistol() {
			super("Shotgun", DamageTypes.BULLET, 400, 300);
			
			this.firingPointX = 0;
			this.firingPointY = -60;
			this.damage = 20;
		}

		public override function fire():void {
			if (currentAmmo > 0) {					
				var bullet:PistolBullet;
				var firingPoint:Point = UtilMaths.getTransformedPoint(this, this.firingPointX, this.firingPointY);
				var rotationDegree = this.parent.rotation + this.rotation;
				
				Game.UNIT_LAYER.addChild(new GunShotParticle(firingPoint.x, firingPoint.y, rotationDegree));
				
				bullet = new PistolBullet(this.getTeam(), UtilMaths.scatter10Percent(damage));
				bullet.x = firingPoint.x;
				bullet.y = firingPoint.y;
				bullet.rotation = rotationDegree;
				
				this.currentAmmo--;
				this.dispatchEvent(new WeaponEvent(WeaponEvent.WEAPON_FIRE, this));
			}
		}
	}
	
}
