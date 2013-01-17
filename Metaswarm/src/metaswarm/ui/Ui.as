package metaswarm.ui   
{
    import flash.display.*;
	import flash.events.*;
	import flash.ui.Keyboard;
	import flash.net.*;
	import flash.utils.*;
	import flash.text.*;
	import metaswarm.ui.hoverlabel.HoverLabel;
	import metaswarm.ui.log.Log;
	import metaswarm.ui.sidebar.Sidebar;
	import metaswarm.swarm.Swarm;
	import metaswarm.ui.uistates.AboutState;
	import metaswarm.ui.uistates.ContactState;
	import metaswarm.ui.uistates.ExploreState;
	import metaswarm.ui.uistates.PreviewState;

	//import fl.controls.Label;
	
	//UI
    public class Ui extends Sprite
    {	
		public var w:int;
		public var h:int;
		
		public var swarm:Swarm;
		public var sidebar:Sidebar;
		public var hoverLabel:HoverLabel;
		public var cmdLog:Log;
		//public var lastCmd:Label;
		
		//internal states
		public var explore:UiState;
		public var preview:UiState;
		public var about:UiState;
		//public var contact:UiState;
		
		//internal state holder
		public var uiState:UiState;
		
        public function Ui():void
		{
			swarm = new Swarm();
			sidebar = new Sidebar();
			hoverLabel = new HoverLabel();
			//lastCmd = new Label();
			cmdLog = new Log();
			
			explore = new ExploreState(this);
			preview = new PreviewState(this);
			about = new AboutState(this);
			//contact = new ContactState(this);
			
			uiState = explore;
		
			init();
		}
		public function init():void{ 
			//can't access this.stage until main is added to stage
			//so listen for event then use stage
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function onAddedToStage(event:Event):void
		{
			swarm.x = stage.stageWidth/6;
			swarm.y = stage.stageHeight/6;
			swarm.w = stage.stageWidth*(2/3);
			swarm.h = stage.stageHeight*(2/3);
		}
	
    }//end class
}//end pkg