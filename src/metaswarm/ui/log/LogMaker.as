package metaswarm.ui.log {
	import flash.display.*;
	import flash.text.*;
	
	public class LogMaker extends Sprite{
		
		private var _log:Log;
		
		public function LogMaker(log:Log):void{
			this._log = log;
			init();
		}
		public function init():void {
			//
		}
		public function make():void {
			//var fmt:TextFormat = new TextFormat( );
			
			var fmt:TextFormat = new TextFormat("Technic", 10, 0xfff);
			//fmt.color = 0xfff;
			//tag.t.embedFonts = true;
			//tag.t.antiAliasType = AntiAliasType.ADVANCED;
			_log.output.text = "";
			_log.output.setTextFormat(fmt);
			_log.output.selectable = false;
			_log.output.mouseEnabled = false;
			//log.id = 0;
			
			//t.width = 
			//t.height =
			//_log.output.background = true
			//_log.output.backgroundColor = 0x999999; //light gray
			//t.border = true;
			//t.borderColor = 0x333333; //dark gray
			_log.output.autoSize = TextFieldAutoSize.LEFT;
			//addChild(this);
			
			//tag.t.text = tag.dat[tag.id];
			
			_log.output.x=1100;
			_log.output.y=0;
		}
		public function go():void {
			_log.addChild(_log.output);
		}
	}
}