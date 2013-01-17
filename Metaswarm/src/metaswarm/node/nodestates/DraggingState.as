package metaswarm.node.nodestates   {
	import metaswarm.node.NodeState;
	
	public class DraggingState implements NodeState{
		
		private var node:Node;
		
		public function DraggingState(node:Node)
		{
			//trace("construct DraggingState");
			this.node = node;
		}
		public function select():void{}
		
		public function deSelect():void{}
		
		public function toggleSelect():void{}
		
		public function drag():void{}
		
		public function drop():void{
			//trace("PickedState drag: goto dragging state");
			node.icon.visible = false;
			
			node.icon.stopDrag();
			node.thumb.stopDrag();
			
			node.thumb.x = node.icon.x;
			node.thumb.y = node.icon.y;
			node.thumb.setTarget(node.icon.x, node.icon.y);
			node.thumb.visible = true;
			
			//goto dropped state
			node.nodeState = node.dropped;
		}
		
		//public function dropThumb():void{}
		
		public function popout():void{}
		
		public function popin():void{}
		
		public function close():void{}
		
		public function setTarget(tgx:Number,
						   		  tgy:Number):void{
			//trace("DraggingState switch");
			//node.dot.setTarget(tgx, tgy);
		}
		
		public function rePosition():void{
			//trace("DraggingState rePosition");
			//node.dot.goToTarget();
			//node.thumb.x = node.icon.x;
			//node.thumb.y = node.icon.y;
			
			//dragging icon so snap dot to icon
			/*node.dot.x = node.dataBox.x;
			node.dot.y = node.dataBox.y;*/
			
			
		}
		
		public function reSize():void{
			//trace("DraggingState reSize");
			node.icon.scaleToTarget(); //???
		}
		
		public function startFocus():void{}
		
		public function stopFocus():void{}
		
		public function startHover():void{}
		
		public function stopHover():void{}
	}
}