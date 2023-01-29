package Events {
	
	import Assets.Units.AlliedUnits.InfiKnight;	
	import flash.events.Event;
	
	public class KnightEvent extends Event {
		
		public static const KNIGHT_MOVEMENT:String = "KNIGHT_MOVEMENT";
		public static const KNIGHT_TRIGGER_DROP:String = "KNIGHT_TRIGGER_DROP";

		public var knight:InfiKnight; 
		
		public function KnightEvent( type:String, knight:InfiKnight, bubbles:Boolean = true, cancelable:Boolean = false) {
			super( type, bubbles, cancelable );
			this.knight = knight;
		}

	}
	
}
