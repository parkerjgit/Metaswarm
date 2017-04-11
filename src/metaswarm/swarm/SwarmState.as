package metaswarm.swarm    {
	
	//fsm interface
	public interface SwarmState{
		
		//internal interface methods
		//function incrSort():void;
		//function decrSort():void;
		function incrState():void;
		function decrState():void;
		function setPattern():void;
	}
}