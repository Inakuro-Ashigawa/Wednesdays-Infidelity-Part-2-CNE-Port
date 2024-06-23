public var sickBeats:Int = 0; // Basically curBeat but won't be skipped if you hold the tab or resize the screen
public static var closedState:Bool = false;
public static var campaignMisses:Int = 0;
public var dadCamZoom:Int = 0.8;
public var bfCamZoom:Int = 1;
public var songScore:Int = 0;
public var songHits:Int = 0;
public var songMisses:Int = 0;
public var scoreTxt:FlxText;
var timeTxt:FlxText;
var songLength:Float = 0;
var scoreTxtTween:FlxTween;


// Week Misses / Endings
public static var weekMisses:Int = 0;
public var weekMissesTxt:FlxText;
var weekMissesBar:FlxSprite;


function postUpdate(elapsed:Float){
switch(curCameraTarget) {
  case 0:
        defaultCamZoom = dadCamZoom;
  case 1:
        defaultCamZoom = bfCamZoom;
   }
}  
function create(){   
	weekMissesBar = new FlxSprite(800,550).loadGraphic(Paths.image('weekMissesBar'));
	weekMissesBar.scale.set(0.7, 0.7);
	weekMissesBar.alpha = 0.000000000001;
	weekMissesBar.cameras = [camHUD];
	add(weekMissesBar);

	if (!downscroll){
	weekMissesBar = new FlxSprite(800,130).loadGraphic(Paths.image('weekMissesBar'));
	}	
	weekMissesTxt = new FlxText(-75, weekMissesBar.y + 18, FlxG.width, "", 20);
	weekMissesTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, "right");
	weekMissesTxt.scrollFactor.set();
	weekMissesTxt.borderSize = 1.25;
	weekMissesTxt.cameras = [camHUD];
	weekMissesTxt.alpha = weekMissesBar.alpha; // smh
	add(weekMissesTxt);
}
//on beat shits dumb way but it looks good - inakuro 
function beatHit(curBeat)
	{
	if (curBeat % 4 == 0)
	 {
		dad.playAnim('idle1');
	 }
	}
			