import openfl.filters.ShaderFilter;

public var distortion:CustomShader;

function postCreate() {
	if (!FlxG.save.data.infidelitySHADERS) {
	distortion = new CustomShader('distortion');
	distortion.iTime = 0;
	distortion.glitchModifier = 0.25;
	distortion.moveScreenFullX = false;
	distortion.moveScreenX = true;
	distortion.moveScreenFullY = false;
	distortion.fullglitch = 0;
	distortion.working = false;
	distortion.timeMulti = 1.;
	distortion.effectMulti = 0.25;
	distortion.iResolution = [FlxG.width, FlxG.height];
	FlxG.camera.addShader(distortion);
	}
	camHUD.fade(0xFF000000, 0.001, false);
}

function shadertween(f) shader.contrast = f;

var dumbstupid:Float = 0;
function update(elapsed) {
	if (!FlxG.save.data.infidelitySHADERS) {
    dumbstupid += elapsed;
    distortion.iTime = dumbstupid;
	distortion.iResolution = [FlxG.width, FlxG.height];
	}
}

function stepHit() {
	if (!FlxG.save.data.infidelitySHADERS) {
	switch(curStep) {
		case 640: FlxTween.num(1.5625, 1.125, 3.38, {ease: FlxEase.cubicInOut}, shadertween);
		case 656: distortion.working = true;
	}
	}
}

function stepHit()
    switch(curStep) {
        case 624:
            cameraProperties.dad.x -= 150;
            cameraProperties.dad.y -= 100;
		case 630:	
			FlxTween.tween(camHUD, {alpha: 0}, 1);
			FlxTween.tween(FlxG.camera, {zoom: 1.1}, 3.4);
			vocals.volume = 1;
		case 642:
			FlxTween.tween(camHUD, {alpha: 0}, 0.5);
		case 651:
			FlxTween.tween(camHUD, {alpha: 1}, 0.5);
        case 656:
            cameraProperties.dad.x += 150;
            cameraProperties.dad.y += 100;
			addCinematicBars(1, {ease: FlxEase.circOut, size: 7});
		case 1424:
			addCinematicBars(1, {ease: FlxEase.circIn, reverse: true});	
		case 1552:
			FlxTween.tween(camHUD, {alpha: 0}, 3.5);
			FlxTween.tween(camGame, {alpha: 0}, 3.5);
			FlxTween.tween(camOther, {alpha: 0}, 3.5);	
}