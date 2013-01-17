package metaswarm.scrap   {
	import flash.display.*;
	import flash.events.*;
    import flash.net.URLRequest;
    import metaswarm.node.components.thumb.BitmapLoadr;
    import metaswarm.node.components.Particle;
	
	public class Image extends Particle{
		
		var path:String;
		var ldr:BitmapLoadr;
		var bmp:Bitmap;
		var bmpLoaded:Boolean;
		
		public function Image():void {
			ldr = new BitmapLoadr(this);
			bmp = new Bitmap();
			bmpLoaded = false;
			init();
		}
		public function init():void {
			addChild(ldr);
			//l.loadImg("fake string");
			
			visible = false;
			//focusRect = true;
			//tabEnabled = true;
		}
		
		public function load(path:String):void{
			this.path = path;
		}
		public function make():void{
			if(!bmpLoaded){
				ldr.loadBmp(path);
				bmpLoaded = true;
			}
		}
		
	}
}