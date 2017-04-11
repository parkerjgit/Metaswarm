package metaswarm.build {
    import flash.display.*;
	import flash.events.*;
	import flash.ui.Keyboard;
	import flash.net.*;
	import flash.utils.*;
	import flash.text.*;
	import metaswarm.ui.hoverlabel.LabelMaker;
	import metaswarm.ui.sidebar.SidebarMaker;
	import metaswarm.swarm.patternmaker.PatternMaker;
	import metaswarm.swarm.SwarmLoader;
	import metaswarm.ui.UiLoader;
	import metaswarm.*;

	//import fl.controls.Label;

    public class Builder extends Sprite
    {
		private var _gnurbwurk:Metaswarm;
		private var _uiLoader:UiLoader;

        public function Builder(_gnurbwurk:Metaswarm):void
		{
			this._gnurbwurk = _gnurbwurk;
			this._uiLoader = new UiLoader(_gnurbwurk.ui);
			
			init();
		}
		private function init():void
		{ 
			//
		}		
		public function load(dat:Array):void
		{
			//load parsed data into objects
			_uiLoader.load(dat);
		}
		public function make():void
		{
			//make views
			_uiLoader.make();
		}
		public function go():void
		{
			//add grandchildren to display
			_uiLoader.go();
		}
		
    }//end class
}//end pkg