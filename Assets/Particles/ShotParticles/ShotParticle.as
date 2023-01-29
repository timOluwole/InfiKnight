package Assets.Particles.ShotParticles {
	
	import Assets.Particles.Particle;	
	import flash.events.Event;
	
	public class ShotParticle extends Particle {

		public function ShotParticle(startingX:Number, startingY:Number) {			
			super(startingX, startingY);
			
			this.addListener(Event.ENTER_FRAME, showParticle);
		}
	
		private function showParticle(e:Event):void {
			this.alpha = Math.max(this.alpha - 0.05, 0);
		}

	}
	
}
