package Assets.Projectiles {
	
	import Global.DamageTypes;
	
	public class Bullet extends Projectile {
		
		public function Bullet(sourceTeam:String, damage:int, speed:int, maximumLifeTimeSeconds:int) {	
			super(sourceTeam, damage, DamageTypes.BULLET, speed, maximumLifeTimeSeconds);		
			this.scaleX = 0.5;
			this.scaleY = 0.5;			
		}
	}
	
}
