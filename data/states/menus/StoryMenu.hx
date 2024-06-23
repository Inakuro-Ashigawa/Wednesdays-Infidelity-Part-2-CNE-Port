import funkin.backend.MusicBeatState;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;

var weekText:FunkinText;
var description:FunkinText;
var banners:FlxSpriteGroup;
var arrows:FlxSpriteGroup;
banners = new FlxSpriteGroup();
arrows = new FlxSpriteGroup();
var curWeek:String = 'main';
var curSelection:Int = 0;
var weekOrder:Array<String> = [];
var originalY:Float = 0;

var canSelect:Bool = true;


function create()
	{
        if (FlxG.sound.music == null || !FlxG.sound.music.playing) {
		CoolUtil.playMusic(Paths.music('breakfast'), true, 1, true, 102);
		FlxG.sound.music.persist = true;
	}
		window.title = "Wednesday's Infidelity - Story Menu";

		isStoryMode = true;
    




	var bg:FunkinSprite = new FunkinSprite().loadGraphic(Paths.image('menus/story-menu/StoryBG'));
	bg.scrollFactor.set();
	add(bg);

        var description:FunkinSprite = new FunkinSprite().loadGraphic(Paths.image('menus/story-menu/Description'));
	description.screenCenter();
	description.y -= 10;
	description.x += 55;
	description.visible = true;
        add(description);

        var weekTitle:FunkinSprite = new FunkinSprite().loadGraphic(Paths.image('menus/story-menu/Save the depressed mouse'));
	weekTitle.screenCenter();
	weekTitle.y -= 300;
	weekTitle.visible = true;
        add(weekTitle);

       var bgSprite:FunkinSprite = new FunkinSprite().loadGraphic(Paths.image('menus/story-menu/main'));
       bgSprite.setGraphicSize(Std.int(bgSprite.width * 0.7, bgSprite.height * 0.7));
       bgSprite.screenCenter();
       bgSprite.y -= 100;
       bgSprite.alpha = 0.5;
       originalY = bgSprite.y;
       bgSprite.y = bgSprite.y + 50;
       add(bgSprite);

	for (i in [0, 1]) {
		var arrow:FunkinSprite = new FunkinSprite().loadGraphic(Paths.image('menus/story-menu/Arrow'));
		arrow.x = i == 0 ? 
			50 :
			FlxG.width - arrow.width - 50;
		arrow.flipX = i == 1;
		arrow.y = 240;
		arrow.alpha = 0.5;
		arrow.antialiasing = true;
		arrows.add(arrow);
	}
	add(arrows);

	FlxG.camera.shake(0.001, 99999999999);
}

function changeItem(value:Int, arrow:Int) {
	CoolUtil.playMenuSFX(0, 0.7);
	FlxG.camera.flash(0x6F000000, 0.2, null, true);
	arrows.members[arrow].alpha = 1;
	curSelection = value;
}

function update(elapsed) {
	if (controls.BACK || FlxG.mouse.justPressedRight) {
		CoolUtil.playMenuSFX(2, 0.7);
		new FlxTimer().start(0.25, function() {FlxG.switchState(new MainMenuState());});
	}

	if (controls.LEFT_P){
		changeItem(curSelection - 1, 0);
	}
	else if (controls.LEFT_R)
		arrows.members[0].alpha = 0.5;
	else if (controls.LEFT_P && curSelection == 0) {
		CoolUtil.playMenuSFX(2, 0.7);
		FlxTween.shake(arrows.members[0], 0.075, 0.1);
		arrows.members[0].alpha = 0.25;
	}

	if (controls.RIGHT_P){
		changeItem(curSelection + 1, 1);
	}
	else if (controls.RIGHT_R){
		arrows.members[1].alpha = 0.5;
	}
	else if (controls.RIGHT_P){
		CoolUtil.playMenuSFX(2, 0.7);
		FlxTween.shake(arrows.members[1], 0.075, 0.1);
		arrows.members[1].alpha = 0.25;
	}

	if (controls.ACCEPT && canSelect) {
		CoolUtil.playMenuSFX(1, 0.7);
		PlayState.isStoryMode = true;
        FlxG.sound.play(Paths.sound('confirmMenu'));
			PlayState.loadWeek({
				name: "week1",
				id: "week1",
				sprite: null,
				chars: [null, null, null],
				songs: [for (song in ["unknown-suffering"]) {name: song, hide: false}],
				difficulties: ['hard']
		    }, "hard");

   FlxTween.tween(FlxG.camera, {zoom: 2.1}, 2, {ease: FlxEase.expoInOut});
			FlxG.camera.shake(0.008, 0.08);
				new FlxTimer().start(1, function() {FlxG.switchState(new PlayState());});
  }

}