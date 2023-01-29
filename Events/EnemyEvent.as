package Events {
	
	import Assets.Units.EnemyUnits.EnemyUnit;
	import flash.events.Event;
	
	public class EnemyEvent extends Event {
		
		public static const ENEMY_LOCATE_KNIGHT:String = "LOCATE_KNIGHT";
	
		public var enemy:EnemyUnit;
		
		public function EnemyEvent( type:String, enemy:EnemyUnit, bubbles:Boolean = true, cancelable:Boolean = false) {
			super( type, bubbles, cancelable );
			this.enemy = enemy;
		}

	}
	
}
