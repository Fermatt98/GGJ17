package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Meta extends FlxSprite
{
	private var timer:Float = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.tipo1__png);
		setGraphicSize(128, 128);
		updateHitbox();
		x -= width / 2;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		timer += elapsed;
		if (Reg.contMeta >= 10)
		{
			var v:FlxState = new Ganaste();
			Reg.contMeta = 0;
			FlxG.switchState(v);
		}
		else if (timer > 6)
		{
			loadGraphic(AssetPaths.tipo1__png);
			setGraphicSize(128, 128);
			updateHitbox();
			timer = 0;
			Reg.contMeta = 0;
		}
		else if (Reg.contMeta >= 7)
		{
			loadGraphic(AssetPaths.tipo3__png);
			setGraphicSize(128, 128);
			updateHitbox();
		}
		else if (Reg.contMeta >= 3)
		{
			loadGraphic(AssetPaths.tipo2__png);
			setGraphicSize(128, 128);
			updateHitbox();
		}
		
	}
}