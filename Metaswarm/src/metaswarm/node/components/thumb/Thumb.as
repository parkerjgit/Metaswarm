package metaswarm.node.components.thumb   {
	import flash.display.*;
	import flash.events.*;
    import flash.net.URLRequest;
	import flash.text.*;
	import metaswarm.node.components.Particle;
	
	public class Thumb extends Particle{
		
		public var path:String;
		
		public var ldr:BitmapLoadr;
		public var bmpButton:BmpButton;
		public var bmpLoaded:Boolean;
		public var thumbMaker:ThumbMaker;
		
		public var header:TextField = new TextField();
		public var footer:TextField = new TextField();
		
		public var closeButton:ThumbButton;
		public var popoutButton:ThumbButton;
		public var popinButton:ThumbButton;
		
		public function Thumb():void {
			ldr = new BitmapLoadr(this);
			bmpButton = new BmpButton();
			bmpLoaded = false;
			thumbMaker = new ThumbMaker(this);
			init();
		}
		public function init():void {
			//addChild(ldr); //no no no
			visible = false;
			//focusRect = true;
			//tabEnabled = true;
		}
		
		public function load(path:String):void{
			this.path = path;
			if(!bmpLoaded){
				ldr.loadBmp(path);
				bmpLoaded = true;
			}
		}
		public function make():void{
			thumbMaker.make();
		}
	}
}