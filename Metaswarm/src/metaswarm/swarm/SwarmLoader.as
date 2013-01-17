package metaswarm.swarm    {
  import flash.display.*;
  import flash.text.*;
  import flash.events.*
  import flash.net.*;
  import metaswarm.node.NodeLoader;
  import metaswarm.*;
  
  public class SwarmLoader extends Sprite {
	    
	private var _swarm:Swarm;
	
    public function SwarmLoader(swarm:Swarm) 
	{
		this._swarm = swarm;
		//this.loadProg = new TextField();
		
		init();
    }
    
    private function init():void 
	{ 
      	//loadProg.width = stage.stageWidth;
      	//loadProg.height = stage.stageHeight;   
      	//addChild(loadProg);  
    }
	
	public function load(dat:Array):void{
		//trace("swarmloader load");
		_swarm.nodeCnt = dat.length;
		_swarm.propCnt = dat[0].length;
		//create nodes and add each to display list
		for(var i:uint=0; i<_swarm.nodeCnt; i++){
			var tmp:Node = new Node();
			var nodeLoader:NodeLoader = new NodeLoader(tmp);
			
			nodeLoader.load(dat[i]); //maybe call after push
			_swarm.nodes.push(tmp);
		}
	}
	public function make():void{
		//swarm.patternMaker.make(); //decouple from swarm
		for(var i:uint=0; i<_swarm.nodeCnt; i++){
			var nodeLoader:NodeLoader = new NodeLoader(_swarm.nodes[i]);
			nodeLoader.make();
		}
	}
	public function go():void{
		//swarm.swarmState = swarm.grid;
		//swarm.sortOrder = 0;
		for(var i:uint=0; i<_swarm.nodeCnt; i++){
			var nodeLoader:NodeLoader = new NodeLoader(_swarm.nodes[i]);
			nodeLoader.go();
			_swarm.addChild(_swarm.nodes[i]);
		}
		//swarm.setPattern();
	}
	
  }//end class
}//end pkg