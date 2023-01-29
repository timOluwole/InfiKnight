package Assets.HUD.HUDElements.PlayerHUDElements {
	
	import Assets.HUD.HUDElements.HUDElement;
	import Assets.Icons.WeaponIcons.WeaponIcon;
	import Assets.Units.AlliedUnits.InfiKnight;
	import Assets.Units.Unit;
	import Events.WeaponEvent;
	import Factories.IconFactory;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Global.Game;
	import Assets.Weapons.Weapon;
	
	public class PlayerHUDWeaponCarousel extends HUDElement {
		
		private const SCROLL_TICKS:uint = 10;
		private const SCROLL_DISTANCE:uint = 500;
		
		private var container:MovieClip;
		private var weaponIconList:Array;
		private var selectedWeaponIconIndex:int;
		private var previouslySelectedWeaponIconIndex:int;
		private var scrollTimer:Timer;
		private var scrollDirection:int;

		public function PlayerHUDWeaponCarousel(unit:Unit) {
			this.scaleX = this.scaleY = 0.15;
			
			weaponIconList = new Array();
			selectedWeaponIconIndex = 0;
			previouslySelectedWeaponIconIndex = 0;
			scrollTimer = new Timer(10, SCROLL_TICKS);
			
			Game.STAGE.addEventListener(WeaponEvent.WEAPON_ACQUIRE, addWeaponToCarousel);
			Game.STAGE.addEventListener(WeaponEvent.WEAPON_CHANGE, cycleThroughCarousel);
			scrollTimer.addEventListener(TimerEvent.TIMER, scrollThroughCarousel);
			scrollTimer.addEventListener(TimerEvent.TIMER_COMPLETE, finishScrolling);
		}
	
		public override function setUpComponents() {
			container = this["ContainerBox"];
		}
	
		public function addWeaponToCarousel(w:WeaponEvent) {
			if (w) {
				var weaponIcon:WeaponIcon = IconFactory.createWeaponIcon(w.weapon);		
				
				if (weaponIcon) {
					weaponIconList.push(weaponIcon);
					
					if (weaponIconList.length == 1) {
						weaponIcon.x = 0;
						weaponIcon.y = 0;
						container.addChild(weaponIcon);
					}
				}
			}
		}
	
		public function cycleThroughCarousel(w:WeaponEvent) {
			if (w) {
				if (w.value != 0 && weaponIconList.length > 1) {
					scrollDirection = w.value;
					previouslySelectedWeaponIconIndex = selectedWeaponIconIndex;
					selectedWeaponIconIndex += scrollDirection;
					
					if (selectedWeaponIconIndex < 0) {
						selectedWeaponIconIndex = weaponIconList.length - 1;
					} else if (selectedWeaponIconIndex >= weaponIconList.length) {
						selectedWeaponIconIndex = 0;
					}
					
					var selectedWeaponIcon:WeaponIcon = weaponIconList[selectedWeaponIconIndex];	
					var previouslySelectedWeaponIcon:WeaponIcon = weaponIconList[previouslySelectedWeaponIconIndex];		
					selectedWeaponIcon.x = 0;			
					selectedWeaponIcon.y = SCROLL_DISTANCE * scrollDirection;				
					previouslySelectedWeaponIcon.y = 0;
				
					for each (var icon:WeaponIcon in weaponIconList) {
						if (container.contains(icon)) {
							container.removeChild(icon);
						}
					}
				
					container.addChild(previouslySelectedWeaponIcon);
					container.addChild(selectedWeaponIcon);
					scrollTimer.reset();
					scrollTimer.start();
				}
			}
		}
	
		public function scrollThroughCarousel(t:TimerEvent):void {
			var previouslySelectedWeaponIcon:WeaponIcon = weaponIconList[previouslySelectedWeaponIconIndex];
			var selectedWeaponIcon:WeaponIcon = weaponIconList[selectedWeaponIconIndex];
			
			if (scrollDirection > 0) {
				previouslySelectedWeaponIcon.y -= (SCROLL_DISTANCE / SCROLL_TICKS);
				selectedWeaponIcon.y = previouslySelectedWeaponIcon.y + SCROLL_DISTANCE;
			} else {
				previouslySelectedWeaponIcon.y += (SCROLL_DISTANCE / SCROLL_TICKS);
				selectedWeaponIcon.y = previouslySelectedWeaponIcon.y - SCROLL_DISTANCE;		
			}
		}
	
	
		public function finishScrolling(t:TimerEvent):void {
			container.removeChild(weaponIconList[previouslySelectedWeaponIconIndex]);
		}
	
		public function checkForWeapons(knight:InfiKnight):void {
			var weapons:Array = knight.getWeaponsList();
			if (weapons) {
				for each (var weapon:Weapon in weapons) {
					addWeaponToCarousel(new WeaponEvent(WeaponEvent.WEAPON_ACQUIRE, weapon));
				}
			}
		}

	}
	
}
