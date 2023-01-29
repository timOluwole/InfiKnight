package Assets.Particles.HealParticles {
	
	import Assets.Particles.Particle;	
	import flash.events.Event;
	
	public class HealParticle extends Particle {
		
		
		public function HealParticle(startingX:Number, startingY) {
			super(startingX, startingY);
			
			this.movementX = 0;
			this.movementY = -3 - (Math.random() * 2);
			
			this.addListener(Event.ENTER_FRAME, showParticle);
		}
	
		private function showParticle(e:Event):void {
			this.movementX *= 0.9;
			this.movementY *= 0.9;
			this.alpha = Math.max(this.alpha - 0.02, 0);
		}
	}
	
}
