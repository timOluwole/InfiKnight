package Assets.HUD.HUDElements {
	
	import Events.UnitEvent;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import Assets.Units.Unit;
	
	public class HUDHealthBarContainer extends HUDElement {
			
		private const DAMAGE_TICK_COUNT:uint = 100;
		
		protected var damageTimer:Timer;
		protected var followTimer:Timer;
		protected var healthBar:MovieClip;
		protected var damageBar:MovieClip;
		protected var currentHealthText:TextField;
		protected var maximumHealthText:TextField;
		
		private var defaultBarWidth:int;
		private var damageTick:Number;
		
		protected var attachedUnit:Unit;
		
		public function HUDHealthBarContainer(attachedUnit:Unit) {
			this.attachedUnit = attachedUnit;
			attachedUnit.addListener(UnitEvent.UNIT_UPDATE_HEALTH, updateHealthOnHUD);			
			
			damageTimer = new Timer(2000, 1);
			followTimer = new Timer(15, DAMAGE_TICK_COUNT);
			
			damageTimer.addEventListener(TimerEvent.TIMER_COMPLETE, damageBarStart);
			followTimer.addEventListener(TimerEvent.TIMER, damageBarFollow);
		}
	
		public override function setUpComponents() {
			healthBar = this["HealthBar"];
			damageBar = this["DamageBar"];
			currentHealthText = this["CurrentHealth"];
			maximumHealthText = this["MaximumHealth"];
			
			defaultBarWidth = healthBar.width;
		}
	
		public function updateHealthOnHUD(U:UnitEvent):void {
			var currentHealth:int = attachedUnit.getHealth();
			var maximumHealth:int = attachedUnit.getMaximumHealth();
			currentHealthText.text = currentHealth.toString();
			maximumHealthText.text = maximumHealth.toString();
			var newWidth:Number = defaultBarWidth * (currentHealth / maximumHealth);
			
			if (currentHealth == 0) {
				damageBar.width = 0;
			} else if (healthBar.width > newWidth) {
				damageTick = (healthBar.width - newWidth) / DAMAGE_TICK_COUNT;
				damageBar.width = healthBar.width;
				damageTimer.reset();
				followTimer.reset();
				damageTimer.start();
			}
		
			healthBar.width = newWidth;
			
		}
	
		public function damageBarStart(t:TimerEvent) {
			followTimer.start();
		}
	
		public function damageBarFollow(t:TimerEvent) {
			damageBar.width -= damageTick;
		}

	}
	
}
