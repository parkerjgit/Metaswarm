package metaswarm.swarm.swarmstates   {
	import metaswarm.swarm.Swarm;
	import metaswarm.swarm.SwarmState;
	
	public class LorenzeState implements SwarmState{
		
		private static const LORENZE:int = 3;
		
		private var swarm:Swarm;
		
		public function LorenzeState(swarm:Swarm)
		{
			//trace("construct GridState");
			this.swarm = swarm;
			init();
		}	
		public function init():void{
			//genPattern();
		}
		public function incrState():void{
			//trace("ScatterState setPattern");
			swarm.swarmState = swarm.type;
			swarm.setPattern();
		}
		public function decrState():void{
			//trace("ScatterState setPattern");
			swarm.swarmState = swarm.browning;
			swarm.setPattern();
		}
		//make this private
		public function setPattern():void{
			//trace("GridState setPattern");
			for(var i:uint=0; i<swarm.nodeCnt; i++){
				swarm.nodes[i].setTarget(LORENZE, swarm.sortOrder);
			}
		}
		
	}//end class
}//end pkg