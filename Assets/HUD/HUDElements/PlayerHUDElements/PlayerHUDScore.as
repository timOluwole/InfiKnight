package Assets.HUD.HUDElements.PlayerHUDElements {
	
	import Assets.HUD.HUDElements.HUDElement;
	import Events.GameEvent;
	import flash.text.TextField;	
	import Global.Game;
	
	public class PlayerHUDScore extends HUDElement {
		
		protected var scoreText:TextField;

		public function PlayerHUDScore() {			
			Game.STAGE.addEventListener(GameEvent.GAME_UPDATE_SCORE, updateScore);
		}
	
		public override function setUpComponents() {
			scoreText = this["Score"];
		}
		
		public function updateScore(G:GameEvent):void {
			scoreText.text = G.value.toString();
		}

	}
	
}
