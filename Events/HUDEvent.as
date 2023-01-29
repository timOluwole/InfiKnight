package Events {
	import flash.events.Event;
	
	public class HUDEvent extends Event {
		
		public static const HUD_DAMAGE_FOLLOW:String = "DAMAGE_FOLLOW";

		public var value:Number; 
		
		public function HUDEvent( type:String, value:Number = 0, bubbles:Boolean = true, cancelable:Boolean = false) {
			super( type, bubbles, cancelable );
			this.value = healthChange;
		}

	}
	
}
