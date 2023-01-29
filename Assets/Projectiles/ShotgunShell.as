package Assets.Projectiles {
	
	import Assets.Particles.HitParticles.BugHitParticle;
	import Events.ProjectileEvent;
	import Global.Game;
	
	public class ShotgunShell extends Bullet {

		public function ShotgunShell(sourceTeam:String, damage:int) {
			super(sourceTeam, damage, 1200, 2);
			this.addEventListener(ProjectileEvent.PROJECTILE_HIT_COMPLETE, projectileHitComplete);
		}
	
		private function projectileHitComplete(p:ProjectileEvent):void {
			this.deleteThis();
		}

	}
	
}
