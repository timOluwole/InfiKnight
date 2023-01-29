package Assets.Particles.HealParticles {
	
	import flash.filters.GlowFilter;
	import flash.filters.BitmapFilterQuality;
	import fl.motion.Color;
	
	public class GlowHealParticle extends HealParticle {
		
		
		public function GlowHealParticle(startingX:Number, startingY) {
			super(startingX, startingY);
			
			this.scaleX = this.scaleY = 1 + Math.random();
			this.alpha = 0.2 + (Math.random() * 0.1);
			
			var greenAmount:uint = (160 + Math.round(Math.random() * 40)) * 256;
			
			var glow:GlowFilter = new GlowFilter(greenAmount, 1, 15 * this.scaleX, 15 * this.scaleY, 2, BitmapFilterQuality.HIGH, false, false);
			this.filters = [glow];
			
		}
	}
	
}
