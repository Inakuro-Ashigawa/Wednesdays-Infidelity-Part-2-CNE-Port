function stepHit()
    switch(curStep) {
        case 1:
			FlxTween.tween(camHUD, {alpha: 0}, 0.2);
            cameraProperties.dad.zoom = 1;
            addCinematicBars(.4, {ease: FlxEase.circOut, size: 12});
        case 342:    
            addCinematicBars(.2, {ease: FlxEase.circIn, reverse: true});
        case 460:    
            FlxTween.tween(camHUD, {alpha: 0.3}, .4);
            FlxTween.tween(camGame, {alpha: 0.3}, .4);
            FlxTween.tween(camOther, {alpha: 0.3}, .4);
        case 465:
            camHUD.alpha = 1;
            camGame.alpha = 1;
            camOther.alpha = 1;
        case 476:    
            FlxTween.tween(camHUD, {alpha: 0.3}, .4);
            FlxTween.tween(camGame, {alpha: 0.3}, .4);
            FlxTween.tween(camOther, {alpha: 0.3}, .4);
        case 481:
            camHUD.alpha = 1;
            camGame.alpha = 1;
            camOther.alpha = 1;
        case 523:    
            FlxTween.tween(camHUD, {alpha: 0.3}, .4);
            FlxTween.tween(camGame, {alpha: 0.3}, .4);
            FlxTween.tween(camOther, {alpha: 0.3}, .4);
        case 528:
            camHUD.alpha = 1;
            camGame.alpha = 1;
            camOther.alpha = 1;      
        case 540:    
            FlxTween.tween(camHUD, {alpha: 0.3}, .4);
            FlxTween.tween(camGame, {alpha: 0.3}, .4);
            FlxTween.tween(camOther, {alpha: 0.3}, .4);
        case 545:
            camHUD.alpha = 1;
            camGame.alpha = 1;
            camOther.alpha = 1;      

        case 830:
			var objs = [
				healthBar,
				healthBarBG,
				iconP1,
				iconP2,
				scoreGroup,
				timeBar,
				timeBarBG,
				timeTxt
			];
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 0.00000000001}, 0.2);
			}    
            addCinematicBars(.3, {ease: FlxEase.circOut, size: 9});
        case 1082:
			var objs = [
				healthBar,
				healthBarBG,
				iconP1,
				iconP2,
				scoreGroup,
				timeBar,
				timeBarBG,
				timeTxt
			];
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 1}, 0.2);
			}    
            addCinematicBars(.9, {ease: FlxEase.circIn, reverse: true});
        case 1667:    
            camGame.alpha = 0.0000000000000001;
} 