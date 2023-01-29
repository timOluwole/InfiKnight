package Assets.HUD {
	
	import Assets.Asset;
	import Assets.HUD.HUDElements.PlayerHUDElements.*;
	import Assets.Units.AlliedUnits.InfiKnight;
	import Assets.Units.Unit;
	
	public class PlayerHUD extends Asset {

		private var healthBar:PlayerHUDHealthBarContainer;
		private var score:PlayerHUDScore;
		private var ammo:PlayerHUDAmmo;
		private var weaponCarousel:PlayerHUDWeaponCarousel;
		
		public function PlayerHUD(unit:Unit) {
			addHealthBar(unit);
			addScore();
			addAmmo(unit);
			addWeaponCarousel(unit);
		}
	
		private function addHealthBar(unit:Unit):void {
			healthBar = new PlayerHUDHealthBarContainer(unit);
			healthBar.x = 200 - (width / 2);
			healthBar.y = 50 - (height / 2);
			addChild(healthBar);
			healthBar.setUpComponents();			
		}
	
		private function addScore():void {
			score = new PlayerHUDScore();
			score.x = 40 - (width / 2);
			score.y = 35 - (height / 2);
			addChild(score);
			score.setUpComponents();			
		}
	
		private function addAmmo(unit:Unit):void {
			ammo = new PlayerHUDAmmo();
			ammo.x = 600 - (width / 2);
			ammo.y = 550 - (height / 2);
			addChild(ammo);
			ammo.setUpComponents();	
			ammo.checkForWeapon(InfiKnight(unit));		
		}
	
		private function addWeaponCarousel(unit:Unit):void {
			weaponCarousel = new PlayerHUDWeaponCarousel(unit);
			weaponCarousel.x = 1100 - (width / 2);
			weaponCarousel.y = 600 - (height / 2);
			addChild(weaponCarousel);
			weaponCarousel.setUpComponents();
			weaponCarousel.checkForWeapons(InfiKnight(unit));
		}

	}
	
}
