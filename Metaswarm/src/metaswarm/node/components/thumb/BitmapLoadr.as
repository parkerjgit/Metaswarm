package metaswarm.node.components.thumb   {
  import flash.display.*;
  import flash.text.*;
  import flash.events.*
  import flash.net.*;
  import flash.geom.Matrix;
  
  public class BitmapLoadr extends Sprite {
	  
	public var loadProg:TextField;
	public var thumb:Thumb;
	
	private var loader:Loader; // The bitmap loader
	//var parsedData:Array; 
    //var output:String;
	//private static const PATH:String = "../index.txt";
	
    public function BitmapLoadr(thumb:Thumb) {
		this.thumb = thumb;
		init();
    }
    private function init():void { 
		loader = new Loader();
		loadProg = new TextField();
      	//loadProg.width = stage.stageWidth;
      	//loadProg.height = stage.stageHeight;
      	thumb.addChild(loadProg); 
    }
	public function loadBmp(path:String):void {
		// Listen for the progress event to check download progress
      	loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, handleProgress);
		// listen for load complete
		loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
		// Register to be notified when the bitmap has been initialized
		loader.contentLoaderInfo.addEventListener(Event.INIT, onInit);
		
		loader.load(new URLRequest("1.JPG"));
	}
		
	// Triggered when the bitmap has been loaded and initialized
	private function onInit(event:Event):void {
		//trace("onInit");
		var loadedBitmap:Bitmap = Bitmap(loader.content);
		
		var loadedBitmapData:BitmapData = loadedBitmap.bitmapData;
		
		// Set the amount by which to scale the bitmap
		var scaleFactor:Number = .5;
		
		/*//specify the height here for now <<<<<<<<<********************************************
		var newHeight:int = 100;
		
		// Calculate the new dimensions of the scaled bitmap
		scaleFactor = newHeight/loadedBitmapData.height;
		var newWidth:int = loadedBitmapData.width * scaleFactor;*/
		
		//specify the height here for now <<<<<<<<<********************************************
		var newWidth:int = 125;
		
		// Calculate the new dimensions of the scaled bitmap
		scaleFactor = newWidth/loadedBitmapData.width;
		var newHeight:int = loadedBitmapData.height * scaleFactor;
		
		// Create a new BitmapData object, sized to hold the scaled bitmap
		var scaledBitmapData:BitmapData = new BitmapData(newWidth, newHeight,
											loadedBitmapData.transparent);
		
		// Create a transformation matrix that will scale the bitmap
		var scaleMatrix:Matrix = new Matrix();
		scaleMatrix.scale(scaleFactor, scaleFactor);
		
		//loadedBitmapData.draw(loadedBitmap, new Matrix())
		// Draw the scaled bitmap into the new BitmapData object
		scaledBitmapData.draw(loadedBitmapData, scaleMatrix);
		
		// Replace the original BitmapData object with the
		// new, scaled BitmapData object
		//loadedBitmap.bitmapData = scaledBitmapData;
		
		// Create a new Bitmap using the BitmapData
    	// and display it.
    	//var newImage:Bitmap = new Bitmap(loadedBitmapData);
    	
		thumb.bmpButton.bmp.bitmapData = scaledBitmapData;
		//addChild(thumb.bmp);
		
		//thumb.bmp = loadedImage;
		thumb.bmpButton.addChild(thumb.bmpButton.bmp);
	}
	
	private function handleProgress(event:ProgressEvent):void {
      	// Calculate the percentage loaded
      	var percent:Number = Math.round(event.bytesLoaded 
                                      / event.bytesTotal * 100 );
      
      	loadProg.text = " Loaded: " + event.bytesLoaded + "\n"
                      + "  Total: " + event.bytesTotal + "\n"
                      + "Percent: " + percent;
						
		//trace(loadProg.text);
    }
	
	private function onComplete(event:Event):void {
		//done with loadProg so remove it
     	thumb.removeChild(loadProg);
    }
  
  }//end class
}//end pkg