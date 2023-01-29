package Events {
	
	import Assets.Units.Unit;
	import Assets.Weapons.Weapon;
	import flash.events.Event;
	
	public class WeaponEvent extends Event {
		
		public static const WEAPON_ACQUIRE:String = "WEAPON_ACQUIRE";
		public static const WEAPON_CHANGE:String = "WEAPON_CHANGE";
		public static const WEAPON_FIRE:String = "WEAPON_FIRE";
		public static const WEAPON_HIT:String = "WEAPON_HIT";
		public static const WEAPON_HIT_CHECK:String = "WEAPON_HIT_CHECK";
		public static const WEAPON_HIT_COMPLETE:String = "WEAPON_HIT_COMPLETE";
		
		public var weapon:Weapon;
		public var unitHit:Unit;
		public var wielder:Unit;
		public var value:Number;
		
		public function WeaponEvent( type:String, weapon:Weapon = null, unitHit:Unit = null, wielder:Unit = null, value:Number = 0, bubbles:Boolean = true, cancelable:Boolean = false) {
			super( type, bubbles, cancelable );
			this.weapon = weapon;
			this.unitHit = unitHit;
			this.wielder = wielder;
			this.value = value;
		}

	}
	
}
