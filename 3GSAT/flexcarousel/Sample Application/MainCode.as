
import mx.controls.Alert;
import Flexcubed.Carousel;

	private var car:Carousel;
	
private function initApp():void {
	car = new Carousel();
	car.fileName = "gallery.xml"
	car.x = 100;
	car.y = 100;
	car.autoRun = 0;
	car.showTitle = false;
	car.color = 0xffffff;
	car.borderColor = 0xffffff;
	car.titleColor = 0x000033;
	car.titleSize = 10;
	car.fadeImages = false;
	car.showBorder = false;
	car.showReflection = true;
	this.addChild(car);
	car.draw();
}