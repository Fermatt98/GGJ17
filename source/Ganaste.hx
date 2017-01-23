package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class Ganaste extends FlxState
{
	private var count:Int = 0;
	private var timer:Float = 0;
	private var menu:FlxSprite;
	private var nextLevel:Bool = false;
	
	override public function create():Void
	{
		super.create();
		FlxG.sound.playMusic(AssetPaths.BravoAplausosClapping__ogg, 1, false);
		menu = new FlxSprite();
		menu.loadGraphic(AssetPaths.pasodenivel1__png);
		add(menu);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		timer += elapsed;
		if (timer >= 0.1 && count <= 6)
		{
			switch(count)
			{
				case 0:
					menu.loadGraphic(AssetPaths.pasodenivel1__png);
				case 1:
					menu.loadGraphic(AssetPaths.pasodenivel2__png);
				case 2:
					menu.loadGraphic(AssetPaths.pasodenivel3__png);
				case 3:
					menu.loadGraphic(AssetPaths.pasodenivel4__png);
				case 4:
					menu.loadGraphic(AssetPaths.pasodenivel5__png);
				case 5:
					menu.loadGraphic(AssetPaths.pasodenivel6__png);
				case 6:
					menu.loadGraphic(AssetPaths.pasodenivel7__png);
			}
			count++;
			timer = 0;
		}
		else if ( count > 6 && nextLevel)
		{
			menu.alpha -= 0.01;
			if (menu.alpha <= 0)
			{
				var v:FlxState;
				if (Reg.state == "Level1")
				{
					v = new Level2();
					Reg.contMeta = 0;
					FlxG.switchState(v);
				}
				else if (Reg.state == "Level2")
				{
					v = new Level3();
					Reg.contMeta = 0;
					FlxG.switchState(v);
				}
				else if (Reg.state == "Level3")
				{
					v = new Level4();
					Reg.contMeta = 0;
					FlxG.switchState(v);
				}
				else if (Reg.state == "Level4")
				{
					v = new Level5();
					Reg.contMeta = 0;
					FlxG.switchState(v);
				}
				else if (Reg.state == "Level5")
				{
					v = new Level6();
					Reg.contMeta = 0;
					FlxG.switchState(v);
				}
				else if (Reg.state == "Level6")
				{
					v = new Level7();
					Reg.contMeta = 0;
					FlxG.switchState(v);
				}
				else if (Reg.state == "Level7")
				{
					v = new Level8();
					Reg.contMeta = 0;
					FlxG.switchState(v);
				}
				else if (Reg.state == "Level8")
				{
					v = new Level9();
					Reg.contMeta = 0;
					FlxG.switchState(v);
				}
				else if (Reg.state == "Level9")
				{
					v = new Level10();
					Reg.contMeta = 0;
					FlxG.switchState(v);
				}
				else if (Reg.state == "Level10")
				{
					v = new FINALLEVEL();
					Reg.contMeta = 0;
					FlxG.switchState(v);
				}
			}
		}
		if (FlxG.mouse.justPressed)
		{
			nextLevel = true;
		}
		
	}
}
