package Utilities {
	
	public class UtilFrame {
	
		public static function isAttackFrame(frameLabel:String):Boolean {
			return (frameLabel && frameLabel.indexOf("attack") == 0);
		}
	
		public static function isWindowFrame(frameLabel:String):Boolean {
			return (frameLabel && frameLabel.indexOf("window") == 0);
		}
	
		public static function isStationaryFrame(frameLabel:String):Boolean {
			return (frameLabel && frameLabel.indexOf("stationary") == 0);
		}
	
		public static function getAttackName(frameLabel:String):String {
			var attackName:String;
			
			if (isAttackFrame(frameLabel)) {
				attackName = frameLabel.substring(7);
			}
		
			return attackName;
		}
	
		public static function getWindowNumber(frameLabel:String):uint {
			var number:uint = 0;
			
			if (isWindowFrame(frameLabel)) {
				number = uint(frameLabel.substring(7));
			}
		
			return number;
		}

	}
	
}
