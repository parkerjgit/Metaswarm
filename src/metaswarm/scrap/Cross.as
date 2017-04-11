package metaswarm.scrap   {
	import flash.display.DisplayObject;
    import flash.display.Graphics;
    import flash.display.Shape;
	import flash.display.Sprite;
	import metaswarm.node.components.Particle;
	
	public class Cross extends Particle{
		
		public function Cross():void{
			init();
		}
		public function init():void {
			//visible = true;
			//focusRect = true;
			//tabEnabled = true;
		}
		
		public function load():void{
			//
		}
		//might dep on load later, so leave here!
		public function make():void{
			//trace("cross.make()");
			this.graphics.lineStyle(0);
			//this.graphics.lineStyle(1, 0xFF0000);
			this.graphics.moveTo(x, y-3);
			this.graphics.lineTo(x, y+3);
			this.graphics.moveTo(x-3, y);
			this.graphics.lineTo(x+3, y);
			/*trace("visible: " + this.visible);
			trace("x: " + this.x);
			trace("y: " + this.y);*/
		}
	}
}
		
		