package metaswarm.node.components.tag   {
	import flash.display.*;
	
	public class TagButton extends SimpleButton{
		
		private static const BLACK:uint = 0x231F20;
		private static const WHITE:uint = 0xFFFFFF;
		private static const BRIGHTRED:uint = 0xFF3333;
		private static const BRIGHTBLUE:uint = 0x66CDFF;
		
		public var size:uint;
		public var type:String;
	
		public function TagButton() {
			this.size = 5;
			this.type = "tag";
			downState      = new TagButtonState(BRIGHTBLUE, BLACK, size);
			overState      = new TagButtonState(BRIGHTRED, BLACK, size);
			upState        = new TagButtonState(WHITE, BLACK, size);
			hitTestState   = new TagButtonState(WHITE, BLACK, size);
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