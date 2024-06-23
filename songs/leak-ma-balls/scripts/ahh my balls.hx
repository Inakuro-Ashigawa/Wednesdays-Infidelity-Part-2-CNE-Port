 // WENSDAY INF
var camOther = new FlxCamera();
public var cutsceneText:FlxText;

function create()
{   
 cutsceneText = new FlxText(0, 0, 400, "", 32);
 cutsceneText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, "center");
 cutsceneText.visible = false;
 add(cutsceneText);

 cutsceneText.cameras = [camOther];
 
 camOther.bgColor = 0;
 camOther.alpha = 1;
 FlxG.cameras.remove(camHUD, false);
 FlxG.cameras.add(camHUD, false);
 FlxG.cameras.add(camOther, false);
} 

 function stepHit()
{  
   switch (curStep)
  {
        case 2: //subtitles
			FlxTween.tween(cutsceneText, {alpha: 1}, 0.5);
			cutsceneText.text = "What is that?";
		case 15:
            cutsceneText.color = FlxColor.RED;
			cutsceneText.text = "Humans. Specifically Leakers, a race far below humanity.";
		
		case 67:
			FlxTween.tween(cutsceneText, {alpha: 0}, 0.5);
		case 79:
			FlxTween.tween(cutsceneText, {alpha: 1}, 0.5);
			cutsceneText.text = "Their only motivation that keeps them alive and still existing in this reality is to be a PEST";
		case 147:
			cutsceneText.text = "one of the worst existing plagues of modern society.";
		case 184:
			FlxTween.tween(cutsceneText, {alpha: 0}, 0.5);
		case 195:
			FlxTween.tween(cutsceneText, {alpha: 1}, 0.5);

	        cutsceneText.color = FlxColor.WHITE;
            boyfriend.playAnim("idle",true);
						
            addCinematicBars(4, {ease: FlxEase.circOut, size: 7});
			cutsceneText.text = "Yo Leakers, that's why you straight built like a R/Niceguys-lookin";	
		case 240:
			cutsceneText.text = "uUuUh, my waifu is gonna love me even though she looks like a fucking 10 year old";	
		case 284:
			cutsceneText.text = "but it's ok beause she's like... 500 years old.";	
		case 317:
			FlxTween.tween(cutsceneText, {alpha: 0}, 0.3);
		case 960:
			var objs = [
				// me lo robe de lunar
				healthBar,
				healthBarBG,
				iconP1,
				iconP2,
                                scoreGroup
			];
			cpuStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			playerStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 0}, 0.2, {
					onComplete: function(twn)
					{
						obj.visible = false;
					}
				});
			}
			FlxTween.tween(cutsceneText, {alpha: 1}, 0.3);
			cutsceneText.text = "Please, please just send them away from us. Murder them. Fuckin' anything.";	
		case 1025:
			cutsceneText.text = "Why am I ranting? I dunno. I should have ended this a long time ago.";	
		case 1075:
			cutsceneText.text = "Fuck, that rhymed.";	
		case 1086:
			FlxTween.tween(cutsceneText, {alpha: 0}, 0.2);
		case 2041:
			FlxTween.tween(cutsceneText, {alpha: 1}, 0.5);

			cutsceneText.text = "FUCK, I MISSED AGAIN!";	
		case 1:
			cutsceneText.alpha = 1;
			cutsceneText.visible = true;
			cutsceneText.size = 32;
			cutsceneText.fieldWidth = 1000;
			cutsceneText.x = 170;
			cutsceneText.y = 550;
                        addCinematicBars(1.2,1);
			var objs = [
				// me lo robe de lunar
				healthBar,
				healthBarBG,
				iconP1,
				iconP2,
                scoreGroup
                
                                 
			];
			cpuStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			playerStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 0}, 0.2, {
					onComplete: function(twn)
					{
						obj.visible = false;
					}
				});
			}

		case 320:
			var objs = [
				// me lo robe de lunar
				healthBar,
				healthBarBG,
				iconP1,
				iconP2,
                                camHUD
			];
			cpuStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			playerStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 1}, 0.00001, {
					onComplete: function(twn)
					{
						obj.visible = true;
					}
				});
			}
		case 1088:
			var objs = [
				// me lo robe de lunar
				healthBar,
				healthBarBG,
				iconP1,
				iconP2,
                camHUD
			];
			cpuStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			playerStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 1}, 0.00001, {
					onComplete: function(twn)
					{
						obj.visible = true;
					}
				});
			}
		case 1408:
			var objs = [
				// me lo robe de lunar
				healthBar,
				healthBarBG,
				iconP1,
				iconP2,
                scoreGroup
			];
			cpuStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 0}, 0.2, {
					onComplete: function(twn)
					{
						obj.visible = false;
					}
				});
			}
		case 1472:
			var objs = [
				// me lo robe de lunar
				healthBar,
				healthBarBG,
				iconP1,
				iconP2,
                scoreGroup
  
			];
			cpuStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 1}, 0.00001, {
					onComplete: function(twn)
					{
						obj.visible = true;
					}
				});
			}
		case 2021:
			if (gf != null)
				gf.visible = false;
  }
}