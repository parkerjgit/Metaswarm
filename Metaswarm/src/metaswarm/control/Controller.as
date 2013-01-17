package metaswarm.control {
	import flash.display.*;
	import metaswarm.ui.hoverlabel.HoverLabel;
	import metaswarm.swarm.Swarm;
	import metaswarm.ui.Ui;
	import metaswarm.ui.UiState;
	
	public class Controller extends Sprite{
		
		private var _uiState:UiState;
		
		public function Controller(main:Ui){
			_uiState = main.uiState;
			
			init();
		}	
		private function init():void{
			//
		}
		
		//delegated methods**************************************************
		public function onEnterFrame():void{
			_uiState.onEnterFrame();
		}
		public function onRightKey():void{
			_uiState.onRightKey();
		}
		public function onLeftKey():void{
			_uiState.onLeftKey();
		}
		public function onUpKey():void{
			_uiState.onUpKey();
		}
		public function onDownKey():void{
			_uiState.onDownKey();
		}
		public function onSpaceKey():void{
			_uiState.onSpaceKey();
		}
		public function onKey1():void{
			_uiState.onKey1();
		}
		public function onKey2():void{
			_uiState.onKey2();
		}
		public function onKey3():void{
			_uiState.onKey3();
		}
		public function onKey4():void{
			_uiState.onKey4();
		}
		public function onKey5():void{
			//swarm.showUniqueTags();
		}
		public function onCtrlClick(node:Node, button:Object):void
		{
			_uiState.onCtrlClick(node, button);
		}
		public function onShftClick(node:Node, button:Object):void
		{
			_uiState.onShftClick(node, button);
		}
		public function onAltClick(node:Node, button:Object):void
		{
			//can't use alt b/c window uses it to focus toolbar
		}
		public function onCtrlShftClick(node:Node, button:Object):void
		{
			_uiState.onCtrlShftClick(node, button);
		}
		public function onMouseClick(node:Node, button:Object):void
		{
			_uiState.onMouseClick(node, button);
		}
		
		//public function onDataBoxClick(node:Node, button:Object):void{}
		public function onMouseDown(node:Node, button:Object):void
		{
			_uiState.onMouseDown(node, button);
		}
		public function onMouseUp(node:Node):void{
			_uiState.onMouseUp(node);
		}
		
		//over
		public function onMouseOver(node:Node, button:Object):void{
			_uiState.onMouseOver(node, button);
		}
		public function onCtrlOver(node:Node, button:Object):void{
			_uiState.onCtrlOver(node, button);
		}
		public function onShftOver(node:Node, button:Object):void{
			_uiState.onShftOver(node, button);
		}
		public function onCtrlShftOver(node:Node, button:Object):void{
			_uiState.onCtrlShftOver(node, button);
		}
		
		//out
		public function onMouseOut(node:Node):void{
			_uiState.onMouseOut(node);
		}
		public function onCtrlOut():void{
			_uiState.onCtrlOut();
		}
		public function onShftOut():void{
			_uiState.onShftOut();
		}
		public function onCtrlShftOut():void{
			//
		}
		

	}//end class
}//end pkg