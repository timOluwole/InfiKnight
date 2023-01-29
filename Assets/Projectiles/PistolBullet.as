package Assets.Projectiles {
	
	import Assets.Particles.HitParticles.BugHitParticle;
	import Events.ProjectileEvent;
	import Factories.ParticleFactory;
	import Global.Game;
	import Assets.Units.Unit;
	import Assets.Weapons.Weapon;
	
	
	public class PistolBullet extends Bullet {

		public function PistolBullet(damage:int, sourceUnit:Unit, sourceWeapon:Weapon) {
			super(damage, 800, 3, sourceUnit, sourceWeapon);
			this.addEventListener(ProjectileEvent.PROJECTILE_HIT_COMPLETE, projectileHitComplete);
		}		
	
		private function projectileHitComplete(p:ProjectileEvent):void {
			this.deleteThis();
		}

	}
	
}
