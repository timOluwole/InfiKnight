package Factories {
	
	import Assets.Containers.HurtBox;
	import Assets.Particles.Particle;
	import Assets.Particles.HitParticles.*;
	import Assets.Particles.HealParticles.*;
	import Assets.Units.Unit;
	import Global.ParticleTypes;
	import flash.geom.Point;	
	import Global.Game;
	import Utilities.UtilObject;
	
	
	public class ParticleFactory {
		
		public static function createParticleSpread(particleType:String, spreadOrigin:Point, unit:Unit = null):void {
			switch (particleType) {
				case ParticleTypes.BUG_HIT:
						createBugParticleSpread(spreadOrigin);
					break;
				case ParticleTypes.HEAL:
						createHealParticleSpread(spreadOrigin, unit);
					break;
				default:
					break;
			}		
		}
	
		private static function createBugParticleSpread(spreadOrigin:Point):void {		
			var spreadAmount:uint = 5 + Math.round(Math.random() * 2);
			for (var i:uint = 0; i < spreadAmount; i++) {
				Game.UNIT_LAYER.addChild(new BugHitParticle(spreadOrigin.x, spreadOrigin.y));
			}
		}
	
		private static function createHealParticleSpread(spreadOrigin:Point, unit:Unit):void {		
			var glowCount:uint = 7 + Math.round(Math.random() * 3);
			var starCount:uint = 3 + Math.round(Math.random() * 2);
			
			var hurtBox:HurtBox = UtilObject.getHurtBox(unit);
			
			var unitWidth:Number = (hurtBox) ? hurtBox.width * unit.scaleX : unit.width;
			var unitHeight:Number = (hurtBox) ? hurtBox.height * unit.scaleY : unit.height;
			var unitLeft:Number = unit.x - (unitWidth / 2);
			var unitTop:Number = unit.y - (unitHeight / 2);
			
			for (var i:uint = 0; i < glowCount; i++) {
				var glowX:Number = unitLeft + (Math.random() * unitWidth);
				var glowY:Number = unitTop + (Math.random() * unitHeight);
				
				Game.UNIT_LAYER.addChild(new GlowHealParticle(glowX, glowY));
			}
			
			for (var j:uint = 0; j < starCount; j++) {
				var starX:Number = unitLeft + (Math.random() * unitWidth);
				var starY:Number = unitTop + (Math.random() * unitHeight);
				
				Game.UNIT_LAYER.addChild(new StarHealParticle(starX, starY));
			}
		}

	}
	
}
