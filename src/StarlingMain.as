package  
{
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.themes.MetalWorksMobileTheme;
	import flash.desktop.NativeApplication;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * Our starling class, adds feathers screen navigators, handles page switching, sets the theme
	 * @author Ben Hall
	 */
	public class StarlingMain extends Sprite
	{
		private var theme:MetalWorksMobileTheme;
		private var nav:ScreenNavigator;
		
		//SCREENS
		private static const MAIN_SCREEN:String = "main-screen";
		
		public function StarlingMain() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{				
			//INITIATE THEME
			theme = new MetalWorksMobileTheme(stage);
			
			//SETUP SCREEN NAVIGATOR
			nav = new ScreenNavigator();
			addChild(nav);
			
			//ADD OUR SCREENS TO THE NAVIGATOR
			var pageOne:ScreenNavigatorItem = new ScreenNavigatorItem(MainScreen);
			nav.addScreen(MAIN_SCREEN, pageOne);	
			
			nav.showScreen(MAIN_SCREEN);
			
			//LISTEN FOR ANDROID SOFT BUTTON PRESSES
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, checkKeypress);
		}
		
		//SIMULATE EXPECTED SOFT BUTTON BEHAVIOUR ON ANDROID
		private function checkKeypress(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.BACK) { 
				e.preventDefault();
			} else if (e.keyCode == Keyboard.MENU) {
				e.preventDefault();
			} else if (e.keyCode == Keyboard.SEARCH) {
				e.preventDefault();
			}
		}
	}

}