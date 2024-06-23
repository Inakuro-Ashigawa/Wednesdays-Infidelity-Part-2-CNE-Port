import openfl.filters.ShaderFilter;

public var distortion:CustomShader;

function postCreate() {
	if (!FlxG.save.data.infidelitySHADERS) {
    distortion = new CustomShader('distortion');
	distortion.iTime = 0;
	distortion.glitchModifier = 1;
	distortion.moveScreenFullX = true;
	distortion.moveScreenX = true;
	distortion.moveScreenFullY = true;
	distortion.fullglitch = 0;
	distortion.working = false;
	distortion.timeMulti = 1.;
	distortion.effectMulti = 0.25;
	distortion.iResolution = [FlxG.width, FlxG.height];
	FlxG.camera.addShader(distortion);
	}
}

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

    case 536:
	    distortion.glitchModifier = 9;
		distortion.working = true;

	case 544:
		distortion.glitchModifier = 1;
		distortion.fullglitch = 1;
	case 670:	
        distortion.working = false;
    }
	}
}