package Assets.Projectiles {
	
	import Assets.Particles.HitParticles.BugHitParticle;
	import Events.ProjectileEvent;
	import Factories.ParticleFactory;
	import Global.Game;
	
	
	public class PistolBullet extends Bullet {

		public function PistolBullet(sourceTeam:String, damage:int) {
			super(sourceTeam, damage, 800, 3);
			this.addEventListener(ProjectileEvent.PROJECTILE_HIT_COMPLETE, projectileHitComplete);
		}		
	
		private function projectileHitComplete(p:ProjectileEvent):void {
			this.deleteThis();
		}

	}
	
}
