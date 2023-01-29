package Assets.Weapons {
	
	import Assets.Asset;
	import Assets.Containers.HitBox;
	import Assets.Units.Unit;
	import Events.WeaponEvent;
	import Events.UnitEvent;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Global.Game;
	import Utilities.UtilFrame;
	import Utilities.UtilMaths;
	import flash.geom.Point;
	
	public class Weapon extends Asset {

		protected var wielderTeam:String;
		public var firingTimer:Timer;
		public var firingInteral:int; // milliseconds
		public var canFire:Boolean;
		protected var currentAmmo:uint;
		protected var maximumAmmo:uint;
		protected var damage:uint;
		protected var damageType:String;
		private var weaponName:String;
		
		protected var firingPointX:Number = 0;
		protected var firingPointY:Number = 0;
		
		public function Weapon(firingInterval:int, weaponName:String) {
			this.firingInteral = firingInterval;
			this.weaponName = weaponName;
			this.canFire = true;
			
			firingTimer = new Timer(firingInteral, 1);
			firingTimer.addEventListener(TimerEvent.TIMER_COMPLETE, canFireAgain);
			this.addListener(WeaponEvent.WEAPON_HIT, weaponHit);
			Game.STAGE.addEventListener(WeaponEvent.WEAPON_ACQUIRE, weaponAcquired);
			this.addListener(Event.ENTER_FRAME, playFrames);
			
		}
	
		public function fire() {
			attack();
			canFire = false;
			firingTimer.reset();
			firingTimer.start();
		}
	
		public function canFireAgain(T:TimerEvent):void {
			canFire = true;
		}

		public function attack():void { /* to be implemented by individual weapon */ }
	
		public function getCurrentAmmo():uint {
			return currentAmmo;
		}
	
		public function getMaximumAmmo():uint {
			return maximumAmmo;
		}
	
		public function getWeaponName():String {
			return weaponName;
		}
	
		public function getDamage() {
			return this.damage;
		}
	
		private function playFrames(e:Event):void {
			var hitBox:HitBox = getHitBox();
			
			if (UtilFrame.isAttackFrame(this.currentLabel) && hitBox) {
				Game.STAGE.dispatchEvent(new WeaponEvent(WeaponEvent.WEAPON_HIT_CHECK, this));				
			}
		}
	
		private function weaponHit(w:WeaponEvent):void {
			if (w) {
				if (w.unitHit) {	// ensuring unit has not disappeared
					var hitBox:HitBox = getHitBox();
					
					if (hitBox) {
						hitBox.addUnitToHitTargets(w.unitHit);
					}
					var healthCnange:uint = -UtilMaths.scatter10Percent(damage);
					w.unitHit.dispatchEvent(new UnitEvent(UnitEvent.UNIT_GET_HIT, w.unitHit, healthCnange, this, this.damageType));
					w.unitHit.dispatchEvent(new UnitEvent(UnitEvent.UNIT_TAKE_DAMAGE, w.unitHit, healthCnange));
					this.dispatchEvent(new WeaponEvent(WeaponEvent.WEAPON_HIT_COMPLETE, this));
				}
			}
		}
	
		private function weaponAcquired(w:WeaponEvent):void {
			if (w) {
				if (w.wielder && w.weapon && w.weapon == this) {
					this.wielderTeam = w.wielder.getTeam();
				}
			}
		}
	
		public function getHitBox():HitBox {
			var hitBox:HitBox = null;
			
			try {
				hitBox = this["HitBox"];
			} catch (ex:Error) {
				
			}
		
			return hitBox;
		}
	
		public function hasAlreadyHitUnit(unit:Unit):Boolean {
			var hitBox:HitBox = getHitBox()
			return (hitBox && hitBox.hasAlreadyHitUnit(unit));
		}
	
		public function getWielderTeam() {
			return this.wielderTeam;
		}
	}
	
}
