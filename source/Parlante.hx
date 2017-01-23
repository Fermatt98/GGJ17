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
	
	public function new(?X:Float=0, ?Y:Float=0, ?_angle = 0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.parlante__png);
		setGraphicSize(128, 128);
		updateHitbox();
		x -= width / 2;
		FlxG.state.add(this);
		angle = _angle;
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
				//new Ondas(x + width/2, y + height/2, ((angulo*i)-FlxAngle.asRadians(Reg.anguloOnda/2))+FlxAngle.asRadians(angle), false);
				if(Reg.group_ondas_multiplicadas.countLiving()+Reg.ondas.countLiving()<100)
					Reg.ondas.add(new Ondas(x + width / 2, y + height / 2, ((angulo * i) - FlxAngle.asRadians(Reg.anguloOnda / 2)) + FlxAngle.asRadians(angle),false));
			}
			timer = 0;
		}
	}
	
}