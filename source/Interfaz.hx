package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class Interfaz extends FlxSprite
{
	private var yoqse:Bool;
	private var text1:FlxText;
	private var text2:FlxText;
	private var text3:FlxText;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.herramientas1__png);
		FlxG.state.add(this);
		color = FlxColor.WHITE;
		text1 = new FlxText((width / 3) / 2, height + 1, 0, Std.string(Reg.cantCono), 16);
		text2 = new FlxText(width / 3+(width / 3) / 2, height + 1, 0, Std.string(Reg.cantMulti), 16);
		text3 = new FlxText(width / 3 * 2 + (width / 3) / 2, height + 1, 0, Std.string(Reg.cantHerr1), 16);
		text1.color = FlxColor.WHITE;
		text2.color = FlxColor.WHITE;
		text3.color = FlxColor.WHITE;
		FlxG.state.add(text1);
		FlxG.state.add(text2);
		FlxG.state.add(text3);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		text1.text = Std.string(Reg.cantCono);
		text2.text = Std.string(Reg.cantMulti);
		text3.text = Std.string(Reg.cantHerr1); 
		trace(Reg.cantCono);
		if (FlxG.mouse.overlaps(this) && FlxG.mouse.justPressed)
		{
			if (FlxG.mouse.x < width / 3)
			{
				loadGraphic(AssetPaths.herramientas2__png);
				Reg.herramienta1Select = false;
				Reg.conotadorSelect = true;
				Reg.multiplicadorSelect = false;
				
			}
			else if(FlxG.mouse.x < (width / 3)*2)
			{
				loadGraphic(AssetPaths.herramientas3__png);
				Reg.conotadorSelect = false;
				Reg.herramienta1Select = false;
				Reg.multiplicadorSelect = true;
				
			}
			else
			{
				loadGraphic(AssetPaths.herramientas4__png);
				Reg.conotadorSelect = false;
				Reg.herramienta1Select = true;
				Reg.multiplicadorSelect = false;
			}
		}
		else if (FlxG.mouse.justPressed)
		{
			if (Reg.herramienta1Select && Reg.cantHerr1 != 0)
			{
				yoqse = true;
				for (i in 0...Reg.herramienta1.length)
				{
					if (!FlxG.mouse.overlaps(Reg.herramienta1[i]))
						yoqse=true;
					else
						yoqse = false;
				}
				if (yoqse)
				{
					Reg.herramienta1.push(new Herramienta1(FlxG.mouse.x, FlxG.mouse.y));
					Reg.cantHerr1--;
				}
			}
			
			if (Reg.conotadorSelect && Reg.cantCono !=0)
			{
				yoqse = true;
				for (i in 0...Reg.conotador.length)
				{
					if (!FlxG.mouse.overlaps(Reg.conotador[i]))
						yoqse=true;
					else
						yoqse = false;
				}
				if (yoqse)
				{
					Reg.conotador.push(new Conotador(FlxG.mouse.x, FlxG.mouse.y));
					Reg.cantCono--;
				}
			}
			
			if (Reg.multiplicadorSelect && Reg.cantMulti !=0)
			{
				yoqse = true;
				for (i in 0...Reg.group_multiplicador.length)
				{
					if (!FlxG.mouse.overlaps(Reg.group_multiplicador.members[i]))
						yoqse=true;
					else
						yoqse = false;
				}
				if (yoqse)
				{
					Reg.group_multiplicador.add(new Multiplicador(FlxG.mouse.x, FlxG.mouse.y));
					Reg.cantMulti--;
				}
				
			}
		}
	}
}