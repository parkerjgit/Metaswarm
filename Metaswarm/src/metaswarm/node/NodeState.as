package metaswarm.node     {
	
	//fsm interface
	public interface NodeState{ //<---------------------- public breaks program
		
		//internal interface methods
		//function filter():void;
		function select():void;	
		function deSelect():void;
		function toggleSelect():void;
		function drag():void;
		function drop():void;
		//function dropThumb():void;
		function popout():void;
		function popin():void;
		function close():void;
		function setTarget(tgx:Number,
						   tgy:Number):void;
		function rePosition():void;
		function reSize():void;
		function startFocus():void;
		function stopFocus():void;
		function startHover():void;
		function stopHover():void;
		//function incrTag():void;
		//function decrTag():void;
	}
}