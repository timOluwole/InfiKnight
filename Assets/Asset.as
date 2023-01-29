package Assets {
	import flash.utils.Dictionary;
	import flash.display.MovieClip;
	import Utilities.UtilObject;
	import Assets.Drops.BuffDrops.HealDrop;
	
	public class Asset extends MovieClip {

		var listeners:Dictionary;
		
		public function Asset() {
			listeners = new Dictionary();
		}
	
		public function addListener(eventType:String, listenerFunction:Function):void {
			if (!listeners[eventType]) {
				listeners[eventType] = new Array(listenerFunction);
			} else {
				(listeners[eventType] as Array).push(listenerFunction);
			}
		
			this.addEventListener(eventType, listenerFunction);
		}
	
		public function clearListeners():void {
			for (var key:String in listeners) {
				var eventType:String = key;
				var functions:Array = listeners[key];
				
				for each (var listenerFunction:Function in functions) {
					this.removeEventListener(eventType, listenerFunction);
				}
			}
		}
	
		protected function deleteThis() {
			clearListeners();
			if (parent) {
				this.parent.removeChild(this);
			}
		}

	}
	
}
