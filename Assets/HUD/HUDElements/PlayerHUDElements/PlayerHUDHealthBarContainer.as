package Assets.HUD.HUDElements.PlayerHUDElements {
	
	import Assets.HUD.HUDElements.HUDHealthBarContainer;
	import Assets.Units.Unit;
	
	public class PlayerHUDHealthBarContainer extends HUDHealthBarContainer {

		public function PlayerHUDHealthBarContainer(attachedUnit:Unit) {
			this.scaleX = 0.8;
			this.scaleY = 0.8;
			
			super(attachedUnit);
		}

	}
	
}
