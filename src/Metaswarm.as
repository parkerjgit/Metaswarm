package  {
    import flash.display.DisplayObject;
    import flash.display.Graphics;
    import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.net.*;
	import flash.utils.*;
	import flash.text.TextField;
	import metaswarm.ui.hoverlabel.HoverLabel;
	import metaswarm.ui.sidebar.Sidebar;
	import metaswarm.swarm.Swarm;
	import metaswarm.build.Builder;
	import metaswarm.control.Controller;
	import metaswarm.build.Preloader;
	import metaswarm.control.Router;
	import metaswarm.ui.Ui;
	
	[SWF(width='1920',height='1200',backgroundColor='#F7F7F7',frameRate='25')]

    public class Metaswarm extends Sprite
    {
		//declarations
		private var _preloader:Preloader;
		private var _builder:Builder;
		private var _router:Router; 
		private var _controller:Controller;
		private var _ui:Ui;				
		
        public function Metaswarm():void
		{
			ui = new Ui();
			builder = new Builder(this);
			preloader = new Preloader(builder);
			controller = new Controller(ui); //removed hoverLabel param
			router = new Router(controller);
			
			init();	
		}

		private function init():void
		{
			//this.stage.quality = "low";
			
			//register ui listeners
			addEventListener(Event.ENTER_FRAME, router.onEnterFrame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, router.onkeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, router.onkeyUp);
			addEventListener(MouseEvent.CLICK, router.onMouseClick);
			addEventListener(MouseEvent.MOUSE_DOWN, router.onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, router.onMouseUp);
			addEventListener(MouseEvent.MOUSE_OVER, router.onMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, router.onMouseOut);
			
			//add ui stage
			addChild(ui);
		}
		
		public function get controller():Controller
		{
			return _controller;
		}
		
		public function set controller(value:Controller):void
		{
			_controller = value;
		}

		public function get router():Router
		{
			return _router;
		}

		public function set router(value:Router):void
		{
			_router = value;
		}

		public function get builder():Builder
		{
			return _builder;
		}

		public function set builder(value:Builder):void
		{
			_builder = value;
		}

		public function get preloader():Preloader
		{
			return _preloader;
		}

		public function set preloader(value:Preloader):void
		{
			_preloader = value;
		}
		
		public function get ui():Ui
		{
			return _ui;
		}

		public function set ui(value:Ui):void
		{
			_ui = value;
		}

		
    }//end class
}//end pkg