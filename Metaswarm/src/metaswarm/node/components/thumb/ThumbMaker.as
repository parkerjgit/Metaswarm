package metaswarm.node.components.thumb   {
	import flash.display.DisplayObject;
    import flash.display.Graphics;
    import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.*;
	
	public class ThumbMaker extends Sprite{
		
		private static const CLOSETHUMB:String = "closeThumb";
		private static const POPOUT:String = "popout";
		private static const POPIN:String = "popin";
		
		private var thumb:Thumb;
		
		public function ThumbMaker(thumb:Thumb):void{
			this.thumb = thumb;
			init();
		}
		public function init():void {
			//
		}
		public function make():void {
			//
			makeHeader();
			//makeFooter();
			makeButtons();
			//thumb.bmp.y = thumb.header.height;
			/*thumb.closeButton = new ThumbButton(CLOSETHUMB);
			thumb.closeButton.x = thumb.width-thumb.closeButton.width;
			thumb.addChild(thumb.closeButton);*/
		}
		
		private function makeHeader():void {
			
			var fmt:TextFormat = new TextFormat("Technic", 12, 0x66CDFF);
			
			//thumb.header.height = 15;
			//thumb.header.width = 125;
			thumb.header.background = true;
			thumb.header.backgroundColor = 0x231F20; 
			//thumb.header.alpha = 50;
			//thumb.header.border = true; 
			//thumb.header.borderColor = 0x000000; 
		
			thumb.header.autoSize = TextFieldAutoSize.LEFT;
			//addChild(this);*/
			thumb.header.text = "123.jpg";
			
			thumb.header.setTextFormat(fmt);
			
			thumb.header.selectable = false;
			thumb.header.mouseEnabled = false;
			//this.id = 0;
			thumb.addChild(thumb.header);
			//initTag();
		}
		
		private function makeFooter():void {
			
			var fmt:TextFormat = new TextFormat("Technic", 10, 0x000000);
			
			thumb.footer.height = 15;
			thumb.footer.width = 125;
			thumb.footer.background = true;
			thumb.footer.backgroundColor = 0xffffff; 
		
			//thumb.header.autoSize = TextFieldAutoSize.LEFT;
			thumb.footer.text = "footer";
			
			thumb.footer.setTextFormat(fmt);
			
			thumb.footer.selectable = false;
			thumb.footer.mouseEnabled = false;
			//this.id = 0;
			
			//thumb.footer.x = 0;
			thumb.footer.y = thumb.footer.width;
			
			thumb.addChild(thumb.footer);
			//initTag();
		}
		
		private function makeButtons():void {
			
			//this should be in thumb class**************************
			thumb.closeButton = new ThumbButton(CLOSETHUMB);
			thumb.popoutButton = new ThumbButton(POPOUT);
			thumb.popinButton = new ThumbButton(POPIN);
			//thumb.loadExtButton:CustomSimpleButton = new CustomSimpleButton("e");
			
			var buttonSize:uint = thumb.closeButton.size;
			var thumbWidth:uint = 125;
		
			//var myButton:Button = new Button();
			//thumb.close.label = "x";
			//thumb.close.emphasized = true;
			//thumb.close.width = 15;
			//close.move(20, 20);
			
			/*thumb.closeButton.make();
			thumb.popoutButton.make();
			thumb.popinButton.make();
			thumb.loadExtButton.make();*/
			
			thumb.closeButton.x = thumbWidth - buttonSize;
			//thumb.closeButton.y = thumb.header.height;
			
			thumb.popoutButton.x = thumbWidth - buttonSize*2;
			//thumb.popoutButton.y = (thumb.header.height + thumb.bmp.height) - 15;
			//thumb.popoutButton.y = buttonSize;
			
			thumb.popinButton.x = thumbWidth - buttonSize*3;
			//thumb.popinButton.y = (thumb.header.height + thumb.bmp.height) - 15;
			//thumb.popinButton.y = buttonSize*2;
			
			//thumb.loadExtButton.x = thumb.header.width-(15 * 3);
			//thumb.loadExtButton.y = thumb.header.height-15;
			
			thumb.addChild(thumb.bmpButton);
			
			thumb.addChild(thumb.closeButton);
			thumb.addChild(thumb.popoutButton);
			thumb.addChild(thumb.popinButton);
			//thumb.addChild(thumb.loadExtButton);
			
			
			
		}
	}
}