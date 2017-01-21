package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Interfaz extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(FlxG.width, 64);
		FlxG.state.add(this);
		color = FlxColor.WHITE;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(this) && FlxG.mouse.justPressed)
		{
			color = FlxColor.RED;
			Reg.herramienta1Select = true;
		}
		else if (FlxG.mouse.justPressed)
		{
			if (Reg.herramienta1Select)
			{
				Reg.herramienta1 = new Herramienta1(FlxG.mouse.x, FlxG.mouse.y);
			}
		}
	}
}