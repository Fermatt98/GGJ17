package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxAngle;
import flixel.system.FlxSound;

class FINALLEVEL extends FlxState
{
	private var collisionSFX:FlxSound;
	private var angulo:Float;
	
	override public function create():Void
	{
		super.create();
		FlxG.sound.playMusic(AssetPaths.Gamejam__ogg, 1, true);
		Reg.state = "FINALLEVEL";
		var v = new FlxSprite();
		v.loadGraphic(AssetPaths.fondo3__png);
		v.setGraphicSize(FlxG.width, FlxG.height);
		v.updateHitbox();
		add(v);
		Reg.cantHerr1 = 2;
		Reg.cantCono = 2;
		Reg.cantMulti = 1;
		Reg.parlante = new Parlante(100, FlxG.height-150, 150);
		Reg.meta = new Meta(FlxG.width / 2 - 64, FlxG.height / 2 - 64);
		Reg.pared = new Array<Pared>();
		Reg.pared.push(new Pared(Reg.meta.x - 138, Reg.meta.y - 138, 400 - 20-80-100, 64, true));
		Reg.pared.push(new Pared(Reg.meta.x - 138, Reg.meta.y + 138, 400 - 20, 64, true));
		Reg.pared.push(new Pared(Reg.meta.x - 138, Reg.meta.y - 138, 64, 400 - 20 - 80, false));
		Reg.pared.push(new Pared(Reg.meta.x +Reg.meta.width + 52, Reg.meta.y - 138+100+15, 64, 400 - 20-80-100, false));
		
		
		Reg.interfaz = new Interfaz();
		Reg.herramienta1 = new Array<Herramienta1>();
		//Reg.meta = new Meta(FlxG.width / 2 + 100, FlxG.height / 2);
		Reg.conotador = new Array<Conotador>();
		FlxG.debugger.visible = true;
		
		Reg.ondas = new FlxTypedGroup<Ondas>();
		Reg.group_herramienta1 = new FlxTypedGroup<Herramienta1>();
		Reg.group_multiplicador = new FlxTypedGroup<Multiplicador>();
		Reg.group_ondas_multiplicadas = new FlxTypedGroup<Ondas>();
		
		
		add(Reg.group_multiplicador);
		add(Reg.group_herramienta1);
		add(Reg.group_ondas_multiplicadas);
		add(Reg.ondas);
		
		collisionSFX = FlxG.sound.load(AssetPaths.Hit_Hurt__ogg);
		angulo = FlxAngle.asRadians(10 / 2);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.overlap(Reg.group_multiplicador, Reg.ondas, multiplicar);
		FlxG.overlap(Reg.group_multiplicador,Reg.group_ondas_multiplicadas, multiplicar2);
		//Reg.group_ondas_multiplicadas.forEachAlive(multiplicar2);
	}
	
	public function multiplicar(G_M:Multiplicador, G_O:Ondas):Void
	{
		for(i in 0... 3)
		{
			trace("aaaaaaaaaaaa");
			if(Reg.group_ondas_multiplicadas.countLiving()+Reg.ondas.countLiving()<100)
				Reg.group_ondas_multiplicadas.add(new Ondas(G_M.x + G_M.width/2, G_M.y + G_M.height/2, ((angulo*i)-FlxAngle.asRadians(10/2))+FlxAngle.asRadians(G_M.angle),false));
			G_O.destroy();
		}
	}
	public function multiplicar2(G_M:Multiplicador,G_O:Ondas):Void
	{
		if(G_O.timer>0.50)
		for(i in 0... 3)
		{
			if(Reg.group_ondas_multiplicadas.countLiving()+Reg.ondas.countLiving()<100)
				Reg.group_ondas_multiplicadas.add(new Ondas(G_M.x + G_M.width/2, G_M.y + G_M.height/2, ((angulo*i)-FlxAngle.asRadians(10/2))+FlxAngle.asRadians(G_M.angle),false));
			G_O.destroy();
		}

	}
}
