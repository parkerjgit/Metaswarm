package metaswarm.node.nodestates   {
	import flash.events.TimerEvent;
	import flash.geom.ColorTransform;
	import flash.utils.Timer;
	import metaswarm.node.NodeState;
	
	public class PickedState implements NodeState{
		
		private var node:Node;
		
		private static var redTransform:ColorTransform;
		private static var bluTransform:ColorTransform;
		private static var blkTransform:ColorTransform;
		private static var whtTransform:ColorTransform;
		
		public function PickedState(node:Node)
		{
			//trace("construct PickedState");
			this.node = node;
			
			redTransform = new ColorTransform( );
			redTransform.color = 0xFF0000;
			bluTransform = new ColorTransform( );
			bluTransform.color = 0x0000ff;
			blkTransform = new ColorTransform( );
			blkTransform.color = 0x231F20;
			whtTransform = new ColorTransform( );
			whtTransform.color = 0xFFFFFF;
		}
		public function select():void{}
		
		public function deSelect():void{
			//trace("PickedState deselect");
			stopFocus();
			node.icon.visible = false;
			node.tag.visible = false; //not working
			
			//restore dot
			node.dot.x = node.icon.x;
			node.dot.y = node.icon.y;
			node.dot.setTarget(node.icon.x, node.icon.y);
			node.dot.visible = true;
			
			node.nodeState = node.idle;
		}
		
		public function toggleSelect():void{
			deSelect();
		}
		
		public function drag():void{
			//trace("PickedState drag: goto dragging state");
			stopFocus();
			
			//position dot at icon so icon can find its
			//way back if thumb is closed
			node.dot.x = node.icon.x;
			node.dot.y = node.icon.y;
			
			//node.dataBox.alpha = 50;
			node.icon.startDrag();
			//node.dot.visible = false;
			//node.icon.visible = false;
			//node.thumb.visible = false;
			
			//remove tag
			node.tag.visible = false;
			
			//show meta & img
			//node.dataBox.visible = true;
			//node.thumb.visible = true;
			
			//load thumb
			node.thumb.visible = false;
			node.thumb.load("imgs/" + node.dat[0] + node.dat[1]);
			node.thumb.make();
			node.thumb.x = node.icon.x;
			node.thumb.y = node.icon.y;
			node.addChild(node.thumb);
			
			//transition to drag state
			node.nodeState = node.dragging;
		}
		
		public function drop():void{
			//trace("PickedState drag: goto dragging state");
			stopFocus();
			
			//position dot at icon so icon can find its
			//way back if thumb is closed
			node.dot.x = node.icon.x;
			node.dot.y = node.icon.y;
			
			//node.dataBox.alpha = 50;
			//node.icon.startDrag();
			//node.dot.visible = false;
			//node.icon.visible = false;
			//node.thumb.visible = false;
			
			//remove tag
			node.tag.visible = false;
			
			//show meta & img
			//node.dataBox.visible = true;
			//node.thumb.visible = true;
			
			//load thumb
			node.thumb.visible = true;
			node.thumb.load("imgs/" + node.dat[0] + node.dat[1]);
			node.thumb.make();
			node.thumb.x = node.icon.x;
			node.thumb.y = node.icon.y;
			node.addChild(node.thumb);
			
			//---
			
			//trace("PickedState drag: goto dragging state");
			//node.icon.visible = false;
			
			//node.icon.stopDrag();
			//node.thumb.stopDrag();
			
			//node.thumb.x = node.icon.x;
			//node.thumb.y = node.icon.y;
			node.thumb.setTarget(node.icon.x, node.icon.y);
			//node.thumb.visible = true;
			
			//transition to drag state
			node.nodeState = node.dropped;
		}
		
		//public function dropThumb():void{}
		
		public function popout():void{}
		
		public function popin():void{}
		
		public function close():void{}
		
		public function setTarget(tgx:Number,
						   		  tgy:Number):void{
			//trace("PickedState switch");
			
			//set new icon target only
			node.icon.setTarget(tgx, tgy);
			
		}
		
		public function rePosition():void{
			//trace("PickedState rePosition");
			
			//update dot position
			node.icon.goToTarget();
			
			//snap tag to new dot position
			node.tag.x = node.icon.x;
			node.tag.y = node.icon.y;
			
			//snap dot to new icon position
			//node.dot.x = node.icon.x;
			//node.dot.y = node.icon.y;
			
			//snap icon to new dot position
			/*node.icon.x = node.dot.x;
			node.icon.y = node.dot.y;*/
		}
		
		public function reSize():void{
			//trace("PickedState reSize");
			node.icon.scaleToTarget();
		}
		
		public function startFocus():void{
			//trace("startFocus");
			node.icon.iconButton.forceOver();
			node.tag.x = node.icon.x;
			node.tag.y = node.icon.y;
			//node.tag.visible = true;
			node.tag.t.borderColor = 0xFF0000;
		}
		public function stopFocus():void{
			//trace("stopFocus");
			node.icon.iconButton.restoreOver();

			//node.tag.visible = false;
			node.tag.t.borderColor = 0xCCCCCC;
		}
		
		public function startHover():void{
			//trace("");
			//node.tag.transform.colorTransform = whtTransform;
			
			//zoom in icon
			node.icon.setTargetWidth(12);
			node.tag.x = node.icon.x;
			node.tag.y = node.icon.y;
			node.tag.visible = true;
		}
		
		public function stopHover():void{
			//trace("");
			//node.tag.transform.colorTransform = blkTransform;
			
			//zoom back out
			node.icon.setTargetWidth(6);
			node.tag.visible = false;
		}
	}
}