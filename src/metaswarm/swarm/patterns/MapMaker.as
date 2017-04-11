// map dependant
var LONG_INIT = -180;
var LAT_INIT = 90;
var LONG_FINAL = 180;
var LAT_FINAL = -90;
var LONG_DELTA = 360;
var LAT_DELTA = 180;

// zoom/position dependant
var mapX = 0;
var mapY = 0;
var mapWidth = 800; //Stage.width; 
var mapHeight = mapWidth/2; //lock aspect

	
	this._parent.map._x = mapX;
	this._parent.map._y = mapY;
	this._parent.map._width = mapWidth;
	this._parent.map._height = mapHeight;
	this._parent.map.setMask(msk);
	
	
// plot dots when button is pressed
this._parent.generateButton.onRelease = function() {

	//trace(rs.getLength());
	fields = rs.getColumnNames();
	for(var i=0; i<rs.getLength(); i++){
		//trace(rs.getItemAt(i)[fields[0]] + " , " + rs.getItemAt(i)[fields[1]]);
		//imageId = rs.getItemAt(i)[fields[0]];
		imageLat = rs.getItemAt(i)[fields[0]];
		imageLong = rs.getItemAt(i)[fields[1]];
		//this._parent.traceTxt.text = Stage.width;
		//mapWidth = 600;
		//mapHeight = 298;
		
		//convert longitude & latitude to screen cordinates
		//for max precision latitude/longitude incr < lat/long delta/stage hight/width respectively
		//4 sigfigs ain't bad then for my purposes, 5 would be better though
		imageX = mapX + Math.round(((number(imageLong) + Math.abs(LONG_INIT)) * (mapWidth / LONG_DELTA)));
		imageY = mapY + Math.round((((number(imageLat) * -1) + Math.abs(LAT_INIT)) * (mapHeight / LAT_DELTA)));
		
		//duplicate movieclip for each image location
		//duplicateMovieClip(this._parent.dot, imageId, 1);
		this._parent.attachMovie("dot", i, i);
		//trace(mc);
		this._parent[i]._x = imageX;
		this._parent[i]._y = imageY;
		//setProperty(this._parent.imageId, _x, imageX);
		//setProperty(this._parent.imageId, _y, imageY);
	}
	
}