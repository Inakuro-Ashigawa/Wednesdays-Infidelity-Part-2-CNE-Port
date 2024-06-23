var oscuro = new FlxSprite();
var sky = new FlxSprite();
var stageTweens:Array<FlxTween> = [];
function create(){

cameraProperties = {
	dad: {
		x: 420.95,
		y: 283,
		zoom: 1
	},
    gf: {
		x: 952.9,
		y: 200,
		zoom: 0.65
	},
	boyfriend: {
		x: 952.9,
		y: 370,
		zoom: 1
	},
	zoomMultiplier: 1
};
defaultCamZoom = 0.8;
boyfriend.x = 800;
boyfriend.y = -50;

dad.x = 80;
dad.y = -50;


remove(dad);
remove(boyfriend);
oscuro = new FlxSprite(-608, -482).loadGraphic(Paths.image('stages/iratus/bgintro'));
oscuro.scrollFactor.set(1, 1);
add(oscuro);

sky = new FlxSprite(-608, -482).loadGraphic(Paths.image('stages/iratus/INFERNO_SKY'));
sky.alpha = 0.000000000001;
sky.scrollFactor.set(0.5, 0.5);
add(sky);

basedSkeletons = new FlxSprite(-506, 164);
basedSkeletons.frames = Paths.getSparrowAtlas('stages/iratus/SKULLS');
basedSkeletons.animation.addByPrefix('idle', 'SKULLS', 24, false);
basedSkeletons.alpha = 0.000000000001;
basedSkeletons.scrollFactor.set(0.85, 0.9);
add(basedSkeletons);

ground = new FlxSprite(-608, 324).loadGraphic(Paths.image('stages/iratus/ROCK_BG'));
ground.alpha = 0.000000000001;
add(ground);


var skeleTween = FlxTween.tween(basedSkeletons, {y: basedSkeletons.y + 60}, 6, {ease: FlxEase.sineInOut, type: 4});
var skyTween = FlxTween.tween(sky, {y: sky.y + 15}, 6, {ease: FlxEase.sineInOut, type: 4});
stageTweens.push(skeleTween);
stageTweens.push(skyTween);
add(dad);
add(boyfriend);
}
function beatHit(curBeat)
{
if (curBeat % 1 == 0)
basedSkeletons.animation.play('idle', true);
}                    
function devillaugh(){
dad.playAnim("laugh");
}
function stepHit(curStep)
{    
    switch(curStep) {
        case 512:
        	oscuro.alpha = 0.000000000001;
			basedSkeletons.alpha = 1;
			sky.alpha = 1;
			ground.alpha = 1;
    }
}        