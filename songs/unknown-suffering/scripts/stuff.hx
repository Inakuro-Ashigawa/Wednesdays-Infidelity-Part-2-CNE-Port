function postCreate() {

    cameraProperties.dad.zoom = cameraProperties.boyfriend.zoom = FlxG.camera.zoom = 0.65;

    addCinematicBars(0.001, {ease: null, size: 7});
}

function onSongStart()
    songLength = 121 * 860;

function onEvent(_)
    if (_.event.name == 'Bump Camera' && curStep < 256)
        cameraProperties.dad.zoom = cameraProperties.boyfriend.zoom = FlxG.camera.zoom = FlxG.camera.zoom + _.event.params[0];

function stepHit()
 switch(curStep) {
    case 255:
        camGame.alpha = 0.000000001;

    case 272:
        camGame.alpha = 1;

    case 400:   
        camGame.alpha = 0.000000001;

    case 416:
        camGame.alpha = 1;

        case 1064:   
        for (strum in cpu.members) {
        FlxTween.tween(strum, {alpha: 0.0000000001}, 1);
        strum.x = -999;
        } 

    case 1375:
        FlxTween.num(songLength, 121 * 1250, 8, {ease: FlxEase.circInOut}, function(num) {songLength = num;});
        for (i in [healthBar, healthBarBG, iconP1, iconP2, scoreGroup,camGame])
            FlxTween.tween(i, {alpha: 0.0000000001}, 1);

    case 1488:
        for (i in [healthBar, healthBarBG, iconP1, iconP2, scoreGroup,camGame])
            FlxTween.tween(i, {alpha: 1}, 1);

    case 2015:        
        FlxTween.num(songLength, inst.length, 3, {ease: FlxEase.circInOut}, function(num) {songLength = num;});
        for (i in [healthBar, healthBarBG, iconP1, iconP2, scoreGroup,camGame])
            FlxTween.tween(i, {alpha: 0.0000000001}, 1);
            
        case 2048:          
        for (i in [healthBar, healthBarBG, iconP1, iconP2, scoreGroup,camGame])
            FlxTween.tween(i, {alpha: 1}, 1);
}  