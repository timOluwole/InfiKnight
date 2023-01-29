package Utilities {
	
	import Assets.Asset;
	import Assets.Units.Unit;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import Global.Directions;
	import Global.Game;
	
	public class UtilMaths {

		public static function distance(position1:Point, position2:Point):Number {
			var dx:Number = position2.x - position1.x;
			var dy:Number = position2.y - position1.y;
			
			return Math.pow(Math.pow(dx, 2) + Math.pow(dy, 2), 0.5);
		}
	
		public static function getFacingRotation(unit:Unit):Number {			
			var vectorToMouse:Vector3D = new Vector3D(Game.CONTEXT.mouseX - unit.x, Game.CONTEXT.mouseY - unit.y);			
			var vectorAngle:int = Math.atan(vectorToMouse.x / -vectorToMouse.y) * 180 / Math.PI;
			
			if (vectorToMouse.y > 0) {
				vectorAngle += 180;
			}
			
			return vectorAngle;
		}
	
		public static function getDirectionRotation(direction:String):Number {
			var directionRotation:int;
			
			switch (direction) {
				case Directions.UP:
					directionRotation = 0;
					break;
				case Directions.UP_RIGHT:
					directionRotation = 45;
					break;
				case Directions.RIGHT:
					directionRotation = 90;
					break;
				case Directions.RIGHT_DOWN:
					directionRotation = 135;
					break;
				case Directions.DOWN:
					directionRotation = 180;
					break;
				case Directions.DOWN_LEFT:
					directionRotation = -135;
					break;
				case Directions.LEFT:
					directionRotation = -90;
					break;
				case Directions.LEFT_UP:
					directionRotation = -45;
					break;
			}
		
			return directionRotation;
		}
	
		public static function getTransformedPoint(obj:Asset, displacementX:Number = 0, displacementY:Number = 0):Point {
			var lastParent:DisplayObject = obj.parent;
			var newX:Number = obj.x + (displacementX * obj.scaleX);
			var newY:Number = obj.y + (displacementY * obj.scaleY);
			var newPoint:Point = new Point(newX, newY);
			
			while (lastParent != Game.UNIT_LAYER && lastParent != Game.STAGE) {
				newPoint = rotatePoint(newPoint, lastParent.rotation);
				newPoint.x *= lastParent.scaleX;
				newPoint.y *= lastParent.scaleY;
				newPoint.x += lastParent.x;
				newPoint.y += lastParent.y;

				lastParent = lastParent.parent;
			}
		
			return newPoint;
		}
	
		public static function rotatePoint(point:Point, rotationInDegrees:Number):Point {
			var newX:Number = (point.x * Math.cos(radial(rotationInDegrees))) + (-point.y * Math.sin(radial(rotationInDegrees)));
			var newY:Number = (point.x * Math.sin(radial(rotationInDegrees))) + (point.y * Math.cos(radial(rotationInDegrees)));	
			
			return new Point(newX, newY);
		}
	
		public static function radial(rotationInDegrees:Number):Number {
			return (rotationInDegrees / 180 * Math.PI);
		}
	
		public static function scatter10Percent(value:Number):Number {
			return ((0.9 + (Math.random() * 0.2)) * value);
		}
	
		public static function seconds(numberOfSeconds:uint):uint {
			return numberOfSeconds * 1000;
		}
	
		public static function minutes(numberOfMinutes:uint):uint {
			return numberOfMinutes * 60000;
		}

	}
	
}
