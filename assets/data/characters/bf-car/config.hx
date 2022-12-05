function loadAnimations()
{
	addByPrefix('idle', 'BF idle dance', 24, false);
	addByIndices('idlePost', 'BF idle dance', [8, 9, 10, 11, 12, 13, 14], "", 24, true);
	addByPrefix('singUP', 'BF NOTE UP0', 24, false);
	addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
	addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
	addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
	addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
	addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
	addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
	addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);

	addOffset("idle", -5, 30);

	addOffset("singLEFT", 2, 24);
	addOffset("singDOWN", -10, -20);
	addOffset("singUP", -49, 60);
	addOffset("singRIGHT", -44, 23);

	addOffset("singLEFTmiss", 2, 51);
	addOffset("singDOWNmiss", -11, 11);
	addOffset("singUPmiss", -39, 57);
	addOffset("singRIGHTmiss", -40, 51);

	playAnim('idle');

	characterData.antialiasing = true;
	characterData.flipX = true;

	setBarColor([49, 176, 209]);
	if (isPlayer)
	{
		setOffsets(230, -230);
	}
	else
	{
		characterData.flipX = true;
		setOffsets(80, 20);
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
