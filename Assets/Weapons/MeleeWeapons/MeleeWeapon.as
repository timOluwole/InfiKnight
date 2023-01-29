package Assets.Weapons.MeleeWeapons {
	
	import Assets.Containers.HitBox;
	import Assets.Units.Unit;
	import Assets.Weapons.Weapon;
	import Events.UnitEvent;
	import Events.WeaponEvent;
	import flash.events.Event;
	import Global.Game;
	import Interfaces.IHitter;
	import Utilities.UtilFrame;
	import Utilities.UtilMaths;
	
	public class MeleeWeapon extends Weapon implements IHitter {

		public function MeleeWeapon(weaponName:String, damageType:String) {
			super(weaponName, damageType);			
			
			this.addListener(Event.ENTER_FRAME, playFrames);
			this.addListener(WeaponEvent.WEAPON_HIT, weaponHit);
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
					var damageDealt:uint = UtilMaths.calculateDamage(this.damage, this.damageType, this.wielder, w.unitHit);	
					damageDealt = UtilMaths.scatter10Percent(damageDealt);		
				
					w.unitHit.dispatchEvent(new UnitEvent(UnitEvent.UNIT_GET_HIT, w.unitHit, -damageDealt, this, this.damageType));
					w.unitHit.dispatchEvent(new UnitEvent(UnitEvent.UNIT_TAKE_DAMAGE, w.unitHit, -damageDealt));
					this.dispatchEvent(new WeaponEvent(WeaponEvent.WEAPON_HIT_COMPLETE, this));
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
			var hitBox:HitBox = getHitBox();
			return (hitBox && hitBox.hasAlreadyHitUnit(unit));
		}

	}
	
}
