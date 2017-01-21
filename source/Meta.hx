package;

import flixel.FlxSprite;
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
		makeGraphic(64, 64);
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		timer += elapsed;
		if (Reg.contMeta >= 10)
		{
			trace("GANASTE!! BIEN AHI!");
			Reg.contMeta = 0;
		}
		else if (timer > 5)
		{
			timer = 0;
			Reg.contMeta = 0;
		}
	}
}