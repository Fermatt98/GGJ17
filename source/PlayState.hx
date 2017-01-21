package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		Reg.parlante = new Parlante(FlxG.width / 2, FlxG.height / 2);
		//Reg.pared = new Pared(FlxG.width / 2 + 100, FlxG.height / 2);
		Reg.interfaz = new Interfaz();
		//Reg.herramienta1 = new Herramienta1(500, 300);
		//Reg.meta = new Meta(FlxG.width / 2 + 100, FlxG.height / 2);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
}
