package Assets.Projectiles {
	
	import Assets.Asset;
	import Assets.Containers.HitBox;
	import Events.ProjectileEvent;
	import Events.UnitEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import Global.Game;
	import Interfaces.IHitter;
	import Interfaces.ITeam;	
	
	public class Projectile extends Asset implements ITeam, IHitter {

		protected var sourceTeam:String;
		protected var damage:uint;
		protected var damageType:String;
		protected var speed:uint;
		protected var lifeTime:uint;
		protected var maximumLifeTime:uint;
		protected var hitBox:MovieClip;
		
		public function Projectile(sourceTeam:String, damage:uint, damageType:String, speed:uint, maximumLifeTimeSeconds:uint) {				
			Game.UNIT_LAYER.addChild(this);
			
			this.sourceTeam = sourceTeam;
			this.damage = damage;
			this.damageType = damageType;
			this.speed = speed;
			this.maximumLifeTime = maximumLifeTimeSeconds * Game.STAGE.frameRate;
			this.lifeTime = 0;
			this.hitBox = this["HitBox"];
			
			this.addListener(Event.ENTER_FRAME, inFlight);
			this.addListener(ProjectileEvent.PROJECTILE_HIT, projectileHit);
		}
	
		public function move():void {			
			x += calculateSpeed() * Math.sin(rotation / 180 * Math.PI);
			y -= calculateSpeed() * Math.cos(rotation / 180 * Math.PI);
		}
	
		private function inFlight(E:Event):void {
			if (lifeTime >= maximumLifeTime) {
				this.deleteThis();
			}
			
			lifeTime++;
			move();
		
			Game.STAGE.dispatchEvent(new ProjectileEvent(ProjectileEvent.PROJECTILE_HIT_CHECK, this));			
		}
	
		private function projectileHit(p:ProjectileEvent):void {
			if (p) {
				if (p.unitHit) {	// ensuring unit has not disappeared
					var healthChange:uint = -p.projectile.getDamage();
					p.unitHit.dispatchEvent(new UnitEvent(UnitEvent.UNIT_GET_HIT, p.unitHit, healthChange, this, this.damageType));
					p.unitHit.dispatchEvent(new UnitEvent(UnitEvent.UNIT_TAKE_DAMAGE, p.unitHit, healthChange));
					this.dispatchEvent(new ProjectileEvent(ProjectileEvent.PROJECTILE_HIT_COMPLETE, this));
				}
			}
		}
	
		private function calculateSpeed():uint {
			return speed / Game.STAGE.frameRate;
		}
	
		public function getTeam():String {
			return this.sourceTeam;
		}
	
		public function getDamage() {
			return this.damage;
		}
	
		public function getHitBox():HitBox {
			var hitBox:HitBox = null;
			
			try {
				hitBox = this["HitBox"];
			} catch (ex:Error) {
				
			}
		
			return hitBox;
		}

	}
	
}
