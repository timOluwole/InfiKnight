package Assets.Particles {
	
	import Assets.Asset;
	import flash.events.Event;
	
	public class Particle extends Asset {

		protected var movementX:Number = 0;
		protected var movementY:Number = 0;
		
		public function Particle(startingX:Number, startingY:Number) {
			this.x = startingX;
			this.y = startingY;
			
			this.addListener(Event.ENTER_FRAME, particleFall);
		}
	
		private function particleFall(e:Event):void {
			this.x += movementX;
			this.y += movementY;
			
			if (this.alpha <= 0) {
				this.deleteThis();
			}
		}

	}
	
}
