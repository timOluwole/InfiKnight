package Assets.Particles.HitParticles {
	
	import flash.geom.ColorTransform;	
	
	public class BugHitParticle extends HitParticle {

		public function BugHitParticle(startingX:Number, startingY:Number) {					
			var offsetX:Number = (Math.random() * 6) - 3;
			var offsetY:Number = (Math.random() * 6) - 3;
			
			startingX += offsetX;
			startingY += offsetY;
			
			super(startingX, startingY);
			
			this.alpha = 0.75 + (Math.random() * 0.25);
			this.scaleX = 0.5 + (Math.random() * 1);
			this.scaleY = this.scaleX;
			
			this.movementX = offsetX * 3;
			this.movementY = offsetY * 3;
			
			var myColorTransform:ColorTransform = new ColorTransform();
				myColorTransform.redOffset   = uint(Math.random() * 100);
				myColorTransform.greenOffset = 000;
				myColorTransform.blueOffset  = 000;
			
			this.transform.colorTransform = myColorTransform;
		}

	}
	
}
