package Assets.HUD.HUDElements.EnemyHUDElements {
	
	import Assets.HUD.HUDElements.HUDHealthBarContainer;
	import Assets.Units.Unit;
	
	public class EnemyHUDHealthBarContainer extends HUDHealthBarContainer {

		public function EnemyHUDHealthBarContainer(attachedUnit:Unit) {
			this.scaleX = 0.2;
			this.scaleY = 0.2;
			
			super(attachedUnit);
		}

	}
	
}
