package metaswarm.ui.sidebar {
	import flash.display.*;
	import flash.geom.ColorTransform;
	import flash.text.*;
	
	public class SidebarMaker extends Sprite{
		
		public var sb:Sidebar;
		
		public function SidebarMaker(sidebar:Sidebar):void{
			this.sb = sidebar;
			init();
		}
		public function init():void {
			//
		}
		public function make():void {
			
			var h1fmt:TextFormat = new TextFormat( );
			h1fmt.font = "technic";
			h1fmt.size = 16;
			h1fmt.leftMargin = 10;
			
			var fmt:TextFormat = new TextFormat( );
			fmt.font = "technic";
			fmt.size = 16;
			fmt.leftMargin = 10;

			// ************************************** shared properties
			/*
			var bg:ColorTransform;
			bg.color = 0xFAFAFA;
			var border:ColorTransform;
			border.color = 0xE6E6E6; 
			*/
			var sbWidth:int = 180;
			var xOffset:int = 20;
			var yOffset:int = 50;
			
			// **************************************
			sb.header.text = '\n' + "meta.swarm" + '\n\n';
			sb.header.setTextFormat(h1fmt);
			sb.header.selectable = false;
			sb.header.mouseEnabled = false;
			sb.header.x=xOffset;
			//sb.header.y=0;
			sb.header.width = sbWidth;
			sb.header.height = 40;
			//sb.header.autoSize = TextFieldAutoSize.CENTER;
			sb.header.background = true;
			sb.header.backgroundColor = 0x333333;
			sb.header.border = false; 
			sb.header.borderColor = 0xE6E6E6;
			
			// **************************************
			sb.shortcuts.text = " " + '\n' +
								"navigation" + '\n\n' +
								"^ - increment sort" + '\n' +
								"v - decrement sort" + '\n' +
								"> - increment pattern" + '\n' +
								"< - decrement pattern" + '\n\n';
			sb.shortcuts.setTextFormat(fmt);
			sb.shortcuts.selectable = false;
			sb.shortcuts.mouseEnabled = false;
			sb.shortcuts.x = xOffset;
			//sb.shortcuts.y = 0;
			sb.shortcuts.width = sbWidth;
			sb.shortcuts.height = 140;
			//sb.shortcuts.autoSize = TextFieldAutoSize.CENTER;
			sb.shortcuts.background = true;
			sb.shortcuts.backgroundColor = 0x333333;
			sb.shortcuts.border = false; 
			sb.shortcuts.borderColor = 0xE6E6E6;
			
			//  **************************************
			sb.states.text = " " + '\n' + 
							 "selection" + '\n\n' +
							 "r - select / deselect" + '\n' +
							 "ctrl + r - add / remove" + '\n' +
							 "shft + r -  select by" + '\n' +
							 "ctrl&shft + r - filter by" + '\n\n';
			sb.states.setTextFormat(fmt);
			sb.states.selectable = false;
			sb.states.mouseEnabled = false;
			sb.states.x = xOffset;
			sb.states.width = sbWidth;
			sb.states.height = 130;
			//sb.states.autoSize = TextFieldAutoSize.LEFT;
			sb.states.background = true;
			sb.states.backgroundColor = 0x333333;
			sb.states.border = false; 
			sb.states.borderColor = 0xE6E6E6;
			
			// **************************************
			sb.nodeList.text = '\n' + "nodes" + '\n\n';
			sb.nodeList.setTextFormat(fmt);
			sb.nodeList.selectable = false;
			sb.nodeList.mouseEnabled = false;
			//sb.nodeList.scrollV = 1;
			sb.nodeList.x = xOffset;
			sb.nodeList.width = sbWidth;
			sb.nodeList.height = 900 - (sb.header.textHeight + 
										sb.shortcuts.textHeight + 
										sb.states.textHeight +
										sb.footer.textHeight);
			//sb.nodeList.autoSize = TextFieldAutoSize.LEFT;
			sb.nodeList.background = true;
			sb.nodeList.backgroundColor = 0xffffff;
			sb.nodeList.border = false; 
			sb.nodeList.borderColor = 0xE6E6E6;
			
			// **************************************
			sb.footer.text = '\n' + "by boot" + '\n\n';
			sb.footer.setTextFormat(fmt);
			sb.footer.selectable = false;
			sb.footer.mouseEnabled = false;
			sb.footer.x = xOffset;
			sb.footer.width = sbWidth;
			sb.footer.height = 40;
			//sb.footer.autoSize = TextFieldAutoSize.LEFT;
			sb.footer.background = true;
			sb.footer.backgroundColor = 0xffffff;
			sb.footer.border = false; 
			sb.footer.borderColor = 0xE6E6E6;
			
			// **************************************
			sb.header.y = yOffset;
			sb.shortcuts.y = sb.header.height;
			sb.states.y = sb.shortcuts.y + sb.shortcuts.height;
			sb.nodeList.y = sb.states.y + sb.states.height;
			sb.footer.y = 900 - sb.footer.height;
			
		}
		
		public function go():void {
			//sb.addChild(sb.header);
			sb.addChild(sb.shortcuts);
			sb.addChild(sb.states);
			//sb.addChild(sb.nodeList);
			//sb.addChild(sb.footer);
		}
	}
}