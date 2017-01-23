package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxAngle;
import flixel.math.FlxRandom;

/**
 * ...
 * @author ...
 */
class Conotador extends FlxSprite
{
	private var angulo:Float;
	private var ran:FlxRandom;
	private var max:Int = 2;
	private var rotate:Bool = true;
	private var angulodeaca:Float = 5;

	public function new(?X:Float=0, ?Y:Float=0, ?angles=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.antena__png);
		setGraphicSize(64, 64);
		updateHitbox();
		FlxG.state.add(this);
		angle = angles;
		angulo = FlxAngle.asRadians(angulodeaca / (max - 1));
		ran = new FlxRandom();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
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
			Reg.cantCono++;
			kill();
		}
	}
	
	public function crearOnda()
	{
		Reg.ondas.add(new Ondas(x + width / 2, y + height / 2, ((angulo * ran.int(0, max) - FlxAngle.asRadians(angulodeaca / 2)) + FlxAngle.asRadians(angle))-FlxAngle.asRadians(60), true));
	}
}