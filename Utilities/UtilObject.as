package Utilities {
	
	import Assets.Asset;
	import Assets.Containers.HitBox;
	import Assets.Containers.HurtBox;
	import Assets.Units.Unit;
	import flash.utils.*;
	import Global.Teams;
	import Interfaces.ITeam;
	import Interfaces.IHurtable;
	import Interfaces.IHitter;
	
	public class UtilObject {

		public static function getClass(obj:Object):Object {
			return getDefinitionByName(getQualifiedClassName(obj));
		}
	
		public static function getHitBox(obj:IHitter):HitBox {
			var hitBox:HitBox = null;
			
			try {
				hitBox = obj["HitBox"];
			} catch (ex:Error) {
				
			}
		
			return hitBox;
		}
	
		public static function getHurtBox(obj:IHurtable):HurtBox {
			var hurtBox:HurtBox = null;
			
			try {
				hurtBox = obj["HurtBox"];
			} catch (ex:Error) {
				
			}
		
			return hurtBox;
		}
	
		public static function attackMakesContact(attacker:IHitter, attacked:IHurtable):Boolean {
			var hitBox:HitBox = getHitBox(attacker);
			var hurtBox:HurtBox = getHurtBox(attacked);
			
			if (hitBox && hurtBox) {
				return hitBox.hitTestObject(hurtBox);
			}
		
			return false;
		}
	
		public static function canAttack(attacker:ITeam, target:ITeam):Boolean {
			return (attacker.getTeam() != target.getTeam() && attacker.getTeam() != Teams.NONE);
		}
	
	}
	
}
