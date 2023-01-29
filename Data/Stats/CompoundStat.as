package Data.Stats {
	
	import Global.DamageTypes;
	import Utilities.UtilMaths
	
	public class CompoundStat extends FlexiStat {

		protected var bulletStat:FlexiStat;
		protected var electricStat:FlexiStat;
		protected var explosiveStat:FlexiStat;
		protected var fireStat:FlexiStat;
		protected var iceStat:FlexiStat;
		protected var magicalStat:FlexiStat;
		protected var physicalStat:FlexiStat;
		protected var trueStat:FlexiStat;
		
		public function CompoundStat(bulletStat:uint = 100, electricStat:uint = 100, explosiveStat:uint = 100, fireStat:uint = 100, iceStat:uint = 100, magicalStat:uint = 100, physicalStat:uint = 100, trueStat:uint = 100) {
			super(100);
		
			this.bulletStat = new FlexiStat(bulletStat);
			this.electricStat = new FlexiStat(electricStat);
			this.explosiveStat = new FlexiStat(explosiveStat);
			this.fireStat = new FlexiStat(fireStat);
			this.iceStat = new FlexiStat(iceStat);
			this.magicalStat = new FlexiStat(magicalStat);
			this.physicalStat = new FlexiStat(physicalStat);
			this.trueStat = new FlexiStat(trueStat);
		}
	
		public function getSpecificStat(damageType:String):FlexiStat {
			switch (damageType) {
				case DamageTypes.BULLET:
					return this.bulletStat;
					break;
				case DamageTypes.ELECTRIC:
					return this.electricStat;
					break;
				case DamageTypes.EXPLOSIVE:
					return this.explosiveStat;
					break;
				case DamageTypes.FIRE:
					return this.fireStat;
					break;
				case DamageTypes.ICE:
					return this.iceStat;
					break;
				case DamageTypes.MAGICAL:
					return this.magicalStat;
					break;
				case DamageTypes.PHYSICAL:
					return this.physicalStat;
					break;
				case DamageTypes.TRUE:
					return this.trueStat;
					break;
				default:
					return this.physicalStat;
					break;
			}
		}
	
		public function calculateScaling(damageType:String):Number {
			var stat:FlexiStat = getSpecificStat(damageType);
			
			return (UtilMaths.percent(stat.getStat()) * UtilMaths.percent(this.getStat()));
		}

	}
	
}
