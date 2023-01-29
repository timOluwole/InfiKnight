package Data.Stats {
	
	public class FlexiStat extends BasicStat {
		
		private var base:Number;
		private var bonus:Number;
		private var baseMultiplier:Number;
		private var bonusMultiplier:Number;
		private var totalmultiplier:Number;
		
		public function FlexiStat(base:Number = 0, minimum:Number = 0, maximum:Number = 0) {
			super(base, minimum, maximum);
			this.base = base;
			this.bonus = 0;
			this.baseMultiplier = 1;
			this.bonusMultiplier = 1;
			this.totalmultiplier = 1;
			
			recalculateStat();
		}

		private function recalculateStat():void {
			var newValue:Number = ((this.base * this.baseMultiplier) + (this.bonus * this.bonusMultiplier)) * this.totalmultiplier;
			newValue = (this.maximum <= this.minimum) ? Math.max(newValue, this.minimum) : Math.max(Math.min(newValue, this.maximum), this.minimum);
			this.stat = newValue;
		}
	
		public override function setStat(newValue:Number):void {
			this.base = newValue;
			recalculateStat();
		}
	
		public function setBaseMultiplier(newValue:Number):void {
			this.baseMultiplier = newValue;
			recalculateStat();
		}
	
		public function setBonus(newValue:Number):void {
			this.bonus = newValue;
			recalculateStat();
		}
	
		public function setBonusMultiplier(newValue:Number):void {
			this.bonusMultiplier = newValue;
			recalculateStat();
		}
	
		public function setTotalMultiplier(newValue:Number):void {
			this.totalmultiplier = newValue;
			recalculateStat();
		}
	
		public function modifyBase(change:Number):void {
			this.base += change;
			recalculateStat();
		}
	
		public function modifyBaseMultiplier(change:Number):void {
			this.baseMultiplier += change;
			recalculateStat();
		}
	
		public function modifyBonus(change:Number):void {
			this.bonus += change;
			recalculateStat();
		}
	
		public function modifyBonusMultiplier(change:Number):void {
			this.bonusMultiplier += change;
			recalculateStat();
		}
	
		public function modifyTotalMultiplier(change:Number):void {
			this.totalmultiplier += change;
			recalculateStat();
		}	
	}	
}
