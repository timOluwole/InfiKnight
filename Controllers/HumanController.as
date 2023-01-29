package Controllers {
	
	import Assets.Units.AlliedUnits.InfiKnight;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	import Global.Directions;
	import Global.Game;
	import Utilities.UtilMaths;
	
	public class HumanController {
		
		private static const INPUT_KEYCODE_LEFT:int		= 65;	// A
		private static const INPUT_KEYCODE_RIGHT:int	= 68;	// D
		private static const INPUT_KEYCODE_UP:int		= 87;	// W
		private static const INPUT_KEYCODE_DOWN:int		= 83;	// S

		private var inputL:Boolean;
		private var inputR:Boolean;
		private var inputU:Boolean;
		private var inputD:Boolean;
		private var inputM:Boolean;
		
		private var knight:InfiKnight;	
		private var mouseTimer:Timer;
		
		public function HumanController(knight:InfiKnight) {
			this.knight = knight;
			this.knight.x = Game.MID_STAGE.x;
			this.knight.y = Game.MID_STAGE.y;
			
			Game.STAGE.addEventListener(KeyboardEvent.KEY_UP, keysUp);
			Game.STAGE.addEventListener(KeyboardEvent.KEY_DOWN, keysDown);	
			Game.STAGE.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			Game.STAGE.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			Game.STAGE.addEventListener(MouseEvent.MOUSE_WHEEL, scroll);
			Game.STAGE.addEventListener(Event.ENTER_FRAME, playFrame);		
			
			mouseTimer = new Timer(10);
			mouseTimer.addEventListener(TimerEvent.TIMER, catchMouseInputs);
			mouseTimer.start();
		}
	
		private function keysUp(K:KeyboardEvent):void {
			if (K.keyCode == INPUT_KEYCODE_LEFT) {
				inputL = false;
			}
			if (K.keyCode == INPUT_KEYCODE_RIGHT) {
				inputR = false;
			}
			if (K.keyCode == INPUT_KEYCODE_UP) {
				inputU = false;
			}
			if (K.keyCode == INPUT_KEYCODE_DOWN) {
				inputD = false;
			}
		}
		
		private function keysDown(K:KeyboardEvent):void {
			if (K.keyCode == INPUT_KEYCODE_LEFT) {
				inputL = true;
				inputR = false;
			}
			if (K.keyCode == INPUT_KEYCODE_RIGHT) {
				inputR = true;
				inputL = false;
			}
			if (K.keyCode == INPUT_KEYCODE_UP) {
				inputU = true;
				inputD = false;
			}
			if (K.keyCode == INPUT_KEYCODE_DOWN) {
				inputD = true;
				inputU = false;
			}
		}
	
		private function mouseUp(M:MouseEvent):void {
			if (M) {
				inputM = false;
			}
		}
	
		private function mouseDown(M:MouseEvent):void {
			if (M) {
				inputM = true;
			}
		}

		private function playFrame(E:Event):void {
			var direction:String = ""; 
			
			if (inputU) {
				direction = (inputR) ? Directions.UP_RIGHT : Directions.UP;
			} else if (inputR) {
				direction = (inputD) ? Directions.RIGHT_DOWN : Directions.RIGHT;
			}  else if (inputD) {
				direction = (inputL) ? Directions.DOWN_LEFT : Directions.DOWN;
			} else if (inputL) {
				direction = (inputU) ? Directions.LEFT_UP : Directions.LEFT;
			}
		
			if (!inputU && !inputD && !inputL && !inputR){
				knight.stand(UtilMaths.getFacingRotation(knight));
			} else if (direction != "") {
				var facingAngle:Number = UtilMaths.getFacingRotation(knight);
				var movementAngle:Number = UtilMaths.getDirectionRotation(direction);
				knight.walk(facingAngle, facingAngle + movementAngle, direction);
			}
		}
	
		private function catchMouseInputs(T:TimerEvent):void {
			if (inputM) {
				knight.useWeapon();
			}
		}
	
		private function scroll(M:MouseEvent):void {
			if (M.delta > 0) {
				knight.cycleThroughWeapons(1);
			} else if (M.delta < 0) {
				knight.cycleThroughWeapons(-1);
			}
		}
	}
	
}
