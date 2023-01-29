package Utilities {
	
	import Assets.Asset;
	import Assets.Containers.HitBox;
	import Assets.Containers.HurtBox;
	import Assets.Units.Unit;
	import flash.utils.*;
	
	public class UtilObject {

		public static function getClass(obj:Object):Object {
			return getDefinitionByName(getQualifiedClassName(obj));
		}
	
		public static function getHitBox(obj:Asset):HitBox {
			var hitBox:HitBox = null;
			
			try {
				hitBox = obj["HitBox"];
			} catch (ex:Error) {
				
			}
		
			return hitBox;
		}
	
		public static function getHurtBox(obj:Asset):HurtBox {
			var hurtBox:HurtBox = null;
			
			try {
				hurtBox = obj["HurtBox"];
			} catch (ex:Error) {
				
			}
		
			return hurtBox;
		}
	
		public static function attackMakesContact(attacker:Asset, attacked:Unit):Boolean {
			var hitBox:HitBox = getHitBox(attacker);
			var hurtBox:HurtBox = getHurtBox(attacked);
			
			if (hitBox && hurtBox) {
				return hitBox.hitTestObject(hurtBox);
			}
		
			return false;
		}
	
	}
	
}
