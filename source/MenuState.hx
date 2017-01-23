package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	private var count:Int = 0;
	private var timer:Float = 0;
	private var menu:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		//FlxG.fullscreen = true;
		FlxG.sound.playMusic(AssetPaths.intro__ogg, 1, true);
		Reg.state = "menu";
		menu = new FlxSprite();
		menu.loadGraphic(AssetPaths.presentacion1k__png);
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
					menu.loadGraphic(AssetPaths.presentacion1k__png);
				case 1:
					menu.loadGraphic(AssetPaths.presentacion2k__png);
				case 2:
					menu.loadGraphic(AssetPaths.presentacion3k__png);
				case 3:
					menu.loadGraphic(AssetPaths.presentacion4k__png);
				case 4:
					menu.loadGraphic(AssetPaths.presentacion5k__png);
				case 5:
					menu.loadGraphic(AssetPaths.presentacion6k__png);
				case 6:
					menu.loadGraphic(AssetPaths.presentacion7k__png);
			}
			count++;
			timer = 0;
		}
		else if ( count > 6 && timer >= 5)
		{
			menu.alpha -= 0.01;
			if (menu.alpha <= 0)
			{
				var v:FlxState = new Level1();
				FlxG.switchState(v);
			}
		}
		
	}
}
