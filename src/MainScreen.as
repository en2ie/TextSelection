package  
{
	import feathers.controls.Header;
	import feathers.controls.Screen;
	import feathers.controls.ScrollContainer;
	import feathers.controls.TextInput;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	
	/**
	 * Our example screen, with a header, scrollcontainer, and textinput.
	 * @author Ben Hall
	 */
	public class MainScreen extends Screen 
	{		
		private var header:Header;
		private var container:ScrollContainer;
		private var textinput:TextInput;
		
		public function MainScreen() 
		{		
		}
		
		override protected function draw():void 
		{	
			header.width = actualWidth;	
			header.validate();
			
			container.height = actualHeight - header.height;
			container.width = actualWidth;
			container.y = header.height;
			container.validate();
		}
		
		override protected function initialize():void 
		{				
			header = new Header();
			header.title = "Hello World";
			addChild(header);		
			
			container = new ScrollContainer();
			container.layout = new AnchorLayout();
			addChild(container);
			
			//POSITION TEXTINPUT IN THE MIDDLE OF OUR SCREEN USING ANCHOR LAYOUT
			var lay:AnchorLayoutData = new AnchorLayoutData();
			lay.horizontalCenter = 0;
			lay.verticalCenter = 0;			
			
			textinput = new TextInput();
			textinput.layoutData = lay;
			container.addChild(textinput);
		}

	}

}