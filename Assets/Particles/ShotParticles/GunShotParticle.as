package Assets.Particles.ShotParticles {
	
	public class GunShotParticle extends ShotParticle {

		public function GunShotParticle(startingX:Number, startingY:Number, rotation:Number) {		
			super(startingX, startingY);
			
			this.scaleX = 0.5;
			this.scaleY = 0.5;
			this.rotation = rotation;
		}

	}
	
}
