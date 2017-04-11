package metaswarm.ui.uistates {
	import metaswarm.*;
	import metaswarm.ui.Ui;
	import metaswarm.swarm.Swarm;
	import metaswarm.ui.UiState;
	import com.greensock.TweenLite;
	
	public class ExploreState implements UiState{
		
		private var main:Ui;
		
		public function ExploreState(main:Ui)
		{
			//trace("construct ExploreState");
			this.main = main;
			init();
		}	
		public function init():void{
		}
		
		//delegated methods**************************************************
		public function onOpenState():void{
			main.cmdLog.append("in explore state");
		}
		public function onEnterFrame():void{
			main.swarm.rePosition();
			main.swarm.reSize();
			main.hoverLabel.update();
		}
		public function onRightKey():void{
			main.swarm.incrState();
			main.cmdLog.append("next pattern");
			//main.lastCmd.text = "next pattern";
		}
		public function onLeftKey():void{
			main.swarm.decrState();
			main.cmdLog.append("previous pattern");
		}
		public function onUpKey():void{
			main.swarm.incrSort();
			main.cmdLog.append("increment sort");
		}
		public function onDownKey():void{
			main.swarm.decrSort();
			main.cmdLog.append("decrement sort");
		}
		public function onSpaceKey():void{
			//main.dropped.tile(); //could move to preview state onEnterFrame
			//main.mainState = main.preview;
			main.swarm.dropSelected();
			main.cmdLog.append("drop selected");
		}
		public function onKey1():void{
			//
			
		}
		public function onKey2():void{
			trace("ExploreState->onKey2");
			main.swarm.preview();
			main.uiState = main.preview;
			//main.uiState.onOpenState();
			main.cmdLog.append("preview mode");
		}
		public function onKey3():void{
			//main.mainState = main.about;
			
		}
		public function onKey4():void{
			//main.mainState = main.contact;
			TweenLite.to(main.swarm, .25, {scaleX:1, scaleY:1});
		}
		public function onCtrlClick(node:Node, button:Object):void
		{
			switch (button.type) {
				case "dot":
					//dot clear and select
					//main.swarm.add(node);
					//main.cmdLog.append("add/remove to selection");
					//tag clear and selectby
					main.swarm.add(node);
					//main.swarm.addBy(node.tag.t.text);
					main.cmdLog.append("add node: " + node.dat[0] + node.dat[1]);
					break;
				case "icon":
					//tag clear and selectby
					main.swarm.remove(node);
					main.cmdLog.append("remove node: " + node.dat[0] + node.dat[1]);
					break;
				case "tag":
					//main.swarm.addBy(node.tag.t.text);
					break;
				default:
					trace("oops, you ctrl clicked button of type: " + button.type);
			}
		}
		public function onShftClick(node:Node, button:Object):void
		{
			switch (button.type) {
				case "dot":
					//main.swarm.filterBy(node.tag.t.text);
					//main.cmdLog.append("filter by: " + node.tag.t.text);
					main.swarm.selectBy(node.tag.t.text);
					main.cmdLog.append("select by: " + node.tag.t.text);
					break;
				case "icon":
					//
					//main.swarm.xxx(node);
					main.swarm.selectBy(node.tag.t.text);
					main.cmdLog.append("select by: " + node.tag.t.text);
					break;
				case "tag":
					/*main.swarm.filterBy(node.tag.t.text);
					main.cmdLog.append("filter by: " + node.tag.t.text);*/
					break;
				default:
					trace("damn it, you shft clicked button of type: " + button.type);
			}
		}
		public function onAltClick(node:Node, button:Object):void
		{
			//can't use alt b/c window uses it to focus toolbar
		}
		public function onCtrlShftClick(node:Node, button:Object):void
		{
			switch (button.type) {
				case "dot":
					//
					break;
				case "icon":
					//
					main.swarm.filterBy(node.tag.t.text);
					main.cmdLog.append("filter by: " + node.tag.t.text);
					break;
				case "tag":
					//
					break;
				default:
					trace("shit, you shft clicked button of type: " + button.type);
			}
		}
		public function onMouseClick(node:Node, button:Object):void
		{
			switch (button.type) {
				case "dot":
					//dot clear and select
					main.swarm.select(node);
					main.cmdLog.append("select node: " + node.dat[0] + node.dat[1]);
					break;
				case "icon":
					//tag clear and selectby
					//main.swarm.selectBy(node.tag.t.text);
					//main.cmdLog.append("select by: " + node.tag.t.text);
					//DO NOTHING B/C drag will handle this case! <------------------------NOTE
					break;
				case "tag":
					//
					//main.swarm.xxx(node);
					main.swarm.selectBy(node.tag.t.text);
					//main.cmdLog.append("filter by: " + node.tag.t.text);
					break;
				case "popout": //rename popoutData
					//trace("popout");
					main.swarm.popout(node);
					break;
				case "popin":
					//trace("popin");
					main.swarm.popin(node);
					break;
				case "closeThumb":
					//
					main.swarm.close(node);
					break;
				default:
					//trace("Not a valid type of button");
			}
		}
		
		//public function onDataBoxClick(node:Node, button:Object):void{}
		
		public function onMouseDown(node:Node, button:Object):void
		{
			switch (button.type) {
				case "icon":
					//
					main.swarm.drag(node); //should be dragIcon!!
					main.cmdLog.append("drag " + node.dat[0] + node.dat[1]);
					break;
				case "bmp":
					main.swarm.drag(node); //should be dragThumb!!
					main.cmdLog.append("drag " + node.dat[0] + node.dat[1]);
					break;
				default:
					//break
			}
		}
		public function onMouseUp(node:Node):void{
			main.swarm.drop(node);
		}
		
		//over
		public function onMouseOver(node:Node, button:Object):void{
			main.hoverLabel.show();
			main.swarm.startHover(node);
			//main.cmdLog.append("start hover");
			//main.swarm.startFocus(target.tag.t.text);

			switch (button.type) {
				case "dot":
					main.hoverLabel.text = "select " + node.dat[0] + node.dat[1];
					break;
				case "icon":
					main.hoverLabel.text = "drag to pluck " + node.dat[0] + node.dat[1];
					break;
				case "tag":
					main.hoverLabel.text = "Clear and Select by: " + node.tag.t.text;
					break;
				case "popout": //rename popoutData
					main.hoverLabel.text = "show data for " + node.dat[0] + node.dat[1];
					break;
				case "popin":
					main.hoverLabel.text = "hide data for " + node.dat[0] + node.dat[1];
					break;
				case "closeThumb":
					main.hoverLabel.text = "close thumbnail and return " + node.dat[0] + node.dat[1] + " to the swarm";
					break;
				case "bmp":
					main.hoverLabel.text = "drag " + node.dat[0] + node.dat[1];
					break;
				default:
					//trace("Not a valid type of button");
			}
		}
		public function onCtrlOver(node:Node, button:Object):void{
			main.swarm.startHover(node);
			//main.cmdLog.append("start hover");
			//main.swarm.startFocusBy(node.tag.t.text);
			main.hoverLabel.text = "Add/remove " + node.dat[0] + node.dat[1];
		}
		public function onShftOver(node:Node, button:Object):void{
			main.swarm.startHover(node);
			main.swarm.startSelectByFocus(node.tag.t.text); //should be focusDotsBy
			main.hoverLabel.text = "Select by: " + node.tag.t.text;
		}
		public function onCtrlShftOver(node:Node, button:Object):void{
			main.swarm.startHover(node);
			main.swarm.startFilterByFocus(node.tag.t.text); //should be focusIconsBy
			main.hoverLabel.text = "Filter by: " + node.tag.t.text;
		}
		
		//out
		public function onMouseOut(node:Node):void{
			main.hoverLabel.hide();
			main.swarm.stopHover(node);
			//main.cmdLog.append("stop hover");
			//main.swarm.stopFocus(target.tag.t.text);
		}
		public function onCtrlOut():void{
			//main.swarm.startHover(node);
			main.swarm.stopFocusBy();
			//main.cmdLog.append("stopFocusBy");
		}
		public function onShftOut():void{
			//main.swarm.startHover(node);
			main.swarm.stopFocusBy();
			//main.cmdLog.append("stopFocusBy");
		}
		public function onCtrlShftOut():void{
			//
		}
		

	}//end class
}//end pkg