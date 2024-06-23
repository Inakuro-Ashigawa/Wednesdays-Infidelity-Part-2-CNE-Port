var curSection = 0;
var stepDev = 0;


function postCreate(){
satanlaugh = new FlxSprite();
satanlaugh.frames = Paths.getSparrowAtlas('stages/iratus/SATAN_LAUGH_SCREEN');
satanlaugh.animation.addByPrefix('scape', 'SATAN LAUGH SCREEN', 24, false);
satanlaugh.screenCenter();
satanlaugh.cameras = [camHUD];
satanlaugh.alpha = 0.00001;
satanlaugh.animation.callback = function(name:String, frameNumber:Int, frameIndex:Int)
{
    satanlaugh.screenCenter();
    satanlaugh.x -= 80;
};
satanlaugh.animation.finishCallback = function(name:String)
{
    satanlaugh.alpha = 0.00001;
};
insert(0, satanlaugh);

}
function stepHit(curStep)
{
	if (curSection >= 32 && curSection <= 54 || curSection >= 56 && curSection <= 71 || curSection >= 112 && curSection <= 143)
	{
		if (curStep % 4 == 0)
		{
			addCamZoom(0.15, 0.05);
		}
	}

	if (curSection >= 80 && curSection <= 94)
	{
		var section = curSection % 8;

		if (section == 0 || section == 2 || section == 4 || section == 6)
		{
			if (stepDev == 1 || stepDev == 13)
				addCamZoom(0.15, 0.05);

			if (stepDev == 5 || stepDev == 7)
				addCamZoom(0.15, 0.07);
		}
		if (section == 1 || section == 5 || section == 7)
		{
			if (stepDev == 5 || stepDev == 7)
				addCamZoom(0.15, 0.07);
			if (stepDev == 13)
				addCamZoom(0.15, 0.05);
		}
		if (section == 3)
		{
			if (stepDev < 13)
			{
				if (curStep % 2 == 0)
					addCamZoom(0.15, 0.05);
			}
		}
	}

	if (curStep >= 892 && curStep <= 895 || curStep >= 1660 && curStep <= 1663)
		addCamZoom(0.15, 0.07);

	switch (curStep)
	{
		case 1:
			camGame.visible = true;
			cameraProperties.dad.zoom = 1;
		case 256:
			cameraProperties.boyfriend.zoom = 1.2;
			cameraProperties.dad.zoom = 1.2;

			var objs = [
				scoreGroup,
				timeBar,
				timeBarBG,
				timeTxt
			];
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 0}, 1);
			}
		case 288:
			cameraProperties.boyfriend.zoom = 1.3;
		case 320:
			cameraProperties.boyfriend.zoom = 1.2;
		case 352:
			cameraProperties.boyfriend.zoom = 1.3;
		case 384:
			cameraProperties.boyfriend.zoom = 1.2;
		case 390:
			cameraProperties.dad.zoom = 1.25;
		case 416:
			cameraProperties.dad.zoom = 1.2;
		case 422:
			cameraProperties.dad.zoom = 1.25;
		case 448:
			cameraProperties.dad.zoom = 1.2;
		case 496:
			var objs = [
				scoreGroup,
				timeBar,
				timeBarBG,
				timeTxt,
				healthBar,
				healthBarBG,
				iconP1,
				iconP2
			];
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 0}, 0.2);
			}


			cameraProperties.dad.zoom = 1;
		case 508:
			var objs = [
				scoreGroup,
				timeBar,
				timeBarBG,
				timeTxt,
				healthBar,
				healthBarBG,
				iconP1,
				iconP2
			];
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 1}, 0.5);
			}

		case 512:

			cameraProperties.boyfriend.Zoom = 1;
			cameraProperties.dad.zoom = 0.8;

			cameraProperties.dad.x -= 100;
			cameraProperties.boyfriend.y -= 30;

		case 768:
			cameraProperties.dad.zoom = 1;
		case 898:
			cameraProperties.dad.zoom = 0.9;
		case 1204:
			cameraProperties.dad.zoom = 0.8;
		case 1036:
			cameraProperties.dad.zoom = 0.9;
		case 1040:
			cameraProperties.dad.zoom = 0.8;
		case 1052:
			cameraProperties.dad.zoom = 0.9;
		case 1068:
			cameraProperties.boyfriend.zoom = 1.1;
		case 1072:
			cameraProperties.boyfriend.zoom = 1;
		case 1084:
			cameraProperties.boyfriend.zoom = 1.1;
		case 1088:
			cameraProperties.dad.zoom = 0.8;
			cameraProperties.boyfriend.zoom = 1;
		case 1152:
			cameraProperties.boyfriend.zoom = 1.2;
			cameraProperties.dad.zoom = 1.2;

			var objs = [
				scoreGroup,
				timeBar,
				timeBarBG,
				timeTxt
			];
			cpuStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 0}, 1);
			}
		case 1280:
			cameraProperties.boyfriend.zoom = 1.1;
		case 1395:
			cameraProperties.dad.zoom = 0.7;

			cpuStrums.forEach(function(spr)
			{
				FlxTween.tween(spr, {alpha: 1}, 1);
			});
		case 1512:
			var objs = [
				scoreGroup,
				timeBar,
				timeBarBG,
				timeTxt,
				healthBar,
				healthBarBG,
				iconP1,
				iconP2
			];
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 0}, 0.5);
			}
		case 1519:
			satanlaugh.alpha = 1;
			satanlaugh.animation.play('scape');
		case 1528:
			var objs = [
				scoreGroup,
				timeBar,
				timeBarBG,
				timeTxt,
				healthBar,
				healthBarBG,
				iconP1,
				iconP2
			];
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 1}, 1);
			}

			cameraProperties.boyfriend.zoom = 1.4;

			cameraProperties.boyfriend.x -= 70;
		case 1664:
			cameraProperties.dad.zoom = 0.9;

		case 1728:

			cameraProperties.dad.zoom = 0.65;
			cameraProperties.boyfriend.zoom = 0.65;

		case 2304:

			cameraProperties.dad.zoom = 0.65;
			cameraProperties.boyfriend.zoom = 0.65;


			FlxTween.tween(camHUD, {alpha: 0}, 1);
	}
}

function addCamZoom(game, hud)
{
	camGame.zoom += game;
	camHUD.zoom += hud;
}
