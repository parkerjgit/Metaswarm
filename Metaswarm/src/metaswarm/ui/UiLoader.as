package metaswarm.ui 
{	
	import metaswarm.*;
	import metaswarm.swarm.SwarmLoader;
	import metaswarm.swarm.patternmaker.PatternMaker;
	import metaswarm.ui.hoverlabel.LabelMaker;
	import metaswarm.ui.log.LogMaker;
	import metaswarm.ui.sidebar.SidebarMaker;
	
	public class UiLoader 
	{	
		private var _ui:Ui;
		private var _labelMaker:LabelMaker;
		private var _sidebarMaker:SidebarMaker;
		private var _patternMaker:PatternMaker;
		private var _logMaker:LogMaker;
		
		public function UiLoader(main:Ui) {
			this._ui = main;
			this._patternMaker = new PatternMaker(_ui.swarm);
			this._labelMaker = new LabelMaker(_ui.hoverLabel);
			this._sidebarMaker = new SidebarMaker(_ui.sidebar);
			this._logMaker = new LogMaker(_ui.cmdLog);
			init();
		}
		
		private function init():void { 
			//  
		}
		
		public function load(dat:Array):void{
			//trace("main.load()");
			var swarmLoader:SwarmLoader = new SwarmLoader(_ui.swarm); //<------------------------------------not sure about this
			swarmLoader.load(dat);
		}
		public function make():void{
			//trace("main.make()");
			var swarmLoader:SwarmLoader = new SwarmLoader(_ui.swarm); //<------------------------------------not sure about this
			swarmLoader.make();
			_labelMaker.make();
			_patternMaker.make();
			_sidebarMaker.make();
			_logMaker.make();
		}
		public function go():void{
			//trace("main.go()");
			var swarmLoader:SwarmLoader = new SwarmLoader(_ui.swarm); //<------------------------------------not sure about this
			swarmLoader.go();
			_labelMaker.go();
			_sidebarMaker.go();
			_logMaker.go();
			
			
			_ui.addChild(_ui.swarm);
			_ui.addChild(_ui.hoverLabel);
			_ui.addChild(_ui.sidebar);
			_ui.addChild(_ui.cmdLog);
			
			//set initial pattern
			_ui.swarm.setPattern();
		}
	}
}