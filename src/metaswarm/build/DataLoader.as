package metaswarm.build {
  import flash.display.*;
  import flash.text.*;
  import flash.events.*
  import flash.net.*;
  
  public class DataLoader extends Sprite {
	  
	private var _loadProg:TextField;  
	private var _preloader:Preloader;
	
    public function DataLoader(preloader:Preloader) 
	{
		this._preloader = preloader;
		this._loadProg = new TextField();
		
		init();
    }
    
    private function init():void 
	{ 
      	//loadProg.width = stage.stageWidth;
      	//loadProg.height = stage.stageHeight;   
      	addChild(_loadProg);  
    }
	
	public function preload():void {
			  
		var loader:URLLoader = new URLLoader();
			  
		// Instruct the loader to read the file as plain text - This line is not
		// necessary because the dataFormat is DataFormat.TEXT by default.
		loader.dataFormat = URLLoaderDataFormat.TEXT;
			  
		// Register an event handler for when the data is finished downloading
		loader.addEventListener(Event.COMPLETE, loadComplete);
		
		// Listen for the progress event to check download progress
      	loader.addEventListener(ProgressEvent.PROGRESS, handleProgress);
 
		// Load the HTML text from the example.html file
		loader.load(new URLRequest("index7.txt"));
    }
		
	private function handleProgress(event:ProgressEvent):void 
	{
      	// Calculate the percentage by multiplying the loaded-to-total 
      	// ratio by 100
      	var percent:Number = Math.round(event.bytesLoaded 
                                      / event.bytesTotal * 100 );
      
      	_loadProg.text = " Loaded: " + event.bytesLoaded + "\n"
                        + "  Total: " + event.bytesTotal + "\n"
                        + "Percent: " + percent;
						
		//trace(loadProg.text);
    }

	
    private function loadComplete(event:Event):void 
	{
		var loader:URLLoader = URLLoader(event.target);
			  
		// assign to output. The data property of the URLLoader is the file contents.
		parseData(loader.data);
    }
	
	private function parseData(loadedData:String):void 
	{
		var parsedData:Array = new Array();
		//var parsedMenu:Array = new Array();
		
		// Split the string into an array of words using a space as the delimiter.
		var lines:Array = loadedData.split("\n");
		var words:Array = new Array();
			
		// Loop through the array and do something with each word. 
		// In this example, just output the values.
		for ( var i:int = 0; i < lines.length; i++ ) {
			words = lines[i].split("\t");
			parsedData.push(words);
			//trace(parsedData[i][1]);
		}
		//gnurbwurk.parsedData = parsedData;
		_preloader.preloadComplete(parsedData);
		//gnurbwurk.main.load(parsedData);
		//gnurbwurk.main.make();
		//gnurbwurk.main.go();
		//gnurbwurk.main.makePatterns();
	}
  
  }//end class
}//end pkg