function loadAnimations()
{
	addByPrefix('idle', "Pico Idle Dance", 24, false);
	addByPrefix('singUP', 'pico Up note0', 24, false);
	addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
	addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
	addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);

	addByPrefix('singUPmiss', 'pico Up note miss', 24, false);
	addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24, false);
	addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
	addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);

	if (isPlayer)
	{
		addOffset("idle", 0, 35);
		addOffset("singLEFT", 86, 14);
		addOffset("singDOWN", 92, -50);
		addOffset("singUP", 11, 55);
		addOffset("singRIGHT", -48, 35);
		addOffset("singLEFTmiss", 89, 46);
		addOffset("singDOWNmiss", 100, -2);
		addOffset("singUPmiss", 21, 90);
		addOffset("singRIGHTmiss", -44, 83);
		setCamOffsets(30, 30);
	}
	else
	{
		addOffset('idle', 0, -303);
		addOffset('singLEFT', 65, -293);
		addOffset('singDOWN', 200, -373);
		addOffset('singUP', -29, -276);
		addOffset('singRIGHT', -68, -310);
		addOffset('singLEFTmiss', 62, -239);
		addOffset('singDOWNmiss', 210, -331);
		addOffset('singUPmiss', -19, -236);
		addOffset('singRIGHTmiss', -60, -262);
		setCamOffsets(30, 300);
	}

	playAnim('idle');

	characterData.flipX = true;
	set('antialiasing', true);
	setBarColor([183, 216, 85]);
	setOffsets(0, -280);
}
