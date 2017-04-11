package metaswarm.ui.hoverlabel {
	import flash.display.*;
	import flash.text.*;
	
	public class LabelMaker extends Sprite{
		
		private var hl:HoverLabel;
		
		public function LabelMaker(hoverLabel:HoverLabel):void{
			this.hl = hoverLabel;
			init();
		}
		public function init():void {
			//
		}
		public function make():void {
			//var fmt:TextFormat = new TextFormat( );
			var fmt:TextFormat = new TextFormat("Technic", 10, 0xfff);

			//tag.t.embedFonts = true;
			//tag.t.antiAliasType = AntiAliasType.ADVANCED;
			hl._output.text = "";
			hl._output.setTextFormat(fmt);
			hl._output.selectable = false;
			hl._output.mouseEnabled = false;
			//log.id = 0;
			
			//t.width = 
			//t.height =
			hl._output.background = true
			hl._output.backgroundColor = 0xf0ff64; //black
			//t.border = true;
			//t.borderColor = 0x333333; //dark gray
			hl._output.autoSize = TextFieldAutoSize.LEFT;
			//addChild(this);
			
			//tag.t.text = tag.dat[tag.id];
			
			
		}
		
		public function go():void {
			hl.addChild(hl._output);
		}
	}
}