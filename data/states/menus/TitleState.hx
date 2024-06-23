import funkin.backend.scripting.Script;
import flixel.addons.display.FlxBackdrop;
import flixel.group.FlxSpriteGroup;
import openfl.Assets;
var bloom:CustomShader;
var aberration:CustomShader;

var titleGroup:FlxSpriteGroup;
var mickey:FlxSprite;
var spiralbg:FlxSprite;
var titleText:FlxSprite;
var titleTextx:FlxSprite;
var titleTextxs:FlxSprite;
var textGroup:FlxSpriteGroup;

var pressedEnter:Bool = false;
var skippedIntro:Bool = false;
var transitioning:Bool = false;
var curWacky:Array<String> = [];
public static var initialized:Bool = false;

function getIntroTextShit() {
	
	var fullText:String = Assets.getText(Paths.txt('introText'));
	var firstArray:Array<String> = fullText.split('\n');
	var swagGoodArray:Array<Array<String>> = [];

	for (i in firstArray)
	{
		swagGoodArray.push(i.split('--'));
	}

	return swagGoodArray;
}

function create() {
	CoolUtil.playMenuSong();

	curWacky = getIntroTextShit();

	titleGroup = new FlxSpriteGroup();
	textGroup = new FlxSpriteGroup();

	spiralbg = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/titlescreen/Spiral Shader Still'));
	spiralbg.scrollFactor.set(0, 0);
	spiralbg.screenCenter();
	spiralbg.scale.set(1.4, 1.4);
	titleGroup.add(spiralbg);

	mickey = new FlxSprite(-0, -1000).loadGraphic(Paths.image('menus/titlescreen/mickeysangre'));
	mickey.scrollFactor.set(0, 0);
	mickey.screenCenter();
	titleGroup.add(mickey);

	titleText = new FlxSprite(-400, -100).loadGraphic(Paths.image('titleEnter'));
	titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
	titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
	titleText.antialiasing = true;
	titleText.setGraphicSize(Std.int(titleText.width * 0.55));
	titleText.animation.play('idle');
	titleText.updateHitbox();
	titleGroup.add(titleText);

	titleTextx = new FlxSprite(-200, -50).loadGraphic(Paths.image('titleEnter'));
	titleTextx.animation.addByPrefix('idle', "Press Enter to Begin", 24);
	titleTextx.animation.addByPrefix('press', "ENTER PRESSED", 24);
	titleTextx.antialiasing = true;
	titleTextx.setGraphicSize(Std.int(titleText.width * 0.55));
	titleTextx.animation.play('idle');
	titleTextx.updateHitbox();
	titleGroup.add(titleTextx);

	titleTextxs = new FlxSprite(200, 0).loadGraphic(Paths.image('titleEnter'));
	titleTextxs.animation.addByPrefix('idle', "Press Enter to Begin", 24);
	titleTextxs.animation.addByPrefix('press', "ENTER PRESSED", 24);
	titleTextxs.antialiasing = true;
	titleTextxs.setGraphicSize(Std.int(titleTextxs.width * 0.55));
	titleTextxs.animation.play('idle');
	titleTextxs.updateHitbox();
	titleGroup.add(titleTextxs);

	add(titleGroup);
	titleGroup.alpha = Script.staticVariables.get('skipTitleIntro') ? 1 : 0.001;

	ngSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('menus/titlescreen/newgrounds_logo'));
	add(ngSpr);
	ngSpr.alpha = 0.001;
	ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
	ngSpr.updateHitbox();
	ngSpr.screenCenter(FlxAxes.X);
	ngSpr.antialiasing = true;

	add(textGroup);

	if (!FlxG.save.data.infidelitySHADERS) {
		if (!FlxG.save.data.infidelitySHADERS) {
			bloom = new CustomShader('bloom');
			bloom.size = 0.0;
			FlxG.camera.addShader(bloom);
		}

		aberration = new CustomShader('chromatic-aberration');
		aberration.strength = 0.0;
		aberration.effectTime = 0.1;
		FlxG.camera.addShader(aberration);
	}
	if (initialized)
		skipIntro();
	else
		initialized = true;
	
	if (Script.staticVariables.get('skipTitleIntro')) {
		if (!FlxG.save.data.infidelitySHADERS) FlxG.camera.shake(0.004, 99999999999);
				
		if (!FlxG.save.data.infidelitySHADERS && !FlxG.save.data.infidelitySHADERS) {
			bloom.size = 18.0;
			aberration.strength = 0.05;
			aberration.effectTime = 0.15;
		}

		skipIntro();
	}
}

function update(elapsed:Float) {
	if (FlxG.keys.justPressed.F)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}
	if (controls.ACCEPT && !skippedIntro)
		skipIntro();
                
	else if (controls.ACCEPT && skippedIntro && !pressedEnter) {
		titleText.alpha = 0.00000001;
		titleTextx.visible = false;
		titleTextxs.visible = false;
		pressedEnter = transitioning = true;
		CoolUtil.playMenuSFX(1, 0.7);
		FlxG.camera.flash(0xFFFFFFFF, 0.5);
		new FlxTimer().start(1, function() {
			FlxG.switchState(new MainMenuState());
		});
	} else if (controls.ACCEPT && transitioning) {
		FlxG.camera.stopFX();
		FlxG.switchState(new MainMenuState());
	}

	spiralbg.angle -= 25 * elapsed;
}

function skipIntro() {
	if (!FlxG.save.data.infidelitySHADERS) FlxG.camera.shake(0.004, 99999999999);
				
	if (!FlxG.save.data.infidelitySHADERS && !FlxG.save.data.infidelitySHADERS) {
		bloom.size = 18.0;
		aberration.strength = 0.05;
		aberration.effectTime = 0.15;
	}

	titleGroup.alpha = 1;
	skippedIntro = true;
	remove(textGroup);
	deleteCoolText();
	FlxG.camera.flash(FlxColor.BLACK, 2.3, null, true);
	FlxG.camera.zoom = 1.2;
	FlxG.sound.music.time = 15800;
	FlxTween.tween(FlxG.camera, {zoom: 1}, 1.8, {ease: FlxEase.circOut});
}
function finishIntro() {
	titleGroup.alpha = 1;
	FlxG.camera.fade(0xFF000000, 1, true);
	FlxG.camera.zoom = 1.5;
	FlxTween.tween(FlxG.camera, {zoom: 1}, 1, {ease: FlxEase.circOut});

	skippedIntro = true;
	deleteCoolText();
}

function stepHit(curStep) {
	if (!Script.staticVariables.get('skipTitleIntro') && !skippedIntro) {
		switch (curStep) {
			case 4:
				createCoolText(['ninjamuffin99', 'phantomArcade', 'kawaisprite', 'evilsk8er']);
			case 12:
				addMoreText('present');
			case 16:
				deleteCoolText();
			case 20:
				createCoolText(['In association', 'with']);
			case 28:
				addMoreText('newgrounds');
				ngSpr.alpha = 1;
			case 32:
				deleteCoolText();
				ngSpr.alpha = 0.00001;
			case 36:
				addMoreText("The wait is over");
			case 44:
				addMoreText("Its finally here");
			case 48:
				deleteCoolText();
			case 52:
				addMoreText('Friday');
			case 56:
				addMoreText('Night');
			case 60:
				deleteCoolText();
			case 63:
				if (!FlxG.save.data.sundaySHAKE) FlxG.camera.shake(0.004, 99999999999);
				
				if (!FlxG.save.data.sundaySHADERS && !FlxG.save.data.sundayINTENSIVESHADERS) {
					bloom.size = 18.0;
					aberration.strength = 0.05;
					aberration.effectTime = 0.15;
				}
				FlxG.camera.zoom = .7;
				createCoolText([curWacky[0]], 0);
			case 74:
				addMoreText(curWacky[1], 0);
			case 97:
				deleteCoolText();
			case 108:
				FlxG.camera.zoom = .7;
				skipIntro();
		}
	}
}

function createCoolText(textArray:Array<String>) {
	for (text in textArray) {
		if (text == "" || text == null) continue;
		var money:Alphabet = new Alphabet(0, (textArray.indexOf(text) * 60) + 200, text, true, false);
		money.screenCenter(FlxAxes.X);
		textGroup.add(money);
	}
}

function addMoreText(text:String) {
	var coolText:Alphabet = new Alphabet(0, (textGroup.length * 60) + 200, text, true, false);
	coolText.screenCenter(FlxAxes.X);
	textGroup.add(coolText);
}

function deleteCoolText() {
	while (textGroup.members.length > 0) {
		textGroup.members[0].destroy();
		textGroup.remove(textGroup.members[0], true);
	}
}