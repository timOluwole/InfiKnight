package Assets.Units {
	
	import Assets.Asset;
	import Assets.Containers.HitBox;
	import Assets.Containers.HurtBox;
	import Assets.Weapons.MeleeWeapons.MeleeWeapon;
	import Data.AttackData.AttackData;
	import Data.AttackData.Attacks;
	import Data.Stats.*;
	import Events.*;
	import flash.events.Event;
	import flash.display.MovieClip;
	import Global.Directions;
	import Global.Frames;
	import Global.Game;
	import Interfaces.IHitter;
	import Interfaces.IHurtable;
	import Interfaces.ITeam;
	import Utilities.UtilFrame;
	import Utilities.UtilObject;

	
	public class Unit extends Asset implements ITeam, IHurtable {

		private var attacks:Attacks;
		
		protected var walkSpeed:FlexiStat;
		protected var maximumTurnSpeed:BasicStat;
		
		private var team:String;
		private var health:BasicStat;
		
		public function Unit(team:String) {
			this.team = team;
			Game.STAGE.addEventListener(ProjectileEvent.PROJECTILE_HIT_CHECK, checkProjectileHit);
			Game.STAGE.addEventListener(UnitEvent.UNIT_ATTACK_HIT_CHECK, checkAttackHit);
			Game.STAGE.addEventListener(WeaponEvent.WEAPON_HIT_CHECK, checkWeaponHit);
			this.addListener(UnitEvent.UNIT_TAKE_DAMAGE, updateHealth);
			this.addListener(UnitEvent.UNIT_HEAL_DAMAGE, updateHealth);
			this.addListener(Event.ENTER_FRAME, playFrames);
			this.addListener(AttackEvent.ATTACK_HIT, attackHit);
			
			Game.UNIT_LAYER.addChild(this);
		}
	
		public function initialiseHealth(healthValue:uint):void {
			health = new BasicStat(healthValue, 0, healthValue);
			this.dispatchEvent(new UnitEvent(UnitEvent.UNIT_UPDATE_HEALTH, this));
		}
	
		// getters 
		public function getAttacks():Attacks {
			return this.attacks;
		}
	
		public function getHealth():uint {
			return health.getStat();
		}
	
		public function getMaximumHealth():uint {
			return this.health.getMaximum();
		}
	
		public function getTeam():String {
			return team;
		}
	
		public function getHurtBox():HurtBox {
			var hurtBox:HurtBox = null;
			
			try {
				hurtBox = this["HurtBox"];
			} catch (ex:Error) {
				
			}
		
			return hurtBox;
		}
	
		// setters
	
		public function setAttacks(attacks:Attacks) {
			this.attacks = attacks;
		}
	
		public function setHealth(health:uint):void {
			this.health.setStat(health);
		}
	
		public function setMaximumHealth(maximumHealth:uint):void {
			this.health.setMaximum(maximumHealth);
		}	
	
		// actions
	
		public function move(movementAngle:Number, speed:Number):void {	
			x += calculateSpeed(speed) * Math.sin(movementAngle / 180 * Math.PI);
			y -= calculateSpeed(speed) * Math.cos(movementAngle / 180 * Math.PI);
		}
	
		public function calculateSpeed(speed:Number):int {
			return speed / Game.STAGE.frameRate;
		}
	
		public  function face(facingAngle:Number):void {
			var positiveRotation:Number = (rotation < 0) ? rotation + 360 : rotation;
			var positiveFacingAngle:Number = (facingAngle < 0) ? facingAngle + 360 : facingAngle;
			var differenceOfPositives:Number = positiveFacingAngle - positiveRotation;
			var maxTurnSpeed:Number = maximumTurnSpeed.getStat();
			
			if (differenceOfPositives > maxTurnSpeed) {	// clockwise
				if (differenceOfPositives > 180) { // turning over 180 degrees clockwise is actually an anti-clockwise turn
					rotation += ((360 - differenceOfPositives) > maxTurnSpeed) ? -maxTurnSpeed : differenceOfPositives;
				} else {
					rotation += maxTurnSpeed;
				}
			} else if (differenceOfPositives < -maxTurnSpeed) {	// anti-clockwise
				if (differenceOfPositives < -180) { // turning over 180 degrees anti-clockwise is actually a clockwise turn
					rotation += ((360 + differenceOfPositives) > maxTurnSpeed) ? maxTurnSpeed : differenceOfPositives;
				} else {
					rotation -= maxTurnSpeed;
				}
			} else {
				rotation = facingAngle;
			}
		}
	
		public function walk(facingAngle:Number, movementAngle:Number, direction:String = Directions.UP) {
			if (this.currentLabel != Frames.WALKING) {
				this.gotoAndPlay(Frames.WALKING);
			}
		
			face(facingAngle);
		
			if (direction == Directions.UP) {
				movementAngle = rotation;
			}
		
			this.move(movementAngle, walkSpeed.getStat());
		}
	
	
		// listener functions
	
		private function checkProjectileHit(p:ProjectileEvent):void {
			if (p) {
				if (p.projectile && this.isAlive()) {
					if (UtilObject.attackMakesContact(p.projectile, this)) {
						if (UtilObject.canAttack(p.projectile, this)) {
							p.projectile.dispatchEvent(new ProjectileEvent(ProjectileEvent.PROJECTILE_HIT, p.projectile, this));
						}
					}
				}
			}
		}
	
		private function checkAttackHit(u:UnitEvent):void {
			if (u) {
				if (u.unit && this.isAlive()) {
					if (UtilObject.attackMakesContact(IHitter(u.unit), this)) {
						if (UtilObject.canAttack(u.unit, this)) {
							var attackName = UtilFrame.getAttackName(u.unit.currentLabel);
							var attack:AttackData = u.unit.getAttacks().getAttack(attackName);
							u.unit.dispatchEvent(new AttackEvent(AttackEvent.ATTACK_HIT, this, attack));
						}
					}
				}
			}
		}
	
		private function checkWeaponHit(w:WeaponEvent):void {
			if (w) {
				var weapon:MeleeWeapon = MeleeWeapon(w.weapon);
				
				if (weapon && this.isAlive()) {
					if (UtilObject.attackMakesContact(weapon, this)) {
						if (UtilObject.canAttack(weapon, this) && !weapon.hasAlreadyHitUnit(this)) {
							weapon.dispatchEvent(new WeaponEvent(WeaponEvent.WEAPON_HIT, weapon, this));
						}
					}
				}
			}
		}
	
		private function updateHealth(u:UnitEvent):void {
			if (u) {
				setHealth(Math.max(0, getHealth() + u.healthChange)); 
				this.dispatchEvent(new UnitEvent(UnitEvent.UNIT_UPDATE_HEALTH, this));
				if (health.getStat() == 0) {
					this.dispatchEvent(new UnitEvent(UnitEvent.UNIT_DIE, this));
					this.gotoAndPlay(Frames.DIE);
				}
			}
		}
	
		private function playFrames(E:Event) {
			if (currentLabel == Frames.DESPAWN) {
				this.dispatchEvent(new UnitEvent(UnitEvent.UNIT_DESPAWN, this));
				this.deleteThis();
			}
			checkForAttack();
		}
	
		public function isAlive():Boolean {
			return (this.health.getStat() > 0);
		}
	
		private function checkForAttack():void {
			if (UtilFrame.isAttackFrame(this.currentLabel)) {
				var hitBox:MovieClip = UtilObject.getHitBox(IHitter(this));
				
				if (hitBox) {
					this.dispatchEvent(new UnitEvent(UnitEvent.UNIT_ATTACK_HIT_CHECK, this));
				}
			}
		}
	
		private function attackHit(a:AttackEvent):void {
			if (a) {
				if (a.unitHit) {	// ensuring unit has not disappeared
					a.unitHit.dispatchEvent(new UnitEvent(UnitEvent.UNIT_TAKE_DAMAGE, a.unitHit, -a.attack.getDamage(this, a.unitHit)));
					this.dispatchEvent(new AttackEvent(AttackEvent.ATTACK_HIT_COMPLETE, this));
				}
			}
		}
	}	
}
