package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Pared extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, _width:Float, _height:Float, rotate:Bool, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		if (rotate)
		{
			loadGraphic(AssetPaths.Pared2__png);
		}
		else
		{
			loadGraphic(AssetPaths.pared1__png);
		}
		setGraphicSize(Std.int(_width), Std.int(_height));
		updateHitbox();
		//x -= width / 2;
		FlxG.state.add(this);
	}
	
}