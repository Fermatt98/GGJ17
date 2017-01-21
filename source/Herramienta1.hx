package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.math.FlxAngle;

/**
 * ...
 * @author ...
 */
class Herramienta1 extends FlxSprite
{
	private var rotate:Bool = true;
	private var firstAngle:Float;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 64);
		FlxG.state.add(this);
		immovable = true;
		firstAngle = FlxAngle.asRadians(45);
		angle = firstAngle;
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		angle++;
		if (FlxG.mouse.pressed && rotate)
		{
			//angle = firstAngle-(FlxAngle.angleBetweenMouse(this));
		}
		else
		{
			rotate = false;
		}
	}
	
}