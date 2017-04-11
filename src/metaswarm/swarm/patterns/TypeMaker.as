package metaswarm.swarm.patterns   {
import flash.display.*;
import flash.utils.*;
import flash.events.*;
import flash.geom.*;
import flash.text.*;

	public class TypeMaker extends Sprite {
		
		//minimum size that text can be rastered at to provide
		//adequate sampling for large display
		private static const FONTSIZE:Number = 42;
		
		public function TypeMaker():void{
		}
		
		//given a text string, number of times to sample it, and desired width of output
		//returns a matrix of 2d coordinates
		public function make(strToSample:String, numOfSamples:uint, outputWidth:Number):Array
		{
			var coords:Array = new Array();
			var bitmap:Bitmap = new Bitmap();
			
			bitmap = raster(strToSample, FONTSIZE);
			coords = sample(bitmap, numOfSamples, outputWidth);
			
			return coords;
		}
		
		private function raster(strToRaster:String, sizeToRasterAt:uint):Bitmap
		{
			//bitmap obj to draw text onto
			var bitmapData:BitmapData;
			
			// Create the text
			var txt:TextField = new TextField( );
			txt.text = strToRaster;
			txt.autoSize = TextFieldAutoSize.LEFT;
			
			var fmt:TextFormat = new TextFormat( );
			fmt.size = sizeToRasterAt;
			fmt.font = "Arial Black";
			fmt.color = 0x000000;
			
			txt.setTextFormat(fmt);
			
			// Make the BitmapData object, sized to accommodate the text. transp is false.
			bitmapData = new BitmapData(txt.textWidth, txt.textHeight, false, 0xffffff);
			
			// Draw the text into the BitmapData object
			bitmapData.draw(txt);
			
			// Associate the BitmapData object with a Bitmap object
			var bitmap:Bitmap = new Bitmap(bitmapData);
			
			return bitmap;	
		}
		
		private function sample(bitmapToSample:Bitmap, numOfSamples:uint, outputWidth:uint):Array
		{
			//matrix of 2d coordinate arrays to return
			var points:Array = new Array();
			
			//bitmapData to sample
			var bitmapData:BitmapData = bitmapToSample.bitmapData;
			
			//brute force determination number of black pixels
			var numOfBlkPixels:uint = 0;
			for (var i:uint=0; i<bitmapData.width; i++){
				for (var j:uint=0; j<bitmapData.height; j++){
					//trace(bitmapData.getPixel(i,j));
					if(bitmapData.getPixel(i,j) == 0){
						numOfBlkPixels ++;
					}
				}
			}
			
			//calc sample step and scale factor to scale output to desired size
			var step:Number = Math.sqrt(numOfBlkPixels / numOfSamples);
			var sf:Number = outputWidth / bitmapData.width;
			
			//resample img every step pixels
			var count:uint = 0;
			for (var m:Number=0; m<bitmapData.width; m+=step){
				for (var n:Number=0; n<bitmapData.height; n+=step){
					if(bitmapData.getPixel(m,n) == 0){
						var nextPoint:Array = [m*sf, n*sf];
						//trace("next point: " + m*sf + ", " + n*sf);
						points.push(nextPoint);
						count++
					}
				}
			}
			
			//check variables
			/*trace("numOfBlkPixels: " + numOfBlkPixels);
			trace("numOfSamples: " + numOfSamples);
			trace("step: " + step);
			trace("sf: " + sf);
			trace("count: " + count);*/
			
			//return coordinates of new blk pixels
			return points;
		}
		
	}//end class
}//end pkg
