import flixel.FlxObject;
var selectedSomethin:Bool = false;
var curSelected:Int = 0;
var menuItems:FlxTypedGroup<FlxSprite>;
var menuItems = new FlxTypedGroup();
var camFollow:FlxObject;
var camFollowPos:FlxObject;
var time:Float = 0;
var newShader:CustomShader = null;
var items:Array = ["menu_suicide", "menu_julian", "menu_cheddar", "menu_sus", "covers", "extras"];
var weeks = [
		["Week Suicide", "Week Suicide P2"],
		["Week Julian"],
		["Week Cheddar"],
		["Week SUS"],
		["Covers"],
		["Extra Songs"]
];

function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.alpha = .4;
			spr.setGraphicSize(Std.int(spr.width * 0.55));

			if (spr.ID == curSelected)
			{

                spr.alpha = 1;
				spr.setGraphicSize(Std.int(spr.width * 0.57));
			    FlxG.camera.flash(FlxColor.BLACK, 0.2, null, true);
				// FlxG.camera.flash(FlxColor.BLACK, 0.2);
				if (spr.ID >= 3)
				{
					camFollow.setPosition(700, 1055);
				}
				else
				{
					camFollow.setPosition(700, 350);
				}
			}
		});
	}

function create(){
        newShader = new CustomShader("ColorSwapShader");
        window.title = "Wednesday's Infidelity - Freeplay Selection";
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('friplay_copia'));
		bg.scrollFactor.set(0, 0);
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);
        camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

    
		add(menuItems);

		for (item in items)
		{
			var newItem:FlxSprite = new FlxSprite(250, -50 + (230 * items.indexOf(item))).loadGraphic(Paths.image('menubackgrounds/' + item));
			newItem.ID = items.indexOf(item);

			switch (item)
			{
				case "menu_sus":
					newItem.setGraphicSize(Std.int(newItem.width * 0.6));
				default:
					newItem.setGraphicSize(Std.int(newItem.width * 0.55));
			}

			menuItems.add(newItem);
		}

		
			FlxG.camera.shake(0.001, 99999999999);

		changeItem();

	}   
function update(elapsed:Float)
{


    if (FlxG.sound.music != null)
		{
			if (FlxG.sound.music.volume < 0.8)
			{
				FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
			}
		}
if (!selectedSomethin)
		{
			if (controls.UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}
			if (controls.BACK)
            {
                FlxG.switchState(new MainMenuState());
        
            }
			if (controls.DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}
        }
}
