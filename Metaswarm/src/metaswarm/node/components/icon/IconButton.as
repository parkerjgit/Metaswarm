package metaswarm.node.components.icon   {
	import flash.display.*;
	
	public class IconButton extends SimpleButton{
		
		private static const BLACK:uint = 0x231F20;
		private static const WHITE:uint = 0xFFFFFF;
		private static const BRIGHTRED:uint = 0xFF3333;
		private static const BRIGHTBLUE:uint = 0x66CDFF;
		
		public var size:uint;
		public var type:String;
	
		public function IconButton() {
			this.size = 3;
			this.type = "icon";
			downState      = new IconButtonState(BRIGHTBLUE, BLACK, size);
			overState      = new IconButtonState(BRIGHTRED, BLACK, size);
			upState        = new IconButtonState(WHITE, BLACK, size);
			hitTestState   = new IconButtonState(WHITE, BLACK, size);
			hitTestState.x = -(size / 4);
			hitTestState.y = hitTestState.x;
			useHandCursor  = true;
		}
		
		public function forceOver():void{
			upState = overState;
		}
		
		public function restoreOver():void{
			upState = hitTestState;
		}
		
		/*//should be draw()
		public function make():void {
			icon.graphics.beginFill(0x0000ff);
			icon.graphics.lineStyle(0);
			icon.graphics.drawRect(0, 0, 10, 10);
			icon.graphics.endFill();
		}*/
	}
}