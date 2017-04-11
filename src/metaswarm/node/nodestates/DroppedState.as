package metaswarm.node.nodestates   {
	import metaswarm.node.NodeState;
	
	public class DroppedState implements NodeState{
		
		private var node:Node;
		
		public function DroppedState(node:Node)
		{
			//trace("construct DroppedState");
			this.node = node;
		}
		
		public function select():void{}
		public function deSelect():void{}
		public function toggleSelect():void{}
		
		public function drag():void{
			//trace("DroppedState drag: goto dragging state");
			
			//start dragging
			node.thumb.startDrag();
			
			//goto to dragging state
			node.nodeState = node.tdragging;
			node.prevState = node.dropped;
		}
		
		public function drop():void{}
		
		//public function dropThumb():void{}
		
		public function popout():void{
			//trace("DroppedState popout");
			
			//position dataBox next to thumb and show
			//node.dataBox.x = node.thumb.x + node.thumb.width;
			node.dataBox.x = node.thumb.x + 125;
			node.dataBox.y = node.thumb.y;
			node.dataBox.visible = true;
			
			//goto popped state
			node.nodeState = node.popped;
		}
		
		public function popin():void{}
		
		public function close():void{
			//trace("DroppedState close");
			
			//position dot at target
			node.dot.snapToTarget();
			
			//position icon at thumb position
			node.icon.x = node.thumb.x;
			node.icon.y = node.thumb.y;
			node.icon.setTarget(node.dot.x, node.dot.y);
			node.icon.visible = true;
			
			//hide thumb, but should i dispose of bitmap???
			node.thumb.visible = false; 
				
			//go back to idle
			node.nodeState = node.picked;
		}
		
		public function setTarget(tgx:Number,
						   		  tgy:Number):void{
			//trace("DroppedState switch");
			
			//preview mainstate needs this to tile
			//node.thumb.setTarget(tgx, tgy);
			
			//set dot target incase thumb is closed, 
			//dot it will get back in place in swarm
			node.dot.setTarget(tgx, tgy);
		}
		
		public function rePosition():void{
			//trace("DroppedState rePosition");
			
			//preview mainstate need this to tile 
			node.thumb.goToTarget();
		}
		
		public function startFocus():void{}
		public function stopFocus():void{}
		public function reSize():void{} //icon is not visible so don't bother
		public function startHover():void{} //change these names to hover or smth
		public function stopHover():void{}
		
	}
}