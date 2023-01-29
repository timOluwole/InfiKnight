package Assets.Particles.HitParticles {
	
	import Assets.Particles.Particle;	
	import flash.events.Event;
	
	public class HitParticle extends Particle {

		public function HitParticle(startingX:Number, startingY:Number) {
			super(startingX, startingY);
			
			this.addListener(Event.ENTER_FRAME, showParticle);
		}
	
		private function showParticle(e:Event):void {
			this.movementX *= 0.9;
			this.movementY *= 0.9;
			this.alpha = Math.max(this.alpha - 0.05, 0);
		}

	}
	
}
