function loadAnimations()
{
	addByPrefix('idle', 'monster idle', 24, false);
	addByPrefix('singUP', 'monster up note', 24, false);
	addByPrefix('singDOWN', 'monster down', 24, false);
	addByPrefix('singLEFT', 'Monster Right note', 24, false);
	addByPrefix('singRIGHT', 'Monster left note', 24, false);

	addOffset('idle', 0, -50);
	addOffset('singUP', -20, 0);
	addOffset('singDOWN', -40, -144);
	addOffset('singLEFT', -30, -50);
	addOffset('singRIGHT', -51, -50);

	playAnim('idle');

	set('antialiasing', true);
	setBarColor([243, 255, 110]);
	setCamOffsets(50, 80);
	setOffsets(-200, 10);
}
