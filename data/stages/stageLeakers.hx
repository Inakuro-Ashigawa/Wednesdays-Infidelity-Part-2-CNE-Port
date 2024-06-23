var danceLeft:Bool = false; // weird ik but ig it works
var trumpetsPlaying:Bool = false; // sexo

function create()
{
cameraProperties = {
	dad: {
		x: 420.95,
		y: 420,
		zoom: 0.73
	},
	gf: {
		x: 0,
		y: 0,
		zoom: 0.65
	},
	boyfriend: {
		x: 952.9,
		y: 410,
		zoom: 0.75
	},
	zoomMultiplier: 1
};
strumLines.members[3].characters[0].x = dad.x + 400;
remove(dad);
remove(gf);
remove(boyfriend);
remove(strumLines.members[3].characters[0]);
dadCamZoom = .73;
bfCamZoom =  .75;

diablito = new FlxSprite(380, 450);
diablito.frames = Paths.getSparrowAtlas('backgrounds/leakers/DEMONS_DANCE');
diablito.animation.addByIndices('danceLeft', 'DEMONS IDLE', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], '', 24, false);
diablito.animation.addByIndices('danceRight', 'DEMONS IDLE', [13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24], '', 24, false);
diablito.animation.addByPrefix('trompeta', 'DEMONS TROMPETA', 24, false);
diablito.antialiasing = true;
diablito.scrollFactor.set(1.05, 1.05);

devs = new FlxSprite();
devs.frames = Paths.getSparrowAtlas('backgrounds/leakers/DEVS');
devs.animation.addByPrefix('idle', 'DEVS', 24, false);
devs.scale.set(1.2, 1.2);
devs.updateHitbox();
devs.setPosition(100, 105);
devs.scrollFactor.set(1.05, 1.05);
devs.antialiasing = true;


osbaldo = new FlxSprite();
osbaldo.frames = Paths.getSparrowAtlas('backgrounds/leakers/oswald');
osbaldo.scale.set(1.2, 1.2);
osbaldo.updateHitbox();
osbaldo.setPosition(1300, 150);
osbaldo.animation.addByPrefix('idle', 'mesa OSWALD', 24, false);
osbaldo.animation.addByPrefix('die', 'OSWALD MANCO NO PUSO PARED', 24, false);
osbaldo.scrollFactor.set(1.05, 1.05);
devs.antialiasing = true;
osbaldo.scale.set(0.96, 0.96);

add(devs);
add(diablito);
add(osbaldo);
add(strumLines.members[3].characters[0]);
add(dad);
add(gf);
add(boyfriend);
gf.forceIsOnScreen = true;
}
function TrompetaDiabloLeakers()
{
if (!trumpetsPlaying)
{
	trumpetsPlaying = true;
}
	diablito.animation.play('trompeta', true);
	diablito.animation.finishCallback = function(name)
{
	if (name == 'trompeta' && trumpetsPlaying)
	trumpetsPlaying = false;
        IdleDiabloLeakers();
 }
}
function IdleDiabloLeakers()
{
trumpetsPlaying = false;
diablito.animation.stop();
}

function beatHit(curBeat)
{
if (curBeat % 2 == 0)
{
	osbaldo.animation.play('idle', true);
	devs.animation.play('idle', true);
}
if (!danceLeft && !trumpetsPlaying)
{
diablito.animation.play('danceLeft', true);
danceLeft = !danceLeft;
}
else if (!trumpetsPlaying)
{
diablito.animation.play('danceRight', true);
danceLeft = !danceLeft;
 }
}
function stepHit()
{  
   switch (curStep)
  {

	case 2006:
			osbaldo.animation.play('die', true);
			osbaldo.setPosition(osbaldo.x - 6, osbaldo.y - 48); // the offsets doesn't work
  }
}  		