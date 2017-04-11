package     {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import metaswarm.node.components.dot.Dot;
	import metaswarm.node.components.icon.Icon;
	import metaswarm.node.nodestates.DraggingState;
	import metaswarm.node.nodestates.DroppedState;
	import metaswarm.node.nodestates.IdleState;
	import metaswarm.node.nodestates.PickedState;
	import metaswarm.node.nodestates.PoppedState;
	import metaswarm.node.nodestates.ThumbDraggingState;
	import metaswarm.node.components.databox.DataBox;
	import metaswarm.node.components.tag.Tag;
	import metaswarm.node.components.thumb.Thumb;
	import metaswarm.node.NodeState;
	
	public class Node extends Sprite{
		
		//omit constants for now
		//var nodeLoader:NodeLoader;
		
		public var dat:Array; //again using key word
		
		//var dat:Array;
		public var xpos:Array;
		public var ypos:Array;
		//var xtmp:Array;
		//var ytmp:Array;
		
		//internal composite objects
		public var thumb:Thumb;
		public var icon:Icon;
		public var dot:Dot;
		public var tag:Tag;
		public var dataBox:DataBox;
		//var img:Image;
		
		//internal states
		public var idle:NodeState;
		public var picked:NodeState;
		public var dragging:NodeState;
		public var dropped:NodeState;
		public var tdragging:NodeState;
		public var popped:NodeState;
		
		//internal state holder
		public var nodeState:NodeState;
		public var prevState:NodeState;
		
		//constructor:
		public function Node(){
			
			//rediculous but don't know how else to initialize an exact-sized 2d array
			xpos = new Array(new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array());
			ypos = new Array(new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array(), new Array());
			
			//nodeLoader = new NodeLoader(this);

			idle = new IdleState(this);
			picked = new PickedState(this);
			dragging = new DraggingState(this);
			tdragging = new ThumbDraggingState(this);
			dropped = new DroppedState(this);
			popped = new PoppedState(this);
			
			dot = new Dot();
			icon = new Icon();
			thumb = new Thumb();
			tag = new Tag();
			dataBox = new DataBox();
			//img = new Image();
			
			init();
		}
		public function init():void{
			nodeState = idle;
		}
		/*function load():void{
			//trace("node.load()");
			nodeLoader.load();
		}
		function make():void{
			//trace("node.make()");
			nodeLoader.make();
		}
		function go():void{
			//trace("node.go()");
			nodeLoader.go();
		}*/
		
		//should this be delegated???--no!
		public function popout():void{
			nodeState.popout();
		}
		
		public function popin():void{
			nodeState.popin();
		}
		
		public function close():void{
			nodeState.close();
		}
		
		public function isIdle():Boolean{
			//trace("isidle?");
			if(nodeState == idle){
				return true;
			}else{
				return false;
			}
		}
		
		public function isPicked():Boolean{
			if(nodeState == picked){
				return true;
			}else{
				return false;
			}
		}
		
		public function isDropped():Boolean{
			if(nodeState == dropped){
				return true;
			}else{
				return false;
			}
		}
		
		public function isPopped():Boolean{
			if(nodeState == popped){
				return true;
			}else{
				return false;
			}
		}
		
		/*function loadData(dat:Array):void{
			tag.dat = dat;
			meta.dat = dat;
			meta.format();
			var path:String = String(dat[0] + dat[1]);
			//img.loadImg(path);
		}
		
		function loadImg():void{
			var path:String = String(meta.dat[0] + meta.dat[1]);
			img.loadImg(path);
		}*/
		
		public function select():void{
			//trace("node delegate select");
			nodeState.select();
		}
		
		public function deSelect():void{
			nodeState.deSelect();
		}
		
		public function toggleSelect():void{
			nodeState.toggleSelect();
		}
		
		public function drag():void{
			//trace("node delegate drag");
			nodeState.drag();
		}
		
		public function drop():void{
			//trace("node delegate drop");
			nodeState.drop();
		}
		
		//change to setTarget
		public function setTarget(pid:uint, sid:uint):void{
			//trace("node set Target");
			nodeState.setTarget(xpos[pid][sid], ypos[pid][sid]);
		}
		
		public function rePosition():void{
			//trace("node delegate rePosition");
			nodeState.rePosition();
		}
		
		public function reSize():void{
			//trace("node delegate reSize");
			nodeState.reSize();
		}
		
		public function startFocus():void{
			//trace("");
			nodeState.startFocus();
		}
		
		public function stopFocus():void{
			//trace("");
			nodeState.stopFocus();
		}
		
		public function startHover():void{
			//trace("");
			nodeState.startHover();
		}
		
		public function stopHover():void{
			//trace("");
			nodeState.stopHover();
		}
		
		public function incrTag():void{
			tag.incr();
		}
		
		public function decrTag():void{
			tag.decr();
		}
	}
}
		
		