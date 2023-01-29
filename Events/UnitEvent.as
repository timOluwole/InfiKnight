package Events {
	
	import Assets.Asset;
	import Assets.Units.Unit;
	import flash.events.Event;
	import Global.DamageTypes;

	public class UnitEvent extends Event {
		
		public static const UNIT_ATTACK_HIT_CHECK:String = "UNIT_ATTACK_HIT_CHECK";
		public static const UNIT_DESPAWN:String = "UNIT_DESPAWN";
		public static const UNIT_DIE:String = "UNIT_DIE";
		public static const UNIT_GET_HIT:String = "UNIT_GET_HIT";
		public static const UNIT_HEAL_DAMAGE:String = "UNIT_HEAL_DAMAGE";
		public static const UNIT_TAKE_DAMAGE:String = "UNIT_TAKE_DAMAGE";
		public static const UNIT_UPDATE_HEALTH:String = "UNIT_UPDATE_HEALTH";

		public var unit:Unit; 
		public var healthChange:int; 
		public var attackSource:Asset; 
		public var damageType:String; 
		
		public function UnitEvent( type:String, unit:Unit, healthChange:int = 0, attackSource:Asset = null, damageType:String = DamageTypes.TRUE, bubbles:Boolean = true, cancelable:Boolean = false) {
			super( type, bubbles, cancelable );
			this.unit = unit;
			this.healthChange = healthChange;
			this.attackSource = attackSource;
			this.damageType = damageType;
		}

	}
	
}
