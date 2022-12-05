var limo:FNFSprite;
var dancer:FNFSprite;
var fastCar:FNFSprite;
var bgLimo:FNFSprite;
var limoOverlay:FNFSprite;
var grpLimoDancers:Dynamic;

function onCreate()
{
	var stageDir:String = 'data/stages/highway/images';

	spawnGirlfriend(true);
	PlayState.defaultCamZoom = 0.90;
	PlayState.cameraSpeed = 1;

	var skyBG:FNFSprite = new FNFSprite(-120, -50).loadGraphic(Paths.image('limoSunset', stageDir));
	skyBG.scrollFactor.set(0.1, 0.1);
	add(skyBG);

	bgLimo = new FNFSprite(-200, 480);
	bgLimo.frames = Paths.getSparrowAtlas('bgLimo', stageDir);
	bgLimo.animation.addByPrefix('drive', "background limo pink", 24);
	bgLimo.playAnim('drive');
	bgLimo.scrollFactor.set(0.4, 0.4);
	add(bgLimo);

	grpLimoDancers = ForeverTools.createSpriteGroup(grpLimoDancers);
	add(grpLimoDancers);

	for (i in 0...5)
	{
		createDancer((370 * i) + 130, bgLimo.y - 380);
		grpLimoDancers.add(dancer);
	}

	limo = new FNFSprite(-50, 550);
	limo.frames = Paths.getSparrowAtlas('limoDrive', stageDir);
	limo.animation.addByPrefix('drive', "Limo stage", 24);
	limo.playAnim('drive');
	limo.antialiasing = !Init.trueSettings.get('Disable Antialiasing');
	layers.add(limo);

	fastCar = new FNFSprite(-300, 160).loadGraphic(Paths.image('fastCarLol', stageDir));
	fastCar.active = true;
	resetFastCar();
	layers.add(fastCar);

	limoOverlay = new FNFSprite(-500, -600).loadGraphic(Paths.image('limoOverlay', stageDir));
	limoOverlay.alpha = 0.2;
	limoOverlay.blend = ForeverTools.returnBlendMode('add');
	foreground.add(limoOverlay);
}

function charStagePos(boyfriend:Character, gf:Character, dad:Character)
{
	boyfriend.setPosition(1070, 220);
	dad.setPosition(100, 100);
	gf.setPosition(300, 100);
}

function limoDrives()
{
	if (bgLimo != null)
		bgLimo.playAnim('drive');

	if (limo != null)
		limo.playAnim('drive');
}

// fast car lol;

var fastCarCanDrive:Bool = true;

function resetFastCar():Void
{
	if (fastCar != null)
	{
		fastCar.x = -12600;
		fastCar.y = FlxG.random.int(140, 250);
		fastCar.velocity.x = 0;
		fastCarCanDrive = true;
	}
}

var carTimer:FlxTimer;

function fastCarDrive()
{
	// trace('Car drive');
	if (fastCar != null)
	{
		FlxG.sound.play(Paths.soundRandom('sounds/carPass', 'data/stages/highway', 0, 1), 0.7);

		fastCar.velocity.x = (FlxG.random.int(170, 220) / FlxG.elapsed) * 3;
		fastCarCanDrive = false;
		carTimer = new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			resetFastCar();
			carTimer = null;
		});
	}
}

// BACKGROUND DANCERS;

var danceDir:Bool = false;

function onBeat(curBeat:Int, boyfriend:Character, gf:Character, dad:Character)
{
	limoDrives();

	if (grpLimoDancers != null)
	{
		grpLimoDancers.forEach(function(dancer:FNFSprite)
		{
			if (dancer != null)
			{
				dancer.scrollFactor.set(0.4, 0.4);
				danceDir = !danceDir;

				if (danceDir)
					dancer.playAnim('danceRight', true);
				else
					dancer.playAnim('danceLeft', true);
			}
		});
	}

	if (FlxG.random.bool(10) && fastCarCanDrive)
		fastCarDrive();
}

function createDancer(x:Float, y:Float)
{
	dancer = new FNFSprite(x, y);
	dancer.frames = Paths.getSparrowAtlas("limoDancer", "data/stages/highway/images");
	dancer.animation.addByIndices('danceLeft', 'bg dancer sketch PINK', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 30, false);
	dancer.animation.addByIndices('danceRight', 'bg dancer sketch PINK', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 30, false);
	dancer.playAnim('danceLeft');
	dancer.antialiasing = !Init.trueSettings.get('Disable Antialiasing');
}
