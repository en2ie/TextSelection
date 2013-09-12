package  
{
	import feathers.system.DeviceCapabilities;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	import starling.core.Starling;
	
	/**
	 * Top level of the application, handles resizing, minmizing and creating our starling instance
	 * @author Ben Hall
	 */
	
	//SOME SCREEN DPIS
	//DeviceCapabilities.dpi = 132; //IPAD 1 & 2
	//DeviceCapabilities.dpi = 306; //GALAXY S3
	//DeviceCapabilities.dpi = 326; //IPOD TOUCH
	//DeviceCapabilities.dpi = 163; //IPHONE 3GS
	
	public class Application extends MovieClip
	{	
		public var star:Starling;		
		
		public function Application() 
		{	
			if (Capabilities.manufacturer.indexOf("Windows") > -1) { DeviceCapabilities.dpi = 132 }
			
			//LISTEN FOR RESIZE EVENTS (MULTIPLE OF THESE MAY BE FIRED ON APP LAUNCH)
			stage.addEventListener(Event.RESIZE, handleResize, false, 999); 
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//LISTEN FOR APP BEING MINIMISED
			stage.addEventListener(Event.DEACTIVATE, stage_deactivateHandler, false, 0, true);
			
			//MAKE STARLING OBJECT
			Starling.handleLostContext = true;
			star = new Starling(StarlingMain, stage);
			star.showStats = false;
			star.enableErrorChecking = false;
			star.start();
		}
		
		//ON MINIMISE DEACTIVATE APP
		private function stage_deactivateHandler(e:Event):void
		{
			star.stop();
			stage.frameRate = 0.01;
			stage.addEventListener(Event.ACTIVATE, stage_activateHandler, false, 0, true);
		}
		
		//ON APP RESUME
		private function stage_activateHandler(e:Event):void
		{
			stage.removeEventListener(Event.ACTIVATE, stage_activateHandler);
			stage.frameRate = 60;
			star.start();
		}
				
		//RESIZE OUR APP TO FILL THE SCREEN WITHOUT SCALING
		private function handleResize(e:Event = null):void 
		{ 
			var deviceSize:Rectangle = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight); 
			if (Starling.current) {
				Starling.current.viewPort = deviceSize;
				star.stage.stageWidth = stage.stageWidth;
				star.stage.stageHeight = stage.stageHeight;
			}
		}			
	}
}