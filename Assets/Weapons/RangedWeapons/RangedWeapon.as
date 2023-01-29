package Assets.Weapons.RangedWeapons {
	
	import Assets.Weapons.Weapon;
	import Events.UnitEvent;
	import Events.WeaponEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import Interfaces.IFire;
	
	public class RangedWeapon extends Weapon implements IFire {
		
		public var firingTimer:Timer;
		public var firingInteral:int; // milliseconds
		public var canFire:Boolean;
		protected var currentAmmo:uint;
		protected var maximumAmmo:uint;

		protected var firingPointX:Number = 0;
		protected var firingPointY:Number = 0;

		public function RangedWeapon(weaponName:String, damageType:String, firingInterval:uint, ammoCapacity:uint) {
			super(weaponName, damageType);		

			this.firingInteral = firingInterval;
			this.currentAmmo = this.maximumAmmo = ammoCapacity;
			this.canFire = true;
			
			firingTimer = new Timer(firingInteral, 1);
			firingTimer.addEventListener(TimerEvent.TIMER_COMPLETE, canFireAgain);
		}

		public override function useWeapon():void {
			if (canFire) {
				fire();
				canFire = false;
				firingTimer.reset();
				firingTimer.start();
			}
		}

		public function canFireAgain(T:TimerEvent):void {
			canFire = true;
		}

		public function fire():void { /* to be implemented by individual weapon */ }

		public function getCurrentAmmo():uint {
			return currentAmmo;
		}

		public function getMaximumAmmo():uint {
			return maximumAmmo;
		}
	}
	
}
