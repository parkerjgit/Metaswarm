package metaswarm.node     {
  import flash.display.*;
  import flash.text.*;
  import flash.events.*
  import flash.net.*;
  
  public class NodeLoader extends Sprite {
	    
	private var node:Node;
	
    public function NodeLoader(node:Node) 
	{
		this.node = node;
		//this.loadProg = new TextField();
		
		init();
    }
	private function init():void{
		//
	}
    
	public function load(dat:Array):void{
		//trace("nodeLoader load")
		node.dat = dat;
		node.dot.load();
		node.tag.load(dat);
		node.icon.load();
		//node.tag.load(node.dat);
		node.dataBox.load(dat);
		//node.thumb.load(node.dat[0] + node.dat[1]);
	}
	public function make():void{
		//trace("nodeLoader make")
		node.dot.make();
		node.tag.make();
		node.icon.make();
		node.dataBox.make();
		//node.thumb.make();
	}
	public function go():void{
		//nodes are initially idle
		//node.nodeState = node.idle;
		//node.addChild(node.thumb);
		node.addChild(node.dot);
		node.addChild(node.icon);
		node.addChild(node.tag);
		node.addChild(node.dataBox);
		//node.addChild(node.thumb); //just added this so I can remove bitmap loader from display list
	}
	
  }//end class
}//end pkg