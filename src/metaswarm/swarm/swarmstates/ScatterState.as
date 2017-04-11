package metaswarm.swarm.swarmstates   {
	import metaswarm.swarm.Swarm;
	import metaswarm.swarm.SwarmState;
	
	public class ScatterState implements SwarmState{
		
		private static const SCATTER:Number = 1;
		
		private var swarm:Swarm;
		
		public function ScatterState(swarm:Swarm)
		{
			//trace("construct ScatterState");
			this.swarm = swarm;
			init();
		}
		public function init():void{
			//do nothing
		}
		public function incrState():void{
			//trace("ScatterState setPattern");
			swarm.swarmState = swarm.browning;
			swarm.setPattern();
		}
		public function decrState():void{
			//trace("ScatterState setPattern");
			swarm.swarmState = swarm.grid;
			swarm.setPattern();
		}
		public function setPattern():void{
			//trace("ScatterState setPattern");
			for(var i:uint=0; i<swarm.nodeCnt; i++){
				swarm.nodes[i].setTarget(SCATTER, swarm.sortOrder);
			}
		}
		
	}//end class
}//end pkg