package Events {
	import flash.events.Event;
	
	public class GameEvent extends Event {
		
		public static const GAME_UPDATE_SCORE:String = "GAME_UPDATE_SCORE";
		
		public var value:Number = 0;
		
		public function GameEvent( type:String, value:Number = 0, bubbles:Boolean = true, cancelable:Boolean = false) {
			super( type, bubbles, cancelable );
			this.value = value;
		}

	}
	
}
