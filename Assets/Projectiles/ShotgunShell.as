package Assets.Projectiles {
	
	import Assets.Particles.HitParticles.BugHitParticle;
	import Assets.Units.Unit;
	import Assets.Weapons.Weapon;
	import Events.ProjectileEvent;
	import Global.Game;
	
	public class ShotgunShell extends Bullet {

		public function ShotgunShell(damage:int, sourceUnit:Unit, sourceWeapon:Weapon) {
			super(damage, 1200, 2, sourceUnit, sourceWeapon);
			this.addEventListener(ProjectileEvent.PROJECTILE_HIT_COMPLETE, projectileHitComplete);
		}
	
		private function projectileHitComplete(p:ProjectileEvent):void {
			this.deleteThis();
		}

	}
	
}
