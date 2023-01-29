package Assets.Drops.BuffDrops {	
	
	import Assets.Units.AlliedUnits.InfiKnight;
	import Events.KnightEvent;
	import Events.UnitEvent;
	import Factories.ParticleFactory;
	import flash.geom.Point;
	import Global.ParticleTypes;
	import Utilities.UtilMaths;
	
	public class HealDrop extends BuffDrop {		
		
		public function HealDrop() {
			
		}
	
		protected override function triggerDropEffect(k:KnightEvent):void {
			if (k) {
				if (k.knight) {
					var knightMaxHealth:uint = k.knight.getMaximumHealth();
					var heal:uint = UtilMaths.scatter10Percent(knightMaxHealth * 0.1);
					var location:Point = new Point(this.x, this.y);
					ParticleFactory.createParticleSpread(ParticleTypes.HEAL, location, k.knight);
					k.knight.dispatchEvent(new UnitEvent(UnitEvent.UNIT_HEAL_DAMAGE, k.knight, heal));
				}
			}
		}
	}
	
}
