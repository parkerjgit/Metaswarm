package metaswarm.node.components.dot    {
	import flash.display.*;
	import flash.text.*;
	
	//should this extend shape instead????
	public class DotButtonState extends Sprite {
		//private var typeOfButton:uint;
		private var bgColor:uint;
		private var lineColor:uint;
		private var size:uint;
	
		public function DotButtonState(lineColor:uint, bgColor:uint, size:uint) {
			//this.typeOfButton = typeOfButton;
			this.bgColor = bgColor;
			this.lineColor = lineColor;
			this.size = size;
			draw();
		}
	
		private function draw():void {
			//trace("draw the dot button state");
			graphics.beginFill(bgColor);
			graphics.drawRect(-size, -size, size*2, size*2);
			graphics.endFill();
			
			graphics.lineStyle(0, lineColor);
			graphics.moveTo(x, y-size);
			graphics.lineTo(x, y+size);
			graphics.moveTo(x-size, y);
			graphics.lineTo(x+size, y);
		}
	}
}