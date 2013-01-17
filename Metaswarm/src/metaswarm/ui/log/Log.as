package metaswarm.ui.log {
	import flash.display.*;
	import flash.text.*;
	
	public class Log extends Sprite{
		
		//add formatting constants here
		//public var logMaker:LogMaker;
		public var output:TextField;
		public var entries:Array;
		
		public function Log():void
		{
			output = new TextField();
			//logMaker = new LogMaker(this);
			entries = new Array();
			
			init();
		}
		public function init():void {
			visible = true;
			focusRect = false;
			tabEnabled = false;
			//tag.mouseEnabled = false;
		}
		
		public function load():void{
			//
		}
		public function make():void{
			//logMaker.make();
		}
		
		public function append(txt:String):void{
			trace("txt: " + txt);
			trace("entries[" + entries.length + "]: " + entries[entries.length-1]);
			
			trace("_");
			
			entries.push(txt);
			//output.unshift(txt + '\n');
			output.replaceText(0, 0, txt + '\n');
			
			/*
			if(txt != entries[entries.length-1]){
				trace("log it");
				entries.push(txt);
				//output.appendText(txt + '\n');
				//output.unshift(txt + '\n');
				output.replaceText(0, 0, txt + '\n');
			}else{
				//entries.push(txt);
				//output.appendText(entries.pop() + '\n');
				//output.text = entries.pop();
			}
			*/
		}
			
		
	}//end class
}//end pkg