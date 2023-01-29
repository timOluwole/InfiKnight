package Global {
	
	import Assets.Containers.DepthLayer;
	import flash.events.EventDispatcher;
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.geom.Point;
	
	public class Game {

		public static const DEPTH_FOREGROUND:uint = 1;
		public static const DEPTH_HUD:uint = 2;	
		
		public static var STAGE:Stage;
		public static var MID_STAGE:Point;
		public static var FRAME_RATE:uint;
		public static var UNIT_LAYER:DepthLayer;
		public static var HUD_LAYER:DepthLayer;
		public static var CONTEXT:InfiNight;	
		
		public static function SetUpStage(stage:Stage, context:InfiNight) {
			STAGE = stage;
			STAGE.scaleMode = StageScaleMode.NO_BORDER;
			MID_STAGE = new Point(STAGE.stageWidth / 2, STAGE.stageHeight / 2);
			CONTEXT = context;
			
			UNIT_LAYER = new DepthLayer();
			HUD_LAYER = new DepthLayer();
			FRAME_RATE = Game.STAGE.frameRate;
			CONTEXT.addChild(UNIT_LAYER);
			CONTEXT.addChild(HUD_LAYER);
			CONTEXT.setChildIndex(UNIT_LAYER, Game.DEPTH_FOREGROUND);
			CONTEXT.setChildIndex(HUD_LAYER, Game.DEPTH_HUD);
		}

	}
	
}
