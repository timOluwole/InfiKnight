package Controllers {
	
	import Assets.Units.AlliedUnits.InfiKnight;
	import Assets.Units.EnemyUnits.EnemyUnit;
	import Assets.Units.Unit;
	import Data.AttackData.AttackData;
	import Data.AttackData.Attacks;
	import Events.EnemyEvent;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import flash.geom.Point;
	import Global.Frames;
	import Global.Game;
	import Global.Thoughts;
	import Utilities.UtilMaths;
	
	public class EnemyBrain {

		public var currentThought:String;
		public var currentAttack:AttackData;
		public var target:InfiKnight;
		private var host:EnemyUnit;
		
		public function EnemyBrain(host:EnemyUnit) {
			this.host = host;
			this.currentThought = Thoughts.FOLLOW;
			
			this.host.addListener(Event.ENTER_FRAME, think);
		}
	
		public function think(e:Event):void {
			var direction:Number;
			var distance:Number;
			
			if (host.isAlive()) {
				switch (currentThought) {
					case Thoughts.STAND:
						if (!target) {
							Game.STAGE.dispatchEvent(new EnemyEvent(EnemyEvent.ENEMY_LOCATE_KNIGHT, host));
						}
						
						if (target) {
							direction = getFacingRotation(target);
							distance = UtilMaths.distance(new Point(host.x, host.y), new Point(target.x, target.y));
							
							if (!currentAttack) {
								decideAttackRandomly();
							}
							
							if (host.currentLabel == Frames.ACTION_COMPLETED) {
								host.gotoAndPlay(Frames.STANDING);
							} else if (distance <= getAttackAdjustedRange()) {
								currentThought = Thoughts.ATTACK;
							} else if (distance <= host.visionRange) {
								currentThought = Thoughts.FOLLOW;
							} else {
								if (host.currentLabel != Frames.STANDING) {
									host.gotoAndPlay(Frames.STANDING);
								}
							}
						}
						break;
					case Thoughts.FOLLOW:
						if (!target) {
							Game.STAGE.dispatchEvent(new EnemyEvent(EnemyEvent.ENEMY_LOCATE_KNIGHT, host));
						}
						
						if (target) {
							direction = getFacingRotation(target);
							distance = UtilMaths.distance(new Point(host.x, host.y), new Point(target.x, target.y));
							
							if (!currentAttack) {
								decideAttackRandomly();
							}
						
							if (distance <= getAttackAdjustedRange()) {
								currentThought = Thoughts.ATTACK;
							} else {
								host.walk(direction, direction);
							}
						}
						break;
					case Thoughts.ATTACK:
						if (!target) {
							Game.STAGE.dispatchEvent(new EnemyEvent(EnemyEvent.ENEMY_LOCATE_KNIGHT, host));
						}
					
						if (target) {
							if (host.currentLabel == Frames.ACTION_COMPLETED) {
								currentThought = Thoughts.ACTION_COMPLETED;
							} else {								
								if (host.currentLabel != Frames.ATTACK) {
									host.attack(currentAttack);
									currentAttack = null;
								}
							}
						}
						break;
					case Thoughts.ACTION_COMPLETED:
						currentThought = Thoughts.STAND;
						break;
				}
			}
		}
	
		private function getFacingRotation(target:Unit):Number {			
			var vectorToTarget:Vector3D = new Vector3D(target.x - host.x, target.y - host.y);			
			var vectorAngle:int = Math.atan(vectorToTarget.x / -vectorToTarget.y) * 180 / Math.PI;
			
			if (vectorToTarget.y > 0) {
				vectorAngle += 180;
			}
			
			return vectorAngle;
		}
	
		private function decideAttackRandomly():void {
			var selectedAttack:AttackData = null;
			var attacks:Attacks = host.getAttacks();
			
			if (attacks) {
				var attackList:Array = attacks.getAttackList();
				
				if (attackList.length > 0) {
					var selectedAttackIndex:uint = Math.floor(Math.random() * attackList.length);
					selectedAttack = attackList[selectedAttackIndex];
				}
			}
		
			currentAttack = selectedAttack;
		}
	
		private function getAttackAdjustedRange():Number {
			var pureRange:uint = (currentAttack) ? currentAttack.getAttackPureRange() : 0;
			return pureRange * host.scaleY;
		}

	}
	
}
