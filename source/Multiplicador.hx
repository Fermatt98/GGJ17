package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.math.FlxAngle;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Multiplicador extends FlxSprite
{
	private var cant:Int = 3;
	private var rotate:Bool = true;
	private var timer:Float = 0;
	private var rotar:Bool = false;
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.megafono2__png);
		setGraphicSize(64, 64);
		updateHitbox();
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		rotacion();
	}
	
	public function rotacion():Void
	{
		if (FlxG.mouse.overlaps(this) && FlxG.mouse.justPressed)
		{
			rotate = true;
		}
		if (FlxG.mouse.justReleased)
		{
			rotate = false;
		}
		if (FlxG.mouse.pressed && rotate)
		{
			angle = FlxG.mouse.x;
		}
		else
		{
			angle %= 360;
			rotate = false;
		}
		if (FlxG.mouse.overlaps(this) && FlxG.mouse.justPressedRight)
		{
			Reg.cantMulti++;
			kill();
		}
		
	}
}