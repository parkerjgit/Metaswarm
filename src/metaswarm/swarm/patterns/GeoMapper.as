package metaswarm.swarm.patterns   {
import flash.display.*;
import flash.events.*;
import flash.geom.*;
import flash.text.*;
import flash.utils.*;

	public class GeoMapper extends Sprite {
		
		// map dependant
		private static const LONG_INIT:Number = -180;
		private static const LAT_INIT:Number = 90;
		private static const LONG_FINAL:Number = 180;
		private static const LAT_FINAL:Number = -90;
		private static const LONG_DELTA:Number = 360;
		private static const LAT_DELTA:Number = 180;
		
		public function GeoMapper():void{
		}
		
		//returns a matrix of 2d coordinates
		public function map(geoPoints:Array, mapHeight:uint):Array
		{
			var points:Array = new Array();
			
			//lorenze iterative functions
			for(var i:uint=0; i<geoPoints.length; i++){
				//set next point coordinate
				var nextPoint:Array = geoToScreen(geoPoints[i], mapHeight);
				points.push(nextPoint);
			}
			return points;
		}
		
		//returns a matrix of 2d coordinates
		public function geoToScreen(geoPoint:Array, mapHeight:uint):Array
		{
			var long:Number = geoPoint[0];
			var lat:Number = geoPoint[1];
			var mapWidth:uint = mapHeight*2;
			
			var px:Number = (long + 180) * (mapWidth/360);
			var py:Number = (lat - 90) * (mapHeight/180) * -1; 
			
			var point:Array = [px, py];

			return point;
		}
		
	}//end class
}//end pkg