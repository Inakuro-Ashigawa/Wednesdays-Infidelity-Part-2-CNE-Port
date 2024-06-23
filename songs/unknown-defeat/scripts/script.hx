var curSection = 0;
var stepDev = 0;

function stepHit(curStep)
{
	if (curStep % 16 == 0)
	{
		curSection = Math.floor(curStep / 16);
	}

	stepDev = Math.floor(curStep % 16) + 1;

	switch (curStep)
	{
		case 1:
			addCinematicBars(.5, {ease: FlxEase.circOut, size: 6});
			FlxTween.tween(camHUD, {alpha: 0}, 0.5);
		case 64:
			FlxTween.tween(camHUD, {alpha: 1}, 0.2);
		case 192:
			addCinematicBars(.5, {ease: FlxEase.circIn, reverse: true});
		case 1215:
			addCinematicBars(.5, {ease: FlxEase.circOut, size: 9});
		case 1336:
			addCinematicBars(.5, {ease: FlxEase.circIn, reverse: true});
		case 1599:
			addCinematicBars(.5, {ease: FlxEase.circOut, size: 1});
		case 1727:
			var objs = [
				iconP1,
				iconP2,
				healthBar,
				healthBarBG
				scoreGroup,
				timeBar,
				timeBarBG,
				timeTxt
			];
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 0}, 0.2);
			}
		case 1855:
			cameraProperties.dad.zoom = 1;
			addCinematicBars(.1, {ease: FlxEase.circIn, reverse: true});
		case 1983:
			var objs = [
				iconP1,
				iconP2,
				healthBar,
				healthBarBG
				scoreGroup,
				timeBar,
				timeBarBG,
				timeTxt
			];
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 1}, 0.4);
			}
			camHUD.alpha = 1;
			cameraProperties.dad.zoom = 0.8;
			cameraProperties.dad.x = 420.95;
			FlxG.camera.flash();
	}
}

function addCamZoom(game, hud)
{
	camGame.zoom += game;
	camHUD.zoom += hud;
}
