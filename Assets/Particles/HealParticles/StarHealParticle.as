package Assets.Particles.HealParticles {	
	
	import flash.filters.GlowFilter;
	import flash.filters.BitmapFilterQuality;
	import fl.motion.Color;
	
	public class StarHealParticle extends HealParticle {
		
		
		public function StarHealParticle(startingX:Number, startingY) {
			super(startingX, startingY);
			
			this.scaleX = this.scaleY = 0.4 + (Math.random() * 0.8);
			this.alpha = 0.6 + (Math.random() * 0.2);
			
			var whiteLevel:uint = 200 + Math.round(Math.random() * 55);
			var colour:uint = (whiteLevel * 256 * 256) + (0xFF * 256) + whiteLevel;
			
			var glow:GlowFilter = new GlowFilter(colour, 1, 15 * this.scaleX, 15 * this.scaleY, 2, BitmapFilterQuality.HIGH, false, false);
			this.filters = [glow];
		}
	}
	
}
