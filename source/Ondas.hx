package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxMath;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Ondas extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0, ?angulo:Float, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioOnda, Reg.tamanioOnda);
		angle = angulo;
		velocity.x = Reg.velocidadOnda * FlxMath.fastCos(angle);
		velocity.y = Reg.velocidadOnda * FlxMath.fastSin(angle);
		FlxG.state.add(this);
		elasticity = 1;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (!isOnScreen())
		{
			destroy();
		}
		FlxG.collide(this, Reg.herramienta1);
		if (FlxG.overlap(this, Reg.meta))
		{
			Reg.contMeta++;
			destroy();
		}
		if (FlxG.overlap(this, Reg.pared))
		{
			destroy();
		}
	}
}