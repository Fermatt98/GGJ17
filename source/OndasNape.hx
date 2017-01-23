package;

import flixel.addons.nape.FlxNapeSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxMath;
import flixel.FlxG;
import flixel.util.FlxCollision;
import flixel.FlxObject;

/**
 * ...
 * @author ...
 */
class OndasNape extends FlxNapeSprite
{

	public function new(X:Float=0, Y:Float=0, ?angulo:Float, ?SimpleGraphic:FlxGraphicAsset, CreateRectangularBody:Bool=true, EnablePhysics:Bool=true) 
	{
		super(X, Y, SimpleGraphic, CreateRectangularBody, EnablePhysics);
		makeGraphic(Reg.tamanioOnda, Reg.tamanioOnda);
		angle = angulo;
		velocity.x = Reg.velocidadOnda * FlxMath.fastCos(angle);
		velocity.y = Reg.velocidadOnda * FlxMath.fastSin(angle);
		FlxG.state.add(this);
		elasticity = 1;
	}
	/*
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.pixelPerfectOverlap(Reg.herramienta1, this))
		{
			FlxObject.separate(Reg.herramienta1, this);
		}
		if (!isOnScreen())
		{
			destroy();
		}
		if (FlxG.overlap(this, Reg.meta))
		{
			Reg.contMeta++;
			destroy();
		}
		if (FlxG.overlap(this, Reg.pared))
		{
			destroy();
		}
	}*/
}