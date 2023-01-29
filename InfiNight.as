package {
	
	import Assets.Cam.VCam;
	import Assets.HUD.PlayerHUD;
	import Assets.Units.AlliedUnits.InfiKnight;
	import Controllers.HumanController;
	import Factories.EnemyFactory;
	import flash.display.MovieClip;
	import Global.Game;
	import Objects.GameRun;	
	
	public class InfiNight extends MovieClip {

		public function InfiNight() {
			Game.SetUpStage(stage, this);
			var run:GameRun = new GameRun();
			
			setUpHUD(run.getKnight());
		}
		
		public function setUpHUD(knight:InfiKnight) {
			var vCam:VCam = new VCam();
			vCam.attachToKnight(knight);	
			
			var hud:PlayerHUD = new PlayerHUD(knight);
			knight.initialiseHealth(500);
			addChild(vCam);						
			vCam.addChild(hud);
		}

	}
	
}
