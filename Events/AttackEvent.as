package Events {
	
	import Assets.Units.Unit;
	import Data.AttackData.AttackData;
	import flash.events.Event;
	
	public class AttackEvent extends Event {
		
		public static const ATTACK_HIT:String = "ATTACK_HIT";
		public static const ATTACK_HIT_COMPLETE:String = "ATTACK_HIT_COMPLETE";
		
		public var unitHit:Unit;
		public var attack:AttackData;
		
		public function AttackEvent( type:String, unitHit:Unit = null, attack:AttackData = null, bubbles:Boolean = true, cancelable:Boolean = false) {
			super( type, bubbles, cancelable );
			this.unitHit = unitHit;
			this.attack = attack;
		}

	}
	
}
