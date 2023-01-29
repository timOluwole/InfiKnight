package Assets.Containers {
	
	import Assets.Asset;
	import Assets.Units.Unit;
	
	public class HitBox extends Asset {
		
		var alreadyHitTargets:Array;
		
		public function HitBox() {
			alreadyHitTargets = new Array;
		}
	
		public function addUnitToHitTargets(unit:Unit):void {
			alreadyHitTargets.push(unit);
		}
	
		public function hasAlreadyHitUnit(unit:Unit):Boolean {
			return (alreadyHitTargets.indexOf(unit) != -1);
		}

	}
	
}
