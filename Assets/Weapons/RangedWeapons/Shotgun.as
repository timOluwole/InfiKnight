package Assets.Weapons.RangedWeapons {
	
	import Assets.Particles.ShotParticles.GunShotParticle;
	import Assets.Projectiles.ShotgunShell;
	import Assets.Weapons.Weapon;
	import Events.WeaponEvent;
	import flash.geom.Point;
	import Global.DamageTypes;
	import Global.Game;
	import Utilities.UtilMaths;
	
	public class Shotgun extends RangedWeapon {

		public function Shotgun() {
			super("Shotgun", DamageTypes.BULLET, 1000, 100);
			
			this.firingPointX = 0;
			this.firingPointY = -100;
			this.damage = 60;
		}

		public override function fire():void {
			if (currentAmmo > 0) {		
				var shell1:ShotgunShell;
				var firingPoint:Point;
				var rotationDegree = this.parent.rotation + this.rotation;
				
				firingPointX = -10;	// left barrel
				firingPoint = UtilMaths.getTransformedPoint(this, this.firingPointX, this.firingPointY);
				
				Game.UNIT_LAYER.addChild(new GunShotParticle(firingPoint.x, firingPoint.y, rotationDegree));	
				
				shell1 = new ShotgunShell(this.damage, this.wielder, this);
				shell1.x = firingPoint.x;
				shell1.y = firingPoint.y;				
				shell1.rotation = rotationDegree;
				
				this.currentAmmo--;
				
				if (currentAmmo > 0) {
					var shell2:ShotgunShell;
					firingPointX = 10;	// right barrel
					firingPoint = UtilMaths.getTransformedPoint(this, this.firingPointX, this.firingPointY);
					
					Game.UNIT_LAYER.addChild(new GunShotParticle(firingPoint.x, firingPoint.y, rotationDegree));	
				
					shell2 = new ShotgunShell(this.damage, this.wielder, this);
					shell2.x = firingPoint.x;
					shell2.y = firingPoint.y;
					shell2.rotation = rotationDegree;
					
					this.currentAmmo--;
				}				
				
				this.dispatchEvent(new WeaponEvent(WeaponEvent.WEAPON_FIRE, this));
			}
		}

	}
	
}
