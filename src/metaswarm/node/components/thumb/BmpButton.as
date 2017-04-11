package metaswarm.node.components.thumb   {
	import flash.display.*;
	import flash.text.*;
	
	public class BmpButton extends Sprite{
		
		public var type:String;
		
		public var bmp:Bitmap;
	
		public function BmpButton() {
			this.type = "bmp";
			
			bmp = new Bitmap();
		}
		
		public function make():void {
		}
	}
}