package Assets.Weapons {
	
	import Assets.Asset;
	import Assets.Units.AlliedUnits.InfiKnight;
	import Events.WeaponEvent;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Global.Game;
	import Global.Teams;
	import Interfaces.ITeam;
	
	public class Weapon extends Asset implements ITeam {

		protected var wielder:InfiKnight;
		protected var damage:uint;
		protected var damageType:String;
		private var weaponName:String;
		
		public function Weapon(weaponName:String, damageType:String) {
			this.weaponName = weaponName;
			this.damageType = damageType;
			
			Game.STAGE.addEventListener(WeaponEvent.WEAPON_ACQUIRE, weaponAcquired);
			
		}
	
		public function useWeapon():void {
			/* to be implemented by individual weapon */ 
		}
	
		public function getWeaponName():String {
			return weaponName;
		}
	
		public function getDamage():uint {
			return this.damage;
		}
	
		private function weaponAcquired(w:WeaponEvent):void {
			if (w) {
				if (w.wielder && w.weapon == this) {
					this.wielder = InfiKnight(w.wielder);
				}
			}
		}
	
		public function getTeam():String {
			return ((this.wielder) ? this.wielder.getTeam() : Teams.NONE);
		}
	}
	
}
