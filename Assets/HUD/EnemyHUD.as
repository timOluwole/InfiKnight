package Assets.HUD {
	
	import Assets.Asset;	
	import Assets.HUD.HUDElements.EnemyHUDElements.*;
	import Assets.Units.EnemyUnits.EnemyUnit;
	import Events.UnitEvent;
	import flash.events.Event;
	import Global.Game;
	
	public class EnemyHUD extends Asset {

		private var healthBarOffset:int;
		private var attachedEnemy:EnemyUnit;
		
		public function EnemyHUD(attachedEnemy:EnemyUnit) {
			Game.HUD_LAYER.addChild(this);
			
			this.attachedEnemy = attachedEnemy;
			var healthBar:EnemyHUDHealthBarContainer = new EnemyHUDHealthBarContainer(attachedEnemy);
			this.healthBarOffset = Math.max(attachedEnemy.width, attachedEnemy.height) * -0.6;
			this.addChild(healthBar);
			healthBar.setUpComponents();			
			
			this.addListener(Event.ENTER_FRAME, followUnit);
			attachedEnemy.addListener(UnitEvent.UNIT_DESPAWN, removeHUD);
		}
	
		private function followUnit(e:Event):void {
			this.x = attachedEnemy.x;
			this.y = attachedEnemy.y + healthBarOffset;
		}
	
		private function removeHUD(u:UnitEvent):void {
			this.deleteThis();
		}

	}
	
}
