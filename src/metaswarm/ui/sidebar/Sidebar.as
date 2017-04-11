package metaswarm.ui.sidebar {
	import flash.display.*;
	import flash.text.*;
	
	public class Sidebar extends Sprite{
		
		public var sidebarMaker:SidebarMaker;
		//
		public var header:TextField;
		public var shortcuts:TextField;
		public var states:TextField;
		public var nodeList:TextField;
		public var footer:TextField;
		
		public function Sidebar():void
		{
			header = new TextField();
			shortcuts = new TextField();
			states = new TextField();
			nodeList = new TextField();
			footer = new TextField();
			
			sidebarMaker = new SidebarMaker(this);
			
			init();
		}
		public function init():void {
			//
		}
		public function load():void{
			//
		}
		public function make():void{
			sidebarMaker.make();
		}
			
		
	}//end class
}//end pkg