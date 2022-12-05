function loadAnimations()
{
	addByPrefix('idle', 'BF idle dance', 24, false);
	addByPrefix('singUP', 'BF NOTE UP0', 24, false);
	addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
	addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
	addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
	addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
	addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
	addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
	addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
	addByPrefix('hey', 'BF HEY', 24, false);

	addOffset("idle", -5, 0);
	addOffset("hey", -3, 4);

	addOffset("singLEFT", 2, -6);
	addOffset("singDOWN", -20, -50);
	addOffset("singUP", -45, 30);
	addOffset("singRIGHT", -50, -7);

	addOffset("singLEFTmiss", 2, 14);
	addOffset("singDOWNmiss", -11, -19);
	addOffset("singUPmiss", -32, 27);
	addOffset("singRIGHTmiss", -30, 21);

	playAnim('idle');

	characterData.antialiasing = true;
	characterData.flipX = true;

	var charX:Float = 0;
	var opponentX:Float = 250;

	if (PlayState.curStage == 'mallEvil')
	{
		charX = -130;
		opponentX = -155;
		setCamOffsets(15, -15);
	}

	setBarColor([49, 176, 209]);
	if (isPlayer)
	{
		setOffsets(charX, 430);
	}
	else
	{
		setOffsets(opponentX, 750);

		if (PlayState.curStage == 'mall')
			setCamOffsets(15, -95);

		if (PlayState.curStage == 'mallEvil')
			setCamOffsets(15, -45);
	}
}

var isOld:Bool = false;

function update(elapsed:Float)
{
	if (FlxG.keys.justPressed.NINE)
	{
		isOld = !isOld;
		if (isPlayer)
		{
			PlayState.uiHUD.iconP1.suffix = (isOld ? '-old' : '');
			PlayState.uiHUD.iconP1.updateIcon();
			PlayState.uiHUD.iconP1.flipX = true;
		}
		else
		{
			PlayState.uiHUD.iconP2.suffix = (isOld ? '-old' : '');
			PlayState.uiHUD.iconP2.updateIcon();
		}
	}
}
