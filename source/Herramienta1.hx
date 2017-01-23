package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.math.FlxAngle;
import flixel.math.FlxRandom;

/**
 * ...
 * @author ...
 */
class Herramienta1 extends FlxSprite
{
	private var rotate:Bool = true;
	private var firstAngle:Float;
	private var img:Int; 
	private var ran:FlxRandom;
	private var rtbool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		trace("uifds");
		ran = new FlxRandom();
		img = ran.int(0, 3);
		FlxG.state.add(this);
		immovable = true;
		switch(img)
		{
			case 0:
				loadGraphic(AssetPaths.platillo__png);
			case 1:
				loadGraphic(AssetPaths.palillo__png);
			case 2:
				loadGraphic(AssetPaths.microfono__png);
			case 3:
				loadGraphic(AssetPaths.oboe1__png);
		}
		setGraphicSize(128, 16);
		updateHitbox();
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		//trace(angle);
		if (FlxG.mouse.overlaps(this) && FlxG.mouse.justPressed)
		{
			rotatata();
		}
		if (FlxG.mouse.overlaps(this) && FlxG.mouse.justPressedRight)
		{
			Reg.cantHerr1++;
			kill();
		}
	}
	
	public function rotatata():Void
	{
		if (rtbool)
		{
			switch(img)
			{
				case 0:
					loadGraphic(AssetPaths.platillo__png);
				case 1:
					loadGraphic(AssetPaths.palillo__png);
				case 2:
					loadGraphic(AssetPaths.microfono__png);
				case 3:
					loadGraphic(AssetPaths.oboe1__png);
			}
			setGraphicSize(128, 16);
			updateHitbox();
			rtbool = false;
		}
		else
		{
			switch(img)
			{
				case 0:
					loadGraphic(AssetPaths.platillovertical__png);
				case 1:
					loadGraphic(AssetPaths.palillovertical__png);
				case 2:
					loadGraphic(AssetPaths.microfonovertical__png);
				case 3:
					loadGraphic(AssetPaths.oboevertical__png);
			}
			setGraphicSize(16, 128);
			updateHitbox();
			rtbool = true;
		}
	}
}