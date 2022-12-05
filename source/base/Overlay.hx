package base;

import flixel.FlxG;
import haxe.Timer;
import openfl.events.Event;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * Overlay that displays FPS and memory usage.
 * 
 * Based on this tutorial:
 * https://keyreal-code.github.io/haxecoder-tutorials/17_displaying_fps_and_memory_usage_using_openfl.html
**/
class Overlay extends TextField
{
	var times:Array<Float> = [];
	var memPeak:UInt = 0;

	// display info
	static var displayFps = true;
	static var displayMemory = true;
	static var displayExtra = #if debug true #else false #end;

	public function new(x:Float, y:Float)
	{
		super();

		this.x = x;
		this.y = x;

		autoSize = LEFT;
		selectable = false;

		defaultTextFormat = new TextFormat(Paths.font("vcr"), 16, 0xFFFFFF);
		text = "";

		addEventListener(Event.ENTER_FRAME, update);
	}

	static final intervalArray:Array<String> = ['B', 'KB', 'MB', 'GB', 'TB'];

	inline public static function getInterval(num:UInt):String
	{
		var size:Float = num;
		var data = 0;
		while (size > 1024 && data < intervalArray.length - 1)
		{
			data++;
			size = size / 1024;
		}

		size = Math.round(size * 100) / 100;
		return size + " " + intervalArray[data];
	}

	function update(_:Event)
	{
		var now:Float = Timer.stamp();
		times.push(now);
		while (times[0] < now - 1)
			times.shift();

		var mem = System.totalMemory;
		if (mem > memPeak)
			memPeak = mem;

		if (visible)
		{
			text = '' // set up the text itself
				+ (displayFps ? times.length + " FPS\n" : '') // Framerate
				+ (displayExtra ? 'Class Object Count: ' + FlxG.state.members.length + "\n" : '') // Current Game State
				+ (displayMemory ? '${getInterval(mem)} // ${getInterval(memPeak)}\n' : ''); // Current and Total Memory Usage
		}
	}

	inline public static function updateDisplayInfo(shouldDisplayFps:Bool, shouldDisplayMemory:Bool)
	{
		displayFps = shouldDisplayFps;
		displayMemory = shouldDisplayMemory;
	}
}

/**
 * Console Overlay that gives information such as traced lines, like a Command Prompt/Terminal
 * author @superpowers04
 * support Super Engine - https://github.com/superpowers04/Super-Engine
 */
class Console extends TextField
{
	public static var instance:Console = new Console();

	/**
	 * The current frame rate, expressed using frames-per-second
	**/
	public var currentFPS(default, null):Int;

	@:noCompletion private var cacheCount:Int;
	@:noCompletion private var currentTime:Float;
	@:noCompletion private var times:Array<Float>;

	public static var debugVar:String = "";

	public function new(x:Float = 20, y:Float = 20, color:Int = 0xFFFFFFFF)
	{
		super();
		instance = this;
		haxe.Log.trace = function(v, ?infos)
		{
			var str = haxe.Log.formatOutput(v, infos);
			#if js
			if (js.Syntax.typeof(untyped console) != "undefined" && (untyped console).log != null)
				(untyped console).log(str);
			#elseif lua
			untyped __define_feature__("use._hx_print", _hx_print(str));
			#elseif sys
			Sys.println(str);
			#end
			if (Console.instance != null)
				Console.instance.log(str);
		}

		this.x = x;
		this.y = y;
		width = 1240;
		height = 680;
		background = true;
		backgroundColor = 0xaa000000;
		// alpha = 0;

		selectable = false;
		mouseEnabled = mouseWheelEnabled = true;
		defaultTextFormat = new TextFormat(Paths.font("vcr"), 14, color);
		text = "Start of log";
		alpha = 0;

		#if flash
		addEventListener(Event.ENTER_FRAME, function(e)
		{
			__enterFrame(e);
		});
		#end
	}

	var lineCount:Int = 0;
	var lines:Array<String> = [];

	public function log(str:String)
	{
		#if (!SHOW_CONSOLE)
		return;
		#end
		// text += "\n-" + lineCount + ": " + str;
		lineCount++;
		lines.push('$lineCount ~ $str');
		while (lines.length > 100)
		{
			lines.shift();
		}
		requestUpdate = true;
	}

	var requestUpdate = false;
	var showConsole = false;
	var wasMouseDisabled = false;

	// Event Handlers
	@:noCompletion
	private #if !flash override #end function __enterFrame(deltaTime:Float):Void
	{
		#if (!SHOW_CONSOLE)
		return;
		#end
		if (FlxG.keys != null && FlxG.keys.justPressed.F10 && FlxG.save.data != null)
		{
			showConsole = !showConsole;
			alpha = (showConsole ? 1 : 0);
			if (FlxG.keys.pressed.SHIFT)
			{
				lines = [];
				trace('Cleared Log');
			}
			if (showConsole)
			{
				wasMouseDisabled = FlxG.mouse.visible;

				requestUpdate = true;
				FlxG.mouse.visible = true;
				scaleX = lime.app.Application.current.window.width / 1280;
				scaleY = lime.app.Application.current.window.height / 720;
			}
			else
			{
				text = ""; // No need to have text if the console isn't showing
				FlxG.mouse.visible = wasMouseDisabled;
			}
		}
		if (showConsole && requestUpdate)
		{
			text = lines.join("\n");
			scrollV = bottomScrollV;
			requestUpdate = false;
		}
	}
}
