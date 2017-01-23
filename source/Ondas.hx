package;

import flixel.FlxSprite;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxMath;
import flixel.FlxG;
import flixel.util.FlxCollision;
import flixel.FlxObject;
import flixel.math.FlxAngle;
import flixel.system.FlxSound;

/**
 * ...
 * @author ...
 */
class Ondas extends FlxSprite
{
	public var timer:Float = 0;
	private var timer2:Float = 0;
	private var _conotador:Bool;
	private var ran:FlxRandom;
	private var collisionSFX:FlxSound;
	private var metaSFX:FlxSound;
	private var paredSFX:FlxSound;
	
	public function new(?X:Float=0, ?Y:Float=0, ?angulo:Float, conotador:Bool, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		ran = new FlxRandom();
		switch(ran.int(0, 7))
		{
			case 0:
				loadGraphic(AssetPaths.nota1__png);
			case 1:
				loadGraphic(AssetPaths.nota2__png);
			case 2:
				loadGraphic(AssetPaths.nota3__png);
			case 3:
				loadGraphic(AssetPaths.nota4__png);
			case 4:
				loadGraphic(AssetPaths.nota5__png);
			case 5:
				loadGraphic(AssetPaths.nota6__png);
			case 6:
				loadGraphic(AssetPaths.nota7__png);
			case 7:
				loadGraphic(AssetPaths.nota8__png);
		}
		setGraphicSize(Reg.tamanioOnda, Reg.tamanioOnda);
		updateHitbox();
		angle = angulo;
		velocity.x = Reg.velocidadOnda * FlxMath.fastCos(angle);
		velocity.y = Reg.velocidadOnda * FlxMath.fastSin(angle);
		trace(Reg.velocidadOnda);
		FlxG.state.add(this);
		elasticity = 1;
		_conotador = conotador;
		collisionSFX = FlxG.sound.load(AssetPaths.Hit_Hurt__ogg);
		metaSFX = FlxG.sound.load(AssetPaths.Pickup_Coin3__ogg);
		paredSFX = FlxG.sound.load(AssetPaths.Explosion__ogg);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		for (i in 0...Reg.herramienta1.length)
		{
			if (FlxG.collide(this, Reg.herramienta1[i]))
			{
				collisionSFX.play();
			}
		}
		timer += elapsed;
		/*
		if (timer > 0.1) {
			for (i in 0...Reg.herramienta1.length)
			{
				if(FlxCollision.pixelPerfectCheck(this, Reg.herramienta1[i]))
				{
					trace(FlxAngle.asDegrees(angle));
					trace(Reg.herramienta1[i].angle);
					angle = FlxAngle.asRadians(((((Reg.herramienta1[i].angle)-90) - FlxAngle.asDegrees(angle)) * 2));
					//angle = 
					velocity.x = Reg.velocidadOnda * FlxMath.fastCos(angle);
					velocity.y = Reg.velocidadOnda * FlxMath.fastSin(angle);
					timer = 0;
					if (FlxAngle.asDegrees(angle) > 360)
					{
						angle -= FlxAngle.asRadians(360);
					}
					else if (FlxAngle.asDegrees(angle) < 0)
					{
						angle += FlxAngle.asRadians(360);
						
					}
					//trace(FlxAngle.asDegrees(angle));
				}
			}
		}
		*/
		if (!isOnScreen())
		{
			destroy();
		}
		if (FlxG.overlap(this, Reg.meta))
		{
			Reg.contMeta++;
			metaSFX.play();
			destroy();
		}
		for (i in 0...Reg.pared.length)
		{
			if (FlxG.overlap(this, Reg.pared[i]))
			{
				paredSFX.play();
				destroy();
			}
		}
		if (!_conotador)
		{
			for (i in 0...Reg.conotador.length)
			{
				if (FlxG.overlap(this, Reg.conotador[i]))
				{
					Reg.conotador[i].crearOnda();
					collisionSFX.play();
					destroy();
				}
			}
		}
		else
		{
			timer2 += elapsed;
			if (timer2 > 0.4)
			{
				_conotador = false;
			}
		}
	}
}