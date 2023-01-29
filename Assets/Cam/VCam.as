package Assets.Cam {
	
	import Assets.Asset;
	import Assets.Units.AlliedUnits.InfiKnight;
	import flash.events.Event;
	import Global.Game;
	
	public class VCam extends Asset {

		private var knight:InfiKnight;
		
		public function VCam() {
			this.width = Game.STAGE.stageWidth;
			this.height = Game.STAGE.stageHeight;
			
			this.addListener(Event.ENTER_FRAME, handleEnterFrame);
		}
	
		public function attachToKnight(knight:InfiKnight):void {
			this.knight = knight;
		}

		private function handleEnterFrame(e:Event):void {
			if (parent) {
				x = knight.x; 
				y = knight.y; 
				parent.scaleX = 1 / scaleX;
				parent.scaleY = 1 / scaleY;						
				parent.x = (width / 2 - x) / scaleX;
				parent.y = (height / 2 - y) / scaleY;
			}
		}
	}
	
}
