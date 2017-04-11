package metaswarm.swarm.patterns   {
import flash.display.*;
import flash.utils.*;
import flash.events.*;
import flash.geom.*;
import flash.text.*;

	public class LorenzeMaker extends Sprite {
		
		//lorenze constants - do not change
		private static const H:Number = 0.01;
		private static const A:Number = 10.0;
		private static const B:Number = 28.0;
		private static const C:Number = 8.0/3.0;
		
		public function LorenzeMaker():void{
		}
		
		//returns a matrix of 2d coordinates
		public function make(numOfPoints:uint, w:uint, h:uint):Array
		{
			var points:Array = new Array();
			
			var sf:Number = h/300; //scale factor. adjust by steping divisor by 100
			var xoff:uint = w/2;
			var yoff:uint = h/2;
			var x0:Number = (Math.random() * 10) / 10;
			var y0:Number = Math.random() * 20;
			var z0:Number = Math.random() * 10;
			
			//lorenze iterative functions
			for(var i:uint=0; i<numOfPoints; i++){
				var x1:Number = x0 + H * A * (y0-x0);
				var y1:Number = y0 + H * (x0 * (B - z0) - y0);
				var z1:Number = z0 + H * (x0 * y0 - C * z0);
				
				//set next point coordinate
				var px:Number = (x0 * 10) * sf + xoff;
				var py:Number = (y0 * 10) * sf + yoff;
				var nextPoint:Array = [px, py]
				points.push(nextPoint);
				
				//feedback
				x0 = x1;
				y0 = y1;
				z0 = z1;
			}
			return points;
		}
		
	}//end class
}//end pkg