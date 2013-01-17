package metaswarm.ui {
	
	//fsm interface
	public interface UiState{
		
		//internal interface methods
		function onEnterFrame():void;
		function onRightKey():void;
		function onLeftKey():void;
		function onUpKey():void;
		function onDownKey():void;
		function onSpaceKey():void;
		function onKey1():void;
		function onKey2():void;
		function onKey3():void;
		function onKey4():void;
		function onMouseClick(node:Node, button:Object):void;
		function onCtrlClick(node:Node, button:Object):void;
		function onShftClick(node:Node, button:Object):void;
		function onAltClick(node:Node, button:Object):void;
		function onCtrlShftClick(node:Node, button:Object):void;
		//function onDataBoxClick(node:Node, button:Object):void;
		function onMouseDown(node:Node, button:Object):void;
		function onMouseUp(target:Node):void;
		function onMouseOver(target:Node, button:Object):void;
		function onCtrlOver(target:Node, button:Object):void;
		function onShftOver(target:Node, button:Object):void;
		function onCtrlShftOver(node:Node, button:Object):void;
		function onCtrlOut():void;
		function onShftOut():void;
		function onCtrlShftOut():void;
		function onMouseOut(target:Node):void;
	
	}//end interface
}//end pkg
		