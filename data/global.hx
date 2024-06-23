import funkin.backend.assets.ModsFolder;
import funkin.editors.charter.Charter;
import lime.graphics.Image;

static var Util = {
	setSize: function(obj:Dynamic, width:Float, height:Float):Void {
		obj.scale.set(Math.abs(((obj.width - width) / obj.width) - 1), Math.abs(((obj.height - height) / obj.height) - 1));
	},

	getIndex: function(position:String):Int {
		return switch(position) {
			default: -1;
			case "dad" | "opponent": 0;
			case "boyfriend" | "bf" | "player": 1;
			case "girlfriend" | "gf": 2;
		};
	},
}

static var redirectStates:Map<FlxState, String> = [
    MainMenuState => "menus/MainMenu",
    StoryMenuState => "menus/StoryMenu"
	TitleState => 'menus/TitleState',
];

function preStateSwitch() {
    window.title = "Wednesday's Infidelity";


    for (redirectState in redirectStates.keys())
        if (FlxG.game._requestedState is redirectState)
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}
function new(){
if (FlxG.save.data.infidelitySHADERS == null) FlxG.save.data.infidelitySHADERS = true;
}