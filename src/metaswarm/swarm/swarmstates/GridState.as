package metaswarm.swarm.swarmstates   {
	import metaswarm.swarm.Swarm;
	import metaswarm.swarm.SwarmState;
	
	public class GridState implements SwarmState{
		
		private static const GRID:Number = 0;
		
		private var swarm:Swarm;
		
		public function GridState(swarm:Swarm)
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
			swarm.swarmState = swarm.scatter;
			swarm.setPattern();
		}
		public function decrState():void{
			//trace("ScatterState setPattern");
			swarm.swarmState = swarm.map;
			swarm.setPattern();
		}
		//make this private
		public function setPattern():void{
			//trace("GridState setPattern");
			/*var prev:String = new String();
			prev = "";*/
			for(var i:uint=0; i<swarm.nodeCnt; i++){
				swarm.nodes[i].setTarget(GRID, swarm.sortOrder);
				/*if(swarm.nodes[i].tag.t.text == prev){
					swarm.nodes[i].tag.visible = false;
				}else{
					swarm.nodes[i].tag.visible = true;
				}
				prev = swarm.nodes[i].tag.t.text;*/
			}
		}
		
	}//end class
}//end pkg