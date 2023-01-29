package Events {
	
	import Assets.Projectiles.Projectile;
	import Assets.Units.Unit;
	import flash.events.Event;
	
	public class ProjectileEvent extends Event {

		public static const PROJECTILE_HIT:String = "PROJECTILE_HIT";
		public static const PROJECTILE_HIT_CHECK:String = "PROJECTILE_HIT_CHECK";
		public static const PROJECTILE_HIT_COMPLETE:String = "PROJECTILE_HIT_COMPLETE";
	
		public var projectile:Projectile;
		public var unitHit:Unit;
		
		public function ProjectileEvent( type:String, projectile:Projectile, unitHit:Unit = null, bubbles:Boolean = true, cancelable:Boolean = false) {
			super( type, bubbles, cancelable );
			this.projectile = projectile;
			this.unitHit = unitHit;
		}

	}
	
}
