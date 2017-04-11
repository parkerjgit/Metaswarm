package metaswarm.control {
	import flash.display.*;
	import metaswarm.ui.hoverlabel.HoverLabel;
	import metaswarm.swarm.Swarm;
	import metaswarm.ui.Ui;
	import metaswarm.ui.UiState;
	
	public class Controller extends Sprite{
		
		//private var _uiState:UiState;
		private var main:Ui;
		
		public function Controller(main:Ui){
			//_uiState = main.uiState;
			this.main = main;
			
			init();
		}	
		private function init():void{
			//
		}
		
		//delegated methods**************************************************
		public function onEnterFrame():void{
			main.uiState.onEnterFrame();
		}
		public function onRightKey():void{
			main.uiState.onRightKey();
		}
		public function onLeftKey():void{
			main.uiState.onLeftKey();
		}
		public function onUpKey():void{
			main.uiState.onUpKey();
		}
		public function onDownKey():void{
			main.uiState.onDownKey();
		}
		public function onSpaceKey():void{
			main.uiState.onSpaceKey();
		}
		public function onKey1():void{
			trace("Controller -> onKey1");
			main.uiState.onKey1();
		}
		public function onKey2():void{
			trace("Controller -> onKey2");
			main.uiState.onKey2();
		}
		public function onKey3():void{
			main.uiState.onKey3();
		}
		public function onKey4():void{
			main.uiState.onKey4();
		}
		public function onKey5():void{
			//swarm.showUniqueTags();
		}
		public function onCtrlClick(node:Node, button:Object):void
		{
			main.uiState.onCtrlClick(node, button);
		}
		public function onShftClick(node:Node, button:Object):void
		{
			main.uiState.onShftClick(node, button);
		}
		public function onAltClick(node:Node, button:Object):void
		{
			//can't use alt b/c window uses it to focus toolbar
		}
		public function onCtrlShftClick(node:Node, button:Object):void
		{
			main.uiState.onCtrlShftClick(node, button);
		}
		public function onMouseClick(node:Node, button:Object):void
		{
			main.uiState.onMouseClick(node, button);
		}
		
		//public function onDataBoxClick(node:Node, button:Object):void{}
		public function onMouseDown(node:Node, button:Object):void
		{
			main.uiState.onMouseDown(node, button);
		}
		public function onMouseUp(node:Node):void{
			main.uiState.onMouseUp(node);
		}
		
		//over
		public function onMouseOver(node:Node, button:Object):void{
			main.uiState.onMouseOver(node, button);
		}
		public function onCtrlOver(node:Node, button:Object):void{
			main.uiState.onCtrlOver(node, button);
		}
		public function onShftOver(node:Node, button:Object):void{
			main.uiState.onShftOver(node, button);
		}
		public function onCtrlShftOver(node:Node, button:Object):void{
			main.uiState.onCtrlShftOver(node, button);
		}
		
		//out
		public function onMouseOut(node:Node):void{
			main.uiState.onMouseOut(node);
		}
		public function onCtrlOut():void{
			main.uiState.onCtrlOut();
		}
		public function onShftOut():void{
			main.uiState.onShftOut();
		}
		public function onCtrlShftOut():void{
			//
		}
		

	}//end class
}//end pkg