﻿package metaswarm.node.components.icon   {
	import flash.display.DisplayObject;
    import flash.display.Graphics;
    import flash.display.Shape;
	import flash.display.Sprite;
	import metaswarm.node.components.Particle;
	
	
	public class Icon extends Particle{
		
		private static const Z_EASE:Number 	= 1;
		private static const Z_SNAP:Number 	= 1;
		
		//Target zoom
		private var tgw:Number;
		
		//radial distance to zoom target
		private var dw:Number;
		
		//zoom velocity
		private var vw:Number;
		
		//should be a customSimpleButton not a maker
		public var iconMaker:IconMaker;
		public var iconButton:IconButton;
		
		public function Icon(tgw:Number=0,
							dw:Number=0,
							vw:Number=0):void
		{
			this.x = 0;
			this.y = 0;
			this.tgw = tgw;
			this.dw = dw;
			this.vw = vw;
			
			iconMaker = new IconMaker(this);
			
			init();
		}
		public function init():void {
			visible = false;
			focusRect = true;
			tabEnabled = true;
			doubleClickEnabled = true;
			//mouseEnabled = false;
		}
		
		public function load():void{
			//
		}
		//might depend on load later, so keep here
		//rather than put in init
		public function make():void{
			iconMaker.make();
		}
		
		public function scaleToTarget():void {
			dw = tgw - this.width;
			if(Math.abs(dw - Z_SNAP)<1){
				this.width = tgw;
				this.height = tgw;
				//removeEventListener(Event.Enter_FRAME, onEnterFrame);
			}else{
				vw = dw * Z_EASE;
				this.width += vw;
				this.height += vw;
			}
		}
				
		public function setTargetWidth(a:Number):void {
			tgw = a;
		}
	}
}
			