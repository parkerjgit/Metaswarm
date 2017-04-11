package metaswarm.node.components.icon   {
	import flash.display.*;
	import flash.text.*;
	
	//should this extend shape instead????
	public class IconButtonState extends Sprite {
		//private var typeOfButton:uint;
		private var bgColor:uint;
		private var lineColor:uint;
		private var size:uint;
	
		public function IconButtonState(lineColor:uint, bgColor:uint, size:uint) {
			//this.typeOfButton = typeOfButton;
			this.bgColor = bgColor;
			this.lineColor = lineColor;
			this.size = size;
			draw();
		}
	
		private function draw():void {
			//trace("draw the icon button state");
			graphics.beginFill(bgColor);
			graphics.lineStyle(0, lineColor);
			//graphics.drawRect(0, 0, size, size);
			graphics.drawRect(-size, -size, size*2, size*2);
			graphics.endFill();
		}
	}
}