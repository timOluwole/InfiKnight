package Assets.Projectiles {
	
	import Assets.Asset;
	import Assets.Containers.HitBox;
	import Assets.Units.Unit;
	import Assets.Weapons.Weapon;
	import Events.ProjectileEvent;
	import Events.UnitEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import Global.Game;
	import Interfaces.IHitter;
	import Interfaces.ITeam;	
	import Utilities.UtilMaths;
	
	public class Projectile extends Asset implements ITeam, IHitter {

		protected var damage:uint;
		protected var damageType:String;
		protected var speed:uint;
		protected var lifeTime:uint;
		protected var maximumLifeTime:uint;
		protected var sourceUnit:Unit;
		protected var sourceWeapon:Weapon;
		
		public function Projectile(damage:uint, damageType:String, speed:uint, maximumLifeTimeSeconds:uint, sourceUnit:Unit, sourceWeapon:Weapon = null) {				
			Game.UNIT_LAYER.addChild(this);
			
			this.damage = damage;
			this.damageType = damageType;
			this.speed = speed;
			this.maximumLifeTime = maximumLifeTimeSeconds * Game.STAGE.frameRate;
			this.lifeTime = 0;
			this.sourceUnit = sourceUnit;
			this.sourceWeapon = sourceWeapon;
			
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
					var damageDealt:uint = UtilMaths.calculateDamage(this.damage, this.damageType, this.sourceUnit, p.unitHit);	
					damageDealt = UtilMaths.scatter10Percent(damageDealt);	
					
					p.unitHit.dispatchEvent(new UnitEvent(UnitEvent.UNIT_GET_HIT, p.unitHit, -damageDealt, this, this.damageType));
					p.unitHit.dispatchEvent(new UnitEvent(UnitEvent.UNIT_TAKE_DAMAGE, p.unitHit, -damageDealt));
					this.dispatchEvent(new ProjectileEvent(ProjectileEvent.PROJECTILE_HIT_COMPLETE, this));
				}
			}
		}
	
		private function calculateSpeed():uint {
			return speed / Game.STAGE.frameRate;
		}
	
		public function getTeam():String {
			return this.sourceUnit.getTeam();
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
