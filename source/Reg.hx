package;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

class Reg
{
	inline static public var tamanioOnda = 24;
	inline static public var velocidadOnda = 200;
	inline static public var cantOnda = 5;
	inline static public var anguloOnda = 20;
	
	static public var herramienta1:Array<Herramienta1>;
	static public var parlante:FlxSprite;
	static public var interfaz:FlxSprite;
	static public var meta:FlxSprite;
	static public var pared:Array<Pared>;
	static public var youWinBool:Array<Bool>;
	static public var cantHerr1:Int;
	static public var cantCono:Int;
	static public var cantMulti:Int;
	static public var conotador:Array<Conotador>;
	
	static public var contMeta:Int = 0;
	
	static public var herramienta1Select:Bool = false;
	static public var conotadorSelect:Bool = false;
	static public var multiplicadorSelect:Bool = false;
	
	static public var ondas:FlxTypedGroup<Ondas>;
	
	static public var group_herramienta1:FlxTypedGroup<Herramienta1>;
	
	static public var group_multiplicador:FlxTypedGroup<Multiplicador>;
	static public var play_multiplicar:Bool = false;
	static public var group_ondas_multiplicadas:FlxTypedGroup<Ondas>;
	
	static public var state:String;
}