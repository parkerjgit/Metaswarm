package metaswarm.subset    {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Graphics;
    import flash.display.Shape;
	
	public class SubsetTiler extends Sprite{
		
		public var subset:Subset;
		//var tileSize:uint;
		
		//constructor:	
		public function SubsetTiler(subset:Subset){
			this.subset = subset;
			//this.tileSize = 100; //later define dynamically
		}
		
		//this is beastly for now. it sets target of both databox
		//and tag, regardless of whether dropped or picked called it.
		//and s should not be hard coded!!
		public function grid():void{
			//trace("tiler.grid");
			var s:uint = 100;
			var cnt:uint = subset.nodes.length;
			//trace("cnt: " + cnt);
			//var xMargin:uint = s/4;
    		//var yMargin:uint = s/4;
			var xsp:uint = s*2;
			var ysp:uint = s + s/4;
			var cols:uint = Math.ceil(((s+ysp) * cnt) / 1080);
			//trace("cols: " + cols);
			var xoff:uint = s/4;
			var yoff:uint = s/4;
			
			for(var i:uint=0; i<cnt; i++){
				//trace("subset.nodes[i].thumb.x: " + subset.nodes[i].meta.x);
				//trace("subset.nodes[i].thumb.y: " + subset.nodes[i].meta.y);
				var px:Number = subset.nodes[i].thumb.x;
				var py:Number = subset.nodes[i].thumb.y;
				subset.nodes[i].thumb.setPrev(px, py);
				//
				var tgx:Number = xoff + xsp*(i%cols);
				var tgy:Number = yoff + ysp*Math.floor(i/cols);
				subset.nodes[i].popout();
				subset.nodes[i].thumb.setTarget(tgx, tgy);
				//subset.nodes[i].tag.setTarget(tgx, tgy);
			}
		}
		
		public function restore():void{
			//trace("tiler.restore");
			var cnt:uint = subset.nodes.length;
			for(var i:uint=0; i<cnt; i++){
				//trace("subset.nodes[i].thumb.x: " + subset.nodes[i].meta.x);
				//trace("subset.nodes[i].thumb.y: " + subset.nodes[i].meta.y);
				var tgx:Number = subset.nodes[i].thumb.px;
				var tgy:Number = subset.nodes[i].thumb.py;
				subset.nodes[i].popin();
				subset.nodes[i].thumb.setTarget(tgx, tgy);
				//subset.nodes[i].tag.setTarget(tgx, tgy);
			}
		}
		
	}//end class
}//end pkg