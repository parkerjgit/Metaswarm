package metaswarm.swarm.swarmstates   {
	import metaswarm.swarm.Swarm;
	import metaswarm.swarm.SwarmState;
	
	public class TypeState implements SwarmState{
		
		private static const TYPE:Number = 4;
		
		private var swarm:Swarm;
		
		function TypeState(swarm:Swarm)
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
			swarm.swarmState = swarm.map;
			swarm.setPattern();
		}
		public function decrState():void{
			//trace("ScatterState setPattern");
			swarm.swarmState = swarm.lorenze;
			swarm.setPattern();
		}
		//make this private
		public function setPattern():void{
			//trace("GridState setPattern");
			for(var i:uint=0; i<swarm.nodeCnt; i++){
				swarm.nodes[i].setTarget(TYPE, swarm.sortOrder);
			}
		}
		
	}//end class
}//end pkg