var curSection = 0;
var stepDev = 0;

function create()
{
	camHUD.alpha = 0;

	blackFuck = new FlxSprite().makeSolid(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
	blackFuck.setGraphicSize(Std.int(blackFuck.width + 100));
	blackFuck.screenCenter();
	add(blackFuck);
}

function stepHit(curStep)
{
	if (curStep % 16 == 0)
	{
		curSection = Math.floor(curStep / 16);
	}

	stepDev = Math.floor(curStep % 16) + 1;

	if (curSection >= 8 && curSection <= 11)
	{
		if (curStep % 16 == 0)
		{
			addCamZoom(0.1, 0.04);
		}
	}

	if (curSection >= 12 && curSection <= 14 || curSection >= 32 && curSection <= 55)
	{
		if (curStep % 4 == 0)
		{
			addCamZoom(0.1, 0.04);
		}
	}

	if (curStep >= 240 && curStep <= 250)
	{
		if (curStep % 2 == 0)
		{
			addCamZoom(0.1, 0.04);
		}
	}

	if (curStep >= 252 && curStep <= 256)
	{
		addCamZoom(0.1, 0.04);
	}

	if (curSection >= 16 && curSection <= 31)
	{
		if (curStep % 4 == 0)
		{
			addCamZoom(0.12, 0.08);
		}
	}

	switch (curStep)
	{
		case 1:

			defaultCamZoom = cameraProperties.dad.zoom;

		case 32:
			FlxTween.tween(camHUD, {alpha: 1}, 2);
		case 64:
			FlxTween.tween(blackFuck, {alpha: 0}, 5.5);

			FlxTween.tween(cameraProperties.dad, {zoom: cameraProperties.dad.zoom - 0.2}, 5.5);

	}
}

function addCamZoom(game, hud)
{
	camGame.zoom += game;
	camHUD.zoom += hud;
}

function addStageZoom(amount)
{
	cameraProperties.boyfriend.zoom += amount;
	cameraProperties.dad.zoom += amount;
}
