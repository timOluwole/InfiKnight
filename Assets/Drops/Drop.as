package Assets.Drops {
	
	import Assets.Asset;
	import Events.KnightEvent;
	import Assets.Units.AlliedUnits.InfiKnight;
	import flash.filters.GlowFilter;
	import flash.filters.BitmapFilterQuality;
	import Global.Game;
	import Assets.Containers.HurtBox;
	import Utilities.UtilObject;
	
	public class Drop extends Asset {

		public function Drop() {
			this.scaleX = this.scaleY = 0.3;
			
			var glow:GlowFilter = new GlowFilter(0xFFFFFF, 1, 20, 20, 2, BitmapFilterQuality.HIGH, false, false);
			this.filters = [glow];
			
			Game.STAGE.addEventListener(KnightEvent.KNIGHT_MOVEMENT, detectKnights);			
			this.addListener(KnightEvent.KNIGHT_TRIGGER_DROP, triggerDropEffect);
		}
	
		public function detectKnights(k:KnightEvent):void {
			if (k) {
				if (k.knight) {
					var hurtBox:HurtBox = UtilObject.getHurtBox(k.knight);
					if (hurtBox.hitTestObject(this)) {
						this.dispatchEvent(new KnightEvent(KnightEvent.KNIGHT_TRIGGER_DROP, k.knight));
						this.deleteThis();
					}
				}
			}
		}
	
		protected function triggerDropEffect(k:KnightEvent):void {
			
		}

	}
	
}
