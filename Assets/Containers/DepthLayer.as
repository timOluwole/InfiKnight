package Assets.Containers {
	
	import Assets.Asset;
	
	public class DepthLayer extends Asset {

		public function DepthLayer() {
			
		}
	
		public function setDepth(depth:int):void {
			setChildIndex(this, depth);
		}

	}
	
}
