package Data.Stats {
	
	public class BasicStat {
		
		protected var stat:Number;
		protected var minimum:Number;
		protected var maximum:Number;		

		public function BasicStat(base:Number, minimum:Number = 0, maximum:Number = 0) {			
			this.stat = base;
			this.minimum = minimum;
			this.maximum = maximum;
		}
	
		public function setStat(newValue:Number):void {
			this.stat = (this.maximum <= this.minimum) ? Math.max(newValue, this.minimum) : Math.max(Math.min(newValue, this.maximum), this.minimum);;
		}
	
		public function setMinimum(minimum:Number):void {
			this.minimum = minimum;
		}
	
		public function setMaximum(maximum:Number):void {
			this.maximum = maximum;
		}
	
		public function getStat():Number {
			return this.stat;
		}
	
		public function getMinimum():Number {
			return this.minimum;
		}
	
		public function getMaximum():Number {
			return this.maximum;
		}

	}
	
}
