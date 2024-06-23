import flixel.graphics.frames.FlxAtlasFrames;
var gfSus = new FlxSprite();
function create(){

remove(gf);
remove(dad);
remove(boyfriend);
boyfriend.x = 920;
boyfriend.y = 100;
gf.x = 400;
gf.y = 130;
dad.x = -140;
dad.y = 75;
cameraProperties = {
	dad: {
		x: 420.95,
		y: 513,
		zoom: 0.8
	},
	boyfriend: {
		x: 952.9,
		y: 550,
		zoom: 1
	},
	zoomMultiplier: 1
 };
 
nightmare = new FlxSprite(-640, -340).loadGraphic(Paths.image('stages/sus/bg'));
nightmare.antialiasing = true;
nightmare.updateHitbox();
add(nightmare);

theamonguslys = new FlxSprite(-354.95, 129.65);
theamonguslys.frames = Paths.getSparrowAtlas('stages/sus/flacu y nuggy');
theamonguslys.antialiasing = true;
theamonguslys.animation.addByPrefix('walk', 'flacu y nuggy', 24, false);
theamonguslys.animation.play('walk', false, false, 38);
add(theamonguslys);

leansus = new FlxSprite(-354.95, 129.65);
leansus.frames = Paths.getSparrowAtlas('stages/sus/leansito');
leansus.antialiasing = true;
leansus.animation.addByPrefix('walk', 'leansito', 24, false);
leansus.animation.play('walk', false, false, 32);
add(leansus);

front = new FlxSprite(-639.35, -340).loadGraphic(Paths.image('stages/sus/front bg'));
front.antialiasing = true;
add(front);

add(dad);
add(boyfriend);

gfSus = new FlxSprite(1300, 400);
gfSus.frames = Paths.getSparrowAtlas('stages/sus/gf-amogus');
gfSus.antialiasing = true;
gfSus.animation.addByPrefix("dance", "amongus-gf", 24, false);
gfSus.animation.play("dance", true);
add(gfSus);

}
function beatHit(curBeat)
{
if (curBeat % 1 == 0)
 {
    gfSus.animation.play("dance", true);
 }
 if (curBeat % 16 == 0)
{
    if (FlxG.random.bool(25))
    {
        switch (FlxG.random.int(1, 2))
        {
            case 1:
                theamonguslys.animation.play('walk', true);
            case 2:
                leansus.animation.play('walk', true);
        }
    }
  }
}