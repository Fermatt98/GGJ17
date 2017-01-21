package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxAngle;

/**
 * ...
 * @author ...
 */
class Parlante extends FlxSprite
{
	private var angulo:Float;
	private var timer:Float = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(64, 64);
		FlxG.state.add(this);
		angulo = FlxAngle.asRadians(Reg.anguloOnda / (Reg.cantOnda - 1));
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		timer += elapsed;
		if (timer > 2)
		{
			for (i in 0...Reg.cantOnda)
			{
				var onda = new Ondas(x + width, y + height / 2, (angulo*i)-FlxAngle.asRadians(Reg.anguloOnda/2));
			}
			timer = 0;
		}
	}
	
}