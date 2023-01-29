package Assets.Weapons.RangedWeapons {
	
	import Assets.Particles.ShotParticles.GunShotParticle;
	import Assets.Projectiles.PistolBullet;
	import Assets.Weapons.Weapon;
	import Events.WeaponEvent;
	import flash.geom.Point;
	import Global.Game;
	import Utilities.UtilMaths;
	
	public class Pistol extends Weapon {

		public function Pistol() {
			super(400, "Pistol");
			
			this.currentAmmo = this.maximumAmmo = 300;
			this.firingPointX = 0;
			this.firingPointY = -60;
			this.damage = 20;
		}

		public override function attack():void {
			if (currentAmmo > 0) {					
				var bullet:PistolBullet;
				var firingPoint:Point = UtilMaths.getTransformedPoint(this, this.firingPointX, this.firingPointY);
				var rotationDegree = this.parent.rotation + this.rotation;
				
				Game.UNIT_LAYER.addChild(new GunShotParticle(firingPoint.x, firingPoint.y, rotationDegree));
				
				bullet = new PistolBullet(this.wielderTeam, UtilMaths.scatter10Percent(damage));
				bullet.x = firingPoint.x;
				bullet.y = firingPoint.y;
				bullet.rotation = rotationDegree;
				
				this.currentAmmo--;
				this.dispatchEvent(new WeaponEvent(WeaponEvent.WEAPON_FIRE, this));
			}
		}
	}
	
}
