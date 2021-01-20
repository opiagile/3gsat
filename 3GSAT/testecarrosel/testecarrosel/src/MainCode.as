
import mx.controls.Alert;
import Flexcubed.Carousel;

	private var car:Carousel;
	
private function initApp():void 
{
	car = new Carousel();
	car.fileName = "gallery.xml"
	car.x = 100;
	car.y = 100;
	car.addEventListener("imageCliked", imageClickedListener);
	car.autoRun = 1;
	car.showTitle = false;
	car.color = 0x000000;
	car.borderColor = 0xffffff;
	car.titleColor = 0x000033;
	car.titleSize = 10;
	car.fadeImages = false;
	car.showBorder = false;
	car.showReflection = true;
	car.xRadius = 900;
	car.yRadius = 100;
	this.addChild(car);
	car.draw();
}
function imageClickedListener(evt:Event):void
{
	trace("Image Clicked");
}
